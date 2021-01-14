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
    <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit layui-hide" lay-event="edit">编辑</a>
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
            url: '/backend/setting/filemanager/getPageList',
            toolbar: '#tableToolbar',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'storage',  title: '存储位置'},
                {field: 'path',  title: '路径'},
                {field: 'title',  title: '标题'},
                {field: 'size',  title: '大小'},
                {field: 'path',  title: '图片', templet: function(data){
                    return '<img width="80px" src="'+data.path+'">'
                }},
                {field: 'created_at',  title: '创建时间'},
                
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            });

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
                    content: '/backend/setting/filemanager/addItem',
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
            $.post('/backend/setting/filemanager/setItem/' + obj.value ,datajson,function(data){
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
                    content: '/backend/setting/filemanager/viewItem/'+data.id,
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
                    $.post('/backend/setting/filemanager/delItem/'+data.id, {}, function(result){
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