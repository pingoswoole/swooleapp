<?php
namespace App\Service\App;

use App\Logic\App\CommissionLogic;
use App\Logic\App\UpgradeLogic;
use App\Logic\Common\PaymentLogic;
use App\Utility\Status;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;
class OrderService extends Base 
{
   

    public function __construct()
    {
         
    }
    
    /**
     * 购卡下单
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param integer $goods_id
     * @param integer $quantity
     * @param integer $pay_channel 支付类型  ['alipay','wechat','union','offline','assets','other']
     * @return void
     */
    public function createCoupon(int $mid, int $goods_id, int $quantity = 1, string $pay_channel = 'offline')
    {
        try {
            //code...
            //订单生成
            //coupon_shop_order
            //coupon_shop_order_goods
            //member_asset_log
            $model = model();
            $model->beginTransaction();
            $coupon_shop_goods_item = $model->get('coupon_shop_goods', "*", ['id' => $goods_id, 'state' => 1]);
            if(empty($coupon_shop_goods_item)) throw new \Exception("商品不存在"); 
            //获取用户信息
            $member_item = $model->get('member', "*", ['id' => $mid]);
            if(empty($member_item)) throw new \Exception("用户不存在"); 
            if($member_item['grade'] <= 1 ) throw new \Exception("请升级代理商在购买！"); 
            //
            $ordersn = make_order_no($mid);
            $order_title = $coupon_shop_goods_item['title'];
             
            $orderInfo = null;
            $price = $coupon_shop_goods_item['price'];
            if($member_item['grade'] == 2){
                //代理商
                $total_fee =  $coupon_shop_goods_item['agent_price'];
            }
            if($member_item['grade'] == 3){
                //运营商
                $total_fee =   $coupon_shop_goods_item['operator_price'];
            }
            $total_fee = $price * $quantity;
            //订单入库
            $coupon_shop_order_field['mid'] = $mid;
            $coupon_shop_order_field['ordersn'] = $ordersn;
            $coupon_shop_order_field['total_fee'] = $total_fee;
            $coupon_shop_order_field['title'] = $order_title;
            $coupon_shop_order_field['total'] = $quantity;
            $coupon_shop_order_field['thumb'] = $coupon_shop_goods_item['thumb'];
            $coupon_shop_order_field['description'] = $coupon_shop_goods_item['description'];
            $coupon_shop_order_field['state'] = 0;
            $coupon_shop_order_field['created_at'] = time();
            $coupon_shop_order_id = $model->insert('coupon_shop_order', $coupon_shop_order_field);
            //支付日记
            $extra = 'coupon';
            $payment_log_field['provider'] = $pay_channel;
            $payment_log_field['ordersn'] = $ordersn;
            $payment_log_field['out_trade_no'] = $ordersn;
            $payment_log_field['total_fee'] = $total_fee;
            $payment_log_field['callback'] = '\App\Logic\App\PayNotifyLogic';
            $payment_log_field['order_id'] = $coupon_shop_order_id;
            $payment_log_field['state'] = 0;
            $payment_log_field['user_id'] = $mid;
            $payment_log_field['extra'] = 'coupon';
            $payment_log_field['created_at'] = time();
            $payment_log_id = $model->insert('payment_log', $payment_log_field);
            //订单商品表
            $coupon_shop_order_goods_field['goods_id'] = $goods_id;
            $coupon_shop_order_goods_field['order_id'] = $coupon_shop_order_id;
            $coupon_shop_order_goods_field['title'] = $order_title;
            $coupon_shop_order_goods_field['price'] = $price;
            $coupon_shop_order_goods_field['deduction_price'] = $coupon_shop_goods_item['deduction_price'];
            $coupon_shop_order_goods_field['expired_at'] = $coupon_shop_goods_item['expires'] * 86400 + time();
            $coupon_shop_order_goods_field['created_at'] = time();
            $coupon_order_goods_fields = [];
            for ($i=0; $i < $quantity; $i++) { 
                # code...
                $coupon_order_goods_fields[] = $coupon_shop_order_goods_field;
            }
            $coupon_shop_order_goods_id = $model->insert("coupon_shop_order_goods", $coupon_order_goods_fields);
             
            $result = [];
            switch ($pay_channel) {
                case 'offline':
                    # 测试用
                    

                    break;
                case 'alipay':
                    //支付宝
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_amount' => $total_fee, //精确元
                        'subject'       => $order_title,
                        'biz_content'   => $extra,
                        //'notify_url'    => $base_notify_url . 'alipay',
                    ];
                    $orderInfo = Pay::alipay(PaymentLogic::getConfig('alipay'))->app($order)->getContent();
                    $result = ['orderInfo' => $orderInfo];
                    break;
                case 'wechat':
                    //微信
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_fee' => $total_fee * 100, // **单位：分**
                        'body'      => $order_title,
                        'attach'    => $extra,
                        //'notify_url' => $base_notify_url . 'weixin'
                    ];
            
                    $orderInfo = Pay::wechat(PaymentLogic::getConfig('wechat'))->app($order)->getContent();
                    $orderInfo = json_decode($orderInfo, true);
                    $result = ['orderInfo' => $orderInfo];
                    break;
                default:
                    # code...
                    break;
            }
             
