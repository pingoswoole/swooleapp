<?php
namespace App\Logic\App;

class CommissionLogic
{
     
    public function fromCoupon(int $from_mid, array $coupon_shop_goods_item)
    {
        return false;
        try {
            //code...
            $model = model();
             
            $member = $model->get('member', ['id', 'pid', 'grade'], ['id' => $from_mid]);
            if($member){
                //运营商获取佣金一级、二级（一级非运营商）
                for ($i=0; $i < 2; $i++) { 
                    # code...
                    $member = $model->get('member', ['id', 'pid', 'grade'], ['id' => $member['pid']]);
                    if($member){
                        //上级是运营商 
                        if( ($i == 0 && $member['grade'] == 3) || ($i == 1 && $member['grade'] == 3)){
                             
                            $commission = $coupon_shop_goods_item['operator_agent_buycoupon'];
                            if($commission > 0 ){
                                $asset_log_field['mid'] = $member['id'];
                                $asset_log_field['title'] = ($i + 1) . "级购卡";
                                $asset_log_field['flow'] = 1;
                                $asset_log_field['money'] = $commission;
                                $asset_log_field['from_type'] = 'shopping';
                                $asset_log_field['asset_type'] = 'commission';
                                $asset_log_field['created_at'] = time();
                                $model->insert('member_asset_log', $asset_log_field);
                                $model->update('member_asset', ['commission[+]' => $commission, 'updated_at' => time()], ['mid' => $member['id']]);
                            }
                            
                        }
                         
                    }
                }
            }
             
            return true;
        } catch (\Throwable $th) {
            //throw $th;
            
        }
        return false;
    }
    
    /**
     * 购买商品激活会员
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param float $total_fee
     * @return void
     */
    public function fromShopingActiveVip(int $from_mid = 0, array $coupon_shop_goods)
    {
         
        try {
            //code...
            $model = model();
            
            $member = $model->get('member', ['id', 'pid', 'grade'], ['id' => $from_mid]);
            if(!$member) throw new \Exception('no member');
           
            //$distribution = setting("distribution");
            //代理商获取一级佣金，运营商获取佣金一级、二级（一级非运营商）
            # code...
            $memberL1 = $model->get('member', ['id', 'pid', 'grade'], ['id' => $member['pid']]);
            if($memberL1){
                //上级是代理商、运营商 order_goods_id
                if( $memberL1['grade'] == 2 || $memberL1['grade'] == 3){
                    $commission = $memberL1['grade'] == 2 ? $coupon_shop_goods['agent_commission'] : $coupon_shop_goods['operator_commission'];
                    if($commission > 0 ){
                        $asset_log_field['mid'] = $memberL1['id'];
                        $asset_log_field['title'] =  "激活会员";
                        $asset_log_field['flow'] = 1;
                        $asset_log_field['money'] = $commission;
                        $asset_log_field['asset_type'] = 'commission';
                        $asset_log_field['from_type'] = 'active';
                        $asset_log_field['created_at'] = time();
                        $model->insert('member_asset_log', $asset_log_field);
                        $model->update('member_asset', ['commission[+]' => $commission , 'updated_at' => time()], ['mid' => $memberL1['id']]);
                        //
                        $model->update('coupon_shop_order_goods', ['commission' => $commission], ['id' => $coupon_shop_goods['order_goods_id']]);
                       
                    }
                    
                }
                if($memberL1['grade'] == 2 && $memberL1['pid']){
                    $memberL2 = $model->get('member', ['id', 'pid', 'grade'], ['id' => $memberL1['pid']]);
                    if($memberL2 && $memberL2['grade'] == 3){
                        $commission =  $coupon_shop_goods['operator_agentactive_vip'];
                        if($commission > 0 ){
                            $asset_log_field['mid'] = $memberL2['id'];
                            $asset_log_field['title'] =  "代理商激活会员";
                            $asset_log_field['flow'] = 1;
                            $asset_log_field['from_type'] = 'active';
                            $asset_log_field['money'] = $commission;
                            $asset_log_field['asset_type'] = 'commission';
                            $asset_log_field['created_at'] = time();
                            $model->insert('member_asset_log', $asset_log_field);
                            $model->update('member_asset', ['commission[+]' => $commission, 'updated_at' => time()], ['mid' => $memberL2['id']]);
                            //
                        }
                    }
                }
                    
            }
          
            return true;
        } catch (\Throwable $th) {
            //throw $th;
            //var_dump($th->getMessage());
            
        }
        return false;
    }

    /**
     * 升级代理商佣金
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $from_mid
     * @param float $total_fee
     * @return void
     */
    public function fromUpgradeAgent(int $from_mid = 0, float $total_fee = 0)
    {
        try {
            //code...
            $model = model();
            $member = $model->get('member', ['id', 'pid', 'grade'], ['id' => $from_mid]);
            if($member['pid']){
                $member = $model->get('member', ['id', 'pid', 'grade'], ['id' => $member['pid']]);
                if($member && $member['grade'] >= 2){
                    $distribution = setting("distribution");
                    $commission_rate =  $member['grade'] == 2?  $distribution['agent_active_agent'] : $distribution['operator_getvip_toagent'];
                    $commission = sprintf('%.2f',  $commission_rate);
                    if($commission > 0 ){
                        $asset_log_field['mid'] = $member['id'];
                        $asset_log_field['title'] =  "会员升级代理商";
                        $asset_log_field['flow'] = 1;
                        $asset_log_field['money'] = $commission;
                        $asset_log_field['asset_type'] = 'commission';
                        $asset_log_field['from_type'] = 'upgrade';
                        $asset_log_field['created_at'] = time();
                        $model->insert('member_asset_log', $asset_log_field);
                        $model->update('member_asset', ['commission[+]' => $commission, 'updated_at' => time()], ['mid' => $member['id']]);
                        //
                    }
                    //间接佣金
                    if($member['grade'] == 2 && $member['pid']){
                        $member = $model->get('member', ['id', 'grade'], ['id' => $member['pid']]);
                        if($member && $member['grade'] == 3){
                            
                            $commission = setting('distribution.operator_indirect_toagent');
                            if($commission > 0 ){
                                $asset_log_field['mid'] = $member['id'];
                                $asset_log_field['title'] =  "间接升级代理商";
                                $asset_log_field['flow'] = 1;
                                $asset_log_field['money'] = $commission;
                                $asset_log_field['asset_type'] = 'commission';
                                $asset_log_field['from_type'] = 'upgrade';
                                $asset_log_field['created_at'] = time();
                                $model->insert('member_asset_log', $asset_log_field);
                                $model->update('member_asset', ['commission[+]' => $commission, 'updated_at' => time()], ['mid' => $member['id']]);
                                //
                            }
                        }
                    }
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    

}