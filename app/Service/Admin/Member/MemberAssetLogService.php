<?php
namespace App\Service\Admin\Member;

use Carbon\Carbon;
use App\Service\Admin\Base;

class  MemberAssetLogService extends Base
{
    
    protected $model_class = \App\Model\Member\MemberAssetLog::class;

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
      public function getPageList($page, $pageSize, $mobile = '', $flow = null, $from = '', $type = ''):array
      {
          $data = ['count' => 0, 'list' => [], 'total_amount' => 0];
          try {
              //code...
              $where = [];
              
              if(!is_null($flow)){
                   $where[] = ['member_asset_log.flow', '=', $flow];
               }
              if($from){
                    $where[] = ['member_asset_log.from_type', '=', $from];
                }
               if($type){
                    $where[] = ['member_asset_log.asset_type', '=', $type];
                }
              $count = $this->model->where($where)->count();
              if($mobile){
                $where[] = ['member.mobile', '=', $mobile];
               }

               $list = $this->model->where($where)->orderBy('member_asset_log.id', 'DESC')->page($page, $pageSize)->with(['member'])->get();
               $total_amount = 0;
               
              if ($list) {
                   # code...
                   $asset_types = ['scroe' => '积分', 'commission' => '佣金'];
                   $from_types = ['active' => '激活会员', 'upgrade' => '升级代理', 'shopping' => '购物', 'withdraw' => '提现'];
                   foreach ($list as $key => &$row) {
                       # code...
                       $total_amount += $row['money'];
                       $row['flow'] = $row['flow'] == 0 ? "出账" : "进账";
                       $row['asset_type'] = $asset_types[$row['asset_type']]?? '其他';
                       $row['from_type'] = $from_types[$row['from_type']]?? '其他';
                   }
                   
               }
              
              return  ['count' => $count, 'list' => $list, 'total_amount' => $total_amount];
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
                $data['morepic'] = json_encode($data['morepic']);
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
                $data['morepic'] = json_encode($data['morepic']);
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
}