            if($coupon_shop_order_id > 0 && $payment_log_id > 0 && $coupon_shop_order_goods_id > 0){
                $model->commit();
                return $this->_result(Status::CODE_OK, '订单已生成', $result);
            }
            $model->rollback();
            return $this->_result(Status::CODE_ERR, '订单生成失败');
        } catch (\Throwable $th) {
            //throw $th;
           // var_dump(PaymentLogic::getConfig('alipay'), $th->getMessage(), $th->getLine(), $th->getFile(), $th->getCode());
            $model->rollback();
            return  $this->_result(Status::CODE_SYS_ERR, $th->getMessage());

        }
         
    }

    /**
     * 创建激活会员订单商品
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param [type] $address
     * @param array $goodsList
     * @param [type] $pay_channel
     * @param string $remark
     * @return void
     */
    public function createActiveOrder(int $mid, $address, array $goodsList, $pay_channel, $remark = '')
    {
        try {
            //code...
            $model = model();
            $model->beginTransaction();
             
            //计算总价、使用优惠券
            $total_fee = 0;
            $total_num = 1;
            $goods_ids = [$goodsList[0]['id']];
            $goods_quantitys = array_column($goodsList, 'quantity', 'id');
            
            $shop_goods_item = $model->get('online_shop_goods', "*", ['id' => $goodsList[0]['id'], 'state' => 1]);
            if(!$shop_goods_item) throw new \Exception('请选择商品！');
            $total_fee = $shop_goods_item['price'];
            $deduction = $this->_getDeduction($mid,  $goods_ids);
            //计算邮费
            $default_express_fee = 150;
            if(isset($address['province'])){
                $province_list = config('app.province');
                if(in_array($address['province'], $province_list)){
                    $web_set = setting('web');
                    $province_key = array_search($address['province'], $province_list);
                    if(isset($web_set['normal_express_area'][$province_key])){
                        $default_express_fee = $web_set['normal_express_fee'];
                    }
                    if(isset($web_set['special_express_area'][$province_key])){
                        $default_express_fee = $web_set['special_express_fee'];
                    }
                }
            }
            $default_express_fee = floatval($default_express_fee);
            $total_fee = sprintf("%.2f", $total_fee - ($deduction['total_deduction']?? 0) + $default_express_fee);
             
            if($total_fee <= 0) throw new \Exception('价格计算出错！');
            $order_title = $shop_goods_item['title'];
            
            $ordersn = make_order_no($mid);
            //添加订单表
            $order['mid'] = $mid;
            $order['ordersn'] = $ordersn;
            $order['total_fee'] = $total_fee;
            $order['title'] = $order_title;
            $order['address'] = json_encode($address);
            $order['total'] = $total_num;
            $order['remark'] = $remark;
            $order['created_at'] = time();
            $order_id = $model->insert('online_shop_order', $order);
            //添加订单商品表
            $order_goods_field['order_id'] = $order_id;
            $order_goods_field['goods_id'] = $shop_goods_item['id'];
            $order_goods_field['title'] = $shop_goods_item['title'];
            $order_goods_field['short_title'] = $shop_goods_item['short_title'];
            $order_goods_field['price'] = $shop_goods_item['price'];
            $order_goods_field['thumb'] = $shop_goods_item['thumb'];
            $order_goods_field['quantity'] =  1;
            $order_goods_field['created_at'] = time();
            
            $order_goods_id = $model->insert('online_shop_order_goods', $order_goods_field);
            //添加支付
            $extra = 'onlineshop';
            $payment_log_field['provider'] = $pay_channel;
            $payment_log_field['ordersn'] = $ordersn;
            $payment_log_field['out_trade_no'] = $ordersn;
            $payment_log_field['total_fee'] = $total_fee;
            $payment_log_field['callback'] = '\App\Logic\App\PayNotifyLogic';
            $payment_log_field['order_id'] = $order_id;
            $payment_log_field['state'] = 0;
            $payment_log_field['user_id'] = $mid;
            $payment_log_field['extra'] = $extra;
            $payment_log_field['created_at'] = time();
            $payment_log_id = $model->insert('payment_log', $payment_log_field);
            //更新优惠券已使用
            if($deduction['coupon_goods_id']) $model->update('coupon_shop_order_goods', ['use_time' => time(), 'online_shop_order_id' => $order_id, 'updated_at' => time()], ['id' => $deduction['coupon_goods_id']]);
            
            $result['ordersn'] = $ordersn;
            $result['total_fee'] = $total_fee;
            $result['pay_channel'] = $pay_channel;

            switch ($pay_channel) {
                case 'offline':
                    # 测试用
                   

                    break;
                case 'alipay':
                    //支付宝
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_amount' => $total_fee, //精确元
                        'subject'       => $order_title,
                        'biz_content'   => $extra,
                         
                    ];
                    $orderInfo = Pay::alipay(PaymentLogic::getConfig('alipay'))->app($order)->getContent();
                    $result = ['orderInfo' => $orderInfo];
                    break;
                case 'wechat':
                    //微信
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_fee' => $total_fee * 100, // **单位：分**
                        'body'      => $order_title,
                        'attach'    => $extra,
                         
                    ];
            
                    $orderInfo = Pay::wechat(PaymentLogic::getConfig('wechat'))->app($order)->getContent();
                    $orderInfo = json_decode($orderInfo, true);
                    $result = ['orderInfo' => $orderInfo];
                    break;
                default:
                    # code...
                    break;
            }
             
            if($order_id > 0 && $payment_log_id > 0 && $order_goods_id > 0){
                $model->commit();
                return $this->_result(Status::CODE_OK, '订单已生成', $result);
            }

            $model->rollback();
            return $this->_result(Status::CODE_ERR, '订单生成失败');

        } catch (\Throwable $th) {
            //throw $th;
            $model->rollback();
            return  $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
        }
    }
    /**
     * 在线下单
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param [type] $address
     * @param [type] $goodsList
     * @param [type] $pay_channel
     * @param string $remark
     * @return void
     */
    public function createOnline(int $mid, $address, array $goodsList, $pay_channel, $remark = '')
    {
        try {
            //code...
            $model = model();
            $model->beginTransaction();
             
            //计算总价、 
            $total_fee = 0;
            $total_num = 0;
            $goods_ids = array_column($goodsList, 'id');
            $goods_quantitys = array_column($goodsList, 'quantity', 'id');
            
            $shop_goods_list = $model->select('online_shop_goods', "*", ['id' => $goods_ids, 'state' => 1]);
            if(!$shop_goods_list) throw new \Exception('请选择商品！');
            $shop_goods_price = array_column($shop_goods_list, 'price', 'id');
            foreach ($goodsList as $key => $row) {
                # code...
                if(isset($shop_goods_price[$row['id']])){
                    $total_fee += sprintf("%.2f", $row['quantity'] * $shop_goods_price[$row['id']]);
                    $total_num += $row['quantity'];
                } 
            }
            //$deduction = $this->_getDeduction($mid,  $goods_ids);
            //计算邮费
            $default_express_fee = 150;
            if(isset($address['province'])){
                $province_list = config('app.province');
                if(in_array($address['province'], $province_list)){
                    $web_set = setting('web');
                    $province_key = array_search($address['province'], $province_list);
                    if(isset($web_set['normal_express_area'][$province_key])){
                        $default_express_fee = $web_set['normal_express_fee'];
                    }
                    if(isset($web_set['special_express_area'][$province_key])){
                        $default_express_fee = $web_set['special_express_fee'];
                    }
                }
            }
            $default_express_fee = floatval($default_express_fee);
            $total_fee = $total_fee  + $default_express_fee;
            if($total_fee <= 0) throw new \Exception('价格计算出错！');
            $order_title = '商品订单';
            $shop_goods_titles = array_column($shop_goods_list, 'title');
            if($shop_goods_titles){
                $shop_goods_titles = implode(",", $shop_goods_titles);
                //utf8 中文一个字符3个长度  
                $order_title = substr_char($shop_goods_titles, 100);
            }
            
            $ordersn = make_order_no($mid);
            //添加订单表
            $order['mid'] = $mid;
            $order['ordersn'] = $ordersn;
            $order['total_fee'] = $total_fee;
            $order['title'] = $order_title;
            $order['address'] = json_encode($address);
            $order['total'] = $total_num;
            $order['remark'] = $remark;
            $order['created_at'] = time();
            $order_id = $model->insert('online_shop_order', $order);
            //添加订单商品表
            $order_goods_field = array_map(function($goods) use($order_id, $goods_quantitys) {
                $field['order_id'] = $order_id;
                $field['goods_id'] = $goods['id'];
                $field['title'] = $goods['title'];
                $field['short_title'] = $goods['short_title'];
                $field['price'] = $goods['price'];
                $field['thumb'] = $goods['thumb'];
                $field['quantity'] = $goods_quantitys[$goods['id']]?? 1;
                $field['created_at'] = time();
                return $field;
            }, $shop_goods_list );
            
            $order_goods_id = $model->insert('online_shop_order_goods', $order_goods_field);
            //添加支付
            $extra = 'onlineshop';
            $payment_log_field['provider'] = $pay_channel;
            $payment_log_field['ordersn'] = $ordersn;
            $payment_log_field['out_trade_no'] = $ordersn;
            $payment_log_field['total_fee'] = $total_fee;
            $payment_log_field['callback'] = '\App\Logic\App\PayNotifyLogic';
            $payment_log_field['order_id'] = $order_id;
            $payment_log_field['state'] = 0;
            $payment_log_field['user_id'] = $mid;
            $payment_log_field['extra'] = $extra;
            $payment_log_field['created_at'] = time();
            $payment_log_id = $model->insert('payment_log', $payment_log_field);

            $result['ordersn'] = $ordersn;
            $result['total_fee'] = $total_fee;
            $result['pay_channel'] = $pay_channel;

            switch ($pay_channel) {
                case 'offline':
                    # 测试
                    
                    break;
                case 'alipay':
                    //支付宝
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_amount' => $total_fee, //精确元
                        'subject'       => $order_title,
                        'biz_content'   => $extra,
                         
                    ];
                    $orderInfo = Pay::alipay(PaymentLogic::getConfig('alipay'))->app($order)->getContent();
                    $result = ['orderInfo' => $orderInfo];
                    break;
                case 'wechat':
                    //微信
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_fee' => $total_fee * 100, // **单位：分**
                        'body'      => $order_title,
                        'attach'    => $extra,
                         
                    ];
            
                    $orderInfo = Pay::wechat(PaymentLogic::getConfig('wechat'))->app($order)->getContent();
                    $orderInfo = json_decode($orderInfo, true);
                    $result = ['orderInfo' => $orderInfo];
                    break;
                default:
                    # code...
                    break;
            }
             
            if($order_id > 0 && $payment_log_id > 0 && $order_goods_id > 0){
                $model->commit();
                return $this->_result(Status::CODE_OK, '订单已生成', $result);
            }

            $model->rollback();
            return $this->_result(Status::CODE_ERR, '订单生成失败');

        } catch (\Throwable $th) {
            //throw $th;
            $model->rollback();
            return  $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
        }


    }

    private function _getDeduction(int $mid, array $goods_ids):array 
    {
        try {
            //code...
            $result['coupon_goods_id'] = [];
            $result['total_deduction'] = 0;
            //查询卡券商品库绑定的在线商品
            $model = model();
            $coupon_shop_goods_list = $model->select('coupon_shop_goods', ['deduction_price', 'id', 'onlineshop_goodsid'], ['onlineshop_goodsid' => $goods_ids, 'state' => 1]);
            if($coupon_shop_goods_list){
                $coupon_goods_ids = array_column($coupon_shop_goods_list, 'id');
                $order_goods_where = [
                    'goods_id' => $coupon_goods_ids, 
                    'use_mid' => $mid, 
                    'expired_at[>]' => time(),
                    'use_time' => 0,
                ];
                $order_goods_list = $model->select('coupon_shop_order_goods', "*", $order_goods_where);
                //var_dump($model->log(), $coupon_shop_goods_list, $goods_ids);
                if($order_goods_list){
                   
                    $result['coupon_goods_id'] = array_column($order_goods_list, 'id');
                    $result['total_deduction'] = array_sum(array_column($order_goods_list, 'deduction_price'));
                }
                //var_dump($total_deduction, $model->log());
                return $result;
            }
        } catch (\Throwable $th) {
            //throw $th;
           
        }
        return $result;
         
    }

    public function getDeduction(int $mid, array $goods_ids)
    {
        try {
            //code...
            $result = [
                'total_deduction' => $this->_getDeduction($mid, $goods_ids)['total_deduction'],
            ];
            return $this->_result(Status::CODE_OK, 'success', $result);
            
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_SYS_ERR, 'error');
        }
         
    }


    public function getExpressFee(string $province = '')
    {
        //计算邮费
        $default_express_fee = 150;
        if(!empty($province)){
            $province_list = config('app.province');
            if(in_array($province, $province_list)){
                $web_set = setting('web');
                $province_key = array_search($province, $province_list);
                if(isset($web_set['normal_express_area'][$province_key])){
                    $default_express_fee = $web_set['normal_express_fee'];
                }
                if(isset($web_set['special_express_area'][$province_key])){
                    $default_express_fee = $web_set['special_express_fee'];
                }
            }
        }
        $default_express_fee = floatval($default_express_fee);
        $result = [
            'express_fee' => $default_express_fee
        ];
        return $this->_result(Status::CODE_OK, 'success', $result);
    }
    /**
     * 升级代理商
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param string $pay_channel
     * @return void
     */
    public function createUpgradeAgent(int $mid, $pay_channel = 'alipay')
    {
        try {
            //code...
            $model = model();
            $member = $model->get('member', ['id', 'grade', 'pid'], ['id' => $mid]);
            if(!$member) throw new \Exception('用户不存在');
            if($member['grade'] >=2 ) throw new \Exception('您已经是代理商');
            //if($member['grade'] == 0 ) throw new \Exception('请升级会员');
            $ordersn = make_order_no($mid);
            $order_title = '代理商权限升级';
            $total_fee = floatval(setting("distribution.upgrade_agent_fee"));
            //支付日记
            $extra = 'upgrade_agent';
            $payment_log_field['provider'] = $pay_channel;
            $payment_log_field['ordersn'] = $ordersn;
            $payment_log_field['out_trade_no'] = $ordersn;
            $payment_log_field['total_fee'] = $total_fee;
            $payment_log_field['callback'] = '\App\Logic\App\PayNotifyLogic';
            $payment_log_field['order_id'] = 0;
            $payment_log_field['state'] = 0;
            $payment_log_field['user_id'] = $mid;
            $payment_log_field['extra'] = $extra;
            $payment_log_field['created_at'] = time();
            $payment_log_id = $model->insert('payment_log', $payment_log_field);
             
            $result = [];
            switch ($pay_channel) {
                case 'offline':
                    # 测试用
                     

                    break;
                case 'alipay':
                    //支付宝
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_amount' => $total_fee, //精确元
                        'subject'       => $order_title,
                        'biz_content'   => $extra,
                        //'notify_url'    => $base_notify_url . 'alipay',
                    ];
                    $orderInfo = Pay::alipay(PaymentLogic::getConfig('alipay'))->app($order)->getContent();
                    $result = ['orderInfo' => $orderInfo];
                    break;
                case 'wechat':
                    //微信
                    $order = [
                        'out_trade_no' => $ordersn,
                        'total_fee' => $total_fee * 100, // **单位：分**
                        'body'      => $order_title,
                        'attach'    => $extra,
                        //'notify_url' => $base_notify_url . 'weixin'
                    ];
            
                    $orderInfo = Pay::wechat(PaymentLogic::getConfig('wechat'))->app($order)->getContent();
                    $orderInfo = json_decode($orderInfo, true);
                    $result = ['orderInfo' => $orderInfo];
                    break;
                default:
                    # code...
                    break;
            }


            return $this->_result(Status::CODE_OK, '提交成功', $result);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, $th->getMessage());
        }
        
    }
    /**
     * 获取订单
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $mid
     * @param integer $state 1：已完成 2待付款 3待发货 4待收货
     * @return void
     */
    public function getOnlineShopOrderList(int $mid, int $state = 1)
    {
        //数据库表 state状态【0：未付款，1：待发货，2：待收货，3：已完成，4：售后】
        try {
            //code...
            $where['online_shop_order.state'] = 0;
            $where['online_shop_order.mid'] = $mid;
            switch ($state) {
                case 1:
                    # code...
                    $where['online_shop_order.state'] = 3;
                    break;
                case 2:
                    # code...
                    $where['online_shop_order.state'] = 0;
                    break;
                case 3:
                    # code...
                    $where['online_shop_order.state'] = 1;
                    break;
                case 4:
                    # code...
                    $where['online_shop_order.state'] = 2;
                    break;
                            
                default:
                    # code...
                    break;
            }
            $where['ORDER'] = ['online_shop_order.id' => 'DESC'];
            $result['count'] = 0;
            $result['list'] = [];
            
            $model = model();
            $column = [
                'online_shop_order.id',
                'online_shop_order.ordersn',
                'online_shop_order.state',
                'online_shop_order.total_fee',
                'online_shop_order_goods.title',
                'online_shop_order_goods.price',
                'online_shop_order_goods.thumb',
                'online_shop_order_goods.quantity',
                'online_shop_order_goods.order_id',
            ];
            $join = [
                '[<]online_shop_order_goods' => ['id' => 'order_id']
            ];
            $order_list = $model->select("online_shop_order", $join, $column, $where);
            if($order_list){
                $list = [];
                foreach ($order_list as $key => $row) {
                    # code...
                    $list[$row['order_id']]['id'] = $row['id'];
                    $list[$row['order_id']]['state'] = $row['state'];
                    $list[$row['order_id']]['ordersn'] = $row['ordersn'];
                    $list[$row['order_id']]['total_fee'] = $row['total_fee'];
                    $list[$row['order_id']]['list'][] = $row;
                }
                $result['count'] = count($list);
                $result['list'] = array_values($list);
            }
            return  $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, '操作失败', $th->getMessage());
        }

    }
    

    public function rePayOnline(int $mid, int $order_id)
    {
        try {
            //code...
            $model = model();
            $result = [];
            return  $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, '操作失败', $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR);
    }

    public function deleteOnline(int $mid, int $order_id)
    {
        try {
            //code...
            $model = model();
            $model->beginTransaction();
            $orderDelPdoStmt = $model->delete('online_shop_order', ['id' => $order_id, 'mid' => $mid, 'state' => 0]);
            $orderGoodsDelPdoStmt = $model->delete('online_shop_order_goods', ['order_id' => $order_id]);
            if($orderDelPdoStmt->rowCount() > 0 && $orderGoodsDelPdoStmt->rowCount() > 0){
                $model->commit();
                return $this->_result(Status::CODE_OK);
            }
            $model->rollback();
        } catch (\Throwable $th) {
            //throw $th;
            $model->rollback();
            return $this->_result(Status::CODE_ERR, '操作失败', $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR);
    }

    public function finishOnline(int $mid, int $order_id)
    {
        try {
            //code...
            $model = model();
            $orderDelPdoStmt = $model->update('online_shop_order', ['state' => 3, 'updated_at' => time()], ['id' => $order_id, 'mid' => $mid, 'state' => 2]);
            if($orderDelPdoStmt->rowCount() > 0){
                return  $this->_result(Status::CODE_OK);
            }
            
        } catch (\Throwable $th) {
            //throw $th;
            return $this->_result(Status::CODE_ERR, '操作失败', $th->getMessage());
        }
        return $this->_result(Status::CODE_ERR);
    }


}