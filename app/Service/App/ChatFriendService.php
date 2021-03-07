<?php
namespace App\Service\App;

use App\Utility\Status;
use App\Model\Member\Member;

class ChatFriendService extends Base
{
    protected $model_class = \App\Model\Product\ChatFriend::class;



    public function search($mid, $union_id)
    {
        try {
            //code...
            $MemberModel = new Member;
            $member_item = $MemberModel->select('id', 'nickname', 'avatar')->where('union_id', $union_id)->first();
            if ($member_item['id'] == $mid) {
                return $this->_result(Status::CODE_ERR, '不能添加自己');
            }
            if ($member_item) {
                return $this->_result(Status::CODE_OK, '查询成功', $member_item);
            }
            return $this->_result(Status::CODE_ERR, '用户不存在');
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR);
        }
    }

    public function getList(int $mid)
    {
        try {
            //code...
            $where['mid'] = $mid;
            $where['state'] = 1;
            $list = $this->model->where($where)->with(['friend' => function ($Builder) {
                $Builder->select("id", 'nickname', 'avatar', 'grade');
            }])->orderBy('id', 'desc')->get();
            return $this->_result(Status::CODE_OK, 'SUCCESS', $list);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }


    public function getAppList(int $mid = 0)
    {
        try {
            //code...
            $where['friend_mid'] = $mid;
            $where['state'] = 0;
            
            $list = $this->model->where($where)->with(['app_friend' => function ($Builder) {
                $Builder->select("id", 'nickname', 'avatar', 'grade');
            }])->orderBy('id', 'desc')->get();
            return $this->_result(Status::CODE_OK, 'SUCCESS', $list);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }


    public function add(int $mid, $friend_mid)
    {
        try {
            //code...
            $exist_item = $this->model->where(['mid' => $mid, 'friend_mid' => $friend_mid])->first();
            if ($friend_mid == $mid) {
                return $this->_result(Status::CODE_ERR, '不能添加自己');
            }
            if ($exist_item) {
                return $this->_result(Status::CODE_ERR, '已发送添加');
            }
            $field['mid'] = $mid;
            $field['friend_mid'] = $friend_mid;
            $insertid = $this->model->insert($field);
            if ($insertid) {
                return $this->_result(Status::CODE_OK, '添加成功，发送申请');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '添加失败');
    }


    public function agree(int $mid, int $id = 0)
    {
        try {
            //code...
            $chatfriend_item = $this->model->where('id', $id)->first();
            if ($chatfriend_item) {
                $result = $this->model->where('id', $id)->update(['state' => 1]);
                if ($result) {
                    //添加一条好友
                    $friend_item = $this->model->where(['mid' => $mid, 'friend_mid' => $chatfriend_item['friend_mid']])->first();
                    if ($friend_item) {
                        $this->model->where('id', $friend_item['id'])->update(['state' => 1]);
                    } else {
                        $friend_field['mid'] = $mid;
                        $friend_field['friend_mid'] = $chatfriend_item['mid'];
                        $friend_field['state'] = 1;
                        $this->model->insert($friend_field);
                        return $this->_result(Status::CODE_OK, '添加成功');
                    }
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }


    public function delete(int $mid, int $id)
    {
        try {
            //code...
            $chatfriend_item = $this->model->where(['id' => $id, 'mid' => $mid])->first();
            if ($chatfriend_item) {
                $result1 = $this->model->where('id', $id)->delete();
                $result2 = $this->model->where(['mid' => $chatfriend_item['friend_mid'], 'friend_mid' => $chatfriend_item['mid']])->delete();
                if ($result1 && $result2) {
                    return $this->_result(Status::CODE_OK, '删除成功');
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
}
