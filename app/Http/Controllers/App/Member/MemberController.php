<?php
namespace App\Http\Controllers\App\Member;

use App\Http\Controllers\AppController;
use App\Service\App\MemberService;

class MemberController extends AppController
{
    public function editProfile()
    {
        $data = (array) $this->_post('nickname', 'gender', 'avatar', 'sign_name', 'wechat', 'qq', 'wallpaper');
        // $data = [];
        $service_rs = (new MemberService)->editProfile($data, $this->auth_user_data['id']);
        $this->__service($service_rs);
    }

    public function changePwd()
    {
        $pwd = $this->_post('password');
        $service_rs = (new MemberService)->changePwd($this->auth_user_data['id'], $pwd);
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

    public function getFprofile()
    {
        $mid = $this->request()->get('id', 0);
        $service_rs = (new MemberService)->getFprofile($mid);
        $this->__service($service_rs);
    }

    public function getFvideo()
    {
        $mid = $this->request()->get('id', 0);
        $service_rs = (new MemberService)->getFvideo($mid);
        $this->__service($service_rs);
    }

    public function getFriendProfile()
    {
        $friends_mid = $this->request()->get('friends_mid', 0);
        $service_rs = (new MemberService)->getFriendProfile($friends_mid);
        $this->__service($service_rs);
    }

    public function realname()
    {
        $real_name = $this->_post('real_name');
        $cred_id = $this->_post('cred_id');
        $hand_img = $this->_post('hand_img');
        
        $service_rs = (new MemberService)->realname($this->auth_user_data['id'], $real_name, $cred_id, $hand_img);
        $this->__service($service_rs);
    }
    
    public function getrealname()
    {
        $service_rs = (new MemberService)->getrealname($this->auth_user_data['id']);
        $this->__service($service_rs);
    }
    
    public function checkPublish()
    {
        $service_rs = (new MemberService)->checkPublish($this->auth_user_data['id']);
        $this->__service($service_rs);
    }
}
