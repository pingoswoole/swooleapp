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
    ['GET', '/home/dashboard', '\Admin\Home\IndexController@dashboard'],
    ['GET', '/home/initMenu', '\Admin\Home\IndexController@initMenu'],
    //
    [['GET', 'POST'], '/auth/', '\Admin\Auth\UserController@index'],
    [['GET', 'POST'], '/role/', '\Admin\Auth\RoleController@index'],
    [['GET', 'POST'], '/rule/', '\Admin\Auth\RuleController@index'],
   
    
];

 

return $route;