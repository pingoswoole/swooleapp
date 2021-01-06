@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

 
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required" value="{{$title}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品ID</label>
        <div class="layui-input-block">
            <input type="text" name="goods_id" id="choose_onlinegoods" lay-verify="required" value="{{$goods_id}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>
        <div class="layui-input-block">
          @component('admin.template.form.image', ['name' => 'path', 'value' => $path?? '', 'title' => '上传图片', 'return' => 'url']) @endcomponent
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
    layui.use(['form', 'layedit', 'laydate', 'tableSelect'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , tableSelect = layui.tableSelect
            ;

        tableSelect.render({
            elem: '#choose_onlinegoods',
            checkedKey: 'id',
            table: {
                url: '/backend/product/onlineshop_goods/getPageList',
                cols: [[
                    { type: 'radio' },
                    { field: 'id', title: 'ID' },
                    { field: 'title', title: '名称' },
                    { field: 'thumb', title: '缩略图',templet: function(data){
                        return '<img width="50px" src="'+data.thumb+'" />'
                    } },
                    { field: 'cate_title', title: '分类' }
                ]]
            },
            done: function (elem, data) {
                console.log(elem, data)
                var NEWJSON = []
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.title)
                })
                //elem.val(NEWJSON.join(","))
                elem.val(data.data[0].id)
            }
        })
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
             
            $.post('/backend/product/swiper_slider/editItem/'+"{{$id}}", data.field, function(result){
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