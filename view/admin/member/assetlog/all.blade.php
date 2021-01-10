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
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mobile" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">流向</label>
                    <div class="layui-input-inline">
                        <select name="flow" lay-filter="">
                            <option value=""></option>
                            <option value="0">出账</option>
                            <option value="1">进账</option>
                          </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">来源</label>
                    <div class="layui-input-inline">
                        <select name="from_type" lay-filter="">
                            <option value=""></option>
                            <option value="active">激活会员</option>
                            <option value="upgrade">升级代理</option>
                            <option value="shopping">购物</option>
                            <option value="withdraw">提现</option>
                          </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">类型</label>
                    <div class="layui-input-inline">
                        <select name="asset_type" lay-filter="">
                            <option value=""></option>
                            <option value="score">积分</option>
                            <option value="commission">佣金</option>
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
<fieldset class="table-search-fieldset">
    <legend>统计信息</legend>
    <div style="margin: 10px 10px 10px 10px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">累计金额</label>
                <div class="layui-input-inline">
                    <input type="text" id="total_amount" disabled placeholder="￥" autocomplete="off" class="layui-input">
                </div>
            </div>
    </div>
</fieldset>
<script type="text/html" id="stateTpl">
    <input type="checkbox" name="state" value="@{{d.id}}" lay-skin="switch"  lay-text="上架|下架" lay-filter="stateSwitch" @{{ d.state == 1 ? 'checked' : '' }}>
</script>

<script type="text/html" id="tableToolbar">
   {{--  <div class="layui-btn-container">
        <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
    </div> --}}
</script>

<table class="layui-hide" id="dataTable" lay-filter="dataTableFilter"></table>

<script type="text/html" id="dataTableBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
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
            url: '/backend/member/assetlog/getPageList',
            toolbar: '#tableToolbar',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'cate_title',  title: '用户', templet:function(data){
                   // let html = '<p>' +data.nickname + '</p>'

                    let  html = '<p>' +(data.member ? data.member.mobile : '无') + '</p>'
                    return html
                }},
                {field: 'title',  title: '标题'},
                {field: 'flow',  title: '流向'},
                {field: 'money',  title: '金额'},
                {field: 'from_type',  title: '来源'},
                {field: 'asset_type',  title: '类型'},
                {field: 'created_at', width: 135, title: '创建时间', sort: true}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line',
            done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                console.log(res);
                
                //得到当前页码
                console.log(curr); 
                $('#total_amount').val(res.extra)
                //得到数据总量
                console.log(count);
            }

        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
           /*  layer.alert(result, {
                title: '最终的搜索信息'
            }); */

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
                    content: '/backend/member/assetlog/addItem',
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
            $.post('/backend/member/assetlog/setItem/' + obj.value ,datajson,function(data){
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

                var index = layer.open({
                    title: '编辑',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: '/backend/member/assetlog/viewItem/'+data.id,
                    end: function(){
                        table.reload('dataTable')
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.post('/backend/member/assetlog/delItem/'+data.id, {}, function(result){
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