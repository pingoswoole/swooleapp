<?php


/**
 * 高性能内存表配置
 * 
 *   Table::TYPE_INT  默认为 4 个字节，可以设置 1，2，4，8 一共 4 种长度 
 *  1byte(int8)	-127 ~ 127
 *  2byte(int16)	-32767 ~ 32767
 *  4byte(int32)	-2147483647 ~ 2147483647
 *  8byte(int64)	不会溢出
 * 
 *   Table::TYPE_FLOAT  会占用 8 个字节的内存
 *   Table::TYPE_STRING  设置后，设置的字符串不能超过 $size 指定的最大长度 
 */
return [
    //前缀表, Di把table对象注入容器时的前缀标识
    'prefix' => 'swoole_table_',
    /* 
    'table_name' => [
        'size' => 1024,//$size 不是为 2 的 N 次方，如 1024、8192、65536 等，底层会自动调整为接近的一个数字，如果小于 1024 则默认成 1024，即 1024 是最小值
        'field' => [
            'field_name1' => [\Swoole\Table::TYPE_STRING, 10],
            'field_name1' => [\Swoole\Table::TYPE_INT, 8],
            'field_name1' => [\Swoole\Table::TYPE_FLOAT, 4],
            'field_name1' => [\Swoole\Table::TYPE_STRING, 64],
        ],
    ] 
    */
    //数据表列
    'table' => [
        //在线用户
        'chat_online_user' => [
            'size' => 8192,
            'field' => [
                'fd' => [\Swoole\Table::TYPE_INT, 4],
                'mid' => [\Swoole\Table::TYPE_INT, 4],
                //'data' => [\Swoole\Table::TYPE_STRING, 100],
                'created_at' => [\Swoole\Table::TYPE_FLOAT, 4],
            ],
        ],
         
        //
    ]

];