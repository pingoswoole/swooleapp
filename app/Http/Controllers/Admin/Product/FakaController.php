<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use \App\Service\Admin\Product\FakaService;
 
/**
 * faka
 *
 * @author pingo
 * @created_at 00-00-00
 */
class FakaController extends AdminController
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
        $this->render('product.faka.data.all');
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
        $data = (new FakaService)->getPageList($page_data['page'], $page_data['limit'], []);
        $this->jsonPage(0, $data['count'], $data['list']);
    }

    public function download()
    {
        $type = $this->request()->post('type', 1);
        $result = (new FakaService)->download($type);
        if ($result) {
            /* $this->response()->getSwooleResponse()->header('Content-Type', 'application/octet-stream');
            $this->response()->getSwooleResponse()->header('Content-Disposition', 'attachment;filename="fllasdfasd.html"');
            $this->response()->getSwooleResponse()->header('Content-Transfer-Encoding', "binary");
            $this->response()->getSwooleResponse()->header('Pragma', "public");
            $this->response()->getSwooleResponse()->header('Expires', "0");
            $this->response()->getSwooleResponse()->header('Content-Length', 100000);
            $this->response()->getSwooleResponse()->write(file_get_contents($result)); */
            //告诉浏览器这是一个文件流格式的文件
            // $this->response()->getSwooleResponse()->header('Content-Type', 'application/octet-stream');
            
            // $this->response()->sendfile($result);
             
     
            $this->json(Status::CODE_OK, '操作成功', ['link' => $result]);
        } else {
            $this->json(Status::CODE_ERR, 'error');
        }
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
        if ($this->isPost()) {
            $post_data = $this->request()->post(['cate_id', 'type', 'area_id', 'title', 'resource_urls', 'state', ]);
                 
            $result = (new FakaService)->addItem($post_data);
            if ($result) {
                $this->json(Status::CODE_OK, 'success');
            } else {
                $this->json(Status::CODE_ERR, 'error');
            }
        } else {
            $data['catelist'] = (new VideoCategoryService)->getAll();
            $data['resource_type'] = VideoData::RESOURCE_TYPE;
            $data['area_list'] = (new VideoAreaService)->getAll(['state' => 1]);
            return $this->render('product.faka.data.add', $data);
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
        $data = (new FakaService)->getItem(['id' => $id]);
        $data['cate_list'] = (new VideoCategoryService)->getAll();
        $data['resource_type'] = VideoData::RESOURCE_TYPE;
        $data['area_list'] = (new VideoAreaService)->getAll(['state' => 1]);

        return $this->render('product.faka.data.edit', $data);
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
        $post_data = $this->request()->post(['cate_id', 'type', 'area_id', 'title', 'resource_urls', 'state', ]);
        $result = (new FakaService)->editItem($post_data, ['id' => $id]);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
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
        $result = (new FakaService)->setItem($id, $post_data['key'], $post_data['value']);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
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
        $result = (new FakaService)->delItem($id);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
            $this->json(Status::CODE_ERR, 'error');
        }
    }
}
