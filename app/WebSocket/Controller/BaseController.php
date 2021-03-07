<?php
namespace App\WebSocket\Controller;

use App\Service\Common\JwtService;
use App\WebSocket\Common\MsgStatus;
use App\WebSocket\Service\ChattingService;
use App\WebSocket\Service\OnlineUserService;

class BaseController
{
    protected $server;
    
    protected $fd;
    
    protected $data;
    //是否需要登录
    protected $check_auth = true;
    //用户数据
    protected $user_data = [];

    public function __construct($server, $fd = null, $data = null)
    {
        $this->server = $server;
        $this->fd = $fd;
        $this->data = $data;
        
        $this->initialize();
    }

    public function initialize()
    {

    }
    
    protected function onRequest($action = '')
    {
         
        if($this->check_auth){
           //在线用户列表是否存在
           if( !OnlineUserService::getInstance()->exist($this->fd)){
               $this->send('您未登录，登录后重试' . $action, -1);
               return false;
           }
           //获取当前用户信息
           $this->user_data = (new ChattingService)->getUserByFd($this->fd);
        }
        
        return true;
    }
    
    /**
     * 发送消息
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $msg
     * @param integer $code
     * @param integer $type 消息类型 1：通知，2：聊天，3:聊天未读记录，4：消息是否发送成功
     * @param array $data
     * @return void
     */
    public function send(string $msg = 'success', int $code = 0, int $type = 1, array $data = [])
    {
        $data = [
            'code' => $code,
            'msg'  => $msg,
            'type' => $type,
            'data' => $data
        ];
        $result = json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
        $this->server->push($this->fd, $result);
    }

    /**
     * 发送对方消息
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $fds
     * @param integer $code
     * @param string $msg
     * @param array $data
     * @return void
     */
    public function sendTo(array $fds = [], int $code = 0, string $msg = 'ok', array $data = [])
    {  
        $data = [
            'code' => $code,
            'msg'  => $msg,
            'type' => 2,
            'data' => $data
        ];
        $result = json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
        foreach ($fds as $key => $fd) {
            # code...
            $this->server->push($fd, $result);
        }
    }

    protected function _formatMsg(int $msg_type = MsgStatus::TYPE_TEXT, string $data)
    {
        
        switch ($msg_type) {
            case MsgStatus::TYPE_TEXT:
                # code...
                
                break;
            case MsgStatus::TYPE_IMAGE:
                # code...
                break;
            case MsgStatus::TYPE_AUDIO:
                # code...
                break;
            case MsgStatus::TYPE_VIDEO:
                # code...
                break;
            case MsgStatus::TYPE_LOCATION:
                # code...
                break;
            default:
                # code...
                break;
        }
        
    }
    /**
     * 方法不存在
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function undefined()
    {
        $this->send('请求错误', -1);
    }


}