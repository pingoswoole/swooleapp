<?php
namespace App\Service\App;

use App\Utility\Status;

class CouponShopGoodsService extends Base
{
    public function getList()
    {
        try {
            //code...
            $join = ['[>]coupon_shop_goods' => ['id' => 'cate_id']];
            $column = [
                'coupon_shop_goods.id',
                'coupon_shop_goods.title',
                'coupon_shop_goods.thumb',
                'coupon_shop_goods.description',
                'coupon_shop_goods.expires',
                'coupon_shop_goods.price',
                'coupon_shop_category.title(cate_title)',
                'coupon_shop_category.id(cate_id)',
            ];
            $where = [
                //'coupon_shop_goods.state' => 1,
            ];
            $list = model()->select("coupon_shop_category", $join, $column, $where);
            if($list){
                $cate_list = [];
                foreach ($list as $key => $row) {
                    # code...
                    $cate_list[$row['cate_id']]['name'] = $row['cate_title'];
                    if(isset($cate_list[$row['cate_id']]['goods'])){
                        if(isset($row['id'])) $cate_list[$row['cate_id']]['goods'][] = $row;
                    }else{
                        if(isset($row['id'])){
                            $cate_list[$row['cate_id']]['goods'][] = $row;
                        }else{
                            $cate_list[$row['cate_id']]['goods'] = [];
                        }
                    }
                }
                
                return $this->_result(Status::CODE_OK, 'success', $cate_list);
            }
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
        }
        return $this->_result(Status::CODE_ERR, 'error');

    }


    public function getCouponGoodsInfo(int $coupon_goods_id)
    {
        try {
            //code...
            $model = model();
            $result = $model->query("SELECT online_shop_goods.*,coupon_shop_order_goods.deduction_price as deduction_price FROM `coupon_shop_order_goods`, `coupon_shop_goods`, `online_shop_goods`
             WHERE coupon_shop_order_goods.id = {$coupon_goods_id} AND coupon_shop_goods.onlineshop_goodsid = online_shop_goods.id LIMIT 1 ")->fetchAll();
            
            return $result[0]?? [];
            
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
        
    }

}