<?php
namespace App\Service\Admin;

use Pingo\Traits\Singleton;

/**
 * 角色
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminRoleService extends Base
{
    use Singleton;
    
    protected $model_class = \App\Model\Admin\AdminRole::class;

    public function getPageList($page, $page_size)
    {
        $where = [];
        $rules_list = $this->model->where($where)->get();
        $count =  $this->model->where($where)->count();
        
        return ['count' => $count, 'list' => $rules_list];
    }


    /**
     * 获取所有角色
     *
     * @param array $fields
     * @return array
     */
    public function getAllList( $fields = "", array $where = []):array
    {
        
        $list = $this->model->select($fields)->where($where)->get();
         
        return (array ) $list;
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
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getById(int $id):array
    {
        return $this->model->where('id', $id)->first();
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
        $rowCount = $this->model->whereIn('id', $ids)->delete();
        return $rowCount > 0 ? true : false;
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