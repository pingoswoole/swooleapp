<?php
namespace App\Service\Admin;

abstract class Base
{

    /**
     * 返回消息
     *
     * @author pingo
     * @created_at 00-00-00
     * @param boolean $flag
     * @param string $msg
     * @param array $data
     * @return void
     */
    public function _return(bool $flag = true, string $msg = 'success', $data = [])
    {
        return [
            'flag' => $flag,
            'msg'  => $msg,
            'data' => $data,
        ];
    }

}