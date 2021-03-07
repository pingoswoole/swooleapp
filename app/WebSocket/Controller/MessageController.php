<?php
namespace App\WebSocket\Controller;

use App\Model\Product\ChatMessage;
use App\WebSocket\Common\MsgStatus;
use App\WebSocket\Service\ChattingService;
use App\WebSocket\Service\OnlineUserService;

class MessageController extends BaseController
{

    public function initialize()
    {

    }

    /**
     * 一对一聊天
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function toOne()
    {
        
        $friend_id = $this->data['friend_id']?? 0;
        if(empty($friend_id)){
            //
            return $this->send('好友不存在！', MsgStatus::STATUS_FAIL);
        }
        if($friend_id == $this->user_data['id']){
            return $this->send('不能自言自语！', MsgStatus::STATUS_FAIL);
        }
        //消息类型检测
        if(!isset($this->data['msg_type']) || !in_array($this->data['msg_type'], ChatMessage::MSG_TYPES)){
            return  $this->send('消息类型错误', MsgStatus::STATUS_FAIL, 4);
        }

        switch ($this->data['msg_type']) {
            case 'text':
                # code...
                $log['content'] = $this->data['content']?? '';
                break;
            case 'voice':
                # code...
                $log['url'] = $this->data['content']??'';
                break;
            case 'img':
                # code...
                $log['url'] = $this->data['content']??'';
                break;
            case 'location':
                # code...
                $log['content'] = $this->data['content']??'';
                $log['gps_data'] = $this->data['gps_data']??'';
                break;
            case 'video':
                # code...
                break;
            
            default:
                # code...
                break;
        }
        $isOnlineFd = OnlineUserService::getInstance()->isOnline($friend_id);  
        $log['is_broadcast'] = 1;
        $log['from_mid'] = OnlineUserService::getInstance()->getUserId($this->fd);
        $log['to_mid'] = $friend_id;
        $log['msg_type'] = $this->data['msg_type'];
        $log['is_broadcast'] = $isOnlineFd ? 1 : 0;
        $log_id = (new ChattingService)->addLog($log);

        if($isOnlineFd){
            //在线
            $message = [
                'id'        => $log_id,
                'who_send'   => 0, //0，朋友发送，1：自己发送
                'msg_type'   => $log['msg_type'],
                'content'    => $log['content']??'',
                'url'        => $log['url']??'',
                'gps_data'   => $log['gps_data']??'',
                'created_at' => date("Y-m-d H:i:s"),
                'friend_id'  => $this->user_data['id'],
                'nickname'   => $this->user_data['nickname'],
                'wechat'     => $this->user_data['wechat'],
                'qq'         => $this->user_data['qq'],
                'avatar'     => $this->user_data['avatar'],
            ];
            $this->sendTo([$isOnlineFd], 0, 'success', $message);
        }

        $this->send('发送成功', MsgStatus::STATUS_OK, 4);

    }

    /**
     * 群聊
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function toGroup()
    {

    }
    /**
     * 获取未读消息列表
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getUnreadMsg()
    {
        $unread_list = (new  ChattingService)->getUnreadMessage($this->user_data['id']);
          
        if($unread_list){
            $this->send('您有未读消息', 0, 3, ['unread' => 1, 'list' => $unread_list]);
        }
    }

    

}