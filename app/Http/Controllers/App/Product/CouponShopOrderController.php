<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\CouponShopOrderService;

class CouponShopOrderController extends AppController
{

    public function getList()
    {
        $page = $this->request()->get("page", 1);
        $pageSize = $this->request()->get("pageSize", 10);
        
        $service_res = (new CouponShopOrderService)->getList($this->auth_user_data['id'], $page, $pageSize);
        return $this->__service($service_res);
    }

    public function getStateList()
    {
        $page = $this->request()->get("page", 1);
        $pageSize = $this->request()->get("pageSize", 10);
        $state = $this->request()->get("state", 1);
        $order_id = $this->request()->get("order_id", 0);

        $service_res = (new CouponShopOrderService)->getStateList($this->auth_user_data['id'], $page, $pageSize, $state, $order_id);
        return $this->__service($service_res);
    }

}