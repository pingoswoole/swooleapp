<?php
namespace App\Logic\Common;

use App\Model\Product\Sms;

class SmsLogic
{
    private $smsapi = 'http://smsapi.jzyyun.com:9003';
    private $user = 'mmflower';
    private $pass = 'cloud@qq.com';


    public function send($mobile, $code)
    {
        try {
            //code...
            //实例化客户端
            $client = new \GuzzleHttp\Client();
                
            //构造url
            $url = $this->smsapi . '/servlet/UserServiceAPI';
                
            //post请求
            $content_s = "【佰聊汇】您的验证码是{$code}, 60秒后可重新获取。";
            $content = mb_convert_encoding($content_s, 'GBK', 'UTF-8');
            $res = $client->request('POST', $url, [
                    'form_params' => [
                        'method'=>'sendSMS',
                        'isLongSms'=> 0,
                        'username'=> $this->user,
                        'password'=> base64_encode($this->pass) ,
                        'smstype'=> 0,
                        'extenno'=> 0,
                        'mobile'=> $mobile,
                        'content'=> ($content),
                        
                    ]
                ]);
                
            $content = $res->getBody()->getContents();
            $content = mb_convert_encoding($content, 'UTF-8', 'GBK');
            //var_dump($content);
            if (false == strstr($content, 'success')) {
                return false;
            }
            $sms_field['type'] = 1;
            $sms_field['mobile'] = $mobile;
            $sms_field['code'] = $code;
            $sms_field['content'] = $content_s;
                
            (new Sms())->insert($sms_field);
            return true;
        } catch (\Throwable $th) {
            //throw $th;
        }
             
        return false;
    }

    public function check($mobile, $code)
    {
        try {
            //code...
            $where['mobile'] = $mobile;
            $where['code'] = $code;
            $where['state'] = 0;

            $sms = (new Sms())->where($where)->first();
            if ($sms) {
                (new Sms())->where($where)->update(['state' => 1]);
                return true;
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return false;
    }
}
