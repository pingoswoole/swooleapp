<?php
namespace App\Rpc;

class UdpEvent
{
    public function onPacket(\Swoole\Server $server, string $data, array $clientInfo)
    {
        try {
            echo output("onPacket: Address:{$client_info['address']} Port:{$client_info['port']} Data:{$data}");
            $serv->sendto($client_info['address'], $client_info['port'], "Server Return:".$data);
        } catch(\Exception $e) {
        }
    }
    
}