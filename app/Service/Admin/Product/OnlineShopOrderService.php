<?php
namespace App\Service\Admin\Product;

use Carbon\Carbon;
use App\Service\Admin\Base;

class OnlineShopOrderService extends Base
{
    
    protected $model_class = \App\Model\Product\OnlineShopOrder::class;  
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
      public function getPageList($page, $pageSize, array $where = []):array
      {
          $data = ['count' => 0, 'list' => []];
          try {
              //code...
              $count = $this->model->where($where)->count();
              $list = $this->model->where($where)->orderBy('id', 'DESC')->page($page, $pageSize)->get();

              return  ['count' => $count, 'list' => $list];
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $data;
      }
      
      /**
       * 添加一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $data
       * @return boolean
       */
      public function addItem(array $data):bool
      {
            try {
                //code...
                $data['created_at'] = Carbon::now()->timestamp;
                $id = model()->insert($this->table, $data);
            } catch (\Throwable $th) {
                //throw $th;
                return false;
            }
            return true;
      }
      
      /**
       * 查询一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $where
       * @return array
       */
      public function getItem(array $where = []):array
      {
            try {
                //code...
                $result = model()->get($this->table, '*', $where);
                return $result ? $result : [];
            } catch (\Throwable $th) {
                //throw $th;
            }
            return [];
      }
      
      /**
       * 修改一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $data
       * @param [type] $where
       * @return boolean
       */
      public function editItem(array $data, array $where): bool
      {
            try {
                //code...
                $order_item = model()->get($this->table, '*', $where);
                if($order_item['state'] !== 1){
                    return false;
                }

                $pdoStmt = model()->update($this->table, $data, $where);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
      
      /**
       * 修改字段
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $data
       * @param [type] $where
       * @return boolean
       */
      public function setItem($id, $field_name, $field_val):bool
      {
            try {
                //code...
                $data = [$field_name => $field_val];
                $pdoStmt = model()->update($this->table, $data, ['id' => $id]);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
      
      /**
       * 条件删除一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $ids
       * @return boolean
       */
      public function delItem($ids = null):bool
      {
            try {
                //code...
                if(is_string($ids)) $ids = [$ids];
                $rowCount = $this->model->whereIn('id', $ids)->delete();
                return $rowCount > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
}