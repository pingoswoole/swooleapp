<?php
namespace App\Crontab;

use Pingo\Crontab\CrontabInterface;

class Order extends CrontabInterface
{

    public  function getMin():string
    {
        return '1';
    }

    public  function getHour():string
    {
        return '2';
    }

    public  function getDay():string
    {
        return '3';
    }

    public  function getMonth():string
    {
        return '5';
    }

    public  function getWeek():string
    {
        return '6';
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
        
    }

}