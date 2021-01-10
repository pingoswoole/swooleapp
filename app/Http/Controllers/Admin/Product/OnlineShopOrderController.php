<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Admin\AdminController;
use App\Utility\Status;
use \App\Service\Admin\Product\OnlineShopOrderService;
/**
 * 商品订单
 *
 * @author pingo
 * @created_at 00-00-00
 */
class OnlineShopOrderController extends AdminController
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
             
            $this->render('product.onlineshop.order.all');
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
            $data = (new OnlineShopOrderService)->getPageList($page_data['page'], $page_data['limit'], []);
            $this->jsonPage(0, $data['count'], $data['list']);
        }
        /**
         * 添加一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function addItem()
        {
            if($this->isPost()){
                 
                $post_data = $this->request()->post();
                $result = (new OnlineShopOrderService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                return $this->render('product.onlineshop.order.add');
            }
        }

        /**
         * 查看一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function viewItem()
        {
            $id = $this->request()->route("id");
            $data = (new OnlineShopOrderService)->getItem(['id' => $id]);
            return $this->render('product.onlineshop.order.edit', $data);
        }
        /**
         * 编辑一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function editItem()
        {
            $id = $this->request()->route("id");
            $post_data = $this->request()->post();
            $result = (new OnlineShopOrderService)->editItem($post_data, ['id' => $id]);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
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
            $data = (new OnlineShopOrderService)->getItem(['id' => $id]);
        }
        /**
         * 删除一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function delItem()
        {
            $id = $this->request()->route("id");
            $result = (new OnlineShopOrderService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}