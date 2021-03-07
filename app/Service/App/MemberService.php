<?php
namespace App\Service\App;

use App\Model\Member\Member;
use App\Model\Member\MemberAsset;
use App\Model\Member\MemberRealnameauth;
use App\Model\Product\VideoData;
use App\Utility\Status;

class MemberService extends Base
{
    protected $model_class = Member::class;
    /**
     * 修改资料
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $data
     * @param [type] $id
     * @return void
     */
    public function editProfile(array $data, $id):array
    {
        try {
            //code...
            unset($data['id']);
            unset($data['grade']);
            unset($data['mobile']);

            $rowCount = $this->model->where('id', $id)->update($data);
             
            if ($rowCount > 0) {
                return $this->_result(Status::CODE_OK, '修改成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '修改失败');
    }

    public function changePwd(int $mid, string $pwd)
    {
        try {
            //code...
            $member_item = $this->model->where('id', $mid)->first();
            if ($member_item) {
                $update_field['pwd'] = encrypt($pwd, $member_item['salt']);
                $this->model->where('id', $mid)->update($update_field);
                
                return $this->_result(Status::CODE_OK, '修改成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }


    public function getProfile(int $mid)
    {
        try {
            //code...
            $member_item = $this->model->where('id', $mid)->first();
            if ($member_item) {
                $result = [
                    'mobile'    => $member_item['mobile'],
                    'nickname'  => $member_item['nickname'],
                    'union_id'  => $member_item['union_id'],
                    'wechat'    => $member_item['wechat'],
                    'qq'        => $member_item['qq'],
                    'sign_name'  => $member_item['sign_name'],
                    'gender'    => $member_item['gender'],
                    'grade'     => $member_item['grade'],
                    'grade_name' => $member_item['grade_name'],
                    'avatar'    => $member_item['avatar'],
                    'wallpaper' => $member_item['wallpaper'],
                    'is_vip'    => $member_item['grade'] > 0 ? true : false,
                ];
               
                return $this->_result(Status::CODE_OK, 'success', $result);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }


    public function getFriendProfile(int $mid = 0)
    {
        try {
            //code...
            $member_item = $this->model->where('id', $mid)->first();
            if ($member_item) {
                $result = [
                    'mobile'    => $member_item['mobile'],
                    'nickname'  => $member_item['nickname'],
                    'wechat'    => $member_item['wechat'],
                    'qq'        => $member_item['qq'],
                    'gender'    => $member_item['gender'],
                    'avatar'    => $member_item['avatar'],
                ];
               
                return $this->_result(Status::CODE_OK, 'success', $result);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }
    

    public function bindInviter(int $mid, $pmobile)
    {
        try {
            //code...
            $model = model();
            $member = $model->get("member", ['pid', 'id'], ['id' => $mid]);
            if ($member['pid']) {
                throw new \Exception("已绑定推荐人");
            }
            $pmember = $model->get("member", ['pid', 'id'], ['mobile' => $pmobile]);
            if (!$pmember || $pmember['id'] >= $member['id']) {
                throw new \Exception("推荐人有误");
            }
            $pdoSmt = $model->update('member', ['pid' => $pmember['id']], ['id' => $mid]);
            if ($pdoSmt->rowCount() > 0) {
                return $this->_result(Status::CODE_OK, '绑定成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getAssetStatis(int $mid):array
    {
        try {
            //code...
            $result = (new MemberAsset())->where('id', $mid)->first();
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function realname(int $mid, $real_name, $cred_id, $hand_img)
    {
        try {
            //code...
            $model = (new MemberRealnameauth());
            $realnameauth = $model->where('mid', $mid)->first();
            if (empty($realnameauth)) {
                //添加
                $res = $model->insert([
                    'mid'       => $mid,
                    'real_name' => $real_name,
                    'cred_id'   => $cred_id,
                    'hand_img'  => $hand_img,
                ]);
                if ($res) {
                    return $this->_result(Status::CODE_OK, '提交成功');
                }
            } else {
                //
                if ($realnameauth['state'] != 1) {
                    $up_field = [
                        'real_name' => $real_name,
                        'cred_id' => $cred_id,
                        'hand_img' => $hand_img,
                        'state' => 0,
                    ];
                    $res = $model->where('id', $realnameauth['id'])->update($up_field);
                    if ($res) {
                        return $this->_result(Status::CODE_OK, '提交成功');
                    }
                }
            }
             
            return $this->_result(Status::CODE_ERR, '操作失败');
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getrealname(int $mid)
    {
        try {
            //code...
            $model = (new MemberRealnameauth());
            $realnameauth = $model->where('mid', $mid)->first();
            if ($realnameauth) {
                return $this->_result(Status::CODE_OK, 'success', $realnameauth);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }


    public function getFprofile(int $mid)
    {
        try {
            //code...
             
            $member = $this->model->where('id', $mid)->select('avatar', 'nickname', 'sign_name', 'wallpaper', 'wechat', 'qq')->first();
            if ($member) {
                return $this->_result(Status::CODE_OK, 'success', $member);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getFvideo(int $mid)
    {
        try {
            //code...
            $model = (new VideoData());
            $video_data = $model->where('mid', $mid)->where('state', 1)->get();
            
            if ($video_data) {
                return $this->_result(Status::CODE_OK, 'success', $video_data);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function checkPublish(int $mid)
    {
        try {
            //code...
            $_result = [
                'article' => ['flag' => true, 'msg' => ''],
                'video' => ['flag' => true, 'msg' => ''],
            ];
            $member = (new Member())->where('id', $mid)->select('is_realname', 'grade')->first();
            $privilege = setting('privilege');
            if (isset($privilege['publish_article_need_realname'])) {
                if ($member['is_realname'] !== 1) {
                    $_result['article'] = ['flag' => false, 'msg' => '您未实名认证'];
                }
            }
            if (!isset($privilege['publish_article_member']['all'])) {
                if (isset($privilege['publish_article_member']['vip']) && $member['grade'] < 1) {
                    $_result['article'] = ['flag' => false, 'msg' => '您不是VIP'];
                }
                if (!isset($privilege['publish_article_member']['vip']) && isset($privilege['publish_article_member']['svip']) && $member['grade'] < 2) {
                    $_result['article'] = ['flag' => false, 'msg' => '您不是SVIP'];
                }
            }
            if (isset($privilege['publish_video_need_realname'])) {
                if ($member['is_realname'] !== 1) {
                    $_result['video'] = ['flag' => false, 'msg' => '您未实名认证'];
                }
            }
            if (!isset($privilege['publish_video_member']['all'])) {
                if (isset($privilege['publish_video_member']['vip']) && $member['grade'] < 1) {
                    $_result['video'] = ['flag' => false, 'msg' => '您不是VIP'];
                }
                if (!isset($privilege['publish_video_member']['vip']) && isset($privilege['publish_video_member']['svip']) && $member['grade'] < 2) {
                    $_result['video'] = ['flag' => false, 'msg' => '您不是SVIP'];
                }
            }

            return $this->_result(Status::CODE_OK, 'success', $_result);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
}
