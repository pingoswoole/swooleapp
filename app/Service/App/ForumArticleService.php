<?php
namespace App\Service\App;

use App\Model\Member\Member;
use App\Model\Product\ForumArticle;
use App\Model\Product\ForumArticleComments;
use App\Utility\Status;

class ForumArticleService extends Base
{
    protected $model_class = ForumArticle::class;

    public function getArticle(int $id):array
    {
        try {
            //code...
            $item = $this->model->where('id', $id)->first();
            if ($item) {
                $item['comments'] = (new ForumArticleComments())->where('article_id', $id)->count();
                return $this->_result(Status::CODE_OK, 'success', $item);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '修改失败');
    }

    public function comment(int $id)
    {
        try {
            //code...
            $result = $this->model->where('id', $id)->increment('like_num', 1);
            if ($result) {
                return $this->_result(Status::CODE_OK, '点赞成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '操作失败');
    }

    /**
     * 发布文章
     *
     * @param integer $mid
     * @param array $data
     * @return void
     */
    public function publish(int $mid, array $data)
    {
        try {
            //权限检查
            $member = (new Member())->where('id', $mid)->select('is_realname', 'grade')->first();
            $privilege = setting('privilege');
            if (isset($privilege['publish_article_need_realname'])) {
                if ($member['is_realname'] !== 1) {
                    return $this->_result(Status::CODE_ERR, '您未通过实名认证');
                }
            }
            if (!isset($privilege['publish_article_member']['all'])) {
                if (isset($privilege['publish_article_member']['vip']) && $member['grade'] < 1) {
                    return $this->_result(Status::CODE_ERR, '您不是VIP用户');
                }
                if (!isset($privilege['publish_article_member']['vip']) && isset($privilege['publish_article_member']['svip']) && $member['grade'] < 2) {
                    return $this->_result(Status::CODE_ERR, '您不是SVIP用户');
                }
            }

            $data['mid'] = $mid;
            $data['state']  = 1;
            $result = $this->model->insert($data);
            if ($result) {
                return $this->_result(Status::CODE_OK, '发布成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }

    public function remove(int $mid, int $id)
    {
        try {
            //code...
            $where['mid'] = $mid;
            $where['id']  = $id;
            $result = $this->model->where($where)->delete();
            if ($result) {
                return $this->_result(Status::CODE_OK);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }

    public function getMyArticleList(int $mid)
    {
        try {
            //code...
            $where['mid'] = $mid;
            $result = $this->model->where($where)->orderBy('id', 'DESC')->get();
            if ($result) {
                return $this->_result(Status::CODE_OK, 'SUCCESS', $result);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
}
