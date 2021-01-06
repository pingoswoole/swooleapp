<?php
namespace App\Service\App;

use App\Utility\Status;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\LabelAlignment;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Response\QrCodeResponse;

class ShareService extends Base
{
    
    public function shareCoupon(int $mid, int $coupon_id):array
    {
        
        try {
            //code...
            $qrcode_file = WEB_QRCODE_FILE_PATH . 'coupon_' . $mid . $coupon_id . ".png";
            $qrcode_url = setting('web.app_url') . str_replace(WEB_PUBLIC_PATH, '', $qrcode_file);
            $coupon_id = encrypt_code($coupon_id);
             
            $share_url = setting('web.app_url') . "/api/access/signup/shareCoupon?invite_id={$mid}&coupon_goods_id={$coupon_id}";
            $qrCode = new QrCode($share_url);
            $qrCode->setSize(300);
            $qrCode->setMargin(20);
            $qrCode->setWriterByName('png');
            $qrCode->setEncoding('UTF-8');
            $qrCode->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH());
            $qrCode->setForegroundColor(['r' => 255, 'g' => 255, 'b' => 255, 'a' => 0]);
            $qrCode->setBackgroundColor(['r' => 84, 'g' => 213, 'b' => 183, 'a' => 0]);
            $qrCode->writeFile($qrcode_file);
            
            $result = [
                'qrcode_url' => $qrcode_url,
                'share_url'  => $share_url,
                'title'      => setting('web.title'),
                'imageUrl'      => setting('web.logo'),
                'summary'      => setting('web.title') . "是一个在线电商应用平台",
            ];
           // $pdoStmt = model()->update('member', $data, ['id' => $id]);
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }
    
    public function shareApp(int $mid)
    {
        try {
            //code...
            $qrcode_file = WEB_QRCODE_FILE_PATH . 'shareapp_' . $mid . ".png";
            $qrcode_url = setting('web.app_url') . str_replace(WEB_PUBLIC_PATH, '', $qrcode_file);
             
            $share_url = setting('web.app_url') . "/api/access/signup/shareApp?invite_id={$mid}";
            $qrCode = new QrCode($share_url);
            $qrCode->setSize(300);
            $qrCode->setMargin(20);
            $qrCode->setWriterByName('png');
            $qrCode->setEncoding('UTF-8');
            $qrCode->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH());
            //$qrCode->setForegroundColor(['r' => 0, 'g' => 0, 'b' => 0, 'a' => 0]);
            //$qrCode->setBackgroundColor(['r' => 84, 'g' => 213, 'b' => 183, 'a' => 0]);
            $qrCode->writeFile($qrcode_file);
            
            $result = [
                'qrcode_url' => $qrcode_url,
                'share_url'  => $share_url,
                'title'      => setting('web.title'),
                'imageUrl'      => setting('web.logo'),
                'summary'      => setting('web.title') . "是一个在线电商应用平台",
            ];
           // $pdoStmt = model()->update('member', $data, ['id' => $id]);
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }



}