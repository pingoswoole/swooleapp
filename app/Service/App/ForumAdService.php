<?php
namespace App\Service\App;

use App\Model\Product\ForumAd;
use App\Utility\Status;

class ForumAdService extends Base
{
    
    protected $model_class = ForumAd::class;

    public function getAdDetail(int $id):array
    {
        try {
            //code...
            $item = $this->model->where('id', $id)->first();
            if($item) return $this->_result(Status::CODE_OK, 'success', $item);   
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '修改失败');
    }

     



}