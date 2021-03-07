<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\OnlineShopGoodsService;

class OnlineShopGoodsController extends AppController
{

    protected $login_check = false;
    /**
     * list
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getList()
    {

        $cate = $this->request()->get('cate', []);
        $sales = $this->request()->get('sales', '');
        $composite = $this->request()->get('composite', '');
        if(!empty($cate)){
            $cate = array_filter($cate);
        }
         
        $service_res = (new OnlineShopGoodsService)->getList($cate, $sales, $composite);
        $this->__service($service_res);
    }

    public function getChannel()
    {
        $service_res = (new OnlineShopGoodsService)->getChannel();
        $this->__service($service_res);
    }

    public function getItem()
    {
        $goods_id = $this->request()->get("id", 0);
        $service_res = (new OnlineShopGoodsService)->getItem($goods_id);
        $this->__service($service_res);
    }

    public function getCateGoodsList()
    {
        $service_res = (new OnlineShopGoodsService)->getCateGoodsList();
        $this->__service($service_res);
    }

    public function getCatesList()
    {
        $service_res = (new OnlineShopGoodsService)->getCatesList();
        $this->__service($service_res);
    }

}