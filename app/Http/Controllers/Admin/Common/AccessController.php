<?php
namespace App\Http\Controllers\Admin\Common;

use App\Http\Controllers\Admin\AdminController;
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
            
             $request_params = $this->request()->post();
             $username = $request_params['username']?? null;
             $pwd = $request_params['password']?? null;
             $result = (new \App\Service\Admin\AdminUserService)->login($username, $pwd);
             if($result['flag']){
                 $session_key = 'AdminSession' . uniqid(true) . mt_rand(100, 999);
                 cache()->setEx($session_key, 7200, json_encode($result['data']));
                 $this->response()->setCookie(self::ADMIN_SESSION_COOKIE_ID, $session_key);
             }
             $code = $result['flag']? Status::CODE_OK : Status::CODE_ERR;
             $this->json($code, $result['msg']);

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
        $code = new \Pingo\Captcha\VerifyCode();
        $this->swoole_response->header('Content-Type','image/png');
        $this->swoole_response->write($code->DrawCode()->getImageByte());
    }

} 