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
$config['error_log_file'] = WEB_LOG_PATH . 'error.log';

//进程ID存储的文件
$config['master_pid_file']  = WEB_LOG_PATH . 'master.pid';
$config['manager_pid_file'] = WEB_LOG_PATH . 'manager.pid';
$config['worker_pid_file']  = WEB_LOG_PATH . 'worker.pid';
$config['task_pid_file']    = WEB_LOG_PATH . 'task.pid';

//Swoole - IP信息
$config['ip']   = '0.0.0.0';
$config['server_type']  = \Pingo\Swoole\Constant::SWOOLE_MIX_SERVER;  //
$config['setting'] = [
    'pid_file'              => WEB_LOG_PATH . 'swoole.pid',
    'log_file'              => WEB_LOG_PATH . 'swoole.log',
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
    'open_http2_protocol'    => true,
    'upload_tmp_dir'         => WEB_TMP_PATH . '/upload',

];
$config['http_setting'] = $config['setting'];
$config['ws_setting']   = $config['setting'];
$config['ws_setting']['open_websocket_protocol'] = true;

//启动服务端口监听
$config['protocol'] = [
    //
    \Pingo\Swoole\Constant::SWOOLE_HTTP_SERVER   => [
        'host'      => $config['ip'], // 监听地址
        'port'      => 9502, // 监听端口
        'mode'      => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type' => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
        'setting'   => $config['http_setting'],
         
    ],
    \Pingo\Swoole\Constant::SWOOLE_WEBSOCKET_SERVER  => [
        'enable'        => false,
        'host'          => $config['ip'],
        'port'          => 9501,
        'mode'          => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type'     => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
        'handler'       => Handler::class,
        'parser'        => Parser::class,
        'ping_interval' => 25000,
        'ping_timeout'  => 60000,
        'listen'        => [],
        'subscribe'     => [],
        'setting'       => $config['ws_setting'],
    ],
    \Pingo\Swoole\Constant::SWOOLE_TCP_SERVER   => [
        'enable'        => false,
        'host'          => $config['ip'],
        'port'          => 9503,
        'mode'          => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type'     => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
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
            'Receive' => [\App\Rpc\TcpEvent::class, "onReceive"],
        ],
    ],
    \Pingo\Swoole\Constant::SWOOLE_UDP_SERVER   => [
        'enable'    => false,
        'host'      => $config['ip'],
        'port'      => 9504,
        'mode'          => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type'     => SWOOLE_SOCK_UDP, // sock type 默认为SWOOLE_SOCK_TCP
        'setting'   => [
            'worker_num'             => 2,
            'max_request'            => 200,
            'dispatch_mode'          => 2,
        ],
        'callbacks' => [
            'Packet' => [\App\Rpc\UdpEvent::class, "onPacket"],
        ],
    ],
    \Pingo\Swoole\Constant::SWOOLE_MQTT_SERVER   => [
        'enable'    => false,
        'host'      => $config['ip'],
        'port'      => 9505,
        'mode'          => SWOOLE_PROCESS, // 运行模式 默认为SWOOLE_PROCESS
        'sock_type'     => SWOOLE_SOCK_TCP, // sock type 默认为SWOOLE_SOCK_TCP
        'setting'   => [
            'worker_num'             => 2,
            'max_request'            => 200,
            'dispatch_mode'          => 2,
        ],
        'callbacks' => [
            'Receive' => [\App\Rpc\MqttEvent::class, "onReceive"],
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
