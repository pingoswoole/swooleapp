<?php
namespace App\Service\Admin;

use Carbon\Carbon;


class CouponShopGoodsService extends Base
{
    
    protected $table = 'coupon_shop_goods';  
    /**
     * 条件查询列表所有
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $page
     * @param [type] $pageSize
     * @param array $where
     * @return array
     */
      public function getPageList($page, $pageSize, array $where = []):array
      {
          $data = ['count' => 0, 'list' => []];
          try {
              //code...
              $count = model()->count($this->table, $where);
              $where['ORDER'] = ['id' => 'DESC'];
              $where['LIMIT'] = [($page - 1)*$pageSize, $pageSize];
              $column = [
                'coupon_shop_goods.id',
                'coupon_shop_goods.title',
                'coupon_shop_goods.price',
                'coupon_shop_goods.description',
                'coupon_shop_goods.thumb',
                'coupon_shop_goods.state',
                'coupon_shop_goods.deduction_price',
                'coupon_shop_goods.created_at',
                'coupon_shop_goods.expires',

                'coupon_shop_goods.operator_agentactive_vip',
                'coupon_shop_goods.operator_agent_buycoupon',
                'coupon_shop_goods.operator_commission',
                'coupon_shop_goods.agent_commission',
                'coupon_shop_goods.agent_price',
                'coupon_shop_goods.operator_price',
                'coupon_shop_category.title(cate_title)',
                'online_shop_goods.title(goods_title)',
                'online_shop_goods.thumb(goods_thumb)'
              ];
              

              $join = [
                  '[>]coupon_shop_category' => ["cate_id" => "id"],
                  '[>]online_shop_goods' => ['onlineshop_goodsid' => 'id'],
              ];
              $list = model()->select($this->table, $join, $column, $where);
              return  ['count' => $count, 'list' => $list];
          } catch (\Throwable $th) {
              //throw $th;
               
          }

          return  $data;
      }
      
      /**
       * 添加一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $data
       * @return boolean
       */
      public function addItem(array $data):bool
      {
            try {
                //code...
                $data['created_at'] = Carbon::now()->timestamp;
                $id = model()->insert($this->table, $data);
            } catch (\Throwable $th) {
                //throw $th;
                return false;
            }
            return true;
      }
      
      /**
       * 查询一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param array $where
       * @return array
       */
      public function getItem(int $id):array
      {
            try {
                //code...
                $join = [
                    '[>]online_shop_goods' => ['onlineshop_goodsid' => 'id']
                ];
                $column = [
                    "{$this->table}.id",
                    "{$this->table}.title",
                    "{$this->table}.price",
                    "{$this->table}.thumb",
                    "{$this->table}.cate_id",
                    "{$this->table}.deduction_price",
                    "{$this->table}.description",
                    "{$this->table}.state",
                    "{$this->table}.expires",
                    "{$this->table}.operator_agentactive_vip",
                    "{$this->table}.operator_agent_buycoupon",
                    "{$this->table}.operator_commission",
                    "{$this->table}.agent_commission",
                    "{$this->table}.agent_price",
                    "{$this->table}.operator_price",

                    "{$this->table}.onlineshop_goodsid",
                    "online_shop_goods.title(goods_title)"

                    
                ];
                $result = model()->get($this->table, $join, $column, ["{$this->table}.id" => $id]);
                
                return $result ? $result : [];
            } catch (\Throwable $th) {
                //throw $th;
            }
            return [];
      }
      
      /**
       * 修改一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $data
       * @param [type] $where
       * @return boolean
       */
      public function editItem(array $data, array $where): bool
      {
            try {
                //code...
                
                $data['updated_at'] = Carbon::now()->timestamp;
                $pdoStmt = model()->update($this->table, $data, $where);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
      
      /**
       * 修改字段
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $data
       * @param [type] $where
       * @return boolean
       */
      public function setItem($id, $field_name, $field_val):bool
      {
            try {
                 
                //code...
                $data = [$field_name => $field_val];
                $pdoStmt = model()->update($this->table, $data, ['id' => $id]);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
      
      /**
       * 条件删除一项
       *
       * @author pingo
       * @created_at 00-00-00
       * @param [type] $ids
       * @return boolean
       */
      public function delItem($ids = null):bool
      {
            try {
                //code...
                if(is_string($ids)) $ids = [$ids];
                $pdoStmt = model()->delete($this->table, ['id' => $ids]);
                return $pdoStmt->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
}