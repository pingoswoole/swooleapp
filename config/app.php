<?php

declare(strict_types=1);

// 是否启用路由
$config['with_route'] = false; //固定为false，暂时不支持路由，get请求后缀参数已？拼接，不能通过路由模式获取参数
//后端访问模块别名,固定为，修改谨慎
$config['admin_route_alias'] = 'backadmin'; //不能设置为admin，已禁用
$config['controller_namespace'] = '\App\Http\Controllers';
$config['admin_menu_rule_cache_file'] = WEB_TMP_PATH . "admin_rule_cache.json";

//$config['app_url'] = '';

 

return $config;
