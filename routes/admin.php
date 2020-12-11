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
    [['GET', 'POST'], '/access/logout', '\Admin\Common\AccessController@logout'],
    ['GET', '/access/captcha', '\Admin\Common\AccessController@captcha'],
    ['GET', '/home/dashboard', '\Admin\Home\IndexController@dashboard'],
    ['GET', '/home/initMenu', '\Admin\Home\IndexController@initMenu'],
    ['GET', '/home/clearApi', '\Admin\Home\IndexController@clearApi'],
    
    //管理员
    [['GET', 'POST'], '/auth/', '\Admin\Auth\UserController@index'],
    [['GET', 'POST'], '/auth/get_all', '\Admin\Auth\UserController@getAll'],
    ['GET', '/auth/addget', '\Admin\Auth\UserController@add'],
    ['POST', '/auth/add', '\Admin\Auth\UserController@addData'],
    [['GET', 'POST'], '/auth/set/{id:\d+}', '\Admin\Auth\UserController@set'],
    [['GET', 'POST'], '/auth/del/{id:\d+}', '\Admin\Auth\UserController@del'],
    ['GET', '/auth/editget/{id:\d+}', '\Admin\Auth\UserController@edit'],
    ['POST', '/auth/edit/{id:\d+}', '\Admin\Auth\UserController@editData'],
    ['GET', '/auth/pwdget', '\Admin\Auth\UserController@editPwd'],
    ['POST', '/auth/pwd', '\Admin\Auth\UserController@editPwdData'],
    ['GET', '/auth/userProfile', '\Admin\Auth\UserController@userProfile'],
    
    //角色
    [['GET', 'POST'], '/role/', '\Admin\Auth\RoleController@index'],
    [['GET', 'POST'], '/role/get_all', '\Admin\Auth\RoleController@getAll'],
    ['GET', '/role/addget', '\Admin\Auth\RoleController@add'],
    ['POST', '/role/add', '\Admin\Auth\RoleController@addData'],
    [['GET', 'POST'], '/role/set/{id:\d+}', '\Admin\Auth\RoleController@set'],
    [['GET', 'POST'], '/role/del/{id:\d+}', '\Admin\Auth\RoleController@del'],
    ['GET', '/role/edit_ruleget/{id:\d+}', '\Admin\Auth\RoleController@editRule'],
    ['POST', '/role/edit_rule/{id:\d+}', '\Admin\Auth\RoleController@editRuleData'],
    ['GET', '/role/editget/{id:\d+}', '\Admin\Auth\RoleController@edit'],
    ['POST', '/role/edit/{id:\d+}', '\Admin\Auth\RoleController@editData'],

    //权限规则
    [['GET', 'POST'], '/rule/', '\Admin\Auth\RuleController@index'],
    [['GET', 'POST'], '/rule/get_all', '\Admin\Auth\RuleController@getAll'],
    [['GET', 'POST'], '/rule/set/{id:\d+}', '\Admin\Auth\RuleController@set'],
    [['GET', 'POST'], '/rule/del/{id:\d+}', '\Admin\Auth\RuleController@del'],
    ['GET', '/rule/addget', '\Admin\Auth\RuleController@add'],
    ['POST', '/rule/add', '\Admin\Auth\RuleController@addData'],
    ['GET', '/rule/editget/{id:\d+}', '\Admin\Auth\RuleController@edit'],
    ['POST', '/rule/edit/{id:\d+}', '\Admin\Auth\RuleController@editData'],

    //设置
    [['GET', 'POST'], '/setting/index', '\Admin\Setting\CommonController@index'],
    ['POST', '/upload/handle', '\Admin\Common\UploadController@handle'],


    
];

 

return $route;