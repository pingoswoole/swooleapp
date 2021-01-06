<?php
namespace App\Service\App;

use App\Utility\Status;

class PlatformService extends Base 
{
    
    /**
     * 升级app获取
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $version
     * @return void
     */
    public function getAppUpgrade($version)
    {
        $curr_version = setting('app.version');
        if($curr_version > $version){
            $result = [
                'versionName'   => $curr_version,
                'local_version' => $version,
                'versionInfo'   => setting('app.content'),
                'download_url'  => setting('app.file'),
                'forceUpdate'   => false,
            ];
            return $this->_result(Status::CODE_OK, 'success', $result);
        }
        return  $this->_result(Status::CODE_ERR, 'no release version');
    }


    public function feedback(array $data)
    {
        try {
            //code...
            $fields['title'] = $data['title'];
            $fields['star'] = $data['star'] ? intval($data['star']) : 0;
            $fields['description'] = $data['contents'];
            $fields['contact'] = $data['contact'] ?? '';
            $fields['created_at'] = time();
            
            model()->insert("ue_suggest", $fields);
            return $this->_result(Status::CODE_OK, '提交成功');
        } catch (\Throwable $th) {
            //throw $th;
        }
        return  $this->_result(Status::CODE_ERR, '提交失败');
    }

}