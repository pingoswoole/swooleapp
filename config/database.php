<?php

declare(strict_types=1);

return [
    'host'      => env_get('DB_HOST', 'mariadb'),
    'port'      => intval(env_get('DB_PORT', 3306)),
    'database'  => env_get('DB_DATABASE', 'spring'),
    'username'  => env_get('DB_USERNAME', 'root'),
    'password'  => env_get('DB_PASSWORD', 'root'),
    'charset'   => env_get('DB_CHARSET', 'utf8mb4'),
    'options'   => [
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        \PDO::MYSQL_ATTR_INIT_COMMAND => "set names utf8mb4",
        \PDO::ATTR_PERSISTENT => false,
        \PDO::ATTR_TIMEOUT => 3,
        //关闭string转换
        \PDO::ATTR_STRINGIFY_FETCHES => false,
        //关闭模拟prepare
        \PDO::ATTR_EMULATE_PREPARES => false,
    ],
    'pool_size'     => 100,

    //
    'pool_name'         => 'mysql',
    'pool_min'          => 10,
    'pool_max'          => 20,
    'pool_waittime'     => 5,
    'pool_idletime'     => 30,
    'pool_checkintval'  => 20,

    //生产数据表，清楚数据使用
    'clear_table'   => [
        'member',
        'member_asset',
    ],

];

