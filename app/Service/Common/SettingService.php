<?php
namespace App\Service\Common;

use App\Model\Common\CommonSetting;

class SettingService
{
        
        public function store($key, $data)
        {
            $CommonSetting = new CommonSetting;
            $result = $CommonSetting->where(['set_key' => $key])->select(['id', 'set_key'])->first();
            $set_value = json_encode($data);
            if($result){
                //update
                $CommonSetting->where(['set_key' => $key])->update(['set_value' => $set_value]);
            }else{
                $CommonSetting->insert(['set_value' => $set_value, 'set_key' => $key]);
            }

            return true;
        }

        
        public function get($key = null, $default = null)
        {   
            $data = [];
            $CommonSetting = new CommonSetting;
            if(is_null($key)){
                //获取所有
                $result = $CommonSetting->get();
                if($result){
                    foreach ($result as $key => $item) {
                        # code...
                        $data[$item['set_key']] = json_decode($item['set_value'], true);
                    }
                }
            }else{
                //
                $keys = explode(".", $key);
                $result = $CommonSetting->where(['set_key' => array_shift($keys)])->first();
                if(isset($result['set_value'])){
                    $data = json_decode($result['set_value'], true);
                    while($keys){
                        $key = array_shift($keys);
                        if(!isset($data[$key])){
                            $data = $default;
                            break;
                        }
                        $data = $data[$key];
                    }
                }

            }

            return $data;
        }

}