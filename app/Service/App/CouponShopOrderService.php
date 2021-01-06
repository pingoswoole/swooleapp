<?php
namespace App\Service\App;

use App\Utility\Status;

class CouponShopOrderService extends Base 
{
    protected $table = 'coupon_shop_order';

    /**
     * 获取分页列表数据
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param integer $page
     * @param integer $pageSize
     * @return void
     */
    public function getList(int $mid, int $page = 1, int $pageSize = 20)
    {
        $result = ['count' => 0, 'list' => []];
          try {
              //code...
              $where['mid'] = $mid;
              $where['state'] = 1;
              $count = model()->count($this->table, $where);
              $where['ORDER'] = ['id' => 'DESC'];
              $where['LIMIT'] = [($page - 1)*$pageSize, $pageSize];
              $column = "*";
               
              $list = model()->select($this->table, $column, $where);
              $result =  ['totalCount' => $count, 'list' => $list, 'isEmpty' => empty($list) ?  true : false];
              return $this->_result(Status::CODE_OK, 'success', $result);
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $this->_result(Status::CODE_ERR, 'error', $result);
    }

    public function getStateList(int $mid, int $page = 1, int $pageSize = 20, int $state = 0, int $order_id = 0)
    {
        $result = ['count' => 0, 'list' => []];
          try {
              //code...
              $model = model();
              $where['coupon_shop_order.mid'] = $mid;
              $where['coupon_shop_order.state'] = 1;
              $where['coupon_shop_order_goods.order_id'] = $order_id;
              if($state){
                $where['coupon_shop_order_goods.use_time[!]'] = 0;
              }else{
                $where['coupon_shop_order_goods.use_time'] = 0;
              } 
              $column = [
                'coupon_shop_order.ordersn',
                'coupon_shop_order_goods.id',
                'coupon_shop_order_goods.expired_at',
                'coupon_shop_order_goods.use_mobile',
                'coupon_shop_order_goods.commission',
                'coupon_shop_order_goods.use_time',
                'coupon_shop_order_goods.order_id',
              ];
              $join = [
                  '[<]coupon_shop_order_goods' => ["id" => "order_id"]
              ];
              $count = $model->count($this->table, $join, "coupon_shop_order_goods.id", $where);
              $where['ORDER'] = ['coupon_shop_order_goods.id' => 'DESC'];
              $where['LIMIT'] = [($page - 1)*$pageSize, $pageSize];
              
              $list = $model->select($this->table, $join, $column, $where);
              
              if($list){
                  foreach ($list as $key => &$row) {
                      # code...
                      $row['is_share'] = $row['use_mobile'] ? true : false;
                      $row['expired_at'] = date("Y-m-d H:i:s", $row['expired_at']);
                  }
              }
              
              $result =  ['totalCount' => $count, 'list' => $list, 'isEmpty' => empty($list) ?  true : false];
              return $this->_result(Status::CODE_OK, 'success', $result);
          } catch (\Throwable $th) {
              //throw $th;
               
               
          }

          return  $this->_result(Status::CODE_ERR, 'error', $result);
    }


}