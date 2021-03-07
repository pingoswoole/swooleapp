<?php

declare(strict_types=1);

return [
    'host'           => env_get('REDIS_HOST', 'mariadb'),
    'port'           => intval(env_get('REDIS_PORT', 6379)),
    'auth'           => env_get('REDIS_PASSWORD'),
    'db_index'       => 0,
    'time_out'       => 3,
    'pool_size'      => 10,
    ///
    'pool_name'      => 'redis',
    'pool_min'          => 5,
    'pool_max'          => 100,
];
