<?php
namespace App\Service\Admin\Product;

use Carbon\Carbon;
use App\Service\Admin\Base;

class WithdrawService extends Base
{
    
    protected $table = 'member_withdraw';  
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
              $count = model()->count($this->table, $where);
              $where['ORDER'] = ['id' => 'DESC'];
              $where['LIMIT'] = [($page - 1)*$pageSize, $pageSize];
              $column = [
                'member_withdraw.id',
                'member_withdraw.money',
                'member_withdraw.bank_info',
                'member_withdraw.state',
                'member_withdraw.created_at',
                'member.nickname',
                'member.mobile',

              ];
              $join = [
                  '[>]member' => ["mid" => "id"]
              ];
              $list = model()->select($this->table, $join, $column, $where);
              if($list){
                  foreach ($list as $key => &$row) {
                      # code...
                      $row['bank_info'] = json_decode($row['bank_info'], true);
                      $row['created_at'] = date('Y-m-d H:i:s', $row['created_at']);
                  }
              }
               
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
                $data['updated_at'] = Carbon::now()->timestamp;
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
                $data['updated_at'] = Carbon::now()->timestamp;
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
                $pdoStmt = model()->delete($this->table, ['id' => $ids]);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
                
            }
            return false;
      }
      /**
       * 审计
       *
       * @author pingo
       * @created_at 00-00-00
       * @param integer $id
       * @param integer $state
       * @return void
       */
      public function audit(int $id, int $state)
      {
        try {
            //code...
            $model = model();
            $model->beginTransaction();
            $trans_flag = true;
            $item = $model->get($this->table, '*', ['id' => $id]);
            if($item && $item['state'] == 0){
                //审核通过
                if($state == 1){
                    
                }elseif ($state == -1) {
                    # 拒绝
                    $pdoStmt = $model->update('member_asset', ['commission[+]' => $item['money']], ['mid' => $item['mid']]);
                    $member_asset_log_field['mid'] = $item['mid'];
                    $member_asset_log_field['title'] = '提现驳回';
                    $member_asset_log_field['flow'] = 1;
                    $member_asset_log_field['money'] = $item['money'];
                    $member_asset_log_field['from_type'] = 'withdraw';
                    $member_asset_log_field['asset_type'] = 'commission';
                    $member_asset_log_field['created_at'] = time();
                    
                    $member_asset_log_id = $model->insert('member_asset_log', $member_asset_log_field);
                    if($pdoStmt->rowCount() <= 0 || $member_asset_log_id <= 0 ){
                        $trans_flag = false;
                    }
                }
                $withdraw_field['state'] = $state;
                $withdraw_field['updated_at'] = time();
                $pdoStmt = $model->update($this->table, $withdraw_field, ['id' => $id]);
                if($pdoStmt->rowCount() <= 0){
                    $trans_flag = false;
                }
            }
            if($trans_flag){
                $model->commit();
                return true;
            }
            $model->rollback();
            return false;
             
        } catch (\Throwable $th) {
            //throw $th;
            $model->rollback();
        }
        return false;
      }

}