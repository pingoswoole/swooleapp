<?php
namespace App\Service\App;

use App\Model\Product\SwiperSlider;
use App\Utility\Status;

class SwiperSliderService extends Base 
{
     
    protected $model_class = SwiperSlider::class;
    /**
     * 获取分页列表数据
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param integer $page
     * @param integer $pageSize
     * @return void
     */
    public function getList(int $page = 1, int $pageSize = 20)
    {
        $result = ['count' => 0, 'list' => []];
          try {
              //code...
              $count = $this->model->count();
              $list = $this->model->orderBy('id', 'DESC')->page($page, $pageSize)->get();
              $result =  ['totalCount' => $count, 'list' => $list, 'isEmpty' => empty($list) ?  true : false];
              return $this->_result(Status::CODE_OK, 'success', $result);
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $this->_result(Status::CODE_ERR, 'error', $result);
    }
 


}