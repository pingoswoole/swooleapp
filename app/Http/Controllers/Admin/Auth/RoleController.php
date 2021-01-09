<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Admin\AdminController;
use App\Utility\AppFunc;
use App\Service\Admin\AdminRoleService;
use App\Service\Admin\AdminRuleService;
use App\Utility\Log\Log;
use App\Utility\Status;

class RoleController extends AdminController
{
    private $rule_role      = 'auth.role';
    private $rule_role_view = 'auth.role.view';
    private $rule_role_add  = 'auth.role.add';
    private $rule_role_set  = 'auth.role.set';
    private $rule_role_del  = 'auth.role.del';
    private $rule_role_rule = 'auth.role.rule';
    public function index()
    {
       // if(!$this->hasRuleForGet($this->rule_role_view)) return ;

        $this->render('auth.role');
    }

    public function getAll()
    {
        //if(!$this->hasRuleForPost($this->rule_role_view)) return ;

        $data = $this->getPage();

        $service_result = (new AdminRoleService)->getPageList($data['page'], $data['limit']);
        $tree_data = AppFunc::arrayToTree($service_result['list'], 'pid');
        $data      = [];
        AppFunc::treeRule($tree_data, $data);
        
        $this->jsonPage(0, $service_result['count'], $data);
    }

    private function fieldInfo()
    {
        $data    = $this->request()->post(['name', 'detail','pid']);

        return $data;
    }

    public function add()
    {
       // if(!$this->hasRuleForGet($this->rule_role_add)) return ;
        $role_data = AdminRoleService::getInstance()->getAllList();
        $this->render('auth.roleAdd',['role_data'=>$role_data]);
    }

    public function addData()
    {
      //  if(!$this->hasRuleForPost($this->rule_role_add)) return ;

        $data = $this->fieldInfo();
        if (!$data) {
            return;
        }

        if (AdminRoleService::getInstance()->add($data)) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '添加失败');
           // Log::getInstance()->error("role--addData:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "没有添加失败");
        }
    }

    public function edit()
    {
        //if(!$this->hasRuleForGet($this->rule_role_set)) return ;

        $id = $this->request()->route('id');

        
        $info = AdminRoleService::getInstance()->getById($id);
        $role_data = AdminRoleService::getInstance()->getAllList(['id', 'name'], [['id' , '<>', $id]]);

        $this->render('auth.roleEdit', ['id' => $id, 'info' => $info, 'role_data'=>$role_data]);
    }

    public function editData()
    {
        //if(!$this->hasRuleForPost($this->rule_role_set)) return ;

        $data = $this->fieldInfo();
        if (!$data) {
            return;
        }
       
        $id = $this->request()->route('id');
        if (AdminRoleService::getInstance()->setById($id, $data)) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '保存失败');
           // Log::getInstance()->error("role--editData:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "编辑保存失败");
        }
        return;
    }

    public function set()
    {
       // if(!$this->hasRuleForPost($this->rule_role_set)) return ;

        $data     = $this->request()->post(['id', 'key', 'value']);
        $id    = $this->request()->route('id');

        $bool = AdminRoleService::getInstance()->setById($id, [$data['key'], $data['value']]);
        if ($bool) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '设置失败');
            //Log::getInstance()->error("role--set:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "没有设置成功");
        }
    }

    public function del()
    {
       // if(!$this->hasRuleForPost($this->rule_role_del)) return ;

        $id      = $this->request()->route('id');
        $bool    = AdminRoleService::getInstance()->delete($id);
        if ($bool) {
            $this->json(Status::CODE_OK, '');
        } else {
             
            $this->json(Status::CODE_ERR, '删除失败');
            //Log::getInstance()->error("role--del:" . json_encode($data, JSON_UNESCAPED_UNICODE) . "没有删除失败");
        }
    }

    public function editRule()
    {
        //if(!$this->hasRuleForGet($this->rule_role_view)) return ;
        
        $rule_data = AdminRuleService::getInstance()->getAllList(['id', 'title', 'pid'], ['status' => 1]);
         
        $data      = AppFunc::arrayToTree($rule_data['list']);
        
        $id        = $this->request()->route('id');
        
        $role_info = AdminRoleService::getInstance()->getById($id);
        $this->render('auth.editRule', ['id' => $id, 'data' => $data, 'checked' => explode(',', $role_info['rules_checked'])]);
    }

    public function editRuleData()
    {
        //if(!$this->hasRuleForPost($this->rule_role_rule)) return ;

        $info = $this->request()->post(['id', 'rules_checked', 'rules']);
         
        $id = $this->request()->route('id');
        
        if (AdminRoleService::getInstance()->saveIdRules($id, $info['rules_checked'] ?? "", $info['rules'] ?? "")) {
            $this->json(Status::CODE_OK);
        } else {
            $this->json(Status::CODE_ERR, '删除失败');
           // Log::getInstance()->error("role--editRuleData:" . json_encode($info, JSON_UNESCAPED_UNICODE) . "权限变更失败");
        }
        return;
    }
}
