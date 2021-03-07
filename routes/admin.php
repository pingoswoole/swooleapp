<?php
/**
 * 后端路由
 * @author pingo
 */

//路由前缀
$route['namespace'] = '/backend';

//路由明细列表
$route['list'] = [

    ['GET', '/home/index', '\Admin\Home\IndexController@index'],
    [['GET', 'POST'], '/access/login', '\Admin\Common\AccessController@login'],
    [['GET', 'POST'], '/access/logout', '\Admin\Common\AccessController@logout'],
    ['GET', '/access/captcha', '\Admin\Common\AccessController@captcha'],
    ['GET', '/home/dashboard', '\Admin\Home\IndexController@dashboard'],
    ['GET', '/home/initMenu', '\Admin\Home\IndexController@initMenu'],
    ['GET', '/home/clearApi', '\Admin\Home\IndexController@clearApi'],
    
    //管理员
    [['GET', 'POST'], '/auth/', '\Admin\Auth\UserController@index'],
    [['GET', 'POST'], '/auth/get_all', '\Admin\Auth\UserController@getAll'],
    ['GET', '/auth/addget', '\Admin\Auth\UserController@add'],
    ['POST', '/auth/add', '\Admin\Auth\UserController@addData'],
    [['GET', 'POST'], '/auth/set/{id:\d+}', '\Admin\Auth\UserController@set'],
    [['GET', 'POST'], '/auth/del/{id:\d+}', '\Admin\Auth\UserController@del'],
    ['GET', '/auth/editget/{id:\d+}', '\Admin\Auth\UserController@edit'],
    ['POST', '/auth/edit/{id:\d+}', '\Admin\Auth\UserController@editData'],
    ['GET', '/auth/pwdget', '\Admin\Auth\UserController@editPwd'],
    ['POST', '/auth/pwd', '\Admin\Auth\UserController@editPwdData'],
    ['GET', '/auth/userProfile', '\Admin\Auth\UserController@userProfile'],
    
    //角色
    [['GET', 'POST'], '/role/', '\Admin\Auth\RoleController@index'],
    [['GET', 'POST'], '/role/get_all', '\Admin\Auth\RoleController@getAll'],
    ['GET', '/role/addget', '\Admin\Auth\RoleController@add'],
    ['POST', '/role/add', '\Admin\Auth\RoleController@addData'],
    [['GET', 'POST'], '/role/set/{id:\d+}', '\Admin\Auth\RoleController@set'],
    [['GET', 'POST'], '/role/del/{id:\d+}', '\Admin\Auth\RoleController@del'],
    ['GET', '/role/edit_ruleget/{id:\d+}', '\Admin\Auth\RoleController@editRule'],
    ['POST', '/role/edit_rule/{id:\d+}', '\Admin\Auth\RoleController@editRuleData'],
    ['GET', '/role/editget/{id:\d+}', '\Admin\Auth\RoleController@edit'],
    ['POST', '/role/edit/{id:\d+}', '\Admin\Auth\RoleController@editData'],

    //权限规则
    [['GET', 'POST'], '/rule/', '\Admin\Auth\RuleController@index'],
    [['GET', 'POST'], '/rule/get_all', '\Admin\Auth\RuleController@getAll'],
    [['GET', 'POST'], '/rule/set/{id:\d+}', '\Admin\Auth\RuleController@set'],
    [['GET', 'POST'], '/rule/del/{id:\d+}', '\Admin\Auth\RuleController@del'],
    ['GET', '/rule/addget', '\Admin\Auth\RuleController@add'],
    ['GET', '/rule/addget/{id:\d+}', '\Admin\Auth\RuleController@addChild'],
    ['POST', '/rule/add/{id:\d+}', '\Admin\Auth\RuleController@addChildData'],
    
    ['POST', '/rule/add', '\Admin\Auth\RuleController@addData'],
    ['GET', '/rule/editget/{id:\d+}', '\Admin\Auth\RuleController@edit'],
    ['POST', '/rule/edit/{id:\d+}', '\Admin\Auth\RuleController@editData'],

    //设置
    [['GET', 'POST'], '/setting/index', '\Admin\Setting\CommonController@index'],
    ['POST', '/upload/handle', '\Admin\Common\UploadController@handle'],

    //用户中心
    ['GET', '/member/member/viewAll', '\Admin\Member\MemberController@viewAll'],
    [['GET', 'POST'], '/member/member/getPageList', '\Admin\Member\MemberController@getPageList'],
    [['GET', 'POST'], '/member/member/addItem', '\Admin\Member\MemberController@addItem'],
    ['GET', '/member/member/viewItem/{id:\d+}', '\Admin\Member\MemberController@viewItem'],
    ['POST', '/member/member/editItem/{id:\d+}', '\Admin\Member\MemberController@editItem'],
    ['POST', '/member/member/setItem/{id:\d+}', '\Admin\Member\MemberController@setItem'],
    ['POST', '/member/member/delItem/{id:\d+}', '\Admin\Member\MemberController@delItem'],
    //资产收支
    ['GET', '/member/assetlog/viewAll', '\Admin\Member\MemberAssetLogController@viewAll'],
    [['GET', 'POST'], '/member/assetlog/getPageList', '\Admin\Member\MemberAssetLogController@getPageList'],
    [['GET', 'POST'], '/member/assetlog/addItem', '\Admin\Member\MemberAssetLogController@addItem'],
    ['GET', '/member/assetlog/viewItem/{id:\d+}', '\Admin\Member\MemberAssetLogController@viewItem'],
    ['POST', '/member/assetlog/editItem/{id:\d+}', '\Admin\Member\MemberAssetLogController@editItem'],
    ['POST', '/member/assetlog/setItem/{id:\d+}', '\Admin\Member\MemberAssetLogController@setItem'],
    ['POST', '/member/assetlog/delItem/{id:\d+}', '\Admin\Member\MemberAssetLogController@delItem'],
    //收货地址
    ['GET', '/member/address/viewAll', '\Admin\Member\MemberAddressController@viewAll'],
    [['GET', 'POST'], '/member/address/getPageList', '\Admin\Member\MemberAddressController@getPageList'],
    [['GET', 'POST'], '/member/address/addItem', '\Admin\Member\MemberAddressController@addItem'],
    ['GET', '/member/address/viewItem/{id:\d+}', '\Admin\Member\MemberAddressController@viewItem'],
    ['POST', '/member/address/editItem/{id:\d+}', '\Admin\Member\MemberAddressController@editItem'],
    ['POST', '/member/address/setItem/{id:\d+}', '\Admin\Member\MemberAddressController@setItem'],
    ['POST', '/member/address/delItem/{id:\d+}', '\Admin\Member\MemberAddressController@delItem'],
    //银行卡
    ['GET', '/member/bankcard/viewAll', '\Admin\Member\MemberBankCardController@viewAll'],
    [['GET', 'POST'], '/member/bankcard/getPageList', '\Admin\Member\MemberBankCardController@getPageList'],
    [['GET', 'POST'], '/member/bankcard/addItem', '\Admin\Member\MemberBankCardController@addItem'],
    ['GET', '/member/bankcard/viewItem/{id:\d+}', '\Admin\Member\MemberBankCardController@viewItem'],
    ['POST', '/member/bankcard/editItem/{id:\d+}', '\Admin\Member\MemberBankCardController@editItem'],
    ['POST', '/member/bankcard/setItem/{id:\d+}', '\Admin\Member\MemberBankCardController@setItem'],
    ['POST', '/member/bankcard/delItem/{id:\d+}', '\Admin\Member\MemberBankCardController@delItem'],
    //实名认证
    ['GET', '/member/realnameauth/viewAll', '\Admin\Member\MemberRealnameauthController@viewAll'],
    [['GET', 'POST'], '/member/realnameauth/getPageList', '\Admin\Member\MemberRealnameauthController@getPageList'],
    [['GET', 'POST'], '/member/realnameauth/addItem', '\Admin\Member\MemberRealnameauthController@addItem'],
    ['GET', '/member/realnameauth/viewItem/{id:\d+}', '\Admin\Member\MemberRealnameauthController@viewItem'],
    ['POST', '/member/realnameauth/editItem/{id:\d+}', '\Admin\Member\MemberRealnameauthController@editItem'],
    ['POST', '/member/realnameauth/setItem/{id:\d+}', '\Admin\Member\MemberRealnameauthController@setItem'],
    ['POST', '/member/realnameauth/delItem/{id:\d+}', '\Admin\Member\MemberRealnameauthController@delItem'],
    ['POST', '/member/realnameauth/audit/{id:\d+}', '\Admin\Member\MemberRealnameauthController@audit'],


    //产品中心
    //在线商城分类
    ['GET', '/product/onlineshop_category/viewAll', '\Admin\Product\OnlineShopCategoryController@viewAll'],
    [['GET', 'POST'], '/product/onlineshop_category/getPageList', '\Admin\Product\OnlineShopCategoryController@getPageList'],
    [['GET', 'POST'], '/product/onlineshop_category/addItem', '\Admin\Product\OnlineShopCategoryController@addItem'],
    ['GET', '/product/onlineshop_category/viewItem/{id:\d+}', '\Admin\Product\OnlineShopCategoryController@viewItem'],
    ['POST', '/product/onlineshop_category/editItem/{id:\d+}', '\Admin\Product\OnlineShopCategoryController@editItem'],
    ['POST', '/product/onlineshop_category/setItem/{id:\d+}', '\Admin\Product\OnlineShopCategoryController@setItem'],
    ['POST', '/product/onlineshop_category/delItem/{id:\d+}', '\Admin\Product\OnlineShopCategoryController@delItem'],
    //在线商城商品
    ['GET', '/product/onlineshop_goods/viewAll', '\Admin\Product\OnlineShopGoodsController@viewAll'],
    [['GET', 'POST'], '/product/onlineshop_goods/getPageList', '\Admin\Product\OnlineShopGoodsController@getPageList'],
    [['GET', 'POST'], '/product/onlineshop_goods/addItem', '\Admin\Product\OnlineShopGoodsController@addItem'],
    ['GET', '/product/onlineshop_goods/viewItem/{id:\d+}', '\Admin\Product\OnlineShopGoodsController@viewItem'],
    ['POST', '/product/onlineshop_goods/editItem/{id:\d+}', '\Admin\Product\OnlineShopGoodsController@editItem'],
    ['POST', '/product/onlineshop_goods/setItem/{id:\d+}', '\Admin\Product\OnlineShopGoodsController@setItem'],
    ['POST', '/product/onlineshop_goods/delItem/{id:\d+}', '\Admin\Product\OnlineShopGoodsController@delItem'],
    //在线商城订单
    ['GET', '/product/onlineshop_order/viewAll', '\Admin\Product\OnlineShopOrderController@viewAll'],
    [['GET', 'POST'], '/product/onlineshop_order/getPageList', '\Admin\Product\OnlineShopOrderController@getPageList'],
    [['GET', 'POST'], '/product/onlineshop_order/addItem', '\Admin\Product\OnlineShopOrderController@addItem'],
    ['GET', '/product/onlineshop_order/viewItem/{id:\d+}', '\Admin\Product\OnlineShopOrderController@viewItem'],
    ['POST', '/product/onlineshop_order/editItem/{id:\d+}', '\Admin\Product\OnlineShopOrderController@editItem'],
    ['POST', '/product/onlineshop_order/setItem/{id:\d+}', '\Admin\Product\OnlineShopOrderController@setItem'],
    ['POST', '/product/onlineshop_order/delItem/{id:\d+}', '\Admin\Product\OnlineShopOrderController@delItem'],
     
    //短视频
    ['GET', '/product/video_category/viewAll', '\Admin\Product\VideoCategoryController@viewAll'],
    [['GET', 'POST'], '/product/video_category/getPageList', '\Admin\Product\VideoCategoryController@getPageList'],
    [['GET', 'POST'], '/product/video_category/addItem', '\Admin\Product\VideoCategoryController@addItem'],
    ['GET', '/product/video_category/viewItem/{id:\d+}', '\Admin\Product\VideoCategoryController@viewItem'],
    ['POST', '/product/video_category/editItem/{id:\d+}', '\Admin\Product\VideoCategoryController@editItem'],
    ['POST', '/product/video_category/setItem/{id:\d+}', '\Admin\Product\VideoCategoryController@setItem'],
    ['POST', '/product/video_category/delItem/{id:\d+}', '\Admin\Product\VideoCategoryController@delItem'],
    
    ['GET', '/product/video_data/viewAll', '\Admin\Product\VideoDataController@viewAll'],
    [['GET', 'POST'], '/product/video_data/getPageList', '\Admin\Product\VideoDataController@getPageList'],
    [['GET', 'POST'], '/product/video_data/addItem', '\Admin\Product\VideoDataController@addItem'],
    ['GET', '/product/video_data/viewItem/{id:\d+}', '\Admin\Product\VideoDataController@viewItem'],
    ['POST', '/product/video_data/editItem/{id:\d+}', '\Admin\Product\VideoDataController@editItem'],
    ['POST', '/product/video_data/setItem/{id:\d+}', '\Admin\Product\VideoDataController@setItem'],
    ['POST', '/product/video_data/delItem/{id:\d+}', '\Admin\Product\VideoDataController@delItem'],
    
    ['GET', '/product/video_tag/viewAll', '\Admin\Product\VideoTagController@viewAll'],
    [['GET', 'POST'], '/product/video_tag/getPageList', '\Admin\Product\VideoTagController@getPageList'],
    [['GET', 'POST'], '/product/video_tag/addItem', '\Admin\Product\VideoTagController@addItem'],
    ['GET', '/product/video_tag/viewItem/{id:\d+}', '\Admin\Product\VideoTagController@viewItem'],
    ['POST', '/product/video_tag/editItem/{id:\d+}', '\Admin\Product\VideoTagController@editItem'],
    ['POST', '/product/video_tag/setItem/{id:\d+}', '\Admin\Product\VideoTagController@setItem'],
    ['POST', '/product/video_tag/delItem/{id:\d+}', '\Admin\Product\VideoTagController@delItem'],
    
    ['GET', '/product/video_area/viewAll', '\Admin\Product\VideoAreaController@viewAll'],
    [['GET', 'POST'], '/product/video_area/getPageList', '\Admin\Product\VideoAreaController@getPageList'],
    [['GET', 'POST'], '/product/video_area/addItem', '\Admin\Product\VideoAreaController@addItem'],
    ['GET', '/product/video_area/viewItem/{id:\d+}', '\Admin\Product\VideoAreaController@viewItem'],
    ['POST', '/product/video_area/editItem/{id:\d+}', '\Admin\Product\VideoAreaController@editItem'],
    ['POST', '/product/video_area/setItem/{id:\d+}', '\Admin\Product\VideoAreaController@setItem'],
    ['POST', '/product/video_area/delItem/{id:\d+}', '\Admin\Product\VideoAreaController@delItem'],
    
    ['GET', '/product/video_ad/viewAll', '\Admin\Product\VideoAdController@viewAll'],
    [['GET', 'POST'], '/product/video_ad/getPageList', '\Admin\Product\VideoAdController@getPageList'],
    [['GET', 'POST'], '/product/video_ad/addItem', '\Admin\Product\VideoAdController@addItem'],
    ['GET', '/product/video_ad/viewItem/{id:\d+}', '\Admin\Product\VideoAdController@viewItem'],
    ['POST', '/product/video_ad/editItem/{id:\d+}', '\Admin\Product\VideoAdController@editItem'],
    ['POST', '/product/video_ad/setItem/{id:\d+}', '\Admin\Product\VideoAdController@setItem'],
    ['POST', '/product/video_ad/delItem/{id:\d+}', '\Admin\Product\VideoAdController@delItem'],

    //社区论坛
    ['GET', '/product/forum_category/viewAll', '\Admin\Product\ForumCategoryController@viewAll'],
    [['GET', 'POST'], '/product/forum_category/getPageList', '\Admin\Product\ForumCategoryController@getPageList'],
    [['GET', 'POST'], '/product/forum_category/addItem', '\Admin\Product\ForumCategoryController@addItem'],
    ['GET', '/product/forum_category/viewItem/{id:\d+}', '\Admin\Product\ForumCategoryController@viewItem'],
    ['POST', '/product/forum_category/editItem/{id:\d+}', '\Admin\Product\ForumCategoryController@editItem'],
    ['POST', '/product/forum_category/setItem/{id:\d+}', '\Admin\Product\ForumCategoryController@setItem'],
    ['POST', '/product/forum_category/delItem/{id:\d+}', '\Admin\Product\ForumCategoryController@delItem'],
    
    ['GET', '/product/forum_article/viewAll', '\Admin\Product\ForumArticleController@viewAll'],
    [['GET', 'POST'], '/product/forum_article/getPageList', '\Admin\Product\ForumArticleController@getPageList'],
    [['GET', 'POST'], '/product/forum_article/addItem', '\Admin\Product\ForumArticleController@addItem'],
    ['GET', '/product/forum_article/viewItem/{id:\d+}', '\Admin\Product\ForumArticleController@viewItem'],
    ['POST', '/product/forum_article/editItem/{id:\d+}', '\Admin\Product\ForumArticleController@editItem'],
    ['POST', '/product/forum_article/setItem/{id:\d+}', '\Admin\Product\ForumArticleController@setItem'],
    ['POST', '/product/forum_article/delItem/{id:\d+}', '\Admin\Product\ForumArticleController@delItem'],
    
    ['GET', '/product/forum_ad/viewAll', '\Admin\Product\ForumAdController@viewAll'],
    [['GET', 'POST'], '/product/forum_ad/getPageList', '\Admin\Product\ForumAdController@getPageList'],
    [['GET', 'POST'], '/product/forum_ad/addItem', '\Admin\Product\ForumAdController@addItem'],
    ['GET', '/product/forum_ad/viewItem/{id:\d+}', '\Admin\Product\ForumAdController@viewItem'],
    ['POST', '/product/forum_ad/editItem/{id:\d+}', '\Admin\Product\ForumAdController@editItem'],
    ['POST', '/product/forum_ad/setItem/{id:\d+}', '\Admin\Product\ForumAdController@setItem'],
    ['POST', '/product/forum_ad/delItem/{id:\d+}', '\Admin\Product\ForumAdController@delItem'],
    
    
    ['GET', '/product/daily_sign/viewAll', '\Admin\Product\DailySignController@viewAll'],
    [['GET', 'POST'], '/product/daily_sign/getPageList', '\Admin\Product\DailySignController@getPageList'],
    //通讯聊天
    ['GET', '/product/chat_message/viewAll', '\Admin\Product\ChatMessageController@viewAll'],
    [['GET', 'POST'], '/product/chat_message/getPageList', '\Admin\Product\ChatMessageController@getPageList'],
    //发卡管理
    ['GET', '/product/faka/viewAll', '\Admin\Product\FakaController@viewAll'],
    [['GET', 'POST'], '/product/faka/getPageList', '\Admin\Product\FakaController@getPageList'],
    ['POST', '/product/faka/download/{id:\d+}', '\Admin\Product\FakaController@download'],
    ['POST', '/product/faka/delItem/{id:\d+}', '\Admin\Product\FakaController@delItem'],
    //提现管理
    ['GET', '/product/withdraw/viewAll', '\Admin\Product\WithdrawController@viewAll'],
    [['GET', 'POST'], '/product/withdraw/getPageList', '\Admin\Product\WithdrawController@getPageList'],
    ['POST', '/product/withdraw/setItem/{id:\d+}', '\Admin\Product\WithdrawController@setItem'],
    ['POST', '/product/withdraw/audit/{id:\d+}', '\Admin\Product\WithdrawController@audit'],
    //建议反馈
    ['GET', '/product/suggestion/viewAll', '\Admin\Product\SuggestionController@viewAll'],
    [['GET', 'POST'], '/product/suggestion/getPageList', '\Admin\Product\SuggestionController@getPageList'],
    ['POST', '/product/suggestion/delItem/{id:\d+}', '\Admin\Product\SuggestionController@delItem'],
    //支付记录
    ['GET', '/product/payment/viewAll', '\Admin\Product\PaymentLogController@viewAll'],
    [['GET', 'POST'], '/product/payment/getPageList', '\Admin\Product\PaymentLogController@getPageList'],
    //消息推送
    
    ['GET', '/product/message_push/viewAll', '\Admin\Product\MessagePushController@viewAll'],
    [['GET', 'POST'], '/product/message_push/getPageList', '\Admin\Product\MessagePushController@getPageList'],
    [['GET', 'POST'], '/product/message_push/addItem', '\Admin\Product\MessagePushController@addItem'],
    ['GET', '/product/message_push/viewItem/{id:\d+}', '\Admin\Product\MessagePushController@viewItem'],
    ['POST', '/product/message_push/editItem/{id:\d+}', '\Admin\Product\MessagePushController@editItem'],
    ['POST', '/product/message_push/setItem/{id:\d+}', '\Admin\Product\MessagePushController@setItem'],
    ['POST', '/product/message_push/delItem/{id:\d+}', '\Admin\Product\MessagePushController@delItem'],
    //幻灯片
    ['GET', '/product/swiper_slider/viewAll', '\Admin\Product\SwiperSliderController@viewAll'],
    [['GET', 'POST'], '/product/swiper_slider/getPageList', '\Admin\Product\SwiperSliderController@getPageList'],
    [['GET', 'POST'], '/product/swiper_slider/addItem', '\Admin\Product\SwiperSliderController@addItem'],
    ['GET', '/product/swiper_slider/viewItem/{id:\d+}', '\Admin\Product\SwiperSliderController@viewItem'],
    ['POST', '/product/swiper_slider/editItem/{id:\d+}', '\Admin\Product\SwiperSliderController@editItem'],
    ['POST', '/product/swiper_slider/setItem/{id:\d+}', '\Admin\Product\SwiperSliderController@setItem'],
    ['POST', '/product/swiper_slider/delItem/{id:\d+}', '\Admin\Product\SwiperSliderController@delItem'],
    //常见问题
    ['GET', '/product/faq/viewAll', '\Admin\Product\FaqController@viewAll'],
    [['GET', 'POST'], '/product/faq/getPageList', '\Admin\Product\FaqController@getPageList'],
    [['GET', 'POST'], '/product/faq/addItem', '\Admin\Product\FaqController@addItem'],
    ['GET', '/product/faq/viewItem/{id:\d+}', '\Admin\Product\FaqController@viewItem'],
    ['POST', '/product/faq/editItem/{id:\d+}', '\Admin\Product\FaqController@editItem'],
    ['POST', '/product/faq/setItem/{id:\d+}', '\Admin\Product\FaqController@setItem'],
    ['POST', '/product/faq/delItem/{id:\d+}', '\Admin\Product\FaqController@delItem'],
    //配置管理

    //数据库
    ['GET', '/setting/database/viewAll', '\Admin\Setting\DatabaseController@viewAll'],
    ['POST', '/setting/database/clearData', '\Admin\Setting\DatabaseController@clearData'],
    
    [['GET', 'POST'], '/setting/database/getPageList', '\Admin\Setting\DatabaseController@getPageList'],
    //文件管理
    ['GET', '/setting/filemanager/viewAll', '\Admin\Setting\FileManagerController@viewAll'],
    [['GET', 'POST'], '/setting/filemanager/getPageList', '\Admin\Setting\FileManagerController@getPageList'],

    


];

 

return $route;
