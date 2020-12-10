@extends('layouts.admin')

@section('body')
<div class="white p20">
    <table class="layui-hide" id="test" lay-filter="test"></table>

    <!-- 表头 -->
    <script type="text/html" id="toolbarDemo">
         
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="add">添加最高权限</button>
            </div>
     
    </script>

    <!-- 状态 -->
    <script type="text/html" id="switchStatus">
        <input type="checkbox" name="status" value="@{{d.id}}" lay-skin="switch"  lay-text="启动|禁用" lay-filter="status" @{{ d.status == 1 ? 'checked' : '' }}>
    </script>


    <!-- 操作 -->
    <script type="text/html" id="barDemo">
         
            <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="add_rule">添加</a>
        
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
       
    </script>
</div>
@endsection


@section('footer_js')
<script>
    layui.use('table', function(){
    var table = layui.table, form = layui.form;

    var datatable = table.render({
        elem: '#test'
        ,url:'/backend/rule/get_all'
        ,method:'post'
        ,toolbar: '#toolbarDemo'
        ,title: '权限'
        ,cols: [[
        {field:'id', title:'ID', width:80, fixed: 'left'}
        ,{field:'title', title:'权限名', width:220}
        ,{field:'node', title:'节点标记', width:220 , event:'edit_node'}
        ,{field:'href', title:'请求URI'}
        ,{field:'route_handler', title:'请求处理器'}
        /* ,{field:'created_at', title:'创建时间'} */
        ,{field:'status', title:'是否启用', templet: '#switchStatus', width:100}
        ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width: 180}
        ]]
        ,defaultToolbar:[]
        // ,page: true
    });

    window.refresh = function()
    {
        datatable.reload();
    }

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'add':
                 
                layer.open({
                     title: '添加最高权限'
                    ,type: 2
                    ,content: '/backend/rule/addget'
                    ,area:['90%', '90%']
                    ,end: function(){
                        location.reload()
                    }
                });
            break;
        };
    });


    form.on('switch(status)', function(obj){
        let datajson = {key:'status', value:obj.elem.checked ? '1':'0'};

        $.post('/backend/rule/set/' + this.value ,datajson,function(data){
            if(data.code != 0) {
                layer.msg(data.msg);
                obj.elem.checked = !obj.elem.checked;
                form.render();
            }
        });
    });


    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        switch(obj.event){
            case 'add_rule':
                layer.open({
                     title: '添加权限'
                    ,type: 2
                    ,content: '/backend/rule/addget/' + data.id
                    ,area:['90%', '90%']
                    ,end: function(){
                        location.reload()
                    }
                });
               // location.href = '/backend/rule/add/' + data.id;
            break;
            case 'del':
                layer.confirm('真的删除行么', function(index){
                    $.post('/backend/rule/del/' + data.id ,'',function(data){
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
                     title: '编辑权限'
                    ,type: 2
                    ,content: '/backend/rule/editget/' + data.id
                    ,area:['70%', '500px']
                });
            break;
            case 'edit_node':
                layer.prompt({
                    formType: 2
                    ,value: data.node
                }, function(value, index){
                    layer.close(index);
                    let datajson = {key:'node', value:value};
                    $.post('/backend/rule/set/' + data.id ,datajson,function(data){
                        if(data.code != 0) {
                            layer.msg(data.msg);
                        } else {
                            obj.update({
                              node: value
                            });
                        }
                    });
                });
            break;
        }
    });
});
</script>
@endsection
