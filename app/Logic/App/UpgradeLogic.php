<?php
namespace App\Logic\App;

class UpgradeLogic
{   
    /**
     * 判断上级是否符合升级运营商
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $from_mid
     * @return void
     */
    public function updateOperator(int $from_mid)
    {
        try {
            //code...
            $model = model();
            $member = $model->get('member', ['pid'], ['id' => $from_mid]);
            
            if(!empty($member['pid'])){
                
                $pmember = $model->get('member', ['pid', 'grade'], ['id' => $member['pid']]);
                 
                if($pmember && $pmember['grade'] == 2 ){
                     
                    $distribution = setting('distribution');
                    $vip_num = $model->count('member', ['pid' => $member['pid'], 'grade' => 1]);
                    $agent_num = $model->count('member', ['pid' => $member['pid'], 'grade' => 2]);
                    if($vip_num >= $distribution['upgrade_operator_need_vip'] && $agent_num >= $distribution['upgrade_operator_need_agent']){
                        $model->update('member', ['grade' => 3], ['id' => $member['pid'], 'grade' => 2]);
                    }
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
           
        }

    }

}