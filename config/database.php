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
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ],
    'size'      => 60,
];

