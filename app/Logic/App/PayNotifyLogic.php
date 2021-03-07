<?php
namespace App\Logic\App;

use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;
class PayNotifyLogic
{
   

    public function __construct()
    {
        
    }
    
    /**
     * 执行入口
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $notify_data
     * @param array $payment_log_item
     * @return void
     */
    public function run(array $notify_data = [], array $payment_log_item = [])
    {
         
        try{
           //验证支付金额跟订单金额是否匹配
           if($payment_log_item['total_fee'] != $notify_data['total_money']) return;
            // 请自行对 trade_status 进行判断及其它逻辑进行判断，在支付宝的业务通知中，只有交易通知状态为 TRADE_SUCCESS 或 TRADE_FINISHED 时，支付宝才会认定为买家付款成功。
            // 1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号；
            // 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）；
            // 3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）；
            // 4、验证app_id是否为该商户本身。
            // 5、其它业务逻辑情况
            $model = model();
            $mid = $payment_log_item['user_id'];
            
            switch ($payment_log_item['extra']) {
                case 'upgrade_agent':
                    # 升级代理商
                    if($mid <= 0 ) return;
                    $model->update('member', ['grade' => 2, 'updated_at' => time()], ['id' => $mid, 'grade[<]' => 2]);
                    //赠送优惠券
                    $distribution = setting('distribution');
                    $upgrade_agent_getcoupon_goodsid = $distribution['upgrade_agent_getcoupon_goodsid'];
                    $coupon_shop_goods_item = $model->get('coupon_shop_goods', "*", ['id' => $upgrade_agent_getcoupon_goodsid]);
                    if($coupon_shop_goods_item && $distribution['upgrade_agent_getcoupon_no'] > 0 ){
                        //订单入库
                        $ordersn = make_order_no($mid);
                        $coupon_shop_order_field['mid'] = $mid;
                        $coupon_shop_order_field['ordersn'] = $ordersn;
                        $coupon_shop_order_field['total_fee'] = 0;
                        $coupon_shop_order_field['title'] = $coupon_shop_goods_item['title'];
                        $coupon_shop_order_field['total'] = $distribution['upgrade_agent_getcoupon_no'];
                        $coupon_shop_order_field['thumb'] = $coupon_shop_goods_item['thumb'];
                        $coupon_shop_order_field['description'] = $coupon_shop_goods_item['description'];
                        $coupon_shop_order_field['state'] = 1;
                        $coupon_shop_order_field['created_at'] = time();
                        $coupon_shop_order_id = $model->insert('coupon_shop_order', $coupon_shop_order_field);
                        //订单商品表
                        $coupon_shop_order_goods_field['goods_id'] = $upgrade_agent_getcoupon_goodsid;
                        $coupon_shop_order_goods_field['order_id'] = $coupon_shop_order_id;
                        $coupon_shop_order_goods_field['title'] = $coupon_shop_goods_item['title'];
                        $coupon_shop_order_goods_field['price'] = $coupon_shop_goods_item['price'];
                        $coupon_shop_order_goods_field['deduction_price'] = $coupon_shop_goods_item['deduction_price'];
                        $coupon_shop_order_goods_field['expired_at'] = $coupon_shop_goods_item['expires'] * 86400 + time();
                        $coupon_shop_order_goods_field['created_at'] = time();
                        $coupon_order_goods_fields = [];
                        for ($i=0; $i < $distribution['upgrade_agent_getcoupon_no']; $i++) { 
                            # code...
                            $coupon_order_goods_fields[] = $coupon_shop_order_goods_field;
                        }
                        $model->insert("coupon_shop_order_goods", $coupon_order_goods_fields);
                        
                    }
                    //发佣金
                    (new CommissionLogic)->fromUpgradeAgent($mid, $notify_data['total_money']);
                    //定时器计算上级是否达标条件升级运营商
                    \Swoole\Timer::after( 5000, function() use($mid){
                        (new UpgradeLogic)->updateOperator($mid);
                    }); 
                    
                    break;
                case 'onlineshop':
                    # 在线商城
                    $online_shop_order_item = $model->get('online_shop_order', '*', ['id' => $payment_log_item['order_id']]);
                    if(!$online_shop_order_item || $online_shop_order_item['state'] != 0 ) return;
                    $model->update('online_shop_order', ['state' => 1, 'updated_at' => time()], ['id' => $payment_log_item['order_id'], 'state' => 0]);
                    //赠送积分
                    $asset_log['mid'] = $mid;
                    $asset_log['title'] = '购物赠送积分';
                    $asset_log['flow'] = 1;
                    $asset_log['money'] = $online_shop_order_item['total_fee'];
                    $asset_log['from_type'] = 'shopping';
                    $asset_log['asset_type'] = 'score';
                    $asset_log['created_at'] = time();
                    
                    $model->insert('member_asset_log', $asset_log);
                    $model->update('member_asset', ['score[+]' => $online_shop_order_item['total_fee']], ['mid' => $mid]);

                    //升级会员
                    $member = $model->get('member', ['id', 'grade'], ['id' => $mid]);
                    if($member['grade'] == 0 ){
                        
                        $model->update('member', ['grade' => 1, 'updated_at' => time()], ['id' => $mid]);
                        //定时器计算上级是否达标条件升级运营商
                        \Swoole\Timer::after( 5000, function() use($mid){
                                
                            (new UpgradeLogic)->updateOperator($mid);
                        });

                        $online_shop_order_id = ($payment_log_item['order_id']);
                        
                        $vip_coupon_result = $model->query("SELECT goods_tb.*,order_goods_tb.id as order_goods_id FROM coupon_shop_order_goods as order_goods_tb, coupon_shop_goods as goods_tb WHERE order_goods_tb.online_shop_order_id = {$online_shop_order_id} LIMIT 1 ")->fetchAll();
                        if(isset($vip_coupon_result[0])){
                            
                            $vip_coupon_result = $vip_coupon_result[0];
                            \Swoole\Timer::after( 5000, function() use($mid, $vip_coupon_result){
                                
                                (new CommissionLogic)->fromShopingActiveVip($mid, $vip_coupon_result);
                            });
                                
                        }
                        
                        
                    }
                    break;
                case 'coupon':
                    # 卡包商城
                    $coupon_shop_order_item = $model->get('coupon_shop_order', '*', ['id' => $payment_log_item['order_id']]);
                    if(!$coupon_shop_order_item || $coupon_shop_order_item['state'] != 0 ) return;
                    $model->update('coupon_shop_order', ['state' => 1, 'updated_at' => time()], ['id' => $payment_log_item['order_id']]);
                    //发佣金
                    $coupon_shop_order_goods = $model->get('coupon_shop_order_goods', ['goods_id'], ['order_id' => $payment_log_item['order_id']]);
                    if($coupon_shop_order_goods){
                        $coupon_shop_goods_item = $model->get('coupon_shop_goods', "*", ['id' => $coupon_shop_order_goods['goods_id']]);
                        if($coupon_shop_goods_item) (new CommissionLogic)->fromCoupon($mid, $coupon_shop_goods_item);
                    }
                    
                    break;
                default:
                    # code...
                    break;
            }

        } catch (\Exception $e) {
            // $e->getMessage();
        }
        
    }


}