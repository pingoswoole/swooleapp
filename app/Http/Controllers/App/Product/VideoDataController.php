<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\VideoDataService;
use App\Service\App\VideoDataCommentService;

class VideoDataController extends AppController
{
    protected $login_check = true;

    public function getList()
    {
        $page = $this->request()->get("page", 1);
        $pageSize = $this->request()->get("pageSize", 100);
        $city = $this->request()->get("city", null);
         
        $service_res = (new VideoDataService)->getPageList($page, $pageSize, $city);
        return $this->__service($service_res);
    }


    public function publish()
    {
        $post_data = $this->_post(['city', 'title', 'url', 'thumb']);
        $service_res = (new VideoDataService)->publish($this->auth_user_data['id'], $post_data);
        return $this->__service($service_res);
    }

    public function remove()
    {
        $id = $this->_post('id');
        $service_res = (new VideoDataService)->remove($this->auth_user_data['id'], $id);
        return $this->__service($service_res);
    }

    public function getMyVideoList()
    {
        $service_res = (new VideoDataService)->getMyVideoList($this->auth_user_data['id']);
        return $this->__service($service_res);
    }

    public function getAdDetail()
    {
        $id = $this->request()->get('id', 0);
        $result = (new VideoDataService)->getAdDetail($id);
        return $this->__service($result);
    }
    

    public function getVDetail()
    {
        $id = $this->request()->get('id', 0);
        $is_ad = $this->request()->get('is_ad', 0);
        $result = (new VideoDataService)->getVDetail($id, $is_ad);
        return $this->__service($result);
    }

    public function zan()
    {
        $id = intval($this->_post('id'));
        $result = (new VideoDataService)->zanVideo($id);
        return $this->__service($result);
    }

    public function comment()
    {
        $id = intval($this->_post('id'));
        $content = (string) $this->_post('content');
        $result = (new VideoDataCommentService)->comment($this->auth_user_data['id'], $id, $content);
        return $this->__service($result);
    }

    public function getCommentsList()
    {
        $id = $this->request()->get('id', 0);
        $result = (new VideoDataCommentService)->getCommentsList($id);
        return $this->__service($result);
    }
}
