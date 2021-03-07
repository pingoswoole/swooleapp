<?php
namespace App\Service\App;

use App\Model\Member\Member;
use App\Model\Product\ChatMessage;
use App\Model\Product\Faka;
use App\Utility\Status;

class ChatService extends Base
{
    /**
     * 非会员发送条数
     *
     * @param integer $mid
     * @return array
     */
    public function checkSendLimit(int $mid): array
    {
        try {
            //code...
            $chatting = setting('chatting');
            if (isset($chatting['visitor_chat_num']) && $chatting['visitor_chat_num'] > 0) {
                $member = (new Member())->where('id', $mid)->select('is_realname', 'grade')->first();
                if ($member['grade'] == 0) {
                    $msg_count = (new ChatMessage())->where('from_mid', $mid)->count();
                    if ($msg_count > $chatting['visitor_chat_num']) {
                        return $this->_result(Status::CODE_ERR, "非会员最多发送{$chatting['visitor_chat_num']}条消息");
                    }
                }
            }
            return $this->_result(Status::CODE_OK);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }

    /**
     * 是否有权限查看资料
     *
     * @param integer $mid
     * @return void
     */
    public function checkView(int $mid): array
    {
        try {
            //code...
            
            $member = (new Member())->where('id', $mid)->select('is_realname', 'grade')->first();
            $chatting = setting('chatting');
            if (!isset($chatting['chat_view_profile']['all'])) {
                if (isset($chatting['chat_view_profile']['vip']) && $member['grade'] < 1) {
                    return $this->_result(Status::CODE_ERR, '您不是VIP用户');
                }
                if (!isset($chatting['chat_view_profile']['vip']) && isset($chatting['chat_view_profile']['svip']) && $member['grade'] < 2) {
                    return $this->_result(Status::CODE_ERR, '您不是SVIP用户');
                }
            }
            return $this->_result(Status::CODE_OK);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }

    /**
     * 聊天内容检查
     *
     * @param integer $mid
     * @param [type] $content
     * @return array
     */
    public function checkContent(int $mid, $content):array
    {
        try {
            //code...
            $content = trim($content);
            $chatting = setting('chatting');
            if (isset($chatting['sys_filter']['mobile'])) {
                $preg = "/^1[3456789]\d{9}$/";
                if (preg_match($preg, $content)) {
                    return $this->_result(Status::CODE_ERR, '不能发送手机');
                }
            }
            if (isset($chatting['sys_filter']['number'])) {
                if (\is_numeric($content)) {
                    return $this->_result(Status::CODE_ERR, '不能纯发数字');
                }
            }
            if (isset($chatting['sys_filter']['link'])) {
                $pattern="#(http|https)://(.*\.)?.*\..*#i";
                if (preg_match($pattern, $content)) {
                    return $this->_result(Status::CODE_ERR, '不能发送链接');
                }
            }
            
            return $this->_result(Status::CODE_OK, 'success');
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
}
