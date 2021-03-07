<?php
namespace App\WebSocket;

use App\Model\Member\Member;
use App\WebSocket\Controller\AccessController;
use Pingo\Traits\Singleton;

/**
 * websocket 请求调度
 *
 * @author pingo
 * @created_at 00-00-00
 */
class Dispatch
{
    use Singleton;

    /**
     * 架构初始化
     *
     * @author pingo
     * @created_at 00-00-00
     */
    public function __construct()
    {
        
    }
    /**
     *  调用控制器
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $server
     * @param [type] $fd
     * @param [type] $data    
     * @param [type] $className
     * @param [type] $uri /控制器/方法   /access/login
     * @return void
     */
    private function __reflectMethod($server,  $fd, $data, $uri)
    {
        //反射调用控制器方法
        try {
            //code...
            $mvc = array_filter(explode('/', $uri));
            $controller = array_shift($mvc)?? 'NotFound';
            $method = array_shift($mvc)?? 'undefined';
            $method = line_tohump($method);

            $class = '\App\WebSocket\Controller\\' . ucfirst(line_tohump($controller)) . 'Controller';
            if(!class_exists($class)) $class = '\App\WebSocket\Controller\NotFoundController';
            $reflectionClass = new \ReflectionClass ( $class );
            $RefClassObj = $reflectionClass->newInstanceArgs([$server, $fd, $data]);
            //前置方法
            $befor_method = "onRequest";
            if($reflectionClass->hasMethod($befor_method)){
                $befor_method_handler = $reflectionClass->getMethod($befor_method);
                $befor_method_handler->setAccessible(true);
                $before_res = $befor_method_handler->invokeArgs($RefClassObj, [$method]);
                if(false === $before_res) return;
                //请求方法
                if(!$reflectionClass->hasMethod($method)){
                    $method = 'undefined';
                }
                $method_handler = $reflectionClass->getMethod($method);
                if($method_handler->isPublic()){
                    $method_handler->invokeArgs($RefClassObj, [$server, $fd, $data]);
                }
            }

        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    /**
     * 会话握手成功
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\WebSocket\Server $server
     * @param \Swoole\Http\Request $request
     * @return void
     */
    public function open(\Swoole\WebSocket\Server $server, \Swoole\Http\Request $request)
    {
        var_dump("打开一个socket：" . $request->fd);
        $this->__reflectMethod($server,  $request->fd, $request->get, '/access/login');
    }
    /**
     * 会话连接
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\Server $server
     * @param integer $fd
     * @param integer $reactorId
     * @return void
     */
    public function connect(\Swoole\Server $server, int $fd, int $reactorId)
    {
        $this->__reflectMethod($server,  $fd, ['reactorId' => $reactorId], '/access/connect');
    }
    /**
     * 会话消息内容
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\WebSocket\Server $server
     * @param \Swoole\WebSocket\Frame $frame
     * @return void
     */
    public function message(\Swoole\WebSocket\Server $server, \Swoole\WebSocket\Frame $frame)
    {   
        //通讯格式 ['__uri__' => '/contr/method' , 'msgtype' => '', 'to_mid' => 0, 'url' => 1, 'content' => 22]
        
        //给客户端回应，发送内容
        $data = json_decode($frame->data, true);
       
        if($frame->data === 'ping'){
            //心跳包
            $uri = '/Access/ping';
        }else{
            var_dump($frame->data, $data);
            $uri = $data['__uri__']?? '/NotFound/undefined';
        }
        
        $this->__reflectMethod($server,  $frame->fd, $data, $uri);

    }
    /**
     * 会话关闭
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\Server $server
     * @param integer $fd
     * @param integer $reactorId
     * @return void
     */
    public function close(\Swoole\Server $server, int $fd, int $reactorId)
    {
        
        var_dump("close", $fd);
        $this->__reflectMethod($server,  $fd, ['reactorId' => $reactorId], '/access/logout');
    }
    
}