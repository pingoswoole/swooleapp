<?php
namespace App\Service\App;

use App\Utility\Status;

class MemberService extends Base
{
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
            $pdoStmt = model()->update('member', $data, ['id' => $id]);
            if($pdoStmt->rowCount() > 0 ) return $this->_result(Status::CODE_OK, '修改成功');
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '修改失败');
    }

    public function getProfile(int $mid)
    {
        try {
            //code...
            $member_item = model()->get("member", "*", ['id' => $mid]);
            if($member_item){
                $grade_names = ['游客', '会员', '代理商', '运营商'];
                $result = [
                    'mobile' => $member_item['mobile'],
                    'nickname' => $member_item['nickname'],
                    'gender' => $member_item['gender'],
                    'grade' => $member_item['grade'],
                    'grade_name' => $grade_names[$member_item['grade']]?? '普通',
                    'avatar' => $member_item['avatar'],
                    'is_vip' => $member_item['grade'] > 0 ? true : false,
                    'pid' => $member_item['pid'],
                ];
                if($member_item['pid']){
                    $pmember_item = model()->get("member", "*", ['id' => $member_item['pid']]);
                    if($pmember_item) $result['p_name'] = $pmember_item['mobile'];
                }
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
            if($member['pid'])  throw new \Exception("已绑定推荐人");
            $pmember = $model->get("member", ['pid', 'id'], ['mobile' => $pmobile]);
            if(!$pmember || $pmember['id'] >= $member['id']) throw new \Exception("推荐人有误");
            $pdoSmt = $model->update('member', ['pid' => $pmember['id']], ['id' => $mid]);
            if($pdoSmt->rowCount() > 0 ) return $this->_result(Status::CODE_OK, '绑定成功');

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
            $model = model();
            $member_asset = $model->get("member_asset", ['score', 'commission'], ['mid' => $mid]);
            $coupon_total = $model->sum('coupon_shop_order', 'total', ['mid' => $mid, 'state' => 1]);
            $coupon_total = $coupon_total?? 0;
            $join = ['[<]coupon_shop_order_goods' => ['id' => 'order_id']];
            $column = [
                "coupon_shop_order.id"
            ];
            $where = [
                'coupon_shop_order.mid' => $mid,
                'coupon_shop_order_goods.use_mid' => 0,
            ];
            $unuse_coupon_total = $model->count("coupon_shop_order", $join, $column, $where);
    
            $result = [
                'score' => $member_asset['score'],
                'commission' => $member_asset['commission'],
                'cardTotal' => $coupon_total,
                'activeCard' =>   ($coupon_total - $unuse_coupon_total),
                'unactiveCard' => $unuse_coupon_total,
            ];
            //var_dump($model->log(), $unuse_coupon_total, $coupon_total);
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }




}