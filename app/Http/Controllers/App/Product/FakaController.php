<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\FakaService;

class FakaController extends AppController
{
    protected $login_check = true;

    public function getDesc()
    {
        $service_res = (new FakaService)->getDesc();
        return $this->__service($service_res);
    }
    
    public function upgrade()
    {
        $grade = intval($this->_post("grade"));
        $key = (string) $this->_post("key");
        
        $service_res = (new FakaService)->upgrade($this->auth_user_data['id'], $grade, $key);
        return $this->__service($service_res);
    }
}
