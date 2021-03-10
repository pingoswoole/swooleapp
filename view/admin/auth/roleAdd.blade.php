@extends('admin.auth.roleBase')

 
@section('footer_js')
<script>
layui.use('form', function(){
  var form = layui.form;

  //监听提交
  form.on('submit(submit)', function(data){
    $.post('/backadmin/auth/role/addData',data.field,function(info){
        if(info.code != 0) {
            layer.msg(info.msg);
        } else {
            layer.msg('添加成功',{time:1000},function(){
                //location.href = '/backadmin/auth/role/index';
                var index = parent.layer.getFrameIndex(window.name);  
                parent.layer.close(index);//关闭当前页
            });

        }
    });
    return false;
  });
});
</script>
@endsection
