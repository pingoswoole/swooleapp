<?php
namespace App\Service\App;

use Carbon\Carbon;
use App\Utility\Status;

class VideoAreaService extends Base
{
    
    protected $model_class = \App\Model\Product\VideoArea::class;
     

    public function getAllList():array
    {
        
        try {
            $where['state'] = 1;
            $result = $this->model->orderBy('id', 'DESC')->where($where)->pluck('title');
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
            
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
      
      
}