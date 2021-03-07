<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\ChatFriendService;
use App\Service\App\ChatService;

class ChatController extends AppController
{
    public function checkContent()
    {
        $content =  $this->_post('content');
        $service_res = (new ChatService)->checkContent($this->auth_user_data['id'], $content);
        return $this->__service($service_res);
    }

    public function checkView()
    {
        $service_res = (new ChatService)->checkView($this->auth_user_data['id']);
        return $this->__service($service_res);
    }

    public function checkSendLimit()
    {
        $service_res = (new ChatService)->checkSendLimit($this->auth_user_data['id']);
        return $this->__service($service_res);
    }
}
