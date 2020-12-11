<?php
namespace App\Service\Admin;

use Pingo\Traits\Singleton;

/**
 * 用户
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminUserService extends Base
{

    use Singleton;
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
            'admin_user.deleted[!]' => 1,
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

    /**
     * 登录
     *
     * @param string $username
     * @param string $password
     * @return array
     */
    public function login(string $username, string $password): array
    {
        try {
            //code...
            $where['deleted'] = 0;
            $where['uname'] = $username;
             
            $admin_user = model()->get('admin_user', '*', $where);
            if(empty($admin_user) ) return  $this->_return(false, "账号或密码不正确！！！");
            
            if($admin_user['pwd'] !== encrypt($password, $admin_user['encry'])) return $this->_return(false, "账号或密码错误！！");
            return $this->_return(true, "登录成功", $admin_user);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_return(false, $th->getMessage());
        }
         
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
        $pdoStmt = model()->update('admin_user', $data, $where);
        return $pdoStmt->rowCount() > 0 ? true : false;
    }
    /**
     * 根据ID查询
     *
     * @param integer $id
     * @return array
     */
    public function getUserById(int $id):array
    {
        return model()->get('admin_user', "*", ['id' => $id]);
         
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
        if(isset($data['pwd'])){
            $user = $this->getUserById($id);
            $data['pwd'] = encrypt($data['pwd'], $user['encry']);
        }
        $pdoStmt = model()->update('admin_user', $data, ['id' => $id]);
        return $pdoStmt->rowCount() > 0 ? true : false;
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
        return model()->insert("admin_user", $data);
    }


}