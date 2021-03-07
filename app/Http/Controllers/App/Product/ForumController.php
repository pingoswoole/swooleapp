<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Logic\App\ForumLogic;
use App\Service\App\ForumArticleService;
use App\Service\App\ForumAdService;
use App\Service\App\ForumArticleCommentsService;
use App\Utility\Status;

class ForumController extends AppController
{
    protected $login_check = true;

    public function getAdList()
    {
        $result = (new ForumLogic)->getAdList();
        return $this->json(Status::CODE_OK, 'success', $result);
    }

    public function getArticle()
    {
        $id = $this->request()->get('id', 0);
        $result = (new ForumArticleService)->getArticle($id);
        return $this->__service($result);
    }

    public function getAdDetail()
    {
        $id = $this->request()->get('id', 0);
        $result = (new ForumAdService)->getAdDetail($id);
        return $this->__service($result);
    }

    
    public function getArticleList()
    {
        $id = $this->request()->get('id', 0);
        $page = $this->request()->get('page', 1);
        $result = (new ForumLogic)->getArticleList($id, $page);
        return $this->json(Status::CODE_OK, 'success', $result);
    }

    public function getCateList()
    {
        $result = (new ForumLogic)->getCateList();
        return $this->json(Status::CODE_OK, 'success', $result);
    }

    public function comment()
    {
        $id = intval($this->_post('id'));
        $result = (new ForumArticleService)->comment($id);
        return $this->__service($result);
    }

    public function getCommentsList()
    {
        $id = $this->request()->get('id', 0);
        $result = (new ForumArticleCommentsService)->getCommentsList($id);
        return $this->__service($result);
    }

    public function remove()
    {
        $id = intval($this->_post('id'));
        $result = (new ForumArticleService)->remove($this->auth_user_data['id'], $id);
        return $this->__service($result);
    }

    public function getMyArticleList()
    {
        $result = (new ForumArticleService)->getMyArticleList($this->auth_user_data['id']);
        return $this->__service($result);
    }


    public function publish()
    {
        $post_data = (array) $this->_post(['cate_id', 'title', 'thumb', 'qq', 'wechat', 'phone', 'content', 'resource_urls']);

        $result = (new ForumArticleService)->publish($this->auth_user_data['id'], $post_data);
        return $this->__service($result);
    }
}
