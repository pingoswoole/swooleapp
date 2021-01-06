<?php
namespace App\Service\Admin;

use Carbon\Carbon;


class DashboardService extends Base
{
    
     
    
    public function getStatis()
    {
        try {
            //code...
            $model = model();
            //用户统计
            $result['member']['total'] = $model->count('member', []);
            $result['member']['vip'] = $model->count('member', ['grade' => 1]);
            $result['member']['agent'] = $model->count('member', ['grade' => 2]);
            //商城订单
            $result['order']['total'] = $model->count('online_shop_order', []);
            $result['order']['pay'] = $model->count('online_shop_order', ['state[>=]' => 1]);
            $result['order']['unpay'] = $model->count('online_shop_order', ['state' => 0]);
            //提现
            $result['withdraw']['total'] = $model->sum('member_withdraw', 'money');
            $result['withdraw']['check'] = $model->sum('member_withdraw', 'money', ['state' => 1]);
            $result['withdraw']['uncheck'] = $model->sum('member_withdraw', 'money', ['state' => 0])?? 0;
            //卡包
            $result['coupon']['total'] = $model->count('coupon_shop_order');
            $result['coupon']['pay'] = $model->count('coupon_shop_order', ['state' => 1]);
            $result['coupon']['unpay'] = $model->count('coupon_shop_order', ['state' => 0]);
            return $result;
        } catch (\Throwable $th) {
            //throw $th;
             
        }
        return [];
    }
     
}