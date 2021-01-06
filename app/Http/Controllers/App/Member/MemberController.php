<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\App\AppController;
use App\Service\App\MemberService;

class MemberController extends AppController
{
    
    public function editProfile()
    {
        
         $data = $this->_post('nickname', 'gender', 'avatar');
        // $data = [];
        $service_rs = (new MemberService)->editProfile($data, $this->auth_user_data['id']);
        $this->__service($service_rs);
    }

    public function getAssetStatis()
    {
        $service_rs = (new MemberService)->getAssetStatis($this->auth_user_data['id']);
        $this->__service($service_rs);
    }

    public function bindInviter()
    {
        $pmobile = $this->_post('pmobile');
        $service_rs = (new MemberService)->bindInviter($this->auth_user_data['id'], $pmobile);
        $this->__service($service_rs);
    }

    public function getProfile()
    {
        $service_rs = (new MemberService)->getProfile($this->auth_user_data['id']);
        $this->__service($service_rs);
    }

}