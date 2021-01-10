<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Admin\AdminController;
use App\Service\Admin\Auth\AdminUserService;
use App\Service\Admin\Auth\AdminRoleService;
use App\Utility\Log\Log;
use App\Utility\Status;

class UserController extends AdminController
{
    private $rule_auth      = 'auth.auth';
    private $rule_auth_view = 'auth.auth.view';
    private $rule_auth_add  = 'auth.auth.add';
    private $rule_auth_set  = 'auth.auth.set';
    private $rule_auth_del  = 'auth.auth.del';
    public function index()
    {
        //if(!$this->hasRuleForGet($this->rule_auth_view)) return ;

        $this->render('auth.user');
    }

    public function userProfile()
    {
        $this->render('auth.userProfile');
    }
    // 获取用户数
    public function getAll()
    {
        //if(!$this->hasRuleForPost($this->rule_auth_view)) return ;
        $page_data = (new \App\Service\Admin\Auth\AdminUserService)->getPageList();
      /*   $data = $this->getPage();
        $service_result = AdminUserService::getInstance()->getPageList($data['page'], $data['limit']);
        list($list_data, $count) = $service_result['data'];
        
        $data       = ['code' => Status::CODE_OK, 'count' => $count, 'data' => $list_data];
        $this->dataJson($data);
        return; */
        $this->jsonPage(0, $page_data['count'], $page_data['list']);
    }

    private function fieldInfo()
    {
         
        $data    = $this->request()->post(['uname', 'pwd', 'status', 'display_name', 'role_id']);
        
        return $data;
    }

    public function add()
    {
        //if(!$this->hasRuleForGet($this->rule_auth_add)) return ;

        $role_data =  AdminRoleService::getInstance()->getAllList();

        $this->render('auth.userAdd', ['role_data' => $role_data]);
    }

    public function addData()
    {
        //if(!$this->hasRuleForPost($this->rule_auth_add)) return ;

        $data = $this->fieldInfo();
        if (!$data) {
            return;
        }
        
        if (AdminUserService::getInstance()->add($data)) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '添加失败');
            //Log::getInstance()->error("user--addData:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "添加失败");
        }

        return;
    }

    // 多字段修改
    public function edit()
    {
        //if(!$this->hasRuleForGet($this->rule_auth_set)) return ;

        $id        = $this->request()->route('id');
        $role_data = AdminRoleService::getInstance()->getAllList();
        $user_data = AdminUserService::getInstance()->getUserById($id);
       
        if (!$user_data) {
            $this->show404();
            return;
        }
        
        $this->render('auth.userEdit', ['id' => $id, 'role_data' => $role_data, 'user_data' => $user_data]);
    }

    // 多字段修改
    public function editData()
    {
        //if(!$this->hasRuleForPost($this->rule_auth_set)) return ;

        $data = $this->fieldInfo();
        if (!$data) {
            return;
        }
        $id = $this->request()->route('id');
        
        if (AdminUserService::getInstance()->setUserById($id, $data)) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '修改失败');
            //Log::getInstance()->error("user--editData:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "修改失败");
        }

        return;
    }

    // 修改密码
    public function editPwd()
    {
        $this->render('auth.userPwd');
    }

    public function editPwdData()
    {
        $info = $this->request()->post(['old_pwd','pwd']);
         
        if (encrypt($info['old_pwd'], $this->auth_user_data['encry']) == $this->auth_user_data['pwd']) {
            
            if(AdminUserService::getInstance()->setUserById($this->auth_user_data['id'], ['pwd' => $info['pwd']])) {
                $this->json(Status::CODE_OK, '修改成功');return ;
            }
        } 

        $this->json(Status::CODE_ERR, '修改失败');
        //Log::getInstance()->waring('user--editPwdData:' . json_encode($info, JSON_UNESCAPED_UNICODE) . '修改失败');
    }

    // 修改基本资料
    public function info()
    {
        $this->render('auth.userInfo');
    }

    public function infoData()
    {
        return ;
    }

    // 单字段修改
    public function set()
    {
       // if(!$this->hasRuleForPost($this->rule_auth_set)) return ;

        $data     = $this->request()->post(['id', 'key', 'value']);
        $id = $this->request()->route("id");
        $result = AdminUserService::getInstance()->modify(['id' => $id], [$data['key'] => $data['value']]);
        if ($result) {
            $this->json(Status::CODE_OK, '设置成功');
        } else {
            $this->json(Status::CODE_ERR, '设置失败');
            //Log::getInstance()->error("user--set:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "没有设置失败");
        }
    }

    public function del($request, $response, $vars = [])
    {
        //if(!$this->hasRuleForPost($this->rule_auth_del)) return ;
        $id      = $this->request()->route("id");
        $id   = intval($id);
        $bool    = AdminUserService::getInstance()->setUserById($id, ['deleted' => 1]);
        if ($bool) {
            $this->json(Status::CODE_OK, '');
        } else {
             
            $this->json(Status::CODE_ERR, '删除失败!!!');
           // Log::getInstance()->error("user--del:" . $id . "没有删除失败");
        }
    }
}
