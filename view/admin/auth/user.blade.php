@extends('layouts.admin')

@section('stylesheet')
    <style type="text/css">
        .header-table{
            margin:10px;
        }
    </style>
@endsection

@section('body')
<div class="white p20">
    <table class="layui-hide" id="test" lay-filter="test"></table>

    <script type="text/html" id="toolbarDemo">
        <!-- <div class="layui-inline">
            <input class="layui-input layui-btn-sm" name="id" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn layui-btn-sm" data-type="reload">搜索</button> -->
      
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="add">添加管理员</button>
        
    </script>

    <script type="text/html" id="barDemo">
        
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
       
            @verbatim
            {{#  if(d.id > 1){ }}
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            {{#  } }} 
            @endverbatim
    </script>

    <script type="text/html" id="switchTpl">
        <input type="checkbox" name="status" value="@{{d.id}}" lay-skin="switch"   lay-text="启用|禁用" lay-filter="status" @{{ d.status == 1 ? 'checked' : '' }}>
    </script>
</div>
@endsection


@section('footer_js')
<script>
layui.use('table', function(){
  var table = layui.table, form = layui.form;

  var datatable = table.render({
    elem: '#test'
    ,url:'/backadmin/auth/user/get_all'
    ,method:'post'
    ,toolbar: '#toolbarDemo'
    ,page: true
    ,title: '用户数据表'
    ,cols: [[
      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'uname', title:'用户名', width:120  , event:'edit_uname'  }
      ,{field:'display_name', title:'真实用户名', event:'edit_name' }
      ,{field:'role_name', title:'所属组'}
      ,{field:'created_at', title:'创建时间', }
      ,{field:'logined_at', title:'最近登录时间'}
      ,{field:'status', title:'状态', templet: '#switchTpl', unresize: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
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
                
                layer.open({
                     title: '添加管理员'
                    ,type: 2
                    ,content: '/backadmin/auth/user/add'
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

        $.post('/backadmin/auth/user/set?id=' + this.value ,datajson,function(data){
            layer.msg(data.msg);
            if(data.code != 0) {
                //layer.msg(data.msg);
                obj.elem.checked = !obj.elem.checked;
                form.render();
            }
        });
    });

  //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        event = obj.event;

        switch(obj.event){
            case 'del':
                layer.confirm('真的删除行么', function(index){
                    $.post('/backadmin/auth/user/del?id=' + data.id ,'',function(data){
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
                    ,content: '/backadmin/auth/user/edit?id=' + data.id
                    ,area:['550px', '470px']
                });
            break;
            case 'edit_uname':
                layer.prompt({
                    formType: 2
                    ,value: data.uname
                }, function(value, index){
                    layer.close(index);
                    let datajson = {key:'uname', value:value};
                    $.post('/backadmin/auth/user/set?id=' + data.id ,datajson,function(data){
                        layer.msg(data.msg);
                        if(data.code != 0) {
                            //layer.msg(data.msg);
                        } else {
                            obj.update({
                              uname: value
                            });
                        }
                    });
                });
            break;
            case 'edit_name':
                layer.prompt({
                    formType: 2
                    ,value: data.display_name
                }, function(value, index){
                    layer.close(index);
                    let datajson = {key:'display_name', value:value};
                    $.post('/backadmin/auth/user/set?id=' + data.id ,datajson,function(data){
                        layer.msg(data.msg);
                        if(data.code != 0) {
                            
                        } else {
                            obj.update({
                              display_name: value
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