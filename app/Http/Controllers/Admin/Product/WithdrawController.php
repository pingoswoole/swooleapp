<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Admin\AdminController;
use App\Utility\Status;

class WithdrawController extends AdminController
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
             
            $this->render('product.withdraw.all');
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
            $data = (new \App\Service\Admin\WithdrawService)->getPageList($page_data['page'], $page_data['limit'], []);
            $this->jsonPage(0, $data['count'], $data['list']);
        }

        /**
         * 修改字段
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function setItem()
        {
            $id = $this->request()->route("id");
            $post_data = $this->request()->post(['key', 'value']);
             
            $result = (new \App\Service\Admin\WithdrawService)->setItem($id, $post_data['key'], $post_data['value']);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }
        /**
         * 审计
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function audit()
        {
            $id = $this->request()->route("id");
            $state = $this->request()->post('state');
            $result = (new \App\Service\Admin\WithdrawService)->audit($id, $state);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }

}