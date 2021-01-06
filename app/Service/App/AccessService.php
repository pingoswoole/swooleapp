<?php
namespace App\Service\App;

use App\Service\Common\JwtService;
use App\Utility\Status;
use Hashids\Hashids;

class AccessService extends Base
{
    private $jwt_zone = 'app';
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
            $member_item = model()->get('member', "*", ['account' => $username]);
            if(!$member_item){
                return $this->_result(Status::CODE_ERR, '账号不存在');
            }

            $pwd = encrypt($password, $member_item['salt']);
            if($pwd !== $member_item['pwd']){
                return $this->_result(Status::CODE_ERR, '账号密码错误');
            }
             
            if($member_item['state'] != 1){
                return $this->_result(Status::CODE_RULE_ERR, '账号已禁用');
            }
            $data['tokenInfo'] = (new JwtService)->encode($this->jwt_zone, $member_item['id'], $member_item);
            switch ($member_item['grade']) {
                case 1:
                    # code...
                    $grade_name = '会员';
                    break;
                case 2:
                    # code...
                    $grade_name = '代理商';
                    break;
                case 3:
                    # code...
                    $grade_name = '运营商';
                    break;
                        
                default:
                    # code...
                    $grade_name = '非会员';
                    break;
            }
            $Hashids = new Hashids('', 10);
            $data['userInfo'] = [
                'id' => $Hashids->encode($member_item['id']),
                'mobile' => $member_item['mobile'],
                'grade_name' => $grade_name,
                'grade' => $member_item['grade'],
                'is_vip'    => $member_item['grade'] > 0 ? true : false,
                'created_at' => date("Y-m-d H:i:s", $member_item['created_at']),
                'gender'    => $member_item['gender'],
                'avatar'    => $member_item['avatar'],
                'nickname'  => $member_item['nickname'],
            ];
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
            if(false !== $fresh_res){
                $userinfo = $JwtService->decode($this->jwt_zone, $fresh_res['token']);
                $where = ['id' => $userinfo['id']];
                $result = model()->get('member', "*", $where);
                if($result){
                    $Hashids = new Hashids('', 10);
                    switch ($result['grade']) {
                        case 1:
                            # code...
                            $grade_name = '会员';
                            break;
                        case 2:
                            # code...
                            $grade_name = '代理商';
                            break;
                        case 3:
                            # code...
                            $grade_name = '运营商';
                            break;
                                
                        default:
                            # code...
                            $grade_name = '非会员';
                            break;
                    }
                    $result['id'] = $Hashids->encode($result['id']);
                    $result['grade_name'] = $grade_name;
                    $result['is_vip']   = $result['grade'] > 0 ? true : false;
                    $result['created_at'] = date("Y-m-d H:i:s", $result['created_at']);
                    $data = ['userInfo' => $result, 'tokenInfo' => $fresh_res];
                    return $this->_result(Status::CODE_OK, 'refresh success', $data);
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
            
        }
        return $this->_result(Status::CODE_ERR, 'token error');
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
    public function register(string $mobile, string $password, $pid = 0, $coupon_goodsid = 0): array
    {
        try {
            //code...
            $modelInstance = model();
            $modelInstance->beginTransaction();
            $member_item = $modelInstance->get('member', ['id'], ['account' => $mobile]);
            if($member_item){
                return $this->_result(Status::CODE_ERR, '账号已注册');
            }
            $salt = random_str(6);
            $field['account'] = $mobile;
            $field['pwd'] = encrypt($password, $salt);
            $field['salt'] = $salt;
            $field['mobile'] = $mobile;
            $field['created_at'] = time();
            //推荐人
            if($pid){
                $pmember = $modelInstance->get('member', ['id'], ['id' => $pid]);
                if($pmember)  $field['pid'] = $pid;
            }
            $member_id = $modelInstance->insert('member', $field);
            //绑定优惠券
            if($coupon_goodsid && $member_id){
                $coupon_goodsid = decrypt_code($coupon_goodsid);
                $order_goods_item = $modelInstance->get('coupon_shop_order_goods', ['id', 'use_mid'], ['id' => $coupon_goodsid]);
                if($order_goods_item && empty($order_goods_item['use_mid'])){
                    $modelInstance->update('coupon_shop_order_goods', ['use_mid' => $member_id, 'use_mobile' => $mobile], ['id' => $coupon_goodsid]);
                }
            }
            //初始化资产
            $member_asset_item = $modelInstance->get('member_asset', "*", ['mid' => $member_id]);
            if($member_asset_item){
                $modelInstance->delete('member_asset', ['id' => $member_asset_item['id']]);
            }
            $member_asset_field['mid'] = $member_id;
            $member_asset_field['created_at'] = time();
            $member_asset_id = $modelInstance->insert('member_asset', $member_asset_field);
            if($member_id > 0 && $member_asset_id > 0){
                $modelInstance->commit();
                return $this->_result(Status::CODE_OK, '注册成功');
            }
            $modelInstance->rollback();
        } catch (\Throwable $th) {
            //throw $th;
            $modelInstance->rollback();
        }

        return $this->_result(Status::CODE_ERR, '注册失败');
    }

     

}