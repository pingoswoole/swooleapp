<?php
namespace App\Http\Controllers\Admin\Common;

use App\Http\Controllers\AdminController;
use App\Model\Member\Member;
use App\Utility\Status;

/**
 * 登录、注册、注销
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AccessController extends AdminController
{

    public $middleware = [];
    protected $auth_flag = false;

    public function initialize()
    {
        
    }

    /**
     * 登录
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $vars
     * @return void
     */
    public function login($request, $response, $vars = [])
    {
        if($this->isPost()){
            try {
                //code...
            
                $request_params = $this->request()->post(['username', 'password', 'captcha', 'check_code']);
                $username = $request_params['username']?? null;
                $pwd = $request_params['password']?? null;
                $captcha = $request_params['captcha']?? null;
                //检查验证码
                $check_code = $request_params['check_code']?? null;
                $check_code = strtolower($check_code);
                $captcha_res = cache()->get($check_code);
                $captcha_res = $captcha_res ? strtolower($captcha_res) : null;
                if(empty($captcha_res) || $captcha_res !== $captcha){
                    $this->json(Status::CODE_ERR, '验证码错误或过期！');
                    return;
                }
                $result = (new \App\Service\Admin\Auth\AdminUserService)->login($username, $pwd);
                if($result['flag']){
                    $session_key = 'AdminSession' . uniqid(true) . mt_rand(100, 999);
                    cache()->setEx($session_key, 7200, json_encode($result['data']));
                    $this->response()->setCookie(self::ADMIN_SESSION_COOKIE_ID, $session_key);
                }
                $code = $result['flag']? Status::CODE_OK : Status::CODE_ERR;
                $this->json($code, $result['msg']);

            } catch (\Throwable $th) {
                //throw $th;
                 
            }

        }else{

            

            $this->render("access.login", ['author' => time()]);
        }
         
    }

    /**
     * 退出
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function logout()
    {
        $session_cookie_val = $this->request->cookie(self::ADMIN_SESSION_COOKIE_ID);
        if(!empty($session_cookie_val)){
           
            $this->response()->setcookie(self::ADMIN_SESSION_COOKIE_ID, null);
            cache()->del($session_cookie_val);
        }
        $this->json(0, '成功退出'); 
    }
    /**
     * 验证码
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function captcha()
    {
        try {
            //code...
            $Conf = new \Pingo\Captcha\Conf;
            $Conf->setCharset("0123456789");
            $code = new \Pingo\Captcha\VerifyCode($Conf);
            $this->swoole_response->header('Content-Type','image/png');
            $Result = $code->DrawCode();
            //$this->swoole_response->write($Result->getImageBase64());
            $check_code =  rand_uniqid_str('captcha');
            
            cache()->setEx($check_code, 90, strtolower($Result->getImageCode()));
            
            $this->json(Status::CODE_OK, 'success', ['image' => $Result->getImageBase64(), 'check_code' => $check_code]);
        } catch (\Throwable $th) {
            //throw $th;
            
        }
        
    }

      

} 