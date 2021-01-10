<?php
namespace App\Service\Admin;

use Carbon\Carbon;


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
                $list = db()->query("SHOW TABLE STATUS");
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
}