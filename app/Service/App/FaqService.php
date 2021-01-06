<?php
namespace App\Service\App;

use App\Utility\Status;

class FaqService extends Base 
{
    protected $table = 'faq_article';

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
              $count = model()->count($this->table, []);
              $where['ORDER'] = ['id' => 'DESC'];
              $where['LIMIT'] = [($page - 1)*$pageSize, $pageSize];
              $column = "*";
               
              $list = model()->select($this->table, $column, $where);
              $result =  ['totalCount' => $count, 'list' => $list, 'isEmpty' => empty($list) ?  true : false];
              return $this->_result(Status::CODE_OK, 'success', $result);
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $this->_result(Status::CODE_ERR, 'error', $result);
    }
 


}