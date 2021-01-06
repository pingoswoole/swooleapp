
@extends('layouts.app')
@section('title', '下载App享受福利')
@section('header_style')
    <style>
        .page{
            margin-top: 50px;
        }
    </style>
@endsection
@section('body')
  
<div class="page">


    <div class="weui-msg">
        <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
        <div class="weui-msg__text-area">
          <h2 class="weui-msg__title">注册成功</h2>
          <p class="weui-msg__desc">选择手机类型，下载APP安装</p>
        </div>
        <div class="weui-msg__opr-area">
          <p class="weui-btn-area">
            <a href="{{setting('app.android_url')}}" class="weui-btn weui-btn_primary">安卓手机</a>
            <a href="{{setting('app.ios_url')}}" class="weui-btn weui-btn_default">苹果手机</a>
          </p>
        </div>

    <div class="weui-footer weui-footer_fixed-bottom">
        <p class="weui-footer__links">
          <a href="javascript:void(0);" class="weui-footer__link">App分发下载</a>
        </p>
        <p class="weui-footer__text">Copyright © 2008-2099</p>
    </div>
</div>
@endsection

@section('footer_js')

<script type="text/javascript">
    $(function(){
        
      });
    });
</script>   
@endsection