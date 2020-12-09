<?php
namespace App\Service\Admin;

use App\Utility\AppFunc;

/**
 * 权限规则
 *
 * @author pingo
 * @created_at 00-00-00
 */
class RuleService
{
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

}