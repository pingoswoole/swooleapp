<?php
namespace App\Http\Controllers\App\Common;

use App\Http\Controllers\App\AppController;
use App\Model\Admin\AdminUser;
use App\Model\Member\Member;
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
            $Member = new Member();
            $res = $Member->where('id', 25)->with(['asset'])->first();
            /* $page = 1;
            $page_size = 10;
            //$res = $User->insert(['user' => random_str(6), 'pwd' => random_str(5)]);
            $where[] = ['admin_user.deleted', '!=', 1];
            $res = $User->leftJoin('admin_role', 'admin_user.role_id', '=', 'admin_role.id')
            ->where($where)
            ->select(['id', 'name'])
            ->limit(($page - 1) * $page_size . ", {$page_size}")
            ->orderBy('admin_user.id', 'DESC')
            ->selectRaw("admin_user.id, uname, display_name, admin_user.created_at, logined_at, status, admin_role.name as role_name")
            ->get(); */
            //$res =  $User->query('select * from admin_role');
            //$res = $User->where('id', 7)->value('uname');
            /* $res = $User->chunk(2, function($data){
                foreach ($data as $key => $row) {
                    # code...
                    var_dump($row);
                }
            }); */
             
            var_dump($res, $Member->_sql()); 
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