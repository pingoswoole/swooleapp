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
    <li>会员特权</li>
    <li>聊天配置</li>
    <li>Uni推送</li>
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
          <label class="layui-form-label">微信</label>
          <div class="layui-input-block">
            <input type="text" name="wechat"  autocomplete="off" value="{{$setting['contact']['wechat']?? ''}}" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">工作时间</label>
          <div class="layui-input-block">
            <input type="text" name="worktime"  autocomplete="off" value="{{$setting['contact']['worktime']?? ''}}" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">其它</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'desc', 'value' => $setting['contact']['desc']??''])@endcomponent
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
              <option value="0" @if($setting['storage']['provider'] == 0) selected @endif>本地</option>
              <option value="1" @if($setting['storage']['provider'] == 1) selected @endif>七牛</option>
              <option value="2" @if($setting['storage']['provider'] == 2) selected @endif>阿里云</option>
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
          <label class="layui-form-label">endpoint</label>
          <div class="layui-input-block">
            <input type="text" name="aliyun_endpoint" value="{{$setting['storage']['aliyun_endpoint']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
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
          <label class="layui-form-label">发卡VIP购买链接</label>
          <div class="layui-input-block">
            <input type="text" name="faka_vip_url"   value="{{$setting['payment']['faka_vip_url']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">发卡SVIP购买链接</label>
          <div class="layui-input-block">
            <input type="text" name="faka_svip_url"   value="{{$setting['payment']['faka_svip_url']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">发卡购买介绍</label>
          <div class="layui-input-block">
            @component('admin.template.form.editor', ['name' => 'faka_intro', 'value' => $setting['payment']['faka_intro']??''])@endcomponent
          </div>
        </div>
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
          <label class="layui-form-label">背景图</label>
          <div class="layui-input-block">
            @component('admin.template.form.image', ['name' => 'bg', 'value' => $setting['app']['bg']??'', 'title' => '上传图片', 'return' => 'url']) @endcomponent
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
      <form class="layui-form" action="" lay-filter="setting_privilege">
        <input type="hidden" name="set_key" value="privilege">
        <!--<div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">VIP价格</label>
            <div class="layui-input-inline">
              <input type="text" name="vip_price"  autocomplete="off" value="{{$setting['privilege']['vip_price']?? ''}}" placeholder="请输入内容" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">SVIP价格</label>
            <div class="layui-input-inline">
              <input type="text" name="svip_price"  autocomplete="off" value="{{$setting['privilege']['svip_price']?? ''}}" placeholder="请输入内容" class="layui-input">
            </div>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">签到赠送积分</label>
          <div class="layui-input-block">
            <input type="text" name="sign_score"  autocomplete="off" value="{{$setting['privilege']['sign_score']?? ''}}" placeholder="请输入内容" class="layui-input">
          </div>
        </div>-->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
          <legend>发贴权限</legend>
        </fieldset>
         
        <div class="layui-form-item">
          <label class="layui-form-label">是否实名认证</label>
          <div class="layui-input-block">
              <input type="checkbox" @if(isset($setting['privilege']['publish_article_need_realname'])) checked="" @endif  name="publish_article_need_realname" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
          </div>
        </div>
        <div class="layui-form-item" pane="">
          <label class="layui-form-label">会员身份</label>
          <div class="layui-input-block">
            <input type="checkbox" name="publish_article_member[all]" title="所有人" @if(isset($setting['privilege']['publish_article_member']['all'])) checked="" @endif>
            <input type="checkbox" name="publish_article_member[vip]" title="VIP" @if(isset($setting['privilege']['publish_article_member']['vip'])) checked="" @endif>
            <input type="checkbox" name="publish_article_member[svip]" title="SVIP" @if(isset($setting['privilege']['publish_article_member']['svip'])) checked="" @endif>
          </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
          <legend>发短视频权限</legend>
        </fieldset>
         
        <div class="layui-form-item">
          <label class="layui-form-label">是否实名认证</label>
          <div class="layui-input-block">
              <input type="checkbox" @if(isset($setting['privilege']['publish_video_need_realname'])) checked="" @endif name="publish_video_need_realname" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
          </div>
        </div>
        <div class="layui-form-item" pane="">
          <label class="layui-form-label">会员身份</label>
          <div class="layui-input-block">
            <input type="checkbox" name="publish_video_member[all]" title="所有人" @if(isset($setting['privilege']['publish_video_member']['all'])) checked="" @endif>
            <input type="checkbox" name="publish_video_member[vip]" title="VIP" @if(isset($setting['privilege']['publish_video_member']['vip'])) checked="" @endif>
            <input type="checkbox" name="publish_video_member[svip]" title="SVIP" @if(isset($setting['privilege']['publish_video_member']['svip'])) checked="" @endif>
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
      <form class="layui-form" action="" lay-filter="setting_chatting">
        <input type="hidden" name="set_key" value="chatting">
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">非会员每个对话最多条数</label>
            <div class="layui-input-inline">
              <input type="text" name="visitor_chat_num"  autocomplete="off" value="{{$setting['chatting']['visitor_chat_num']?? 1}}" placeholder="请输入内容" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
          </div>
          
        </div>
       
        <div class="layui-form-item">
          <label class="layui-form-label">默认屏蔽内容</label>
          <div class="layui-input-block">
            <input type="checkbox" name="sys_filter[mobile]" title="电话" @if(isset($setting['chatting']['sys_filter']['mobile'])) checked="" @endif>
            <input type="checkbox" name="sys_filter[number]" title="纯数字" @if(isset($setting['chatting']['sys_filter']['number'])) checked="" @endif>
            <input type="checkbox" name="sys_filter[link]" title="链接" @if(isset($setting['chatting']['sys_filter']['link'])) checked="" @endif>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">对方资料查看（qq、微信、作品）</label>
          <div class="layui-input-block">
            <input type="checkbox" name="chat_view_profile[all]" title="所有人" @if(isset($setting['chatting']['chat_view_profile']['all'])) checked="" @endif>
            <input type="checkbox" name="chat_view_profile[vip]" title="VIP" @if(isset($setting['chatting']['chat_view_profile']['vip'])) checked="" @endif>
            <input type="checkbox" name="chat_view_profile[svip]" title="SVIP" @if(isset($setting['chatting']['chat_view_profile']['svip'])) checked="" @endif>
          </div>
        </div>
        <div class="layui-form-item layui-form-text">
          <label class="layui-form-label">自定义过滤内容</label>
          <div class="layui-input-block">
            <textarea placeholder="请输入内容,多个以|分隔" name='custom_filter' class="layui-textarea">{{$setting['chatting']['custom_filter']??''}}</textarea>
          </div>
          <div class="layui-form-mid layui-word-aux">多个用|分隔符</div>
        </div> 

        <div class="layui-form-item">
          <div class="layui-input-block">
              <button class="layui-btn" lay-submit="" lay-filter="SettingSbt">立即提交</button>
          </div>
       </div>
      </form>
    </div>


    <div class="layui-tab-item">
      <form class="layui-form" action="" lay-filter="setting_unipush">
        <input type="hidden" name="set_key" value="unipush">
         
        <div class="layui-form-item">
          <label class="layui-form-label">app_key</label>
          <div class="layui-input-block">
            <input type="text" name="app_key" value="{{$setting['unipush']['app_key']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">app_id</label>
          <div class="layui-input-block">
            <input type="text" name="app_id" value="{{$setting['unipush']['app_id']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">master_secret</label>
          <div class="layui-input-block">
            <input type="text" name="master_secret" value="{{$setting['unipush']['master_secret']?? ''}}"  autocomplete="off" placeholder="请输入内容" class="layui-input">
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