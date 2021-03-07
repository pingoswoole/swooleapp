<?php
namespace App\Logic\Admin;

use App\Model\Common\CommonUploadfile;
use Carbon\Carbon;
use  OSS\OssClient;
use OSS\Core\OssException;

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
    const VIDEO_EXT = ['mp4', '3gp', 'flv', 'avi', 'rmvb', 'wmv'];
        
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
    public function storage($tmpFile, $fileName, $size, $ext)
    {
        try {
            //code...
            $file_name = md5(uniqid(true) . $fileName . mt_rand(100, 999)) . "." . $ext;
            $snap_thumb = false;
            if (\in_array($ext, self::VIDEO_EXT)) {
                //视频需要截取封面
                $snap_thumb = WEB_STORAGE_FILE_PATH . md5($file_name) . ".jpg";
                $output = shell_exec("ffmpeg -i {$tmpFile} -y -f image2 -t 0.001 -s 320x320 {$snap_thumb}");
                $thumb = env_get("APP_URL") . str_replace(WEB_PUBLIC_PATH, '', $snap_thumb);
            }
            $storage_set = setting('storage');
                
            switch ($storage_set['provider']) {
                    case 0:
                        # 本地存储
                        $save_file_name = WEB_STORAGE_FILE_PATH . $file_name;
                        if (false === move_uploaded_file($tmpFile, $save_file_name)) {
                            return false;
                        }
                         $path = str_replace(WEB_PUBLIC_PATH, '', $save_file_name);
                         $url = env_get("APP_URL") . $path;
                        
                        break;
                    case 1:
                        //七牛
                        break;
                    case 2:
                        //阿里云
                        $accessKeyId = $storage_set['aliyun_access_key'];
                        $accessKeySecret = $storage_set['aliyun_access_key_secret'];
                        $endpoint = $storage_set['aliyun_endpoint'];
                        $bucket = $storage_set['aliyun_bucket'];
                        $aliyun_base_uri = $storage_set['aliyun_base_uri'];
                         // 设置文件名称。
                        $object = "common/". $file_name;
                        $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
                        $ossClient->putObject($bucket, $object, file_get_contents($tmpFile));
                        //$exist = $ossClient->doesObjectExist($bucket, 'common/87826f35be9f172353683683f918d621.jpg');
                        $path = '/' . $object;
                        $url = $aliyun_base_uri . $path;
                        if (false !== $snap_thumb) {
                            $object = "common/". \md5($file_name) . ".jpg";
                            $ossClient->putObject($bucket, $object, file_get_contents($snap_thumb));
                            $thumb = $aliyun_base_uri . '/' . $object;
                        }
                        //$ossClient->deleteObject($bucket, 'common/29136b08cd4dd67287f9d6e69036c550.jpg');
                        break;
                    default:
                        # code...
                        break;
                }


                
            if (in_array($ext, self::IMAGE_EXT)) {
                $types = 'image';
            } elseif (in_array($ext, self::VIDEO_EXT)) {
                # code...
                $types = 'video';
            } else {
                $types = 'file';
            }

            $field['storage']   = CommonUploadfile::STORAGE[$storage_set['provider']];
            $field['title']     = $fileName;
            $field['size']      = $size;
            $field['types']     = $types;
            $field['path']      = $path;
            $field['url']       = $url;

            $CommonUploadfile = new CommonUploadfile;
            $insertId = $CommonUploadfile->insert($field);
            return ['id' => $insertId, 'url' => $url, 'thumb' => $snap_thumb? $thumb : null];
        } catch (\Throwable $th) {
            //throw $th;
        }

        return false;
    }
}
