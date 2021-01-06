<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\App\AppController;
use App\Service\App\MessageService;

class MessageController extends AppController
{

    protected $login_check = false;

    public function getList()
    {
        $page = $this->request()->get("page", 1);
        $pageSize = $this->request()->get("pageSize", 100);
        
        $service_res = (new MessageService)->getList($page, $pageSize);
        return $this->__service($service_res);
    }

   

}