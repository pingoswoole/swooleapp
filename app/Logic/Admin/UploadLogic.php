<?php
namespace App\Logic\Admin;

use App\Model\Common\CommonUploadfile;
use Carbon\Carbon;

/**
 * 上传文件逻辑
 *
 * @author pingo
 * @created_at 00-00-00
 */
class UploadLogic 
{
       const IMAGE_EXT = ['png', 'jpg', 'jpeg', 'gif'];
       const FILE_EXT = ['zip', 'wgt', 'docx', 'xls', 'doc', 'xlsx'];
       const VIDEO_EXT = ['mp4', '3gp', 'flv', 'avi', 'rmvb'];

       /**
        * storage
        *
        * @author pingo
        * @created_at 00-00-00
        * @param [type] $tmpFile
        * @param [type] $fileName
        * @param [type] $size
        * @param [type] $ext
        * @return void
        */
        public function  storage($tmpFile, $fileName, $size, $ext)
        {
            try {
                //code...
                $save_file_name = WEB_STORAGE_FILE_PATH . md5(uniqid(true) . $fileName) . "." . $ext;
                if(false === move_uploaded_file($tmpFile, $save_file_name)){
                   return false;
                }
                if(in_array($ext, self::IMAGE_EXT)){
                    $types = 'image';
                }elseif (in_array($ext, self::VIDEO_EXT)) {
                    # code...
                    $types = 'video';
                }else{
                    $types = 'file';
                }
                $path = str_replace(WEB_PUBLIC_PATH, '', $save_file_name);
                $field['storage'] = 'local';
                $field['title'] = $fileName;
                $field['size'] = $size;
                $field['types'] = $types;
                $field['path'] = $path;
                $CommonUploadfile = new CommonUploadfile;
                $insertId = $CommonUploadfile->insert($field);
                return ['id' => $insertId, 'url' => setting("web.app_url") . $path];
            } catch (\Throwable $th) {
                //throw $th;
            }

            return false;
        }
}