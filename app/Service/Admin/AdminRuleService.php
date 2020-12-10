<?php
namespace App\Service\Admin;

use App\Utility\AppFunc;
use Pingo\Traits\Singleton;

/**
 * 规则
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminRuleService
{  

   use Singleton;
   /**
    * Undocumented function
    *
    * @author pingo
    * @created_at 00-00-00
    * @return void
    */
   public function getAllList()
   {
      $where = [];
      $column = ['id', 'title(name)','node', 'status','is_menu', 'href', 'icon', 'route_handler', 'pid'];
      $table = 'admin_rule';
      $rules_list = model()->select($table, $column, $where);
      $count =  model()->count($table, $where);
      
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
          try{
              $rules = AdminRole::create()->where(['id' => $role_id])->scalar('rules');
              if(!is_array($rules)) $rules = explode(",", $rules);
              $nodes = AdminRule::create()->where('status', 1)->where('id', $rules, 'IN')->column('node');
              
              return empty($nodes)? [] : $nodes;
  
          }catch(\Throwable $e){
              
              return [];
          }
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
       $rules_list = model()->select("admin_rule", ['id', 'title', 'href', 'icon', 'pid', 'status', 'is_menu'], []);
       $menu_list['homeInfo'] = [
          'title' => '首页',
          'href' => '/backend/home/dashboard',
       ];
       $menu_list['logoInfo'] = [
          'title' => '控制台',
          'href'  => '',
          "image" => "/images/logo.png"
       ];
       if($rules_list){
           foreach($rules_list as $key => $rule)
           {
               if($rule['is_menu'] == 0) unset($rules_list[$key]);
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
          $rules_list = model()->select("admin_rule", ['id', 'href', 'route_handler', 'is_menu'], []);
          
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
        return model()->insert("admin_rule", $data);
    }
    /**
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getById(int $id):array
    {
         return  model()->get('admin_rule', "*", ['id' => $id]);
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
        return model()->update('admin_rule', $data, ['id' => $id]);
    }
    /**
     * 删除
     *
     * @param [type] $ids
     * @return void
     */
    public function delete($ids)
    {
        if(is_string($ids)) $ids = [$ids];
        return model()->delete('admin_rule', ['id' => $ids]);
    }

}