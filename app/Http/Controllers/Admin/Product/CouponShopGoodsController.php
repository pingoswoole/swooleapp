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
class CouponShopGoodsController extends AdminController
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
             
            $this->render('product.couponshop.goods.all');
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
            $data = (new \App\Service\Admin\CouponShopGoodsService)->getPageList($page_data['page'], $page_data['limit'], []);
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
                 
                $post_data = $this->request()->post([
                        'title', 
                        'deduction_price',
                        'cate_id', 
                        'price',
                        'expires', 
                        'state', 
                        'thumb', 
                        'onlineshop_goodsid', 
                        'description',
                        'operator_agentactive_vip',
                         
                        'operator_commission',
                        'agent_commission',
                        'agent_price',
                        'operator_price',
                        ]);
                 
                $result = (new \App\Service\Admin\CouponShopGoodsService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                $data = (new \App\Service\Admin\CouponShopCategoryService)->getAll();
                 
                return $this->render('product.couponshop.goods.add', ['catelist' => $data]);
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
            $data = (new \App\Service\Admin\CouponShopGoodsService)->getItem($id);
            $data['cate_list'] = (new \App\Service\Admin\CouponShopCategoryService)->getAll();
            
            return $this->render('product.couponshop.goods.edit', $data);
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
            $post_data = $this->request()->post([
                                'title', 
                                'deduction_price', 
                                'cate_id', 'price', 
                                'state', 
                                'expires', 
                                'thumb', 
                                'onlineshop_goodsid', 
                                'description',
                                'operator_agentactive_vip',
                                
                                'operator_commission',
                                'agent_commission',
                                'agent_price',
                                'operator_price',
                                
                                ]);
            $result = (new \App\Service\Admin\CouponShopGoodsService)->editItem($post_data, ['id' => $id]);
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
            $result = (new \App\Service\Admin\CouponShopGoodsService)->setItem($id, $post_data['key'], $post_data['value']);
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
            $result = (new \App\Service\Admin\CouponShopGoodsService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}