<?php
namespace App\Logic\Common;

use Pingo\Component\ConsoleTools;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;
class PaymentLogic
{
    private static $alipay_config = [];
    private static $wechat_config = [];

    public function __construct()
    {
        
    }

    /**
     * 获取配置
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $type
     * @return void
     */
    public static function getConfig($type = 'alipay')
    {
        $payment_setting = setting("payment");
        $base_url = setting('web.app_url');

        self::$alipay_config = [
            'app_id' => $payment_setting['alipay_app_id'],
            'notify_url' => $base_url . $payment_setting['notify_url'] . "/alipay",
            'return_url' => 'http://bb.cn/return.php',
            'ali_public_key' => $payment_setting['ali_public_key'],
            // 加密方式： **RSA2**  
            'private_key' => $payment_setting['alipay_private_key'],
            // 使用公钥证书模式，请配置下面两个参数，同时修改ali_public_key为以.crt结尾的支付宝公钥证书路径，如（./cert/alipayCertPublicKey_RSA2.crt）
            // 'app_cert_public_key' => './cert/appCertPublicKey.crt', //应用公钥证书路径
            // 'alipay_root_cert' => './cert/alipayRootCert.crt', //支付宝根证书路径
            'log' => [ // optional
                'file' => WEB_LOG_PATH . '/alipay.log',
                'level' => 'info', // 建议生产环境等级调整为 info，开发环境为 debug
                'type' => 'single', // optional, 可选 daily.
                'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
                // 更多配置项请参考 [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
            ],
            'mode' => 'normal', // optional,设置此参数，将进入沙箱模式
        ]; 

        self::$wechat_config = [
            'appid' => $payment_setting['wechat_appid'], // APP APPID
            'app_id' => $payment_setting['wechat_app_id'], // 公众号 APPID
            'miniapp_id' => $payment_setting['wechat_miniapp_id'], // 小程序 APPID
            'mch_id' => $payment_setting['wechat_mchid'],
            'key' => $payment_setting['wechat_key'],
            'notify_url' => $base_url . $payment_setting['notify_url'] . "/wechat",
            'cert_client' => './cert/apiclient_cert.pem', // optional，退款等情况时用到
            'cert_key' => './cert/apiclient_key.pem',// optional，退款等情况时用到
            'log' => [ // optional
                'file' => WEB_LOG_PATH . '/wechat.log',
                'level' => 'info', // 建议生产环境等级调整为 info，开发环境为 debug
                'type' => 'single', // optional, 可选 daily.
                'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
                // 更多配置项请参考 [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
            ],
            'mode' => 'normal', // optional, dev/hk;当为 `hk` 时，为香港 gateway。
        ];

        return $type === 'alipay' ? self::$alipay_config : self::$wechat_config;
    }
    /**
     * 异步通知处理
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $type
     * @param [type] $data
     * @return void
     */
    public function notify($type, $raw_data)
    {
       
        
         
        try{
            //Log::debug('pAY notify', json_encode($raw_data)); 
            switch ($type) {
                case 'alipay':
                    # code...
                    $data = $raw_data;
                    $pay = Pay::alipay(self::getConfig('alipay'));
                    $total_money = $data['total_amount'];
                    break;
                case 'wechat':
                    @libxml_disable_entity_loader(true);
                    $data = json_decode(json_encode(simplexml_load_string($raw_data, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
                    $pay = Pay::wechat(self::getConfig('wechat'));
                    $total_money = $data['total_fee'] * 0.01;
                    break;
                default:
                    # code...
                    return 'ERROR';
                    break;
            }

            $dataObj = $pay->verify($data); // 是的，验签就这么简单！
            // 请自行对 trade_status 进行判断及其它逻辑进行判断，在支付宝的业务通知中，只有交易通知状态为 TRADE_SUCCESS 或 TRADE_FINISHED 时，支付宝才会认定为买家付款成功。
            // 1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号；
            // 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）；
            // 3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）；
            // 4、验证app_id是否为该商户本身。
            // 5、其它业务逻辑情况
            $data = $dataObj->all();
            $data['total_money'] = floatval($total_money);
             //微信返回数据
             /* {"appid":"wx80c292c443a2fd9c","bank_type":"OTHERS","cash_fee":"2","fee_type":"CNY","is_subscribe":"N",
                "mch_id":"1604162097","nonce_str":"eLkiKxbQhBUBrjQ4","openid":"o3nrh5rvYQ4RfZ2_bY18UfYN-0tk",
                "out_trade_no":"DT160656905730570627634","result_code":"SUCCESS","return_code":"SUCCESS",
                "sign":"BB5CF8012CBB4A121E967CC638F19050","time_end":"20201128211105","total_fee":"2",
                "trade_type":"APP","transaction_id":"4200000832202011285981920309"}  */
                //支付宝返回数据
                /* 
                {"gmt_create":"2020-11-29 10:59:39","charset":"utf-8","seller_email":"jiucengfu@126.com","subject":"普通VIP会员",
                    "sign":"Wq5AG3xITdx1nanZxPePtRmemLjDCeCSlPQ9oyczxPZcAMfTmz/4hFkVgT5UYRmaZ1ZY1zdUSvbGtuQ9gq3KBY43k0dMFlUNlR/ko5Fo4aSaBiO6sGhwJVSYHi56lNzSQzrY2QBUQ5fEWOYfWtmf90SGNlN8WucjbaW5qyoVLblCLmAPnhxwlswipHVxA/RMGg/E72Dj3wFy0NM+yUIhWjGx3O0pAFNCRBfTvN5+5THQ5QUPj8NSWFMahENBuFVeuc0XO+OxuEyvSdZSuCvWTbAkpAFWiRIYlIVic/XYomK9ofqvajbG5N5navOmGEU0U7rUP6m80YRCg5pW77rEyQ==",
                    "buyer_id":"2088802371093034","invoice_amount":"0.01","notify_id":"2020112900222105940093031419269741",
                    "fund_bill_list":"[{\"amount\":\"0.01\",\"fundChannel\":\"PCREDIT\"}]","notify_type":"trade_status_sync",
                    "trade_status":"TRADE_SUCCESS","receipt_amount":"0.01","app_id":"2021001190674423","buyer_pay_amount":"0.01",
                    "sign_type":"RSA2","seller_id":"2088731229691374","gmt_payment":"2020-11-29 10:59:40",
                    "notify_time":"2020-11-29 10:59:40","version":"1.0","out_trade_no":"DT160661877312384089034",
                    "total_amount":"0.01","trade_no":"2020112922001493031414117901","auth_app_id":"2021001190674423",
                    "buyer_logon_id":"pin***@163.com","point_amount":"0.00"} */
             
            $payment_log_item = model()->get('payment_log', "*", ['out_trade_no' => $data['out_trade_no']]);
            if($payment_log_item){
                if($payment_log_item['state'] == 0 ) model()->update('payment_log', ['state' => 1, 'notify_data' => json_encode($data), 'updated_at' => time()], ['id' => $payment_log_item['id']]);
                //反射调用业务处理类
                $logicClass = $payment_log_item['callback'];
                if(class_exists($logicClass)){
                    
                    $logicMethod = "run";
                    $RefClass = new \ReflectionClass($logicClass);
                    $RefClassObj = $RefClass->newInstanceArgs();
                    if ($RefClass->hasMethod($logicMethod)) {
                        $method_handler = $RefClass->getMethod($logicMethod);
                        $method_handler->setAccessible(true);
                        $method_handler->invokeArgs($RefClassObj, [$data, $payment_log_item]);
                    }
                    
                }
            }
             
            return $pay->success()->getContent();// laravel 框架中请直接 `return $pay->success()`

        } catch (\Exception $e) {
            // $e->getMessage();
            Log::debug('pay_notify_error ', $e->getMessage()); 
        }

        return 'SYS_ERROR';
        
    }
    

}