@extends('layouts.admin')

@section('body')
<div class="white p20">
    <table class="layui-hide" id="test" lay-filter="test"></table>
    <script type="text/html" id="toolbarDemo">
        
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="add">添加角色组</button>
            </div>
         
    </script>

    <script type="text/html" id="barDemo">
        
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="editRule">变更权限</a>
        
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        
    </script>
</div>
@endsection


@section('footer_js')
<script>

    layui.use('table', function(){
    var table = layui.table;

    var datatable = table.render({
        elem: '#test'
        ,'url' :'/backend/role/get_all'
        ,method:'post'
        ,toolbar: '#toolbarDemo'
        ,title: '角色权限表'
        ,cols: [[
        {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
        ,{field:'name', title:'角色组', width:220}
        ,{field:'detail', title:'描述' , edit: 'text' , event:'edit_detail'}
        ,{field:'created_at', title:'创建时间'}
        ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width: 250}
        ]]
        ,defaultToolbar:[]
    });
    window.refresh = function()
    {
        datatable.reload();
    }

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        switch(obj.event){
            case 'add':
                //location.href="/backend/role/add";
                layer.open({
                     title: '添加角色'
                    ,type: 2
                    ,content: '/backend/role/addget'
                    ,area:['90%', '90%']
                    ,end: function(){
                        location.reload()
                    }
                });
            break;
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        switch(obj.event){
            // case 'edit_name':
            //     layer.prompt({
            //         formType: 2
            //         ,value: data.name
            //     }, function(value, index){
            //         layer.close(index);
            //         let datajson = {key:'name', value:value};
            //         $.post('/role/set/' + data.id ,datajson,function(data){
            //             if(data.code != 0) {
            //                 layer.msg(data.msg);
            //             } else {
            //                 obj.update({
            //                   name: value
            //                 });
            //             }
            //         });
            //     });
            // break;
            case 'edit_detail':
                layer.prompt({
                    formType: 2
                    ,value: data.detail
                }, function(value, index){
                    layer.close(index);
                    let datajson = {key:'detail', value:value};
                    $.post('/backend/role/set/' + data.id ,datajson,function(data){
                        if(data.code != 0) {
                            layer.msg(data.msg);
                        } else {
                            obj.update({
                              detail: value
                            });
                        }
                    });
                });
            break;
            case 'del':
                layer.confirm('真的删除行么', function(index){
                    $.post('/backend/role/del/' + data.id ,'',function(data){
                        layer.close(index);
                        if(data.code != 0) {
                            layer.msg(data.msg);
                        } else {
                            obj.del();
                        }
                    });
                });
            break;
            case 'edit':
                layer.open({
                     title: '编辑角色组'
                    ,type: 2
                    ,content: '/backend/role/editget/' + data.id
                    ,area:['500px', '350px']
                });
            break;
            case 'editRule':
                layer.open({
                    type: 2,
                    maxmin: true, // 显示最大最小化按钮
                    area: ['500px', '450px'],
                    title: '变更权限',
                    content: '/backend/role/edit_ruleget/' + data.id,
                });
            break;
        }
    });
});
</script>
@endsection
