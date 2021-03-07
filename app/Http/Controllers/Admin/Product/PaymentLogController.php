<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use \App\Service\Admin\Product\PaymentLogService;

class PaymentLogController extends AdminController
{
        /**
         * 列表展示
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function viewAll()
        {
             
            $this->render('product.payment.all');
        }
        /**
         * 列表数据
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function getPageList()
        {    
            
            $page_data = $this->getPage();
            $data = (new PaymentLogService)->getPageList($page_data['page'], $page_data['limit'], []);
            $this->jsonPage(0, $data['count'], $data['list']);
        }


}