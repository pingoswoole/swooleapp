<?php
namespace App\Http\Controllers\Admin\Home;

use App\Http\Controllers\Admin\BaseController;

class IndexController extends BaseController
{


    public function index($request, $response, $vars = [])
    {
       
        
        //var_dump(\Pingo\Component\Di::getInstance()->get("aa"));
        //var_dump( \Pingo\Swoole\Context::get('Request'));
        /*  $pool1 = \Pingo\Pool\PoolManager::getInstance()->getConnectionPool(\Pingo\Config\Config::getInstance()->get("database.pool_name"));
        $mysql = $pool1->borrow();
        //$status = $mysql->query('select * from member');
        $stm = $mysql->prepare("select * from member");
        $stm->execute();
        while($res = $stm->fetch(\PDO::FETCH_ASSOC)){
            var_dump($res);
        }
        $pool1->return($mysql);  */
         (new \Pingo\Database\Redis)->set("goods". time() , time() . mt_rand(100, 999));
        //$this->render("default.404", ['author' => time()]);
         
         /* $pdo = (new \App\Model\BaseModel)->insert("member", [
             'name' => random_str(9),
             'sex'  => mt_rand(100, 999)
         ]);
         var_dump($pdo); */
       // $pool = PoolManager::getInstance()->getConnectionPool("mysql");
        //$pdo = $pool->get();
         /*    $statement = $pdo->prepare('SELECT * from member limit 1');
            if (!$statement) {
                throw new \RuntimeException('Prepare failed');
            }
            $a = mt_rand(1, 100);
            $b = mt_rand(1, 100);
            $result = $statement->execute();
            if (!$result) {
                throw new \RuntimeException('Execute failed');
            }
            $result = $statement->fetchAll();
             var_dump($result);
            \Pingo\Database\PDOPool::getInstance()->close($pdo);
 */
        $str = random_str(9);
        
        $response->write(
            json_encode(
                [
                    'method' => 'request_method' . $str,
                    'message' => 'Hello pingosswww.' . get_rand(),
                    'vars' => $vars
                ]
            )
        );
    }

} 