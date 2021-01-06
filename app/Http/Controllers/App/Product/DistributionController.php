<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\App\AppController;
use App\Utility\Status;
use App\Service\App\DistributionService;
/**
 * 分销相关
 *
 * @author pingo
 * @created_at 00-00-00
 */
class DistributionController extends AppController
{

       
        /**
         * 查看一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function getUpgradeDes()
        {
            $name = $this->request()->route("name");
            $service_res = (new DistributionService)->getUpgradeDes($name, $this->auth_user_data['id']);
            return $this->__service($service_res);             
        }
        



}