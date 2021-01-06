<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\App\AppController;
use App\Service\App\WithdrawService;
use App\Utility\Status;
use Pingo\Validate\Validate;


class WithdrawController extends AppController
{
    
    public function withdraw()
    { 
        $data = [
            'money' => $this->_post('money'),
            'bankcard_id' => $this->_post('bankcard_id'),
        ];
        $rule = [
            'money'   => 'require',
            'bankcard_id'   => 'require',
        ];
        $msg = [
            'money'        => '金额必填',
            'bankcard_id'        => '银行卡必选',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        $money = floatval($data['money']);
        $bankcard_id = intval($data['bankcard_id']);
        // $data = [];
        $service_rs = (new WithdrawService)->withdraw($this->auth_user_data['id'], $money, $bankcard_id);
        $this->__service($service_rs);
    }

   

}