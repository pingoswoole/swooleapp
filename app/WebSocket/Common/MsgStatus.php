<?php
namespace App\WebSocket\Common;

class MsgStatus
{
    //消息状态
    const STATUS_OK = 0;

    const STATUS_FAIL = -1;

    const STATUS_SYS_ERR = -2;

    const STATUS_AUTH_ERR = -3;
    //消息内容类型
    const TYPE_TEXT = 1;

    const TYPE_IMAGE = 2;

    const TYPE_AUDIO = 3;

    const TYPE_VIDEO = 4;

    const TYPE_LOCATION = 5;
    //广播类型
     

}