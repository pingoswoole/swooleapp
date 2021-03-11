@extends('admin.auth.ruleBase')

@section('footer_js')
<script>

layui.use('form', function(){
	var form = layui.form;

	form.val("form", {
		"title": "{{ $info['title'] }}"
		,"node": "{{ $info['node'] }}"
		,"is_menu": {{ $info['is_menu'] }}
		,"href": "{!! $info['href'] !!}"
		 
	});


	//监听提交
	form.on('submit(submit)', function(data){
		data.field.is_menu = data.field.is_menu ? 1 : 0;
		$.post('/backadmin/auth/rule/editData?id='+{{ $info['id'] }},data.field,function(info){
		    if(info.code != 0) {
				layer.msg(info.msg);
			} else {
				layer.msg('编辑成功',{time:1000},function(){
		            parent.layer.close(parent.layer.getFrameIndex(window.name));
		            parent.refresh();
		        });
			}
		});
		return false;
	});
});
</script>
@endsection