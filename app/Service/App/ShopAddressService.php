<?php
namespace App\Service\App;

use App\Utility\Status;
use Carbon\Carbon;

class ShopAddressService extends Base
{
    protected $table = 'member_shopaddress';
     
    /**
     * 获取列表
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @return array
     */
    public function getList(int $mid):array
    {
        try {
            //code...
            $model = model();
            $column = "*";
            $where = ['mid' => $mid];
            $item = $model->select($this->table, $column, $where);
            if($item){
                return $this->_result(Status::CODE_OK, 'success', $item);
            }  
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    /**
       * 添加一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $data
       * @return boolean
       */
      public function addItem(int $mid, array $data):array
      {
           
            try {
                //code...
                $model = model();
                $model->beginTransaction();
                $default_flag = true;
                if(!empty($data['is_default'])){
                    $pdoStmt = $model->update($this->table, ['is_default' => 0], ['mid' => $mid]);
                    if($pdoStmt->rowCount() <= 0) {
                        //$default_flag = false;
                    }
                }
                $data['mid'] = $mid;
                $data['created_at'] = Carbon::now()->timestamp;
                $id = $model->insert($this->table, $data);
                if($id > 0 && $default_flag){
                    $model->commit();
                    return $this->_result(Status::CODE_OK, '添加成功');
                }
                $model->rollback();
            } catch (\Throwable $th) {
                //throw $th;
                $model->rollback();
               return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
            }
            return $this->_result(Status::CODE_ERR, 'error');
      }
      
      /**
       * 查询一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $where
       * @return array
       */
      public function getItem(int $mid, int $id):array
      {
            try {
                //code...
                $where['mid'] = $mid;
                $where['id'] = $id;
                $result = model()->get($this->table, '*', $where);
                if($result){
                    return $this->_result(Status::CODE_OK, 'success', $result);
                }
                 
            } catch (\Throwable $th) {
                //throw $th;
                return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
            }
            return $this->_result(Status::CODE_ERR, 'error');
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
      public function editItem(array $data, int $mid, int $id): array
      {
            try {
                //code...
                
                if(!empty($data['is_default'])){
                    $pdoStmt = model()->update($this->table, ['is_default' => 0], ['mid' => $mid]);
                }
                $where['id'] = $id;
                $where['mid'] = $mid;
                $data['updated_at'] = Carbon::now()->timestamp;
                $pdoStmt = model()->update($this->table, $data, $where);
                if($pdoStmt->rowCount() > 0){
                    return $this->_result(Status::CODE_OK, '修改成功');
                }
            } catch (\Throwable $th) {
                //throw $th;
                return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
            }
            return $this->_result(Status::CODE_ERR, 'error');
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
      public function setItem($id, $field_name, $field_val):array
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
      public function delItem(int $mid, int $id):array
      {
            try {
                //code...
                $pdoStmt = model()->delete($this->table, ['id' => $id, 'mid' => $mid]);
                if($pdoStmt->rowCount() > 0){
                    return $this->_result(Status::CODE_OK, '删除成功');
                }
                
            } catch (\Throwable $th) {
                //throw $th;
                return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
            }
            return $this->_result(Status::CODE_ERR, 'error');
      }


}