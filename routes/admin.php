<?php
/**
 * 后端路由
 * @author pingo
 */

//路由前缀
$route['namespace'] = '/backend';

//路由明细列表
$route['list'] = [
    ['GET', '/member/', 'Admin\MemberController@index'],
    ['POST', '/member/', 'Admin\MemberController@index'],
    ['DELETE', '/member/', 'Admin\MemberController@index'],
    ['PUT', '/member/', 'Admin\MemberController@index'],
    
];


return $route;