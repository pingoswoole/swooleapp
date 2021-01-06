<?php
/**
 * App
 * @author pingo
 */

//路由前缀
$route['namespace'] = '/api';

//路由明细列表
$route['list'] = [
    //会话管理
    ['POST', '/access/register', '\App\Common\AccessController@register'],
    ['POST', '/access/login', '\App\Common\AccessController@login'],
    ['POST', '/access/logout', '\App\Common\AccessController@logout'],
    ['POST', '/access/refresh', '\App\Common\AccessController@refreshToken'],
    ['GET', '/access/signup/shareCoupon', '\App\Common\AccessController@viewCouponSignUp'],
    ['GET', '/access/signup/shareApp', '\App\Common\AccessController@viewAppSignUp'],
    
    ['GET', '/access/download', '\App\Common\AccessController@download'],
    //用户
    ['GET', '/member/getProfile', '\App\Member\MemberController@getProfile'],
    ['POST', '/member/editProfile', '\App\Member\MemberController@editProfile'],
    ['GET', '/member/getAssetStatis', '\App\Member\MemberController@getAssetStatis'],
    ['POST', '/member/bindInviter', '\App\Member\MemberController@bindInviter'],
    
    ['GET', '/member/shopaddress/getList', '\App\Member\ShopAddressController@getList'],     
    ['GET', '/member/shopaddress/getItem', '\App\Member\ShopAddressController@getItem'],
    ['POST', '/member/shopaddress/addItem', '\App\Member\ShopAddressController@addItem'],      
    ['POST', '/member/shopaddress/editItem', '\App\Member\ShopAddressController@editItem'],     
    ['POST', '/member/shopaddress/delItem', '\App\Member\ShopAddressController@delItem'],     
    
    ['GET', '/member/bankcard/getList', '\App\Member\BankCardController@getList'],     
    ['GET', '/member/bankcard/getItem', '\App\Member\BankCardController@getItem'],
    ['POST', '/member/bankcard/addItem', '\App\Member\BankCardController@addItem'],      
    ['POST', '/member/bankcard/editItem', '\App\Member\BankCardController@editItem'],     
    ['POST', '/member/bankcard/delItem', '\App\Member\BankCardController@delItem'], 

    ['GET', '/member/assets/getLogList', '\App\Member\AssetLogController@getLogList'],
    ['GET', '/member/assets/getGroup', '\App\Member\MemberController@getGroup'],
    ['POST', '/member/assets/withdraw', '\App\Member\WithdrawController@withdraw'],

    //文件上传
    ['POST', '/common/upload', '\App\Common\UploadController@handle'],
    //平台相关信息
    ['GET', '/platform/getPrivacy', '\App\Common\PlatformController@getPrivacy'],
    ['GET', '/platform/getProtocol', '\App\Common\PlatformController@getProtocol'],
    ['GET', '/platform/getAboutus', '\App\Common\PlatformController@getAboutus'],
    ['GET', '/platform/getContact', '\App\Common\PlatformController@getContact'],
    ['GET', '/platform/viewRule/{id:\d+}', '\App\Common\PlatformController@viewRule'],
    ['GET', '/platform/getAppUpgrade', '\App\Common\PlatformController@getAppUpgrade'],
    ['POST', '/platform/feedback', '\App\Common\PlatformController@feedback'],
    ['GET', '/platform/getProvince', '\App\Common\PlatformController@getProvince'],
    
    //产品
    ['GET', '/coupon_shop_goods/getList', '\App\Product\CouponShopGoodsController@getList'],
    ['GET', '/coupon_shop_order/getList', '\App\Product\CouponShopOrderController@getList'],
    ['GET', '/coupon_shop_order/getStateList', '\App\Product\CouponShopOrderController@getStateList'],

    ['GET', '/faq/getList', '\App\Product\FaqController@getList'],
    ['GET', '/share/shareCoupon', '\App\Product\ShareController@shareCoupon'],
    ['GET', '/share/shareApp', '\App\Product\ShareController@shareApp'],
    ['GET', '/message/getList', '\App\Product\MessageController@getList'],
    ['GET', '/swiper_slider/getList', '\App\Product\SwiperSliderController@getList'],

    ['GET', '/online_shop_goods/getList', '\App\Product\OnlineShopGoodsController@getList'],
    ['GET', '/online_shop_goods/getChannel', '\App\Product\OnlineShopGoodsController@getChannel'],
    ['GET', '/online_shop_goods/getItem', '\App\Product\OnlineShopGoodsController@getItem'],
    ['GET', '/distribution/getUpgradeDes/{name}', '\App\Product\DistributionController@getUpgradeDes'],
    ['GET', '/online_shop_goods/getCateGoodsList', '\App\Product\OnlineShopGoodsController@getCateGoodsList'],
    ['GET', '/online_shop_goods/getCatesList', '\App\Product\OnlineShopGoodsController@getCatesList'],
    
    //订单
    ['POST', '/order/createCoupon', '\App\Product\OrderController@createCoupon'],
    ['POST', '/order/createOnline', '\App\Product\OrderController@createOnline'],
    ['POST', '/order/createUpgradeAgent', '\App\Product\OrderController@createUpgradeAgent'],
    ['GET', '/order/getDeduction', '\App\Product\OrderController@getDeduction'],
    ['GET', '/order/getExpressFee', '\App\Product\OrderController@getExpressFee'],
    ['GET', '/order/getOnlineShopOrderList', '\App\Product\OrderController@getOnlineShopOrderList'],
    
    ['POST', '/order/rePayOnline', '\App\Product\OrderController@rePayOnline'],
    ['POST', '/order/deleteOnline', '\App\Product\OrderController@deleteOnline'],
    ['POST', '/order/finishOnline', '\App\Product\OrderController@finishOnline'],

    ['POST', '/order/createActiveOrder', '\App\Product\OrderController@createActiveOrder'],
    //支付异步通知
    ['POST', '/pay/notify/{name}', '\App\Common\PayNotifyController@notify'],
    

];


return $route;