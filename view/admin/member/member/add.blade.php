@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

 
<form class="layui-form" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">身份等级</label>
        <div class="layui-input-block">
          <select name="grade" lay-verify="required">
            <option value="0">游客</option>
            <option value="1">VIP</option>
            <option value="2">SVIP</option>
            
          </select>
        </div>
    </div>
   {{--  <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="account" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div> --}}
    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="pwd" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
     
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-block">
            <input type="text" name="nickname" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">头像</label>
        <div class="layui-input-block">
             @component('admin.template.form.image', ['name' => 'avatar', 'value' => '', 'title' => '选择缩略图'])
                 
             @endcomponent
        </div>
    </div>
     
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否禁用</label>
        <div class="layui-input-block">
          <input type="checkbox"   name="state" lay-skin="switch" lay-filter="switchState" title="开关">
        </div>
      </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="formBtn">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

@endsection


@section('footer_js')

 
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            ;

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 3) {
                    return '标题至少得3个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchState)', function (data) {
           /*  layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis) */

        });

        //监听提交
        form.on('submit(formBtn)', function (data) {
            
            data.field.state = data.field.state ? 1 : 0

            $.post('/backend/member/member/addItem', data.field, function(result){
                layer.msg(result.msg, {time: 2000}, function(){
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                })
            })
            return false;
        });

    });
</script>
@endsection