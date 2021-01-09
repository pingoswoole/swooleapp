<?php
namespace App\Http\Controllers\App\Common;

use App\Http\Controllers\App\AppController;
use App\Model\Member\User;
use App\Service\App\PlatformService;
use App\Service\Common\SettingService;
use App\Utility\Status;
use Pingo\Database\DB;
use Pingo\Pool\PoolManager;
use Pingo\Validate\Validate;

use function GuzzleHttp\Promise\settle;

/**
 * 平台相关内容
 *
 *  隐私政策、服务协议、关于我们、联系方式
 * @author pingo
 * @created_at 00-00-00
 */
class PlatformController extends AppController
{
    protected $login_check = false;

    /**
     * 平台隐私
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getPrivacy()
    {
        /* $pools = PoolManager::getInstance();
        $pools1 = $pools->getConnectionPool("mysql");
        $mysql = $pools1->borrow();
        $title = time();
        $status = $mysql->exec("insert into goods(`title`) values ('{$title}')");
        var_dump($status);
        $mysql->return($mysql); */
        
        //model()->insert('goods', ['title' => time()]);

        //$res = DB::table('user')->insert(['user' => random_str(8), 'pwd' => time()]);
        //$res = DB::table('user')->insert(['user' => random_str(8), 'pwd' => time()]);
        try {
            //code...
            //$res = db()->table('user')->insert([['user' => random_str(8), 'pwd' => time()],['user' => random_str(8), 'pwd' => time()]]);
            //$res1 = db()->table('user')->where('pwd', 11)->decrement(['money' => 1, 'score'=> 2]);
            //$res = db()->query('select * from user where id=:id', ['id' => 1]);
           /*  $User = new User();
            $res = $User->where('id', 'in', [11, 22])->with(['goods' => function($Query){
                $Query->select("id", 'uid');
            },'role'])->first();
            var_dump($res); */
            $User = new User();
            //$res = $User->insert(['user' => random_str(6), 'pwd' => random_str(5)]);
            $res = $User->where('id', '>', 100)->sum('id');
            $res1 = $User->where('id', '>', 100)->avg('id');
            $res2 = $User->where('id', '>', 100)->max('id');
            $res2 = $User->where('id', '=', 22)->update(['pwd' => 'bbbbbbbbb']);
            var_dump($res, $res1, $res2, $User->_sql()); 
            //$data = (new SettingService)->get("web.privacy");
            //$this->json(Status::CODE_OK, 'success', $data);
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage(), $th->getFile(), $th->getLine());
        }
    }
    /**
     * 服务协议
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getProtocol()
    {
        $data = (new SettingService)->get("web.protocol");
        $this->json(Status::CODE_OK, 'success', $data);
    }
    /**
     * 关于我们
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getAboutus()
    {
        $data = (new SettingService)->get("web.aboutus");
        $this->json(Status::CODE_OK, 'success', $data);
    }
    /**
     * 联系我们
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getContact()
    {
        $data = (new SettingService)->get("contact");
        $this->json(Status::CODE_OK, 'success', $data);
    }
    
    public function viewRule()
    {
        $type = $this->request()->route("id");
        if($type == 1){
            $content = setting("web.protocol");
            $tpl = 'common.terms';
        }else{
            $content = setting("web.privacy");
            $tpl = 'common.privacy';
        }
        $data = [
            'content' => $content
        ];
        return $this->render($tpl, $data);
    }

    /**
     * app更新
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getAppUpgrade()
    {
        //
        $terminal_type = $this->request()->get('type', '1001');
        $version = $this->request()->get('version', 1);
        $service_res = (new PlatformService)->getAppUpgrade($version);
        return $this->__service($service_res);
    }

    /**
     * 意见反馈
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function feedback()
    {
        $rule = [
            'contents'  => 'require|min:2|max:100',
            'title'  => 'require|min:2|max:50',
        ];
        $msg = [
            'contents' => '内容不符合',
            'title' => '标题不符合',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($this->post_data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }
        $service_res = (new PlatformService)->feedback($this->post_data);
        return $this->__service($service_res);

    }


    public function getProvince()
    {
        $province = config('app.province');
        return $this->json(Status::CODE_OK, 'success', $province);
    }


}