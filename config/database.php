<?php

declare(strict_types=1);

return [
    'host'      => 'mariadb',
    'port'      => 3306,
    'database'  => 'spring',
    'username'  => 'root',
    'password'  => 'Think1688...',
    'charset'   => 'utf8mb4',
    'options'   => [
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        \PDO::MYSQL_ATTR_INIT_COMMAND => "set names utf8mb4",
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

