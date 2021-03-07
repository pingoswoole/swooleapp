<?php
namespace App;

/**
 * 应用时间接管初始化
 *
 * @author pingo
 * @created_at 00-00-00
 */

use App\Model\Member\Member;
use App\WebSocket\Dispatch;
use Pingo\Component\Di;
use Pingo\Config\Config;
use Pingo\Swoole\Constant;
use Pingo\Swoole\Manager;
use Pingo\Swoole\SwooleTable;

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
        Di::getInstance()->set(Constant::HTTP_EXCEPTION_HANDLER, [\App\Exception\HttpException::class, 'handle']);
        
        //添加定时器
        $cront_list = [
            //new \App\Crontab\Message,
            //new \App\Crontab\Order,
        ];
        $cron = new \Pingo\Crontab\Cron($cront_list);
        $cron->start();
       
        //添加进程消费队列
        //$swoole_server->addProcess(new \App\Proccess\ss);
        //创建内存表swoole_table
    }

    public static function onTask(\Swoole\Server $server, \Swoole\Server\Task $Task)
    {
        $worker_id = $Task->worker_id;
        $task_id = $Task->id;
        $data = $Task->data;
        //data = ['type' => 'crontab', 'data' => []]
        //type：crontab 定时器，wechat：聊天，
        switch ($data['type']) {
            case 'crontab':
                # code...
                (new $data['data']['class'])->run();
                break;
            case 'wechat':
                break;
            default:
                # code...
                break;
        }
        //var_dump($data);

        //$Task->finish('6666');
    }
    
     

    public static function onFinish(\Swoole\Server $server, int $task_id, $data)
    {
        //var_dump($task_id, $data);
    }
    /**
     * 监听WebSocket消息事件
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\WebSocket\Server $server
     * @param \Swoole\WebSocket\Frame $frame
     * @return void
     */
    public static function onMessage(\Swoole\WebSocket\Server $server, \Swoole\WebSocket\Frame $frame)
    {
        Dispatch::getInstance()->message($server, $frame);
    }
    /**
     *  监听webSocket连接事件
     *  前提要执行onConnect
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\WebSocket\Server $server
     * @param \Swoole\Http\Request $request
     * @return void
     */
    public static function onOpen(\Swoole\WebSocket\Server $server, \Swoole\Http\Request $request)
    {
        Dispatch::getInstance()->open($server, $request);
    }


    public static function onConnect(\Swoole\Server $server, int $fd, int $reactorId)
    {
        Dispatch::getInstance()->connect($server, $fd, $reactorId);
    }

    /**
     * 连接关闭（http、websocket、tcp）
     *
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\Server $server
     * @param integer $fd
     * @param integer $reactorId
     * @return void
     */
    public static function onClose(\Swoole\Server $server, int $fd, int $reactorId)
    {
        Dispatch::getInstance()->close($server, $fd, $reactorId);
    }
    /**
     * 自定义握手
     * 设置 onHandShake 回调函数后不会再触发 onOpen 事件，需要应用代码自行处理，可以使用 $server->defer 调用 onOpen 逻辑
     * @author pingo
     * @created_at 00-00-00
     * @param \Swoole\Http\Request $request
     * @param \Swoole\Http\Response $response
     * @return void
     */
    public function onHandShake(\Swoole\Http\Request $request, \Swoole\Http\Response $response)
    {
        // print_r( $request->header );
        // if (如果不满足我某些自定义的需求条件，那么返回end输出，返回false，握手失败) {
        //    $response->end();
        //     return false;
        // }

        // websocket握手连接算法验证
        $secWebSocketKey = $request->header['sec-websocket-key'];
        $patten = '#^[+/0-9A-Za-z]{21}[AQgw]==$#';
        if (0 === preg_match($patten, $secWebSocketKey) || 16 !== strlen(base64_decode($secWebSocketKey))) {
            $response->end();
            return false;
        }
        echo $request->header['sec-websocket-key'];
        $key = base64_encode(
            sha1(
                    $request->header['sec-websocket-key'] . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11',
                    true
                )
        );

        $headers = [
                'Upgrade' => 'websocket',
                'Connection' => 'Upgrade',
                'Sec-WebSocket-Accept' => $key,
                'Sec-WebSocket-Version' => '13',
            ];

        // WebSocket connection to 'ws://127.0.0.1:9502/'
        // failed: Error during WebSocket handshake:
        // Response must not include 'Sec-WebSocket-Protocol' header if not present in request: websocket
        if (isset($request->header['sec-websocket-protocol'])) {
            $headers['Sec-WebSocket-Protocol'] = $request->header['sec-websocket-protocol'];
        }

        foreach ($headers as $key => $val) {
            $response->header($key, $val);
        }

        $response->status(101);
        $response->end();
    }
}
