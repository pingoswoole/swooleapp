<?php
namespace App\Http\Middleware;

class Auth
{
    public static function run($handler)
    {
         
        return function ($request, $response, $vars) use ($handler) {
            // do something
             
            return $handler($request, $response, $vars);
        };
    }
}