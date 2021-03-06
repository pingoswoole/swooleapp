@extends('layouts.admin')

@section('body')
<div class="layui-card">
	@yield('body-title')
	<div class="layui-card-body">
		<div class="layui-container">
			<div class="layui-row">
				 
					<form class="layui-form" action="" lay-filter="form">
						@if (isset($info))
							<div class="layui-form-item">
								<label class="layui-form-label">父节点</label>
								<div class="layui-input-block">
									<input type="text" name="" value="{{$info['title']}} {{$info['href']}}" class="layui-input" disabled >
								</div>
							</div>
						@endif
						<div class="layui-form-item">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-block">
								<input type="text" name="title" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">节点标识(唯一性)</label>
							<div class="layui-input-block">
								<input type="text" name="node" required lay-verify="required" placeholder="请输入节点标识" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">菜单请求URI</label>
							<div class="layui-input-block">
								<input type="text" name="href" required   placeholder="请输入请求URI" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">例如/backadmin/index/a</div>
						</div>
						 
						<div class="layui-form-item">
							<label class="layui-form-label">是否菜单</label>
							<div class="layui-input-block">
								<input type="checkbox" name="is_menu" lay-skin="switch" checked lay-text="是|否">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				 
			</div>
		</div>
	</div>
</div>
@endsection