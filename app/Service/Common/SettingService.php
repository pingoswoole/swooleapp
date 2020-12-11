<?php
namespace App\Service\Common;

class SettingService
{

        public function store($key, $data)
        {
            $table = 'common_setting';
            $result = model()->get($table, ['id', 'set_key'], ['set_key' => $key]);
            $set_value = json_encode($data);
            if($result){
                //update
                model()->update($table, ['set_value' => $set_value], ['set_key' => $data]);
            }else{
                model()->insert($table, ['set_value' => $set_value, 'set_key' => $key, 'created_at' => time()]);
            }

            return true;
        }

        
        public function get($key = null)
        {   
            $data = [];
            $table = 'common_setting';
            if(is_null($key)){
                //获取所有
                $result = model()->select($table, '*', []);
                if($result){
                    foreach ($result as $key => $item) {
                        # code...
                        $data[$item['set_key']] = json_decode($item['set_value'], true);
                    }
                }
            }else{
                //
                $result = model()->get($table, '*', ['set_key' => $key]);
                $data = $result ? json_decode($result['set_value'], true) : null; 
            }

            return $data;
        }

}