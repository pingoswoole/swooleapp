<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\App\AppController;
use App\Service\App\SwiperSliderService;

class SwiperSliderController extends AppController
{

    protected $login_check = false;

    public function getList()
    {
        $page = $this->request()->get("page", 1);
        $pageSize = $this->request()->get("pageSize", 100);
        
        $service_res = (new SwiperSliderService)->getList($page, $pageSize);
        return $this->__service($service_res);
    }

   

}