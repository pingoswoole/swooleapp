@extends('layouts.admin_frame')

@section('header_style')
 
<style type="text/css">
    .layui-table-cell{
	    
	    height: auto;
	    white-space: normal;
    }
</style>
@endsection

@section('body')

<fieldset class="table-search-fieldset">
    <legend>搜索信息</legend>
    <div style="margin: 10px 10px 10px 10px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="real_name" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <select name="state" lay-verify="required" lay-search="">
                        <option value="all">全部</option>
                        <option value="1">已通过</option>
                        <option value="0">待审核</option>
                        <option value="-1">拒绝</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>

<script type="text/html" id="stateTpl">
    <input type="checkbox" name="state" value="@{{d.id}}" lay-skin="switch"  lay-text="上架|下架" lay-filter="stateSwitch" @{{ d.state == 1 ? 'checked' : '' }}>
</script>

<script type="text/html" id="tableToolbar">
    <div class="layui-btn-container layui-hide">
        <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
    </div>
</script>

<table class="layui-hide" id="dataTable" lay-filter="dataTableFilter"></table>

<script type="text/html" id="dataTableBar">
    @verbatim
    {{#  if(d.state == 0 ){ }}
        <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">通过</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">拒绝</a>
    {{# }  }}
    
    @endverbatim
</script>

@endsection


@section('footer_js')

 
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#dataTable',
            url: '/backadmin/member/member_realnameauth/getPageList',
            toolbar: '#tableToolbar',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'cate_title',  title: '用户', templet: function(data){
                    let html = '<p>' +data.member.nickname+ '</p>'
                    html += '<p>' +data.member.mobile+ '</p>'
                    return html

                }},
                {field: 'cred_type',  title: '手持身份证', templet: function(data){
                    let html =  '<img src="'+data.hand_img+'" width="180px"/>'
                    return html;
                }},
                {field: 'real_name',  title: '姓名'},
                {field: 'cred_id',  title: '证件号码'},
                {field: 'state_txt',  title: '状态'},
                {field: 'created_at', width: 135, title: '创建时间', sort: true},
                {title: '操作', minWidth: 150, toolbar: '#dataTableBar', align: "center"} 
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            // layer.alert(result, {
            //     title: '最终的搜索信息'
            // });

            //执行搜索重载
            table.reload('dataTable', {
                page: {
                    curr: 1
                }
                , where: {
                    searchParams: result
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(dataTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: '/backadmin/member/member_realnameauth/addItem',
                    end: function(){
                        table.reload('dataTable')
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('dataTable')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
        });

        //监听表格复选框选择
        table.on('checkbox(dataTableFilter)', function (obj) {
            console.log(obj)
        });

        form.on('switch(stateSwitch)', function(obj){
            let datajson = {key:'state', value:obj.elem.checked ? '1':'0'};
            $.post('/backadmin/member/member_realnameauth/setItem/' + obj.value ,datajson,function(data){
                layer.msg(data.msg);
                if(data.code !== 0) {
                    obj.elem.checked = !obj.elem.checked;
                    form.render();
                }
            });
        });

        table.on('tool(dataTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                $.post('/backadmin/member/member_realnameauth/audit/'+data.id, {state: 1}, function(result){
                        layer.msg(result.msg, {time: 2000}, function(){
                            if(result.code === 0 ){
                                obj.del();
                                layer.close(index);
                            }
                        })
                })
                // var index = layer.open({
                //     title: '编辑',
                //     type: 2,
                //     shade: 0.2,
                //     maxmin:true,
                //     shadeClose: true,
                //     area: ['90%', '90%'],
                //     content: '/backadmin/member/member_realnameauth/viewItem/'+data.id,
                //     end: function(){
                //         table.reload('dataTable')
                //     }
                // });
                // $(window).on("resize", function () {
                //     layer.full(index);
                // });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的拒绝么？', function (index) {
                    $.post('/backadmin/member/member_realnameauth/audit/'+data.id, {state: -1}, function(result){
                        layer.msg(result.msg, {time: 2000}, function(){
                            if(result.code === 0 ){
                                obj.del();
                                layer.close(index);
                            }
                        })
                    })
                });
            }


        });

    });
</script>
@endsection