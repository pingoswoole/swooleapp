<?php
namespace App\Http\Controllers\Admin\Common;

use App\Http\Controllers\Admin\AdminController;

/**
 * 文件上传
 *
 * @author pingo
 * @created_at 00-00-00
 */
class UploadController extends  AdminController
{
       private static $allow_ext = [
           'jpg', 'jpeg', 'gif', 'png', 'webmg'
       ];
       private static $allow_type = [

       ];


        public function handle()
        {
            $files = $this->request()->getUploadedFiles();//获取一个上传文件,返回的是一个\EasySwoole\Http\Message\UploadFile的对象
            $msg = '上传失败';
            $data = [];

            if($files){
                foreach ($files as $key => $file) {
                    # code...
                    $ext = substr($file->getClientFilename(), strrpos($file->getClientFilename(), '.') + 1);
                    if(!in_array($ext, self::$allow_ext)){
                        $msg = '文件不允许';
                        break;  
                    }
                    $save_file_name = WEB_STORAGE_FILE_PATH . md5(uniqid(true) . $file->getClientFilename()) . "." . $ext;
                    if(false === move_uploaded_file($file->getTempName(), $save_file_name)){
                        $msg = '上传错误';
                        break;
                    }
                    $data[] = config("app.app_url") . str_replace(WEB_PUBLIC_PATH, '', $save_file_name);
                    $msg = '上传成功';
                }
            }
            $this->json(0, $msg, $data);
        }

        private function __checkExt($ext)
        {
            
        }



}