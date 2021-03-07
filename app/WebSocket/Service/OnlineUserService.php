<?php
namespace App\WebSocket\Service;

use Pingo\Traits\Singleton;
use Carbon\Carbon;

class OnlineUserService
{
    use Singleton;

    protected static $swoole_table = null;

    public function __construct()
    {
        self::$swoole_table = swoole_table_obj('chat_online_user');
    }
    /**
     * 添加
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $fd
     * @param [type] $mid
     * @return void
     */
    public function add($fd, $mid)
    {
        return self::$swoole_table->set(
                $fd,
                [
                    'fd' => $fd,
                    'mid' => $mid,
                    'created_at' => Carbon::now()->toString(),
                ]
            );
    }

    public function set($fd, $mid)
    {
        return self::$swoole_table->set(
            $fd,
            [
                'fd' => $fd,
                'mid' => $mid,
                'created_at' => Carbon::now()->toString(),
            ]
        );
    }

    public function get($fd, $field = null)
    {
        return self::$swoole_table->get($fd, $field);
    }

    public function exist(string $fd)
    {
        return self::$swoole_table->exist($fd);
    }

    public function del(string $fd)
    {
        return self::$swoole_table->del($fd);
    }

    public function count()
    {
        return self::$swoole_table->count();
    }


    public function getAll()
    {
        $data = [];
        foreach(self::$swoole_table as $row)
        {
            $data[] = $row;
        }
        return $data;
    }
    /**
     * 用户是否在线
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @return boolean || int $fd
     */
    public function isOnline(int $mid)
    {
        $flag = false;
        foreach(self::$swoole_table as $row)
        {
            if($row['mid'] == $mid){
                $flag = $row['fd'];
                break;
            }
        }
        return $flag;
    }

    public function getUserId(int $fd)
    {
        return self::$swoole_table->get($fd, 'mid');
    }

    /**
     * 删除老旧 fd
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @return void
     */
    public function delByMid(int $mid = 0)
    {
        $fds = [];
        foreach(self::$swoole_table as $row)
        {
            if($row['mid'] == $mid){
                $fds[] = $row['fd'];
            }
        }
        if($fds){
            foreach ($fds as $key => $fd) {
                # code...
                self::$swoole_table->del($fd);
            }
        }
    }

}