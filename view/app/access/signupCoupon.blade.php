
@extends('layouts.app')
@section('title', '注册送购物卡')
@section('header_style')
    <style>
        .page{
            margin-top: 50px;
        }
        .detail{
          padding: 10px;
        }
        .detail span:first-child{
           
        }
        .detail span{
          color: rgb(245, 10, 22);
          font-size: 18px;
          display:block;
        }
    </style>
@endsection
@section('body')
  
<div class="page">

<div class="goods">
  <img src="{{$goods['thumb']}}" alt="" style="width: 100%">
  <p style="line-height: 30px;font-size:16px;color:rgb(59, 74, 80)">{{$goods['title']}}</p>
  <p class="detail">
    @if(empty($has_txt))
    <span>￥{{$goods['price']}}</span>
    <span>优惠券抵扣：{{$goods['deduction_price']}}</span>
        
    @else
     <span>{{$has_txt}}</span>
    @endif
    <span></span>
  </p>
</div>
<form action="#" method="POST" id="form">
 
<div class="weui-cells">
  
    <input type="hidden" name="invite_id" value="{{$invite_id??0}}">
    <input type="hidden" name="coupon_goods_id" value="{{$coupon_goods_id??0}}">
    <div class="weui-cell weui-cell_select weui-cell_select-before">
      <div class="weui-cell__hd">
        <select class="weui-select" name="select2">
          <option value="1">+86</option>
          <option value="2">+80</option>
          <option value="3">+84</option>
          <option value="4">+87</option>
        </select>
      </div>
      <div class="weui-cell__bd">
        <input class="weui-input" name="mobile" id="tel" maxlength="11" type="number" pattern="[0-9]*" placeholder="请输入号码">
      </div>
    </div>
  </div>

    <div class="weui-cell weui-cell_vcode">
      <div class="weui-cell__hd">
        <label class="weui-label">验证码</label>
      </div>
      <div class="weui-cell__bd">
        <input class="weui-input" name="code" maxlength="6" id="code"  type="tel" placeholder="请输入验证码">
      </div>
      <div class="weui-cell__ft">
        <button type="button" class="weui-vcode-btn" id="send_code"  >获取验证码</button>
      </div>
    </div>
      
  </div>
  
  <div class="weui-cells weui-cells_form">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" name="pwd" type="password" id="pass"  maxlength="15" placeholder="请输入密码">
      </div>
   </div>
  
<div class="weui-cells weui-cells_form" >
 <div class="weui-cell" style="justify-content: center;align-items:center">
  <label for="weuiAgree" class="weui-agree">
    <input id="weuiAgree" type="checkbox"  class="weui-agree__checkbox">
    <span class="weui-agree__text">
      阅读并同意
    </span>
</label>
 <a style="margin-left: -20px;color:#36b1f1" class="weui-agree weui-agree__text" href="/api/platform/viewRule/1">《服务协议》</a>
 
</div>
</div>
</form>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">注册立即享受活动</a>
  </div>
</div>
@endsection

@section('footer_js')

<script type="text/javascript">
    $(function(){

        var sendCodeFlag = false;

        $("#send_code").click(function(){

            var _this = $(this);
            var time = 60;
            var timer = null;
            _this.html(time + '秒后重新发送');
            _this.attr('disabled', 'disabled');  // 禁用按钮
            //获取验证码
            $.get("/api/access/getCode", {},
                function (data, textStatus, jqXHR) {
                    $.toast(data.msg, "text");
                    if(data.code == 0 ){
                        //定时器启动
                    } 
                }
            );
            timer = setInterval(function(){
                // 定时器到底了 兄弟们回家啦
                if(time == 1){
                clearInterval(timer);       
                _this.html('获取验证码');  
                _this.removeAttr('disabled'); 
                
                }else{
                time--;
                _this.html(time + '秒后重新发送');
                }
            }, 1000)
        })
        
        $("#showTooltips").click(function() {
        var tel = $('#tel').val();
        var code = $('#code').val();
        var pass = $('#pass').val();
        var agreet = $('#weuiAgree').prop('checked');

        if(!tel || !/^1[3|4|5|6|7|8]\d{9}$/.test(tel)) $.toptip('请输入手机号');
        else if(!code || !/\d{6}/.test(code)) $.toptip('请输入六位手机验证码');
        else if(!pass ||  pass.length < 6 ) $.toptip('请输入六位以上的密码');
        else if(!agreet) $.toptip('请同意服务协议');
        else{

            $.post("/api/access/register", $('#form').serialize(),
                function (result, textStatus, jqXHR) {
                    if(result.code == 0 ){
                        window.location.href = "/api/access/download"
                    }else{
                        $.toast(result.msg, "forbidden");
                    }
                }
            );
        }
      });
    });
</script>   
@endsection