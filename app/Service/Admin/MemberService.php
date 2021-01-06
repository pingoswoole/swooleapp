<?php
namespace App\Service\Admin;

use Carbon\Carbon;


class MemberService extends Base
{
    
    protected $table = 'member';  
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
                'member.id',
                'member.account',
                'member.nickname',
                'member.avatar',
                'member.mobile',
                'member.gender',
                'member.grade',
                'member.state',
                'member.created_at',
                'member_asset.score',
                'member_asset.balance',
                
              ];
              $join = [
                  '[>]member_asset' => ["id" => "mid"]
              ];
              $list = model()->select($this->table, $join, $column, $where);
              if($list){
                  foreach ($list as $key => &$row) {
                      # code...
                      $row['created_at'] = date('Y-m-d H:i:s', $row['created_at']);
                      $grade_names = ['游客', '会员', '代理商', '运营商'];
                      $row['grade_name'] = $grade_names[$row['grade']]?? '';
                  }
              }
              return  ['count' => $count, 'list' => $list];
          } catch (\Throwable $th) {
              //throw $th;
              var_dump($th->getMessage());
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
                //是否存在用户
                $member = model()->get($this->table, '*', ['mobile' => $data['mobile']]);
                if($member) return false;
                $salt = random_str(8);
                $data['salt'] = $salt;
                $data['pwd'] = encrypt($data['pwd'], $salt);;
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
      public function getItem(array $where = []):array
      {
            try {
                //code...
                $result = model()->get($this->table, '*', $where);
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
                $member = model()->get($this->table, '*', $where);
                if($member && $member['pwd'] !== $data['pwd']){
                    $data['pwd'] = encrypt($data['pwd'], $member['salt']);
                }
                //是否重新修改等级
                if($data['grade'] == 2 && $member['grade'] != $data['grade']){
                    //赠送优惠券
                    $model = model();
                    $distribution = setting('distribution');
                    $upgrade_agent_getcoupon_goodsid = $distribution['upgrade_agent_getcoupon_goodsid'];
                    $coupon_shop_goods_item = $model->get('coupon_shop_goods', "*", ['id' => $upgrade_agent_getcoupon_goodsid]);
                    if ($coupon_shop_goods_item && $distribution['upgrade_agent_getcoupon_no'] > 0) {
                        //订单入库
                        $mid = $member['id'];
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
                }
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
                $pdoStmt1 = model()->delete($this->table, ['id' => $ids]);
                //删除资产
                $pdoStmt2 = model()->delete('member_asset', ['mid' => $ids]);
                return $pdoStmt1->rowCount() > 0 && $pdoStmt2->rowCount() > 0 ? true : false;
            } catch (\Throwable $th) {
                //throw $th;
            }
            return false;
      }
}