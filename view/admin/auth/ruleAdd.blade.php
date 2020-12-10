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
    data.field.status = data.field.status ? 1 : 0;
    form_field = data;
    let url = '/backend/rule/add'
    @if(isset($id))
      url += '/{{$id}}'
    @endif
    http_post(url, data.field, function(result){
        if(result.code != 0) {
            layer.msg(result.msg);
        } else {
            layer.msg('添加成功', {time:1000}, function(){
                form_field.form.reset();
            });
        }
    })
    return false;
  });
  
});
</script>
@endsection