<?php
namespace App\Http\Controllers\App\Common;

use App\Http\Controllers\AppController;
use App\Logic\App\UniPushLogic;
use App\Model\Common\AbTest;
use App\Model\Product\UeSuggest;
use App\Service\App\CouponShopGoodsService;
use App\Utility\Status;
use App\Logic\Common\SmsLogic;
use Pingo\Validate\Validate;

class AccessController extends AppController
{
    protected $login_check = false;


    public function test()
    {
        /* $id = db()->table('ab_test')->insert(['title' => random_str(8), 'created_at' => time()]);
        var_dump($id); */
        try {
            //code...
            /*  $db = db()->getConnect();
             $res = $db->table('ab_test')->insert(['title' => "'1=1' or insert into", 'created_at' => time()]);
             $res = $db->table('member')->count();
             $db->return();
             var_dump($res); */
            $res = $this->request()->posts(['aa' => ['int', 1999], 'bb']);
            
            var_dump($res);
            /*$AbTest = (new AbTest)->initConnect();
             $AbTest->beginTransaction();
            $UeSuggest = (new UeSuggest())->setPdo($AbTest->getPdo());

            $UeSuggest->insert(['title' => random_str(8), 'description' => time(), 'contact' => time(), 'created_at' => time()]);
            $res = $AbTest->insert(['title' => "'1=1' or insert into", 'created_at' => time()]);
            $AbTest->commit();
            $AbTest->return();
            var_dump($res); */
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
        }
    }
    /**
     * 登录
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function login()
    {
        //
         
        $rule = [
            'mobile'  => 'require|mobile|max:11',
            'pwd'   => 'require|max:15',
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'pwd.require'     => '密码必填',
            'mobile'        => '手机号码错误',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        //
        $service_res = (new \App\Service\App\AccessService)->login($this->post_data['mobile'], $this->post_data['pwd']);
        
        $this->__service($service_res);
    }
    /**
     * refrsh_token
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function refreshToken()
    {
        $rule = [
            'refresh_token'  => 'require|min:11',
        ];
        $msg = [
            'refresh_token.require' => 'refresh_token必须',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_res = (new \App\Service\App\AccessService)->refreshToken($this->post_data['refresh_token']);
        $this->__service($service_res);
    }
    /**
     * 注册
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function register()
    {
        $rule = [
            'mobile'  => 'require|mobile|max:11',
            'pwd'   => 'require|max:15',
            'code'  => 'require|number'
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'pwd.require'     => '密码必填',
            'mobile'        => '手机号码错误',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        //手机验证码
        $result = (new SmsLogic)->check($this->post_data['mobile'], $this->post_data['code']);
        if (!$result) {
            return $this->json(Status::CODE_ERR, '验证码错误');
        }
        $invite_id = $this->_post("invite_id") ?? 0;
        $service_res = (new \App\Service\App\AccessService)->register($this->post_data['mobile'], $this->post_data['pwd'], $invite_id);
        $this->__service($service_res);
    }
     
    
    public function forget()
    {
        $rule = [
            'mobile'  => 'require|mobile|max:11',
            'pwd'   => 'require|max:15',
            'code'  => 'require|number'
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'pwd.require'     => '密码必填',
            'mobile'        => '手机号码错误',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        //手机验证码
        $result = (new SmsLogic)->check($this->post_data['mobile'], $this->post_data['code']);
        if (!$result) {
            return $this->json(Status::CODE_ERR, '验证码错误');
        }
         
        $service_res = (new \App\Service\App\AccessService)->forget($this->post_data['mobile'], $this->post_data['pwd']);
        $this->__service($service_res);
    }
    /**
     * 一键登录 UNICLOUD
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function univerify()
    {
        $rule = [
            'mobile'  => 'require|mobile|max:11',
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'mobile'        => '手机号码错误',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_res = (new \App\Service\App\AccessService)->univerify($this->post_data['mobile']);
        $this->__service($service_res);
    }

    public function getKefu()
    {
        $service_res = (new \App\Service\App\AccessService)->getKefu();
        $this->__service($service_res);
    }

    public function sendsms()
    {
        $rule = [
            'mobile'  => 'require|mobile|max:11',
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'mobile'        => '手机号码错误',
        ];
        $validate   = Validate::make($rule, $msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_res = (new \App\Service\App\AccessService)->sendsms($this->post_data['mobile']);
        
        $this->__service($service_res);
    }
    /**
     * 下载APP页面
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function download()
    {
        return  $this->render('access/download');
    }
    /**
     * 注销
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function logout()
    {
    }
}
