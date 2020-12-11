<?php

namespace App\Exception;

use Pingo\Http\Request;
use Pingo\Http\Response;
use Pingo\Http\Message\Status;


class HttpException extends \Exception
{
    /**
     * @var Response
     */
    public $response = null;

    public static function handle( \Throwable $exception, Request $request, Response $response )
    {
        $debug = config('app.debug');
         
        $response->withStatus(Status::CODE_INTERNAL_SERVER_ERROR);
        if($debug){
            $response->write(nl2br($exception->getMessage()."\n".$exception->getTraceAsString()));
        }else{
            $response->write('System Error...' . $exception->getMessage());
        }

        // echo "====================================\n";
        // var_dump($exception->getTraceAsString());
    }


}