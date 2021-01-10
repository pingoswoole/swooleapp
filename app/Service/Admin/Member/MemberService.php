<?php
namespace App\Service\Admin\Member;

use App\Model\Member\MemberAsset;
use Carbon\Carbon;
use App\Service\Admin\Base;

class MemberService extends Base
{
    
    protected $model_class = \App\Model\Member\Member::class;
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

              $count =  $this->model->where($where)->count();
              $list =  $this->model->where($where)->orderBy('id', 'DESC')->page($page, $pageSize)->with(['asset', 'realnameauth'])->get();
              //code...
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
                //是否存在用户
                $member = $this->model->where('mobile', $data['mobile'])->first();
                if($member) return false;
                $salt = random_str(8);
                $data['salt'] = $salt;
                $data['pwd'] = encrypt($data['pwd'], $salt);;
                $data['created_at'] = Carbon::now()->timestamp;
                $id = $this->model->insert($data);
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
                $result = $this->model->where($where)->first();
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
                $member = $this->model->where($where)->first();
                if($member && $member['pwd'] !== $data['pwd']){
                    $data['pwd'] = encrypt($data['pwd'], $member['salt']);
                }
                 
                $data['updated_at'] = Carbon::now()->timestamp;
                $rowCount = $this->model->where($where)->update($data);
                return $rowCount > 0 ? true : false;
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
                $rowCount = $this->model->where(['id' => $id])->update($data);
                return $rowCount > 0 ? true : false;
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
                $rowCount1 = $this->model->whereIn('id', $ids)->delete();
                //删除资产
                $
                $rowCount2 = (new MemberAsset())->whereIn('mid', $ids)->delete();
                return $rowCount1 > 0 && $rowCount2 > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
}