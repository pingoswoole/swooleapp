<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use App\Service\Admin\Product\VideoCategoryService;
/**
 * 分类
 *
 * @author pingo
 * @created_at 00-00-00
 */
class VideoCategoryController extends AdminController
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
             
            $this->render('product.video.category.all');
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
            $data = (new VideoCategoryService)->getPageList($page_data['page'], $page_data['limit'], []);
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
                $result = (new VideoCategoryService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                return $this->render('product.video.category.add');
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
            $data = (new VideoCategoryService)->getItem(['id' => $id]);
            return $this->render('product.video.category.edit', $data);
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
            $result = (new VideoCategoryService)->editItem($post_data, ['id' => $id]);
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
            $data = (new VideoCategoryService)->getItem(['id' => $id]);
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
            $result = (new VideoCategoryService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}