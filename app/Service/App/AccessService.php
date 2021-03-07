<?php
namespace App\Service\App;

use App\Logic\Common\SmsLogic;
use App\Model\Member\Member;
use App\Model\Member\MemberAsset;
use App\Model\Product\Sms;
use App\Service\Common\JwtService;
use App\Utility\Status;
use Hashids\Hashids;

class AccessService extends Base
{
    private $jwt_zone = 'app';
    protected $model_class = Member::class;
    /**
     * 登录
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $username
     * @param string $password
     * @return array
     */
    public function login(string $username, string $password): array
    {
        try {
            //code...
            $member_item = $this->model->where('account', $username)->first();
            if (!$member_item) {
                return $this->_result(Status::CODE_ERR, '账号不存在');
            }

            $pwd = encrypt($password, $member_item['salt']);
            if ($pwd !== $member_item['pwd']) {
                return $this->_result(Status::CODE_ERR, '账号密码错误');
            }
             
            if ($member_item['state'] != 1) {
                return $this->_result(Status::CODE_RULE_ERR, '账号已禁用');
            }
            $data['tokenInfo'] = (new JwtService)->encode($this->jwt_zone, $member_item['id'], $member_item);
            
            return $this->_result(Status::CODE_OK, '登录成功', $data);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, '注册失败');
    }
    /**
     * refreshToken
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $refresh_token
     * @return void
     */
    public function refreshToken(string $refresh_token):array
    {
        try {
            //code...
            $JwtService = (new JwtService);
            $fresh_res = $JwtService->refresh($this->jwt_zone, $refresh_token);
            if (false !== $fresh_res) {
                $data = ['tokenInfo' => $fresh_res];
                return $this->_result(Status::CODE_OK, 'refresh success', $data);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'token error');
    }

    public function sendsms($mobile)
    {
        try {
            //code...
            $code = mt_rand(1000, 9999);
            $flag = (new SmsLogic)->send($mobile, $code);
            if ($flag) {
                return $this->_result(Status::CODE_OK, '发送成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
    /**
     * 注册
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $mobile
     * @param string $password
     * @return array
     */
    public function register(string $mobile, string $password, $pid = 0): array
    {
        try {
            //code...
            $MemberModel = (new Member)->initConnect();
            $MemberModel->beginTransaction();
            $member = $MemberModel->where('mobile', $mobile)->first();
            if ($member) {
                return $this->_result(Status::CODE_ERR, '手机已注册');
            }
            //
            $salt = random_str(6);
            $member_field['account'] = $mobile;
            $member_field['mobile'] = $mobile;
            $member_field['pwd'] = encrypt($password, $salt);
            $member_field['avatar'] = env_get('APP_URL') . '/images/avatar.png';
            $member_field['salt'] = $salt;
            $member_id = $MemberModel->insert($member_field);
            if ($member_id) {
                $hashids = new Hashids('', 6, '123456789ABCDEFG'); //
                $union_id = $hashids->encode($member_id);
                $default_name = '用户' . $union_id;
                $update_member_field['union_id'] = $union_id; //
                $update_member_field['nickname'] = $default_name; //
                $update_member_field['sign_name'] = '家伙很懒，什么都没留下。'; //
                
                $MemberModel->where('id', $member_id)->update($update_member_field);
                //初始化资产
                $MemberAssetModel = (new MemberAsset)->setPdo($MemberModel->getPdo());
                $member_asset_item = $MemberAssetModel->where('mid', $member_id)->first();
                if ($member_asset_item) {
                    $MemberAssetModel->where('mid', $member_id)->delete();
                }
                $member_asset_field['mid'] = $member_id;
                $member_asset_id = $MemberAssetModel->insert($member_asset_field);
                if ($member_asset_id > 0) {
                    $MemberModel->commit();
                    return $this->_result(Status::CODE_OK, '注册成功');
                }
            }
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR, '注册失败');
        } catch (\Throwable $th) {
            //throw $th;
            
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR);
        }
    }

    public function forget(string $mobile, string $password)
    {
        try {
            //code...
            $MemberModel = (new Member)->initConnect();
            $MemberModel->beginTransaction();
            $member = $MemberModel->where('mobile', $mobile)->first();
            if ($member) {
                $member_field['pwd'] = encrypt($password, $member['salt']);
                ;
                $res = $MemberModel->where('id', $member['id'])->update($member_field);
                if ($res) {
                    $MemberModel->commit();
                    return $this->_result(Status::CODE_OK, '修改成功');
                }
            }
            //
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR, '修改失败');
        } catch (\Throwable $th) {
            //throw $th;
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR);
        }
    }

    /**
     * Unicloud 一键登录
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $mobile
     * @return void
     */
    public function univerify($mobile)
    {
        try {
            //code...
            $MemberModel = (new Member)->initConnect();
            $MemberModel->beginTransaction();
            $member = $MemberModel->where('mobile', $mobile)->first();
            if ($member) {
                return $this->_result(Status::CODE_ERR);
            }
            //
            $salt = random_str(6);
            $member_field['account'] = $mobile;
            $member_field['mobile'] = $mobile;
            $member_field['pwd'] = encrypt($mobile, $salt);
            $member_field['avatar'] = env_get('APP_URL') . '/images/avatar.png';
            $member_id = $MemberModel->insert($member_field);
            if ($member_id) {
                $hashids = new Hashids('', 8, '123456789'); //
                $default_name = '用户' . $union_id;
                $update_member_field['union_id'] = $hashids->encode($member_id); //
                $update_member_field['nickname'] = $default_name; //
                $update_member_field['sign_name'] = '家伙很懒，什么都没留下。'; //
                
                $MemberModel->where('id', $member_id)->update($update_member_field);
                //初始化资产
                $MemberAssetModel = (new MemberAsset)->setPdo($MemberModel->getPdo());
                $member_asset_item = $MemberAssetModel->where('mid', $member_id)->first();
                if ($member_asset_item) {
                    $MemberAssetModel->where('mid', $member_id)->delete();
                }
                $member_asset_field['mid'] = $member_id;
                $member_asset_id = $MemberAssetModel->insert($member_asset_field);
                if ($member_asset_id > 0) {
                    $MemberModel->commit();
                    return $this->_result(Status::CODE_OK);
                }
            }
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR);
        } catch (\Throwable $th) {
            //throw $th;
            $MemberModel->rollback();
            return $this->_result(Status::CODE_ERR);
        }
    }


    public function getKefu()
    {
        try {
            //code...
            $member_item = (new Member)->select('id', 'nickname', 'avatar')->where('is_kefu', 1)->first();
            if ($member_item) {
                return $this->_result(Status::CODE_OK, 'success', $member_item);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
}
