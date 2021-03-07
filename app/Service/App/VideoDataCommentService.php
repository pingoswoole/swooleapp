<?php
namespace App\Service\App;

use Carbon\Carbon;
use App\Utility\Status;
use App\Model\Product\VideoArea;
use App\Model\Product\VideoAd;

class VideoDataCommentService extends Base
{
    protected $model_class = \App\Model\Product\VideoDataComment::class;

    public function getCommentsList(int $id):array
    {
        try {
            //code...
            $list = $this->model->where('video_data_id', $id)
                ->orderBy('id', 'DESC')
                ->with(['member' => function ($Query) {
                    $Query->select('id', 'nickname', 'avatar', 'grade');
                }])
                ->get();
            if ($list) {
                return $this->_result(Status::CODE_OK, 'success', $list);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '获取失败');
    }

    public function comment(int $mid, int $id, string $comment)
    {
        try {
            //code...
            $data['mid'] = $mid;
            $data['video_data_id'] = $id;
            $data['content'] = $comment;

            $id = $this->model->insert($data);
            if ($id) {
                return $this->_result(Status::CODE_OK, '评论成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '操作失败');
    }
}
