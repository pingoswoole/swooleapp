<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\VideoAreaService;
use App\Service\App\VideoDataService;

class VideoAreaController extends AppController
{
    protected $login_check = false;

    public function getList()
    {
        $service_res = (new VideoAreaService)->getAllList();
        return $this->__service($service_res);
    }

    public function getCityList()
    {
        $city = $this->request()->get('city', '');
        $type = $this->request()->get('type', 0);
        $service_res = (new VideoDataService)->getListByCity($city, $type);
        return $this->__service($service_res);
    }

    public function getSameCityList()
    {
        $city = $this->request()->get('city', '');
        $sort = $this->request()->get('sort', '');
        $composite = $this->request()->get('composite', '');
        
        $service_res = (new VideoDataService)->getSameCityList($city, $sort, $composite);
        return $this->__service($service_res);
    }
}
