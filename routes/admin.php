<?php
/**
 * 后端路由
 * @author pingo
 */

//路由前缀
$route['namespace'] = '/backend';

//路由明细列表
$route['list'] = [
    ['GET', '/home/index', '\Admin\Home\IndexController@index'],
    [['GET', 'POST'], '/access/login', '\Admin\Common\AccessController@login'],
    ['GET', '/access/captcha', '\Admin\Common\AccessController@captcha'],
    ['PUT', '/member/', 'Admin\MemberController@index'],
    
];


return $route;