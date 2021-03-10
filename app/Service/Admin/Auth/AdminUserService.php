<?php
namespace App\Service\Admin\Auth;

use Pingo\Traits\Singleton;
use App\Service\Admin\Base;

/**
 * 用户
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminUserService extends Base
{
    use Singleton;
    protected $model_class = \App\Model\Admin\AdminUser::class;
    /**
     * getPageList
     *
     * @param array $where
     * @param integer $page
     * @param integer $page_size
     * @return void
     */
    public function getPageList(int $page = 1, int $page_size = 20)
    {
        $where[] = ['admin_user.deleted', '!=', 1];
        $list = $this->model
            ->leftJoin('admin_role', 'admin_user.role_id', '=', 'admin_role.id')
            ->where($where)
            ->limit(($page - 1) * $page_size . ", {$page_size}")
            ->orderBy('admin_user.id', 'DESC')
            ->selectRaw("admin_user.id, uname, display_name, admin_user.created_at, logined_at, status, admin_role.name as role_name")
            ->get();

        $count = $this->model->where($where)->count();
        return ['count' => $count, 'list' => $list];
    }

    /**
     * 登录
     *
     * @param string $username
     * @param string $password
     * @return array
     */
    public function login(string $username, string $password)
    {
        try {
            //code...
            $where['deleted'] = 0;
            $where['status']  = 1;
            $where['uname'] = $username;
             
            $admin_user = $this->model->where($where)
            ->first();
            if (empty($admin_user)) {
                return  $this->_return(false, "账号或密码不正确！！！111");
            }
             
            if ($admin_user['pwd'] !== encrypt($password, $admin_user['encry'])) {
                return $this->_return(false, "账号或密码错误！！");
            }
            return $this->_return(true, "登录成功", $admin_user);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_return(false, $th->getMessage());
        }
    }

    /**
     * 检查用户是否有权限操作
     *
     * @param integer $user_id
     * @param [type] $rule_name
     * @return boolean
     */
    public function hasRule(int $user_id, $rule_name): bool
    {
        return true;
    }
    /**
     * 更新
     *
     * @param array $where
     * @param array $data
     * @return void
     */
    public function modify(array $where = [], array $data)
    {
        $rowCount = $this->model->where($where)->update($data);
        return $rowCount > 0 ? true : false;
    }
    /**
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getUserById(int $id)
    {
        $item = $this->model->where('id', $id)->first();
        return   $item;
    }
    /**
     * 根据ID修改
     *
     * @param integer $id
     * @param array $data
     * @return boolean
     */
    public function setUserById(int $id, array $data): bool
    {
        if (isset($data['pwd'])) {
            $user = $this->getUserById($id);
            $data['pwd'] = encrypt($data['pwd'], $user['encry']);
        }
        $rowCount = $this->model->where('id', $id)->update($data);
        return $rowCount > 0 ? true : false;
    }
    /**
     * 新增
     *
     * @param array $data
     * @return void
     */
    public function add(array $data)
    {
        $salt = random_str(6, false, true);
        $data['pwd'] = encrypt($data['pwd'], $salt);
        $data['encry'] = $salt;
        return $this->model->insert($data);
    }

    /**
       * 条件删除一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $ids
       * @return boolean
       */
    public function delItem($ids = null):bool
    {
        try {
            //code...
            if (!is_array($ids)) {
                $ids = [$ids];
            }
            $rowCount = $this->model->whereIn('id', $ids)->delete();
            return $rowCount > 0 ? true : false;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
}
