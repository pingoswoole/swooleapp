<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\App\AppController;
use App\Service\App\AssetLogService;
use App\Utility\Status;

class AssetLogController extends AppController
{

    public function getLogList()
    {
        $from_type = $this->request()->get("from_type", 'active');
        $service_rs = (new AssetLogService)->getList($this->auth_user_data['id'], $from_type);
        $this->__service($service_rs);
    }

}