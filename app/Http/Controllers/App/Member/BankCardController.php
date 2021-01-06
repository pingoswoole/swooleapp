<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\App\AppController;
use App\Service\App\BankCardService;
use App\Utility\Status;
use Pingo\Validate\Validate;

class BankCardController extends AppController
{
    
    public function getList()
    {
        $service_rs = (new BankCardService)->getList($this->auth_user_data['id']);
        $this->__service($service_rs);
    }

    public function getItem()
    {
        $id = $this->request()->get("id", 0); 
        $service_rs = (new BankCardService)->getItem($this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

    public function addItem()
    {
        $data = [
            'bank_type' => $this->_post('bank_type'),
            'bank_name' => $this->_post('bank_name'),
            'bank_username' => $this->_post('bank_username'),
            'bank_no' => $this->_post('bank_no'),
        ];
        $rule = [
            'bank_type'   => 'require|max:15|min:2',
            'bank_name'   => 'require|max:50|min:3',
            'bank_username'   => 'require|max:30|min:2',
            'bank_no'   => 'require|min:10'
        ];
        $msg = [
            'bank_type'        => '银行类型错误',
            'bank_name'        => '开户行不符合',
            'bank_username'        => '姓名不符合',
            'bank_no'        => '卡号不符合',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_rs = (new BankCardService)->addItem($this->auth_user_data['id'], $data);
        $this->__service($service_rs);
    }

    public function editItem()
    {
        $data = [
            'bank_type' => $this->_post('bank_type'),
            'bank_name' => $this->_post('bank_name'),
            'bank_username' => $this->_post('bank_username'),
            'bank_no' => $this->_post('bank_no'),
        ];
        $rule = [
            'bank_type'   => 'require|max:15|min:2',
            'bank_name'   => 'require|max:50|min:3',
            'bank_username'   => 'require|max:30|min:2',
            'bank_no'   => 'require|min:10'
        ];
        $msg = [
            'bank_type'        => '银行类型错误',
            'bank_name'        => '开户行不符合',
            'bank_username'        => '姓名不符合',
            'bank_no'        => '卡号不符合',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        $id = $this->request()->get("id", 0);

        $service_rs = (new BankCardService)->editItem($data, $this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

    public function delItem()
    {
        $id = $this->request()->get("id", 0); 
        $service_rs = (new BankCardService)->delItem($this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

}