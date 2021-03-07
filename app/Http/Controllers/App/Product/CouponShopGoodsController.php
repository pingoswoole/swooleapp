<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\CouponShopGoodsService;

class CouponShopGoodsController extends AppController
{

    /**
     * list
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getList()
    {
        $service_res = (new CouponShopGoodsService)->getList();
        $this->__service($service_res);
    }

}