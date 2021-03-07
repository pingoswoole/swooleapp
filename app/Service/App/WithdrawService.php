<?php
namespace App\Service\App;

use App\Utility\Status;
use Carbon\Carbon;

class WithdrawService extends Base
{

     /**
      * 每个月提现一次
      *
      * @author pingo
      * @created_at 00-00-00
      * @param integer $mid
      * @param [type] $money
      * @param [type] $bankcard_id
      * @return array
      */
      public function withdraw(int $mid, $money, $bankcard_id):array
      {
           
            try {
                //code...
                $model = model();
                $model->beginTransaction();
                //本月是否有提现
                $last_withdraw_item = $model->get('member_withdraw', '*', ['mid' => $mid, 'ORDER' => ['id' => 'DESC']]);
                if($last_withdraw_item){
                    $now_month = date("m");
                    $last_withdraw_month = date("m", $last_withdraw_item['created_at']);
                    if($now_month == $last_withdraw_month){
                        throw new \Exception('每个月只能提现一次，月底统一审核');
                    }
                }
                $member_asset = $model->get('member_asset', ['commission'], ['mid' => $mid]);
                if($member_asset && $member_asset['commission'] >= $money ){
                    $pdoStmt = $model->update('member_asset', ['commission[-]' => $money], ['mid' => $mid]);
                    if($pdoStmt->rowCount() > 0){
                        $member_asset_log_field['mid'] = $mid;
                        $member_asset_log_field['title'] = '佣金提现';
                        $member_asset_log_field['flow'] = 0;
                        $member_asset_log_field['money'] = $money;
                        $member_asset_log_field['from_type'] = 'withdraw';
                        $member_asset_log_field['asset_type'] = 'commission';
                        $member_asset_log_field['created_at'] = time();
                        $asset_log_id = $model->insert('member_asset_log', $member_asset_log_field);

                        $bank_info = $model->get("member_bank_card", ['bank_type', 'bank_name', 'bank_username', 'bank_no'], ['mid' => $mid, 'id' => $bankcard_id]);
                        $member_withdraw_field['mid'] = $mid;
                        $member_withdraw_field['money'] = $money;
                        $member_withdraw_field['state'] = 0;
                        $member_withdraw_field['bank_info'] = json_encode($bank_info);
                        $member_withdraw_field['created_at'] = time();
                        $member_withdraw_id = $model->insert('member_withdraw', $member_withdraw_field);
                        if($member_withdraw_id > 0 && $asset_log_id > 0){
                            $model->commit();
                            return $this->_result(Status::CODE_OK, '提现成功，待审核。');
                        }
                    }
                }

                $model->rollback();
            } catch (\Throwable $th) {
                //throw $th;
                $model->rollback();
               return $this->_result(Status::CODE_SYS_ERR, $th->getMessage());
            }
            return $this->_result(Status::CODE_ERR, '提现失败，余额不足！');
      }
       

}