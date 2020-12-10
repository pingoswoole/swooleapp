<?php
namespace App\Service\Admin;

use Pingo\Traits\Singleton;

/**
 * 角色
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminRoleService
{
    use Singleton;

    public function getPageList($page, $page_size)
    {
        $where = [];
        $column = "*";
        $table = 'admin_role';
        $rules_list = model()->select($table, $column, $where);
        $count =  model()->count($table, $where);
        
        return ['count' => $count, 'list' => $rules_list];
    }


    /**
     * 获取所有角色
     *
     * @param array $fields
     * @return array
     */
    public function getAllList( $fields = "*", array $where = []):array
    {
        //$column = "*";
        $table = 'admin_role';
        $list = model()->select($table, $fields, $where);
        return $list;
    }

    /**
     * 新增
     *
     * @param array $data
     * @return void
     */
    public function add(array $data)
    {
         return model()->insert("admin_role", $data);
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
        return model()->update('admin_role', $data, ['id' => $id]);
    }
    /**
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getById(int $id):array
    {
        return model()->get("admin_role", [], ['id' => $id]);
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
        return model()->delete('admin_role', [ 'id' => $ids]);
    }
    /**
     * Undocumented function
     *
     * @param [type] $id
     * @param [type] $rules_checked
     * @param [type] $rules
     * @return void
     */
    public function saveIdRules(int $id, $rules_checked, $rules)
    {
        if ($this->setById($id, ['rules_checked' => $rules_checked, 'rules' =>  $rules])) {
            // $this->cacheRules($id);
            return true;
        } else {
            return false;
        }
    }


}