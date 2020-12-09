<?php
namespace App;

/**
 * 应用时间接管初始化
 *
 * @author pingo
 * @created_at 00-00-00
 */
use Pingo\Config\Config;
class SwooleEvent
{
    /**
     * 应用初始化
     *  多语言、时区、系统自定义配置等
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public static function initialize()
    {
        
    }
    /**
     * 注入全局运行服务
     * 常量、定时器、进程、回调函数自定义
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $swoole_server
     * @return void
     */
    public static function globalService(\Swoole\Server $swoole_server)
    {
        //初始化Redis、mysql进程池
       // $db_setting = Config::getInstance()->get("database");
       // \Pingo\Database\BaseModel::getInstance($db_setting);
        //$data = new \Pingo\Database\BaseModel($db_setting);
         
    }

    
}