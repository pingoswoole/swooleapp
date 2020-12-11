<?php
namespace App\Http\Controllers\Admin\Common;

use App\Http\Controllers\Admin\AdminController;

/**
 * 登录、注册、注销
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AccessController extends AdminController
{

    public $middleware = [];

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
         
         $this->render("access.login", ['author' => time()]);
         
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