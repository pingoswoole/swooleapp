<?php
namespace App\Http\Controllers\App\Common;

use App\Http\Controllers\App\AppController;
use App\Logic\App\UniPushLogic;
use App\Service\App\CouponShopGoodsService;
use App\Utility\Status;
use Pingo\Validate\Validate;

class AccessController extends AppController
{
    protected $login_check = false;

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
        $validate   = Validate::make($rule,$msg);
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
        $validate   = Validate::make($rule,$msg);
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
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        //手机验证码
        $invite_id = $this->_post("invite_id") ?? 0;
        $coupon_goods_id = $this->_post("coupon_goods_id") ?? 0;

        $service_res = (new \App\Service\App\AccessService)->register($this->post_data['mobile'], $this->post_data['pwd'], $invite_id, $coupon_goods_id);
        $this->__service($service_res);
    }
    /**
     * 优惠券注册页面
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function viewCouponSignUp()
    {
        
        $data = [
            'invite_id' => $this->request()->get("invite_id", 0),
            'coupon_goods_id' => $this->request()->get("coupon_goods_id", 0),
        ];
        //获取卡券商品信息
        $coupon_goods_id = decrypt_code($data['coupon_goods_id']);
        $data['has_txt'] = setting('distribution.share_coupon_txt');
        $data['goods'] = (new CouponShopGoodsService)->getCouponGoodsInfo($coupon_goods_id);
         
        return $this->render('access/signupCoupon', $data);
    }
    /**
     * app推广注册页面
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function viewAppSignUp()
    {
        return $this->render('access/signupApp');
        $data = [
            'invite_id' => $this->request()->get("invite_id", 0),
        ];
         
        return $this->render('access/signupApp', $data);
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