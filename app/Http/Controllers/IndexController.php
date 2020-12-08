<?php

declare(strict_types=1);
 
namespace App\Http\Controllers;

class IndexController
{
    public $middleware = ['__construct' => 
    [
        \App\Middleware\Test::class . '::run',
        \App\Middleware\Auth::class . "::run",
        ]
    ];

    public function index($request, $response, $vars = [])
    {
        $response->write(
            json_encode(
                [
                    'method' => 'request_method',
                    'message' => 'Hello Simps.',
                    'vars' => $vars
                ]
            )
        );
    }

    public function hello($request, $response, $data)
    {
        $name = $data['name'] ?? 'sss';

        $response->write(
            json_encode(
                [
                    'method' => 'request_method',
                    'message' => "Hello {$name}.",
                    'vars' => $data
                ]
            )
        );
    }
}
