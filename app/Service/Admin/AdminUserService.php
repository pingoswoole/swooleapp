<?php
namespace App\Service\Admin;


/**
 * 用户
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminUserService
{
    /**
     * getPageList
     *
     * @param array $where
     * @param integer $page
     * @param integer $page_size
     * @return void
     */
    public function getPageList($page = 1, $page_size = 20)
    {
        $table = "admin_user";
        $join  = [
            '[>]admin_role' => ['admin_user.role_id' => 'id']
        ];
        $where = [
            //'admin_user.deleted[!]' => 0,
            'LIMIT' => [($page - 1) * $page_size, $page_size],
            'ORDER' => ['admin_user.id' => 'DESC']
        ];
        $column = ["admin_user.id","uname","display_name","admin_user.created_at","logined_at","status","admin_role.name(role_name)"];

        $list = model()->select($table, $join, $column, $where);
        $count = model()->count($table, $where);
        return ['count' => $count, 'list' => $list];
/* 
        $data = AdminUser::create()->where('deleted', 0, '=')
            ->join('admin_role', 'admin_user.role_id = admin_role.id')
            ->where('admin_user.deleted', 0, '=')
            ->order('admin_user.id', 'DESC')
            ->field("admin_user.id,uname,display_name,admin_user.created_at,logined_at,status,admin_role.name as role_name")
            ->limit(($page - 1) * $page_size, $page_size)
            ->all();
        $auth_count = AdminUser::create()->where('deleted', 0, '=')->count();
       
        return $this->returnData(true, "查询成功", [$this->toArray($data), $auth_count]);; */
    }


}