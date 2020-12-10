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
    [['GET', 'POST'], '/auth/get_all', '\Admin\Auth\UserController@getAll'],
    ['GET', '/auth/addget', '\Admin\Auth\UserController@add'],
    ['POST', '/auth/add', '\Admin\Auth\UserController@addData'],
    [['GET', 'POST'], '/auth/set/{id:\d+}', '\Admin\Auth\UserController@set'],
    [['GET', 'POST'], '/auth/del/{id:\d+}', '\Admin\Auth\UserController@del'],
    
    [['GET', 'POST'], '/role/', '\Admin\Auth\RoleController@index'],
    [['GET', 'POST'], '/role/get_all', '\Admin\Auth\RoleController@getAll'],
    ['GET', '/role/addget', '\Admin\Auth\RoleController@add'],
    [['GET', 'POST'], '/role/set/{id:\d+}', '\Admin\Auth\RoleController@set'],
    [['GET', 'POST'], '/role/del/{id:\d+}', '\Admin\Auth\RoleController@del'],
    

    [['GET', 'POST'], '/rule/', '\Admin\Auth\RuleController@index'],
    [['GET', 'POST'], '/rule/get_all', '\Admin\Auth\RuleController@getAll'],
    [['GET', 'POST'], '/rule/set/{id:\d+}', '\Admin\Auth\RuleController@set'],
    [['GET', 'POST'], '/rule/del/{id:\d+}', '\Admin\Auth\RuleController@del'],
    
];

 

return $route;