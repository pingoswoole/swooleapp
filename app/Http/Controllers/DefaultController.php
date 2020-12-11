<?php

declare(strict_types=1);
 
namespace App\Http\Controllers;
 
/**
 * 默认控制器
 * 
 * 路由不存在、控制不存在
 *
 * @author pingo
 * @created_at 00-00-00
 */
class DefaultController
{
    
    /**
     * 控制器不匹配
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $uri
     * @return void
     */
    public function controllerNotFound($request, $response, $uri = [])
    {
        
        $response->end(json_encode([
            $uri,
            "controllerNotFound"
        ]));
    }
    /**
     * 请求方法禁止(GET|POST|PUT|DELETE|HEAD)
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $uri
     * @return void
     */
    public function requestMethodForbid($request, $response, $uri = [])
    {
        //$response->status(405);
        $response->write("requestMethodForbid");
    }  
    /**
     * 方法不存在
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $uri
     * @return void
     */
    public function methodNotFound($request, $response, $uri = [])
    {
        $response->write("methodNotFound");
    }
    /**
     * 其他路由
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $uri
     * @return void
     */
    public function unedfined($request, $response, $uri = [])
    {
        //$response->status(400);
        $response->write("unedfined");
    }
   
}
