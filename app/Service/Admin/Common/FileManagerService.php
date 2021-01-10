<?php
namespace App\Service\Admin\Common;

use Carbon\Carbon;
use App\Service\Admin\Base;

class FileManagerService extends Base
{
    protected $model_class = \App\Model\Common\CommonUploadfile::class;


    /**
     * 条件查询列表所有
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $page
     * @param [type] $pageSize
     * @param array $where
     * @return array
     */
      public function getPageList($page = 1, $pageSize = 10, array $where = []):array
      {
          $data = ['count' => 0, 'list' => []];
          try {
              //code...

              $count = $this->model->where($where)->count();
              $list = $this->model->where($where)->page($page, $pageSize)->orderBy('id', 'DESC')->get();

              return  ['count' => $count, 'list' => $list];
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $data;
      }
     
}