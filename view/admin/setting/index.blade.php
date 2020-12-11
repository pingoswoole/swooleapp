@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">网站设置</li>
    <li>客服联系</li>
    <li>短信配置</li>
    <li>支付配置</li>
    <li>App配置</li>
    <li>小程序配置</li>
    <li>公众号配置</li>
    <li>提现配置</li>
  </ul>
  <div class="layui-tab-content" style="">
    <div class="layui-tab-item layui-show">
      <form class="layui-form" action="" lay-filter="setting_web">
         <input type="hidden" name="set_key" value="web">
        <div class="layui-form-item">
          <label class="layui-form-label">网站名称</label>
          <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">服务协议</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'protocol', 'value' => $setting['web']['protocol']??''])@endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">隐私政策</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'privacy', 'value' => $setting['web']['privacy']??''])@endcomponent
          </div>
        </div>
         
        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
        
      </form>
    </div>
    <div class="layui-tab-item">
      <form class="layui-form" action="" lay-filter="setting_contact">
        <input type="hidden" name="set_key" value="contact">
        <div class="layui-form-item">
          <label class="layui-form-label">微信二维码</label>
          <div class="layui-input-block">
            @component('admin.template.form.image', ['name' => 'qrcode', 'value' => '', 'title' => '上传图片']) @endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">电话</label>
          <div class="layui-input-block">
            <input type="text" name="phone"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">QQ</label>
          <div class="layui-input-block">
            <input type="text" name="qq"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
      </form>
    </div>
    <div class="layui-tab-item">
      <form class="layui-form" action="" lay-filter="setting_sms">
        <input type="hidden" name="set_key" value="sms">
         
        <div class="layui-form-item">
          <label class="layui-form-label">签名</label>
          <div class="layui-input-block">
            <input type="text" name="sign_name"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">验证类模板</label>
          <div class="layui-input-block">
            <input type="text" name="code_tpl"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">通知类模板</label>
          <div class="layui-input-block">
            <input type="text" name="notice_tpl"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
      </form>
    </div>
    <div class="layui-tab-item">
      <form class="layui-form" action="" lay-filter="setting_payment">
        <input type="hidden" name="set_key" value="payment">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>支付宝</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">app_id</label>
          <div class="layui-input-block">
            <input type="text" name="app_id"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">本地私钥</label>
          <div class="layui-input-block">
            <textarea name="private_key" class="layui-textarea"  ></textarea>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">支付宝公钥</label>
          <div class="layui-input-block">
             <textarea name="ali_public_key" class="layui-textarea" ></textarea>
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>微信</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">APP APPID</label>
          <div class="layui-input-block">
            <input type="text" name="appid"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label"> 公众号 APPID</label>
          <div class="layui-input-block">
            <input type="text" name="app_id"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">小程序 APPID</label>
          <div class="layui-input-block">
            <input type="text" name="miniapp_id"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">商户号</label>
          <div class="layui-input-block">
            <input type="text" name="mchid"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">签名key</label>
          <div class="layui-input-block">
            <input type="text" name="key"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
      </form>
    </div>
    <div class="layui-tab-item">
         app配置
    </div>
    <div class="layui-tab-item">
         小程序配置
    </div>
    <div class="layui-tab-item">
          公众号配置
    </div>
    <div class="layui-tab-item">
       提现配置
    </div>
  </div>
</div> 
 

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
@endsection


@section('footer_js')

 
<script>

layui.use(['form','miniTab'], function () {
        var form = layui.form,
            layer = layui.layer
            , layer = layui.layer
            , $ = layui.jquery
            miniTab = layui.miniTab;

        //监听提交
        form.on('submit(SettingSbt)', function (data) {
            
             console.log(data.field);
             $.post("/backend/setting/index", data.field, function(result){
                layer.msg(result.msg)
             })
            return false;
        });

        //表单初始赋值
        form.val('setting_web', {
            "title": "{{$setting['web']['title']??''}}" // "name": "value"
            , "password": "123456"
            , "interest": 1
            , "like[write]": true //复选框选中状态
            , "close": true //开关状态
            , "sex": "女"
            , "desc": "我爱 layui"
        })


    });
    
</script>
@endsection