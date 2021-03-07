<?php
namespace App\Http\Controllers\App\Product;

use App\Http\Controllers\AppController;
use App\Service\App\OrderService;
use App\Utility\Status;
use Pingo\Validate\Validate;

class OrderController extends AppController
{
    /**
     * 生成购卡订单
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function createCoupon()
    {
        $quantity = $this->_post('quantity');
        $goods_id = $this->_post('goods_id');
        $quantity = intval($quantity);
        $goods_id = intval($goods_id);
        $paytype = $this->_post('paytype');
        
        $service_res = (new OrderService)->createCoupon($this->auth_user_data['id'], $goods_id, $quantity, $paytype);
        return $this->__service($service_res);
    }
    /**
     * 生成在线商城订单
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function createOnline()
    {
         
        $data = $this->_post('address', 'goodsList', 'paytype', 'remark');
        $rule = [
            'address'   => 'require',
            'goodsList'   => 'require',
            'paytype'   => 'require',
        ];
        $msg = [
            'address'        => '请选择收货地址',
            'goodsList'        => '请选择商品',
            'paytype'        => '请选择支付',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_res = (new OrderService)->createOnline($this->auth_user_data['id'], $data['address'], $data['goodsList'], $data['paytype'], $data['remark']);
        return $this->__service($service_res);
    }
    /**
     * 激活会员商品下单
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function createActiveOrder()
    {
         
        $data = $this->_post('address', 'goodsList', 'paytype', 'remark');
        $rule = [
            'address'   => 'require',
            'goodsList'   => 'require',
            'paytype'   => 'require',
        ];
        $msg = [
            'address'        => '请选择收货地址',
            'goodsList'        => '请选择商品',
            'paytype'        => '请选择支付',
        ];
        $validate   = Validate::make($rule,$msg);
        if (!$validate->check($data)) {
            return $this->json(Status::CODE_ERR, $validate->getError());
        }

        $service_res = (new OrderService)->createActiveOrder($this->auth_user_data['id'], $data['address'], $data['goodsList'], $data['paytype'], $data['remark']);
        return $this->__service($service_res);
    }
    
    /**
     * 代理升级单
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function createUpgradeAgent()
    {
        $paytype = $this->_post('paytype');
         
        $service_res = (new OrderService)->createUpgradeAgent($this->auth_user_data['id'], $paytype);
        return $this->__service($service_res);
    }

    public function getDeduction()
    {
        $goodsIds = $this->request()->get('goodsIds', "");
        $goods_ids = explode(",", $goodsIds);
        if(empty($goods_ids)){
            return $this->json(Status::CODE_ERR, '请选择商品');
        }
        $service_res = (new OrderService)->getDeduction($this->auth_user_data['id'], $goods_ids);
        return $this->__service($service_res);
    }

    public function getExpressFee()
    {
        $province = $this->request()->get('province', '');
        $service_res = (new OrderService)->getExpressFee($province);
        return $this->__service($service_res);
    }

    public function getOnlineShopOrderList()
    {
        $state = $this->request()->get("state", 1);
        $service_res = (new OrderService)->getOnlineShopOrderList($this->auth_user_data['id'], $state);
        return $this->__service($service_res);
    }

    public function rePayOnline()
    {
        $id = $this->_post("id");
        $service_res = (new OrderService)->rePayOnline($this->auth_user_data['id'], $id);
        return $this->__service($service_res);
    }

    public function deleteOnline()
    {
        $id = $this->_post("id");
        $service_res = (new OrderService)->deleteOnline($this->auth_user_data['id'], $id);
        return $this->__service($service_res);
    }
    
    public function finishOnline()
    {
        $id = $this->_post("id");
        $service_res = (new OrderService)->finishOnline($this->auth_user_data['id'], $id);
        return $this->__service($service_res);
    }
    


}