@extends('admin.auth.ruleBase')

@section('body-title')
  {{-- <div class="layui-card-header">@if(isset($info)) {{$info['name']}} -- @endif添加权限</div> --}}
@endsection
@section('footer_js')
<script>

layui.use('form', function(){
  var form = layui.form;

  var form_field;
 
  //监听提交
  form.on('submit(submit)', function(data){
    data.field.is_menu = data.field.is_menu ? 1 : 0;
    form_field = data;
    let url = '/backadmin/auth/rule/addData'
    @if(isset($id))
      url = '/backadmin/auth/rule/addChildData?id={{$id}}'
    @endif
    http_post(url, data.field, function(result){
        if(result.code != 0) {
            layer.msg(result.msg);
        } else {
            layer.msg('添加成功', {time:1000}, function(){
                //关闭iframe页面
                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
            });
        }
    })
    return false;
  });
  
});
</script>
@endsection