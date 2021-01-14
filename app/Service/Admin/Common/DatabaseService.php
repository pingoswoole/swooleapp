<?php
namespace App\Service\Admin\Common;

use Carbon\Carbon;
use App\Service\Admin\Base;

class DatabaseService extends Base
{
    
     
    /**
     * 获取数据表
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
        public function getTables()
        {
            $data = ['count' => 0, 'list' => []];
            try {
                //code...
                $pdoStmt = db()->query("SHOW TABLE STATUS");
                $list = $pdoStmt->fetchAll();
                 
                if($list){
                    foreach ($list as $key => $row) {
                        # code...
                        $data['list'][] = [
                            'name' => $row['Name'],
                            'engine' => $row['Engine'],
                            'row' => $row['Rows'],
                            'data_len' => $row['Data_length'],
                            'create_time' => $row['Create_time'],
                            'update_time' => $row['Update_time'],
                            'comment' => $row['Comment'],
                        ]; 
                    }
                }

            } catch (\Throwable $th) {
                //throw $th;
                
            }
            return $data;

        }

        /**
         * 清理生产数据
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function clearData()
        {
            try {
                $tables = config('database.clear_table');
                //备份数据
                if($tables){
                    $db = db();
                    foreach ($tables as $key => $table_name) {
                        # 备份表数据： create table tmp_article_info  select * from article_info
                        $tmp_table = "{$table_name}_backup_" . date("Y_m_d_His");
                        $sql = "CREATE table `{$tmp_table}`  SELECT * FROM `{$table_name}`";
                        $pdoStm = $db->query($sql);
                        if($pdoStm->rowCount() > 0){
                            $sql = "TRUNCATE  TABLE `{$table_name}`";
                            $pdoStm = $db->query($sql);
                        }
                    }
                     
                }

                return $this->_return(true, '成功清理，备份成功');
                
            } catch (\Throwable $th) {
                //throw $th;
                return $this->_return(false, $th->getMessage());
            }
            return $this->_return(false, 'error');
             
        }



}