@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

 
<form class="layui-form" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">分类所属</label>
        <div class="layui-input-block">
          <select name="cate_id" lay-verify="required">
            @foreach ($cate_list as $item)
            <option value="{{$item['id']}}" @if($item['id'] === $cate_id) selected @endif>{{$item['title']}}</option>
            @endforeach
          </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required" value="{{$title}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">购买价格</label>
        <div class="layui-input-block">
            <input type="text" name="price" lay-verify="required" value="{{$price}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">抵扣金额</label>
        <div class="layui-input-block">
            <input type="text" name="deduction_price" lay-verify="required" value="{{$deduction_price}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">缩略图</label>
        <div class="layui-input-block">
             @component('admin.template.form.image', ['name' => 'thumb', 'title' => '选择缩略图', 'value' => $thumb])
                 
             @endcomponent
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠商品</label>
        <div class="layui-input-inline">
            <input type="text" name="" placeholder="请选择" value="{{$goods_title}}" autocomplete="off" class="layui-input" id="choose_onlinegoods">
            <input type="hidden" lay-verify="required" name="onlineshop_goodsid" value="{{$onlineshop_goodsid}}">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">运营商激活会员佣金</label>
        <div class="layui-input-block">
            <input type="text" name="operator_commission" lay-verify="required" value="{{$operator_commission}}" autocomplete="off" placeholder="请输入金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">间接激活会员佣金</label>
        <div class="layui-input-block">
            <input type="text" name="operator_agentactive_vip" lay-verify="required" value="{{$operator_agentactive_vip}}" autocomplete="off" placeholder="请输入金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">代理商激活会员佣金</label>
        <div class="layui-input-block">
            <input type="text" name="agent_commission" lay-verify="required" value="{{$agent_commission}}" autocomplete="off" placeholder="请输入金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">代理商购卡金额</label>
        <div class="layui-input-block">
            <input type="text" name="agent_price" lay-verify="required" value="{{$agent_price}}" autocomplete="off" placeholder="请输入金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">运营商购卡金额</label>
        <div class="layui-input-block">
            <input type="text" name="operator_price" lay-verify="required" value="{{$operator_price}}" autocomplete="off" placeholder="请输入金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">有效期（天数）</label>
        <div class="layui-input-block">
            <input type="text" name="expires" lay-verify="required" value="{{$expires}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div> 
    <div class="layui-form-item">
        <label class="layui-form-label">详情</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="description">{{$description}}</textarea>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否上架</label>
        <div class="layui-input-block">
          <input type="checkbox" @if(!empty($state)) checked @endif   name="state" lay-skin="switch" lay-filter="switchState" title="开关">
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
            , tableSelect = layui.tableSelect
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
                elem.val(NEWJSON.join(","))
                elem.siblings('input').val(data.data[0].id)
            }
        })
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

            $.post('/backend/product/couponshop_goods/editItem/{{$id}}', data.field, function(result){
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