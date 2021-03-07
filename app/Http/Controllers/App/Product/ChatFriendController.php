<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\ChatFriendService;

class ChatFriendController extends AppController
{

    /**
     * list
     *  好友列表
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function getList()
    {
        $service_res = (new ChatFriendService)->getList($this->auth_user_data['id']);
        $this->__service($service_res);
    }

    public function getAppList()
    {
        $service_res = (new ChatFriendService)->getAppList($this->auth_user_data['id']);
        $this->__service($service_res);
    }

    public function search()
    {
        //
        $union_id = $this->request()->get('key', 0);
        $service_res = (new ChatFriendService)->search($this->auth_user_data['id'], $union_id);
        return $this->__service($service_res);
    }

    /**
     * 添加好友
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function add()
    {
        $union_id = $this->_post('union_id');
        
        $service_res = (new ChatFriendService)->add($this->auth_user_data['id'], $union_id);
        $this->__service($service_res);
    }

    /**
     * 同意好友
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function agree()
    {
        $id = intval($this->_post('id'));
        $service_res = (new ChatFriendService)->agree($this->auth_user_data['id'], $id);
        return $this->__service($service_res);
    }
    /**
     * 删除好友
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function delete()
    {
        $id = intval($this->_post('id'));
        $service_res = (new ChatFriendService)->delete($this->auth_user_data['id'], $id);
        $this->__service($service_res);
    }
}
