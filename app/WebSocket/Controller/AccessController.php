<?php
namespace App\WebSocket\Controller;

use App\Model\Member\Member;
use App\Service\Common\JwtService;
use App\WebSocket\Common\MsgStatus;
use App\WebSocket\Service\ChattingService;
use App\WebSocket\Service\OnlineUserService;

class AccessController extends BaseController
{
     protected $check_auth = false;
     /**
      * 登录
      *
      * @author pingo
      * @created_at 00-00-00
      * @param [type] $server
      * @param [type] $fd
      * @param [type] $data
      * @return void
      */
     public function login($server, $fd, $data)
     {
           
          $token = $data['token']?? '';
          $user_data = (new JwtService)->decode('app', $token);
          if(false === $user_data){
               $this->send('登录失败，暂无法通讯！', -1);
               return false;
          }
          //删除老旧fd
          OnlineUserService::getInstance()->delByMid($user_data['id']);
          OnlineUserService::getInstance()->set($fd, $user_data['id']);
          //发送未读消息
          $unread_list = (new  ChattingService)->getUnreadMessage($user_data['id']);
          
          if($unread_list){
              return $this->send('您有未读消息', 0, 3, ['unread' => 1, 'list' => $unread_list]);
          }

          $this->send("登录成功", MsgStatus::STATUS_OK, 1);

     }

     public function connect()
     {

     }

     /**
      * 关闭close
      *
      * @author pingo
      * @created_at 00-00-00
      * @return void
      */
     public function logout()
     {
          OnlineUserService::getInstance()->del($this->fd);
          
     }
     /**
      * 心跳包回复
      *
      * @author pingo
      * @created_at 00-00-00
      * @return void
      */
     public function ping()
     {
          $this->send('连接可用:ping');
     }

}