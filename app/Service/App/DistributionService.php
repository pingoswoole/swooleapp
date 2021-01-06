<?php
namespace App\Service\App;

use App\Utility\Status;

class DistributionService extends Base 
{
   
 
    public function getUpgradeDes(string $name = 'vip', int $mid)
    {
      
       
          try {
              //code...
              if($name == 'agent'){
                 $result = [
                    'price' => setting("distribution.upgrade_agent_fee"),
                    'desc'  => setting("distribution.agent_desc"),
                 ];
              }else{
                  //获取一张没过期的优惠券、则随机一个商品
                  $result = [
                    'desc'  => setting("distribution.vip_des"),
                    'hasPid' => false,
                  ];
                  $member = model()->get('member', ['pid'], ['id' => $mid]);
                  if($member['pid']) $result['hasPid'] = true;
                  $coupon_shop_order_goods_item = model()->get('coupon_shop_order_goods', ['goods_id'], ['use_mid' => $mid, 'use_time' => 0, 'expired_at[>]' => time()]);
                  if($coupon_shop_order_goods_item) {
                    $result['goods_id'] = $coupon_shop_order_goods_item['goods_id'];
                    $coupon_shop_goods = model()->get('coupon_shop_goods', ['onlineshop_goodsid'], ['id' => $coupon_shop_order_goods_item['goods_id']]);
                    if($coupon_shop_goods) $result['goods_id'] = $coupon_shop_goods['onlineshop_goodsid'];
                  }else{
                     $online_shop_goods = model()->get('online_shop_goods', ['id'], ['state' => 1]);
                     $result['goods_id'] = $online_shop_goods['id'];
                  }
              }
              return $this->_result(Status::CODE_OK, 'success', $result);
          } catch (\Throwable $th) {
              //throw $th;
              var_dump($th->getMessage());
          }
          return  $this->_result(Status::CODE_ERR, 'error');
    }
 


}