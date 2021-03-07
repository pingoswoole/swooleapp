<?php
namespace App\WebSocket\Service;

use App\Model\Member\Member;
use App\Model\Product\ChatMessage;

class ChattingService
{

    public function addLog(array $data)
    {
        try {
            //code...
            $field['from_mid'] = $data['from_mid'];
            $field['to_mid'] = $data['to_mid'];
            $field['msg_type'] = $data['msg_type'];
            $field['content'] = $data['content']??'';
            $field['url'] = $data['url']??'';
            $field['gps_data'] = $data['gps_data']??'';
            $field['is_broadcast'] = $data['is_broadcast'];
            
            return (new ChatMessage())->insert($field);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return 0;
    }

    
    public function getUnreadMessage(int $mid)
    {
       
        try {
            //code...
            $ChatMessage = new ChatMessage();
            $message_list = $ChatMessage->whereIn('to_mid', [$mid])
                    ->where('is_broadcast', 0)
                    ->orderBy('id', 'DESC')
                    ->with(['sendUser' => function($Query){
                        $Query->select('id', 'nickname', 'avatar', 'grade', 'wechat', 'qq');
                    }])
                    ->get();
            if($message_list){
                $result = [];
                $ids = [];
                foreach ($message_list as $key => $message) {
                    # code...
                    $ids[] = $message['id'];
                    $content_list_tmp = [
                        'id'        => $message['id'],
                        'who_send'  => 0, //0，朋友发送，1：自己发送
                        'msg_type'  => $message['msg_type'],
                        'content'   => $message['content'],
                        'url'       => $message['url'],
                        'gps_data'  => $message['gps_data'],
                        'created_at'=> $message['created_at'],
                    ];
                    if(isset($result[$message['from_mid']])){
                        $result[$message['from_mid']]['content_list'][] = $content_list_tmp;
                    }else{
                        $result[$message['from_mid']] = [
                            'friend_id' => $message['from_mid'],
                            'nickname' => $message['sendUser']['nickname']?? '无昵称',
                            'wechat' => $message['sendUser']['wechat']?? '',
                            'qq' => $message['sendUser']['qq']?? '',
                            'avatar' => $message['sendUser']['avatar']?? '',
                            'content_list' => [$content_list_tmp]
                        ];
                    }
                }
                //更新
                $ChatMessage->whereIn('id', $ids)->update(['is_broadcast' => 1]);
                return $result;
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return [];

    }


    public function getUserByFd(int $fd)
    {
        try {
            //code...
            $mid = OnlineUserService::getInstance()->getUserId($fd);
            if($mid){
                return (new Member())->where('id', $mid)->first();
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return [];
    }

}