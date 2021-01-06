<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\App\AppController;
use App\Service\App\ShopAddressService;
use App\Utility\Status;
use Pingo\Validate\Validate;

class ShopAddressController extends AppController
{
    
    public function getList()
    {
        $service_rs = (new ShopAddressService)->getList($this->auth_user_data['id']);
        $this->__service($service_rs);
    }

    public function getItem()
    {
        $id = $this->request()->get("id", 0); 
        $service_rs = (new ShopAddressService)->getItem($this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

    public function addItem()
    {
        $data = [
            'contact_name' => $this->_post('contact_name'),
            'mobile' => $this->_post('mobile'),
            'address' => $this->_post('address'),
            'province' => $this->_post('province'),
            'is_default' => $this->_post('is_default'),
        ];
        $rule = [
            'mobile'  => 'require|mobile|max:11',
            'contact_name'   => 'require|max:10|min:2',
            'address'   => 'require|max:50|min:5',
            'province'   => 'require|max:30|min:2',
            'is_default'   => 'require|between:0,1'
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'mobile'        => '手机号码错误',
            'contact_name'        => '联系人不符合',
            'address'        => '地址不符合',
            'province'        => '省份不符合',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_rs = (new ShopAddressService)->addItem($this->auth_user_data['id'], $data);
        $this->__service($service_rs);
    }

    public function editItem()
    {
        $data = [
            'contact_name' => $this->_post('contact_name'),
            'mobile' => $this->_post('mobile'),
            'address' => $this->_post('address'),
            'province' => $this->_post('province'),
            'is_default' => $this->_post('is_default'),
        ];
        $rule = [
            'mobile'  => 'require|mobile|max:11',
            'contact_name'   => 'require|max:10|min:2',
            'address'   => 'require|max:50|min:5',
            'province'   => 'require|max:30|min:2',
            'is_default'   => 'require|between:0,1'
        ];
        $msg = [
            'mobile.require' => '手机必须',
            'mobile'        => '手机号码错误',
            'contact_name'        => '联系人不符合',
            'address'        => '地址不符合',
            'province'        => '省份不符合',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        $id = $this->request()->get("id", 0);

        $service_rs = (new ShopAddressService)->editItem($data, $this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

    public function delItem()
    {
        $id = $this->request()->get("id", 0); 
        $service_rs = (new ShopAddressService)->delItem($this->auth_user_data['id'], $id);
        $this->__service($service_rs);
    }

}