<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Logic\App\ForumLogic;
use App\Service\App\ForumArticleService;
use App\Service\App\ForumAdService;
use App\Service\App\ForumArticleCommentsService;
use App\Utility\Status;

class ForumArticleCommentsController extends AppController
{


    public function commentArticle()
    {
        $id = intval($this->_post('id'));
        $comments = (string) $this->_post('comments');
        
        $result = (new ForumArticleCommentsService)->commentArticle($this->auth_user_data['id'], $id, $comments);
        return $this->__service($result);
    }

}