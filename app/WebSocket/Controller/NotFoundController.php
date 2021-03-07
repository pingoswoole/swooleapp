<?php
namespace App\WebSocket\Controller;

class NotFoundController extends BaseController
{

    public function undefined()
    {
        $this->send('请求错误222', -1);
    }

}