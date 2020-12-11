<?php
namespace App\Http\Middleware;

use App\Utility\Status;

class AdminAuth
{

    public static function run($handler)
    {
        return function ($request, $response, $vars) use ($handler) {
            // do something
             

            return $handler($request, $response, $vars);
        };
    }
}