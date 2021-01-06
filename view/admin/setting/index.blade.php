@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">网站设置</li>
    <li>客服联系</li>
    <li>短信配置</li>
    <li>上传配置</li>
    <li>支付配置</li>
    <li>App配置</li>
    <li>小程序配置</li>
    <li>公众号配置</li>
    <li>提现配置</li>
    <li>分销配置</li>
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
          <label class="layui-form-label">LOGO</label>
          <div class="layui-input-block">
            @component('admin.template.form.image', ['name' => 'logo', 'value' => $setting['web']['logo']??'', 'title' => '上传图片', 'return' => 'url']) @endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">网站域名</label>
          <div class="layui-input-block">
            <input type="text" name="app_url"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        {{-- <div class="layui-form-item">
          <label class="layui-form-label">全国统一邮费</label>
          <div class="layui-input-block">
            <input type="text" name="default_express_fee" lay-verify="required" value="{{$setting['web']['default_express_fee']??0}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div> --}}
        <div class="layui-form-item">
          <label class="layui-form-label">普通区域邮费</label>
          <div class="layui-input-block">
            @php
                $province = config('app.province');
                
            @endphp
            @foreach ($province as $key => $item)
              <input type="checkbox" name="normal_express_area[{{$key}}]" lay-skin="primary" title="{{$item}}" @if(isset($setting['web']['normal_express_area'][$key])) checked="" @endif>
            @endforeach
            
          </div>
         
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <input type="text" name="normal_express_fee" lay-verify="required" value="{{$setting['web']['normal_express_fee']??0}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">特殊区域邮费</label>
          <div class="layui-input-block">
            @foreach ($province as $key => $item)
              <input type="checkbox" name="special_express_area[{{$key}}]" lay-skin="primary" title="{{$item}}" @if(isset($setting['web']['special_express_area'][$key])) checked="" @endif>
            @endforeach
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <input type="text" name="special_express_fee" lay-verify="required" value="{{$setting['web']['special_express_fee']??0}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">关于我们</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'aboutus', 'value' => $setting['web']['aboutus']??''])@endcomponent
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
            @component('admin.template.form.image', ['name' => 'qrcode', 'value' => $setting['contact']['qrcode'], 'title' => '上传图片', 'return' => 'url']) @endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">电话</label>
          <div class="layui-input-block">
            <input type="text" name="phone"  autocomplete="off" value="{{$setting['contact']['phone']?? ''}}" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">QQ</label>
          <div class="layui-input-block">
            <input type="text" name="qq"  autocomplete="off" value="{{$setting['contact']['qq']?? ''}}" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">工作时间</label>
          <div class="layui-input-block">
            <input type="text" name="worktime"  autocomplete="off" value="{{$setting['contact']['worktime']?? ''}}" placeholder="请输入内容" class="layui-input">
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
            <input type="text" name="sign_name" value="{{$setting['sms']['sign_name']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">验证类模板</label>
          <div class="layui-input-block">
            <input type="text" name="code_tpl" value="{{$setting['sms']['code_tpl']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">通知类模板</label>
          <div class="layui-input-block">
            <input type="text" name="notice_tpl" value="{{$setting['sms']['notice_tpl']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
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
      <form class="layui-form" action="" lay-filter="setting_storage">
        <input type="hidden" name="set_key" value="storage">
        <div class="layui-form-item">
          <label class="layui-form-label">存储类型</label>
          <div class="layui-input-inline">
            <select name="provider" >
              <option value="0">本地</option>
              <option value="1" >七牛</option>
              <option value="2">阿里云</option>
            </select>
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>本地</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">域名</label>
          <div class="layui-input-block">
            <input type="text" name="local_base_uri" value="{{$setting['storage']['local_base_uri']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>七牛云</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">AccessKeyId</label>
          <div class="layui-input-block">
            <input type="text" name="qiniu_access_key" value="{{$setting['storage']['qiniu_access_key']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">AccessKeySecret</label>
          <div class="layui-input-block">
            <input type="text" name="qiniu_access_key_secret" value="{{$setting['storage']['qiniu_access_key_secret']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">域名</label>
          <div class="layui-input-block">
            <input type="text" name="qiniu_base_uri" value="{{$setting['storage']['qiniu_base_uri']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">Bucket</label>
          <div class="layui-input-block">
            <input type="text" name="qiniu_bucket" value="{{$setting['storage']['qiniu_bucket']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>阿里云</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">AccessKeyId</label>
          <div class="layui-input-block">
            <input type="text" name="aliyun_access_key" value="{{$setting['storage']['aliyun_access_key']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">AccessKeySecret</label>
          <div class="layui-input-block">
            <input type="text" name="aliyun_access_key_secret" value="{{$setting['storage']['aliyun_access_key_secret']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">域名</label>
          <div class="layui-input-block">
            <input type="text" name="aliyun_base_uri" value="{{$setting['storage']['aliyun_base_uri']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">Bucket</label>
          <div class="layui-input-block">
            <input type="text" name="aliyun_bucket" value="{{$setting['storage']['aliyun_bucket']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
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
        <div class="layui-form-item">
          <label class="layui-form-label">异步通知URL</label>
          <div class="layui-input-block">
            <input type="text" name="notify_url"   value="{{$setting['payment']['notify_url']?? '/api/pay/notify'}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>支付宝</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">app_id</label>
          <div class="layui-input-block">
            <input type="text" name="alipay_app_id" value="{{$setting['payment']['alipay_app_id']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">本地私钥</label>
          <div class="layui-input-block">
            <textarea name="alipay_private_key"   class="layui-textarea"  >{{$setting['payment']['alipay_private_key']?? ''}}</textarea>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">支付宝公钥</label>
          <div class="layui-input-block">
             <textarea name="ali_public_key"  class="layui-textarea" >{{$setting['payment']['ali_public_key']?? ''}}</textarea>
          </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>微信</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">APP APPID</label>
          <div class="layui-input-block">
            <input type="text" name="wechat_appid"  value="{{$setting['payment']['wechat_appid']?? ''}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label"> 公众号 APPID</label>
          <div class="layui-input-block">
            <input type="text" name="wechat_app_id" value="{{$setting['payment']['wechat_app_id']?? ''}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">小程序 APPID</label>
          <div class="layui-input-block">
            <input type="text" name="wechat_miniapp_id" value="{{$setting['payment']['wechat_miniapp_id']?? ''}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">商户号</label>
          <div class="layui-input-block">
            <input type="text" name="wechat_mchid" value="{{$setting['payment']['wechat_mchid']?? ''}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">签名key</label>
          <div class="layui-input-block">
            <input type="text" name="wechat_key" value="{{$setting['payment']['wechat_key']?? ''}}" autocomplete="off" placeholder="请输入内容" class="layui-input">
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
      <form class="layui-form" action="" lay-filter="setting_app">
        <input type="hidden" name="set_key" value="app">
         
        <div class="layui-form-item">
          <label class="layui-form-label">版本</label>
          <div class="layui-input-block">
            <input type="text" name="version"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">升级内容</label>
          <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="content" class="layui-textarea">{{$setting['app']['content']}}</textarea>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">更新包</label>
          <div class="layui-input-block">
             @component('admin.template.form.uploadfile' , ['name' => 'file', 'value' => $setting['app']['file'], 'title' => '上传更新包', 'return' => 'url'])@endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">分发平台地址</label>
          <div class="layui-input-block">
            <input type="text" name="fenfa_url" value="{{$setting['app']['fenfa_url']??''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">安卓下载地址</label>
          <div class="layui-input-block">
            <input type="text" name="android_url" value="{{$setting['app']['android_url']??''}}"   autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">苹果下载地址</label>
          <div class="layui-input-block">
            <input type="text" name="ios_url" value="{{$setting['app']['ios_url']??''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
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
         小程序配置
    </div>
    
    <div class="layui-tab-item">
          公众号配置
    </div>

    <div class="layui-tab-item">
       提现配置
    </div>

    <div class="layui-tab-item">
      <form class="layui-form" action="" lay-filter="setting_distribution">
        <input type="hidden" name="set_key" value="distribution">
       {{--  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>会员</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">升级指定购买</label>
          <div class="layui-input-block">
            <input type="text" name="upgradevip_goods_title" value="{{$setting['distribution']['upgradevip_goods_title']??''}}" placeholder="请点击选择商品" autocomplete="off" class="layui-input" id="choose_onlinegoods">
            <input type="hidden" lay-verify="required" name="upgradevip_goodsid" value="{{$setting['distribution']['upgradevip_goodsid']??0}}">
          </div>
        </div> --}}
        <div class="layui-form-item">
          <label class="layui-form-label">分享注册卡包抵扣文字</label>
          <div class="layui-input-block">
            <input type="text" name="share_coupon_txt" value="{{$setting['distribution']['share_coupon_txt']??''}}" placeholder="" autocomplete="off" class="layui-input" >
            
          </div>
        </div> 

        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px;">
          <legend>代理商</legend>
        </fieldset>
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">升级费用</label>
            <div class="layui-input-inline">
              <input type="text" name="upgrade_agent_fee" value="{{$setting['distribution']['upgrade_agent_fee']??''}}" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">升级赠卡数量</label>
            <div class="layui-input-inline">
              <input type="text" name="upgrade_agent_getcoupon_no" value="{{$setting['distribution']['upgrade_agent_getcoupon_no']?? 0}}" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">升级赠卡选择</label>
            <div class="layui-input-inline">
              <input type="text" name="upgrade_agent_getcoupon_goodstitle" value="{{$setting['distribution']['upgrade_agent_getcoupon_goodstitle']?? ''}}"   id="choose_coupon_goods" autocomplete="off" class="layui-input">
              <input type="hidden" lay-verify="required" name="upgrade_agent_getcoupon_goodsid" value="{{$setting['distribution']['upgrade_agent_getcoupon_goodsid']??0}}">
            </div>
          </div>
        </div>
        {{-- <div class="layui-form-item">
          <label class="layui-form-label">购卡折扣</label>
          <div class="layui-input-inline">
            <input type="text" name="agent_buycoupon_discount" lay-verify="required" value="{{$setting['distribution']['agent_buycoupon_discount']?? 0}}" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">激活会员提成</label>
          <div class="layui-input-inline">
            <input type="text" name="agent_active_vip" value="{{$setting['distribution']['agent_active_vip']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div> --}}
        <div class="layui-form-item">
          <label class="layui-form-label">会员升级代理提成</label>
          <div class="layui-input-inline">
            <input type="text" name="agent_active_agent" value="{{$setting['distribution']['agent_active_agent']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">元</div>
        </div>
        <p>升级运营商条件</p>
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">代理商累计</label>
            <div class="layui-input-inline">
              <input type="tel" name="upgrade_operator_need_agent" value="{{$setting['distribution']['upgrade_operator_need_agent']?? 0}}"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">人以上</div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">会员累计</label>
            <div class="layui-input-inline">
              <input type="text" name="upgrade_operator_need_vip" value="{{$setting['distribution']['upgrade_operator_need_vip']?? 0}}" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">人以上</div>
          </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>运营商</legend>
        </fieldset>
        {{-- <div class="layui-form-item">
          <label class="layui-form-label">购卡折扣</label>
          <div class="layui-input-inline"> 
            <input type="text" name="operator_buycoupon_discount" value="{{$setting['distribution']['operator_buycoupon_discount']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">激活会员提成</label>
          <div class="layui-input-inline">
            <input type="text" name="operator_active_vip" value="{{$setting['distribution']['operator_active_vip']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div> --}}
        <div class="layui-form-item">
          <label class="layui-form-label">会员升级代理提成</label>
          <div class="layui-input-inline">
            <input type="text" name="operator_getvip_toagent" value="{{$setting['distribution']['operator_getvip_toagent']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">元</div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">间接升级代理提成</label>
          <div class="layui-input-inline">
            <input type="text" name="operator_indirect_toagent" value="{{$setting['distribution']['operator_indirect_toagent']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">元</div>
        </div>
       {{--  <div class="layui-form-item">
          <label class="layui-form-label">线下代理商激活会员提成</label>
          <div class="layui-input-inline">
            <input type="text" name="operator_agentactive_vip" value="{{$setting['distribution']['operator_agentactive_vip']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">线下代理商购卡提成</label>
          <div class="layui-input-inline">
            <input type="text" name="operator_agent_buycoupon" value="{{$setting['distribution']['operator_agent_buycoupon']?? 0}}" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">%</div>
        </div> --}}
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
          <legend>升级说明</legend>
        </fieldset>
        <div class="layui-form-item">
          <label class="layui-form-label">会员升级说明</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'vip_des', 'value' => $setting['distribution']['vip_des']??''])@endcomponent
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">代理商升级说明</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'agent_desc', 'value' => $setting['distribution']['agent_desc']??''])@endcomponent
          </div>
        </div>   
        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
      </form>
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

layui.use(['form','miniTab', 'tableSelect'], function () {
        var form = layui.form,
            layer = layui.layer
            , layer = layui.layer
            , tableSelect = layui.tableSelect
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
        tableSelect.render({
            elem: '#choose_coupon_goods',
            checkedKey: 'id',
            table: {
                url: '/backend/product/couponshop_goods/getPageList',
                cols: [[
                    { type: 'radio' },
                    { field: 'id', title: 'ID' },
                    { field: 'title', title: '名称' },
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
        
        //表单初始赋值
        form.val('setting_web', {
            "title": "{{$setting['web']['title']??''}}"
            ,"app_url": "{{$setting['web']['app_url']??''}}"
            , "password": "123456"
            , "interest": 1
            , "like[write]": true //复选框选中状态
            , "close": true //开关状态
            , "sex": "女"
            , "desc": "我爱 layui"
        })

        form.val('setting_app', {
            "version": "{{$setting['app']['version']??''}}"
            , "password": "123456"
            
        })
        

    });
    
</script>
@endsection