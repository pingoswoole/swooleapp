<?php
namespace App\Service\Admin\Auth;

use App\Utility\AppFunc;
use Pingo\Traits\Singleton;
use App\Service\Admin\Base;

/**
 * 规则
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminRuleService extends Base
{
    use Singleton;
    protected $model_class = \App\Model\Admin\AdminRule::class;
    /**
     * Undocumented function
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getAllList($column = "", $where = [])
    {
        $rules_list = $this->model->where($where)->select($column)->orderBy('sort', 'ASC')->get();
        $count =  $this->model->where($where)->count();
       
        return ['count' => $count, 'list' => $rules_list];
    }

    /**
       * 根据角色ID查询授权标识路由
       *
       * @param integer $role_id
       * @return array
       */
    public function getNodesByRoleId(int $role_id): array
    {
        //   try{
        //       $rules = AdminRole::create()->where(['id' => $role_id])->scalar('rules');
        //       if(!is_array($rules)) $rules = explode(",", $rules);
        //       $nodes = AdminRule::create()->where('status', 1)->where('id', $rules, 'IN')->column('node');
              
        //       return empty($nodes)? [] : $nodes;
  
        //   }catch(\Throwable $e){
              
        //       return [];
        //   }
    }

    /**
     * getMenuRules
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getMenuRules()
    {
        $rules_list = $this->model->select('id', 'title', 'href', 'icon', 'pid', 'status', 'is_menu', 'sort')->orderBy('sort', 'ASC')->get();
        $menu_list['homeInfo'] = [
          'title' => '首页',
          'href' => '/backadmin/home/index/dashboard',
       ];
        $menu_list['logoInfo'] = [
          'title' => '控制台',
          'href'  => '',
          "image" => "/images/logo.png"
       ];
        if ($rules_list) {
            foreach ($rules_list as $key => $rule) {
                if ($rule['is_menu'] == 0) {
                    unset($rules_list[$key]);
                }
            }
            $menu_list['menuInfo'] = AppFunc::arrayToTree($rules_list, 'pid', 'child');
        }
        
        return $menu_list;
    }

    /**
     * Undocumented function
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getRuleRoutes()
    {
        $rules_list = $this->model->select('id', 'href', 'route_handler', 'is_menu')->get();
          
        return $rules_list;
    }

    /**
     * 新增
     *
     * @param array $data
     * @return void
     */
    public function add(array $data)
    {
        return $this->model->insert($data);
    }
    /**
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getById(int $id):array
    {
        return  $this->model->where('id', $id)->first();
    }

    /**
     * 根据ID修改
     *
     * @param integer $id
     * @param array $data
     * @return boolean
     */
    public function setById(int $id, array $data): bool
    {
        $rowCount = $this->model->where('id', $id)->update($data);
        return $rowCount > 0 ? true : false;
    }
    /**
     * 删除
     *
     * @param [type] $ids
     * @return void
     */
    public function delete($ids)
    {
        if (is_string($ids)) {
            $ids = [$ids];
        }
        $rowCount = $this->model->whereIn('id', $ids)->delete();
        return $rowCount > 0 ? true : false;
    }
}
