<?php
namespace App\Service\App;

use App\Model\Product\ForumArticleComments;
use App\Utility\Status;

class ForumArticleCommentsService extends Base
{
    
    protected $model_class = ForumArticleComments::class;

    public function getCommentsList(int $id):array
    {
        try {
            //code...
            $list = $this->model->where('article_id', $id)
                ->orderBy('id', 'DESC')
                ->with(['member' => function($Query){
                     $Query->select('id', 'nickname', 'avatar', 'grade');
                }])
                ->get();
            if($list) return $this->_result(Status::CODE_OK, 'success', $list);   
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '获取失败');
    }

    public function commentArticle(int $mid, int $id, string $comment)
    {
        try {
            //code...
            $data['mid'] = $mid;
            $data['article_id'] = $id;
            $data['title'] = $comment;

            $id = $this->model->insert($data);
            if($id) return $this->_result(Status::CODE_OK, '评论成功');   
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '操作失败');
    }
     



}