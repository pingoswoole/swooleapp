<?php
namespace App\Service\App;

use App\Utility\Status;
use Carbon\Carbon;

class AssetLogService extends Base
{
    protected $table = 'member_asset_log';
     
    /**
     * 获取列表
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @return array
     */
    public function getList(int $mid, $from_type):array
    {
        try {
            //code...
            $model = model();
            $column = "*";
            $where = ['mid' => $mid, 'from_type' => $from_type, 'ORDER' => ['id' => 'DESC']];
            $list = $model->select($this->table, $column, $where);
            if($list){
                foreach ($list as $key => &$row) {
                    # code...
                    $row['created_at'] = date("Y-m-d H:i:s", $row['created_at']);
                }
                return $this->_result(Status::CODE_OK, 'success', $list);
            }  
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
            return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
 

}