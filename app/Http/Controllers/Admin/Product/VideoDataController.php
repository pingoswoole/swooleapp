<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\AdminController;
use App\Model\Product\VideoArea;
use App\Model\Product\VideoData;
use App\Service\Admin\Product\VideoAreaService;
use App\Utility\Status;
use \App\Service\Admin\Product\VideoDataService;
use \App\Service\Admin\Product\VideoCategoryService;
/**
 * 商品
 *
 * @author pingo
 * @created_at 00-00-00
 */
class VideoDataController extends AdminController
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
             
            $this->render('product.video.data.all');
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
            $data = (new VideoDataService)->getPageList($page_data['page'], $page_data['limit'], []);
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
              
                $post_data = $this->request()->post(['cate_id', 'type', 'area_id', 'title', 'thumb', 'resource_urls', 'state', ]);
                 
                $result = (new VideoDataService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                $data['catelist'] = (new VideoCategoryService)->getAll();
                $data['resource_type'] = VideoData::RESOURCE_TYPE;
                $data['area_list'] = (new VideoAreaService)->getAll(['state' => 1]);
                return $this->render('product.video.data.add',  $data);
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
            $data = (new VideoDataService)->getItem(['id' => $id]);
            $data['cate_list'] = (new VideoCategoryService)->getAll();
            $data['resource_type'] = VideoData::RESOURCE_TYPE;
            $data['area_list'] = (new VideoAreaService)->getAll(['state' => 1]);

            return $this->render('product.video.data.edit', $data);
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
            $post_data = $this->request()->post(['cate_id', 'type', 'area_id', 'title', 'thumb', 'resource_urls', 'state', ]);
            $result = (new VideoDataService)->editItem($post_data, ['id' => $id]);
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
            $result = (new VideoDataService)->setItem($id, $post_data['key'], $post_data['value']);
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
            $result = (new VideoDataService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}