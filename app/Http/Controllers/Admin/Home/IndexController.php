<?php
namespace App\Http\Controllers\Admin\Home;

use App\Http\Controllers\Admin\AdminController;

/**
 * 首页
 * 
 * @author pingo
 * @created_at 00-00-00
 */
class IndexController extends AdminController
{

    /**
     * initMenu
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function initMenu()
    {
        $result = (new \App\Service\Admin\AdminRuleService)->getMenuRules();
        $this->write($result);
    }
    
    public function clearApi()
    {
         $this->json(1);
    }
    /**
     * Undocumented function
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $vars
     * @return void
     */
    public function index($request, $response, $vars = [])
    {
       
        $this->render("home.index");
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
        // ( new \Pingo\Database\Redis)->set("goods". mt_rand(1000, 9999) . time() , time() . mt_rand(100, 999));
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
       
    }

    /**
     * 数据统计报表
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function dashboard()
    {
        $this->render("home.dashboard");
    }

} 