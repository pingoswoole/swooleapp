@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

 
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required" disabled value="{{$title}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input type="text" name="ordersn" disabled lay-verify="required" value="{{$ordersn}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
             @php
               $address = json_decode($address, true);
             @endphp
             <p>联系人：{{$address['contact_name']?? ''}}</p>
             <p>电话：{{$address['mobile']?? ''}}</p>
             <p>地址：{{$address['province']?? ''}}{{$address['address']?? ''}}</p>
             
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">快递信息</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="express" lay-verify="required" class="layui-textarea"></textarea>
        </div>
    </div>
    <input type="hidden" name="state" value="2">
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
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)

        });

        //监听提交
        form.on('submit(formBtn)', function (data) {
             
            
            $.post('/backend/product/video_area/editItem/'+"{{$id}}", data.field, function(result){
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