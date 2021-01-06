<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\App\AppController;
use App\Service\App\ShareService;

class ShareController extends AppController
{
    /**
     * 分享卡券商品
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function shareCoupon()
    {
        $coupon_id = $this->request()->get("coupon_goods_id", 0);
        $service_res = (new ShareService)->shareCoupon($this->auth_user_data['id'], $coupon_id);
        return $this->__service($service_res);
    }
    /**
     * 推广App
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function shareApp()
    {
        $service_res = (new ShareService)->shareApp($this->auth_user_data['id']);
        return $this->__service($service_res);
    }

}