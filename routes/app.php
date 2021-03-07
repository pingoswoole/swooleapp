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
    
    ['POST', '/access/univerify', '\App\Common\AccessController@univerify'],
    ['POST', '/access/register', '\App\Common\AccessController@register'],
    ['POST', '/access/forget', '\App\Common\AccessController@forget'],

    ['POST', '/access/login', '\App\Common\AccessController@login'],
    ['POST', '/access/logout', '\App\Common\AccessController@logout'],
    ['POST', '/access/refresh', '\App\Common\AccessController@refreshToken'],
    ['GET', '/access/signup/shareCoupon', '\App\Common\AccessController@viewCouponSignUp'],
    ['GET', '/access/signup/shareApp', '\App\Common\AccessController@viewAppSignUp'],
    [['GET', 'POST'], '/access/test', '\App\Common\AccessController@test'],
    ['GET', '/access/download', '\App\Common\AccessController@download'],
    ['GET', '/access/getKefu', '\App\Common\AccessController@getKefu'],
    ['POST', '/access/sendsms', '\App\Common\AccessController@sendsms'],
    //用户
    ['GET', '/member/getProfile', '\App\Member\MemberController@getProfile'],
    ['POST', '/member/editProfile', '\App\Member\MemberController@editProfile'],
    ['GET', '/member/getAssetStatis', '\App\Member\MemberController@getAssetStatis'],
    ['POST', '/member/bindInviter', '\App\Member\MemberController@bindInviter'],
    ['GET', '/member/getFriendProfile', '\App\Member\MemberController@getFriendProfile'],
    ['POST', '/member/changePwd', '\App\Member\MemberController@changePwd'],
    ['GET', '/member/getFvideo', '\App\Member\MemberController@getFvideo'],
    ['GET', '/member/getFprofile', '\App\Member\MemberController@getFprofile'],
    ['POST', '/member/realname', '\App\Member\MemberController@realname'],
    ['GET', '/member/getrealname', '\App\Member\MemberController@getrealname'],
    ['GET', '/member/checkPublish', '\App\Member\MemberController@checkPublish'],
    
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
    //好友管理
    ['GET', '/member/chatfriend/getList', '\App\Product\ChatFriendController@getList'],
    ['GET', '/member/chatfriend/getAppList', '\App\Product\ChatFriendController@getAppList'],
    ['POST', '/member/chatfriend/add', '\App\Product\ChatFriendController@add'],
    ['POST', '/member/chatfriend/agree', '\App\Product\ChatFriendController@agree'],
    ['POST', '/member/chatfriend/delete', '\App\Product\ChatFriendController@delete'],
    ['GET', '/member/chatfriend/search', '\App\Product\ChatFriendController@search'],
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
    ['GET', '/platform/getAppDownload', '\App\Common\PlatformController@getAppDownload'],
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
    //发卡
    ['GET', '/faka/getDesc', '\App\Product\FakaController@getDesc'],
    ['POST', '/faka/upgrade', '\App\Product\FakaController@upgrade'],

    ['POST', '/chat/checkContent', '\App\Product\ChatController@checkContent'],
    ['GET', '/chat/checkView', '\App\Product\ChatController@checkView'],
    ['GET', '/chat/checkSendLimit', '\App\Product\ChatController@checkSendLimit'],
    
    //视频
    [['GET', 'POST'], '/video_data/getList', '\App\Product\VideoDataController@getList'],
    ['GET', '/video_area/getList', '\App\Product\VideoAreaController@getList'],
    ['POST', '/video_data/publish', '\App\Product\VideoDataController@publish'],
    ['GET', '/video_data/getMyVideoList', '\App\Product\VideoDataController@getMyVideoList'],
    ['POST', '/video_data/remove', '\App\Product\VideoDataController@remove'],
    ['GET', '/video_data/getCityList', '\App\Product\VideoAreaController@getCityList'],
    ['GET', '/video_data/getSameCityList', '\App\Product\VideoAreaController@getSameCityList'],
    ['POST', '/video_data/zan', '\App\Product\VideoDataController@zan'],
     
    ['GET', '/video_data/getAdDetail', '\App\Product\VideoDataController@getAdDetail'],

    ['GET', '/video_data/getVDetail', '\App\Product\VideoDataController@getVDetail'],
    ['GET', '/video_data/getCommentsList', '\App\Product\VideoDataController@getCommentsList'],
    ['POST', '/video_data/comment', '\App\Product\VideoDataController@comment'],
    //广场
    ['GET', '/forum/getAdList', '\App\Product\ForumController@getAdList'],
    ['GET', '/forum/getArticle', '\App\Product\ForumController@getArticle'],
    ['GET', '/forum/getCateList', '\App\Product\ForumController@getCateList'],
    ['GET', '/forum/getAdDetail', '\App\Product\ForumController@getAdDetail'],
    ['GET', '/forum/getArticleList', '\App\Product\ForumController@getArticleList'],
    ['GET', '/forum/getCommentsList', '\App\Product\ForumController@getCommentsList'],
    ['POST', '/forum/remove', '\App\Product\ForumController@remove'],
    ['POST', '/forum/comment', '\App\Product\ForumController@comment'],
    ['POST', '/forum/commentArticle', '\App\Product\ForumArticleCommentsController@commentArticle'],
    
    ['POST', '/forum/publish', '\App\Product\ForumController@publish'],
    ['GET', '/forum/getMyArticleList', '\App\Product\ForumController@getMyArticleList'],

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
