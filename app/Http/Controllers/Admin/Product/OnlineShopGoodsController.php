<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Admin\AdminController;
use App\Utility\Status;

/**
 * 商品
 *
 * @author pingo
 * @created_at 00-00-00
 */
class OnlineShopGoodsController extends AdminController
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
             
            $this->render('product.onlineshop.goods.all');
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
            $data = (new \App\Service\Admin\OnlineShopGoodsService)->getPageList($page_data['page'], $page_data['limit'], []);
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
                 
                $post_data = $this->request()->post(['title', 'short_title', 'cate_id', 'price', 'state', 'thumb', 'morepic', 'description']);
                 
                $result = (new \App\Service\Admin\OnlineShopGoodsService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                $data = (new \App\Service\Admin\OnlineShopCategoryService)->getAll();
                 
                return $this->render('product.onlineshop.goods.add', ['catelist' => $data]);
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
            $data = (new \App\Service\Admin\OnlineShopGoodsService)->getItem(['id' => $id]);
            $data['cate_list'] = (new \App\Service\Admin\OnlineShopCategoryService)->getAll();
            
            return $this->render('product.onlineshop.goods.edit', $data);
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
            $post_data = $this->request()->post(['title', 'short_title', 'cate_id', 'price', 'state', 'thumb', 'morepic', 'description']);
            $result = (new \App\Service\Admin\OnlineShopGoodsService)->editItem($post_data, ['id' => $id]);
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
            $post_data = $this->request()->post(['key', 'value']);
            $result = (new \App\Service\Admin\OnlineShopGoodsService)->setItem($id, $post_data['key'], $post_data['value']);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
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
            $result = (new \App\Service\Admin\OnlineShopGoodsService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}