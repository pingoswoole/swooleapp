<?php
namespace App\Http\Controllers\Admin\Common;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
 
use  OSS\OssClient;
use OSS\Core\OssException;
/**
 * 文件上传
 *
 * @author pingo
 * @created_at 00-00-00
 */
class UploadController extends  AdminController
{
       private static $allow_ext = [
           'jpg', 'jpeg', 'gif', 'png', 'webmg', 'wgt', 'mpg', 'mp4', 'avi', 'flv', 'rmvb'
       ];
       private static $allow_type = [

       ];


        public function handle()
        {
            $files = $this->request()->getUploadedFiles();//获取一个上传文件,返回的是一个\EasySwoole\Http\Message\UploadFile的对象
            $msg = '上传失败';
            $code = Status::CODE_OK;
            $data = [];

            if($files){

                $UploadLogic = new \App\Logic\Admin\UploadLogic;
                foreach ($files as $key => $file) {
                    # code...
                   
                    $ext = substr($file->getClientFilename(), strrpos($file->getClientFilename(), '.') + 1);
                    $ext = strtolower($ext);
                    if(!in_array($ext, self::$allow_ext)){
                        $msg = '文件不允许';
                        $code = Status::CODE_VERIFY_ERR;
                        break;  
                    }
                    $upload_res = $UploadLogic->storage($file->getTempName(), $file->getClientFilename(), $file->getSize(), $ext);
                    if(false === $upload_res){
                        $msg = '上传错误';
                        $code = Status::CODE_ERR;
                        break;
                    }
                    $data[] = $upload_res;
                    $msg = '上传成功';
                }
            }
            $this->json($code, $msg, $data);
        }

        private function __checkExt($ext)
        {
            
        }



}