<?php

declare(strict_types=1);

return [
    'host'      => 'mariadb',
    'port'      => 3306,
    'database'  => 'backend_shop1',
    'username'  => 'root',
    'password'  => 'Think1688...',
    'charset'   => 'utf8mb4',
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
    'pool_max'          => 200,
    'pool_waittime'     => 5,
    'pool_idletime'     => 30,
    'pool_checkintval'  => 20,
    
];

