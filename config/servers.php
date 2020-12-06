<?php

declare(strict_types=1);
/**
 * swoole 配置
 * @author pingo <pingstrong@163.com>
 */
if(!defined("WEB_RUNTIME_PATH")) exit("No Access");

//进程名称
$config['master_process_name']  = 'pingswoole_master';
$config['manager_process_name'] = 'pingswoole_manager';
$config['worker_process_name']  = 'pingswoole_worker';
$config['task_process_name']    = 'pingswoole_task';

//错误日志
$config['error_log_file'] = WEB_LOG_PATH . '/error.log';

//进程ID存储的文件
$config['master_pid_file']  = WEB_LOG_PATH . '/master.pid';
$config['manager_pid_file'] = WEB_LOG_PATH . '/manager.pid';
$config['worker_pid_file']  = WEB_LOG_PATH . '/worker.pid';
$config['task_pid_file']    = WEB_LOG_PATH . '/task.pid';

//Swoole - IP信息
$config['ip']   = '0.0.0.0';
$config['server_type']  = \Pingo\Swoole\Constant::SWOOLE_WEB_SOCKET_SERVER;  //
$config['setting'] = [
    'pid_file'              => WEB_LOG_PATH . '/swoole.pid',
    'log_file'              => WEB_LOG_PATH . '/swoole.log',
    'daemonize'             => false,
    'task_tmpdir'           => '/dev/shm',
    'max_request'           => 2000,
    // Normally this value should be 1~4 times larger according to your cpu cores.
    'reactor_num'           => swoole_cpu_num() * 2,
    'worker_num'            => swoole_cpu_num() * 2,
    'task_worker_num'       => swoole_cpu_num() * 2,
    'enable_static_handler' => true,
    'package_max_length'    => 20 * 1024 * 1024,
    'buffer_output_size'    => 10 * 1024 * 1024,
    'socket_buffer_size'    => 128 * 1024 * 1024,
    'reload_async'          => true,
    'max_wait_time'         => 3,
    'document_root'         => WEB_RUNTIME_PATH . '/public', // 版本小于v4.4.0时必须为绝对路径
    'enable_coroutine'      => 1,
    'task_enable_coroutine' => 1,
    // 压缩
    'http_compression'      => true,
    // $level 压缩等级，范围是 1-9，等级越高压缩后的尺寸越小，但 CPU 消耗更多。默认为 1, 最高为 9
    'http_compression_level' => 1,

];
$config['http_setting'] = $config['setting'];
$config['ws_setting']   = $config['setting'];
$config['ws_setting']['open_websocket_protocol'] = true;

//启动服务端口监听
$config['protocol'] = [
    //
    'http'     => [
        'host'      => $config['ip'], // 监听地址
        'port'      => 9501, // 监听端口
        'mode'      => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type' => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
        'setting'   => $config['http_setting'],
        //事件回调接管
        'callbacks' => [
            "open" => [\App\Events\WebSocket::class, 'onOpen'],
            "message" => [\App\Events\WebSocket::class, 'onMessage'],
            "close" => [\App\Events\WebSocket::class, 'onClose'],
        ],
    ],
    'websocket'  => [
        'enable'        => false,
        'host'          => $config['ip'],
        'port'          => 9505,
        'mode'          => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type'     => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
        'handler'       => Handler::class,
        'parser'        => Parser::class,
        'ping_interval' => 25000,
        'ping_timeout'  => 60000,
        'listen'        => [],
        'subscribe'     => [],
        'setting'       => $config['ws_setting'],
        //事件回调接管
        'callbacks' => [
            "open" => [\App\Events\WebSocket::class, 'onOpen'],
            "message" => [\App\Events\WebSocket::class, 'onMessage'],
            "close" => [\App\Events\WebSocket::class, 'onClose'],
        ],
    ],
    'tcp'   => [
        'enable'        => false,
        'host'          => $config['ip'],
        'port'          => 9502,
        'setting'       => [
            'worker_num'             => 2,
            'max_request'            => 200,
            'dispatch_mode'          => 2,
            'open_length_check'      => true,
            'package_max_length'     => 8192,
            'package_length_type'    => 'N',
            'package_length_offset'  => '0',
            'package_body_offset'    => '4',
        ],
        'callbacks' => [
            
        ],
    ],
    'udp'   => [
        'enable'    => false,
        'host'      => $config['ip'],
        'port'      => 9503,
        'setting'   => [
            'worker_num'             => 2,
            'max_request'            => 200,
            'dispatch_mode'          => 2,
        ],
        //事件回调接管
        'callbacks' => [
            "open" => [\App\Events\WebSocket::class, 'onOpen'],
            "message" => [\App\Events\WebSocket::class, 'onMessage'],
            "close" => [\App\Events\WebSocket::class, 'onClose'],
        ],
    ],
    'hot_update' => [
        'enable'  => false,
        'name'    => ['*.php'],
        'include' => [],
        'exclude' => [],
    ],
    'tables'     => [],
    //每个worker里需要预加载以共用的实例
    'concretes'  => [],
    //重置器
    'resetters'  => [],
    //每次请求前需要清空的实例
    'instances'  => [],
    //每次请求前需要重新执行的服务
    'services'   => [],
];

return $config;
