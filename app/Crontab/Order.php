<?php
namespace App\Crontab;

use App\Model\Admin\AdminUser;
use Pingo\Crontab\CrontabInterface;

class Order implements CrontabInterface
{

    public  function getMin():string
    {
        return '*';
    }

    public  function getHour():string
    {
        return '*';
    }

    public  function getDay():string
    {
        return '*';
    }

    public  function getMonth():string
    {
        return '*';
    }

    public  function getWeek():string
    {
        return '*';
    }
    /**
     * 执行入口
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public   function run()
    {
       $res = (new AdminUser())->first();
        var_dump($res, __METHOD__, date("Y-m-d H:i:s"));
         
    }

}