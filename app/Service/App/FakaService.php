<?php
namespace App\Service\App;

use App\Model\Member\Member;
use App\Model\Product\Faka;
use App\Utility\Status;

class FakaService extends Base
{
    protected $model_class = Faka::class;

    public function getDesc():array
    {
        try {
            //code...
            $payment_set = setting('payment');
            $result = [
                'faka_vip_url' => $payment_set['faka_vip_url']??'',
                'faka_svip_url' => $payment_set['faka_svip_url']??'',
                'faka_intro' => $payment_set['faka_intro']??'',
            ];
            
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, '修改失败');
    }

    /**
     * 卡密升级会员
     *
     * @param integer $mid
     * @param integer $grade 1：vip，2：svip
     * @param string $key 卡号
     * @return array
     */
    public function upgrade(int $mid, int $grade = 1, string $key = ''): array
    {
        try {
            //code...
            
            if (!in_array($grade, [1, 2])) {
                return $this->_result(Status::CODE_ERR, '级别错误');
            }
            $model = $this->model->initConnect();
            $pdo = $model->getPdo();
            $MemberModel = (new \App\Model\Member\Member())->setPdo($pdo);
            $member = $MemberModel->where('id', $mid)->first();
            if ($member['grade'] >= $grade) {
                return $this->_result(Status::CODE_OK, '您已升级');
            }
            $faka = $model->where('number', $key)->first();
            if (!$faka || $faka['state'] == 1) {
                return $this->_result(Status::CODE_ERR, '卡密错误');
            }
            if ($faka['type'] != $grade) {
                return $this->_result(Status::CODE_ERR, '卡密不匹配该等级');
            }
            $MemberModel->beginTransaction();
            $faka_field['state'] = 1;
            $faka_field['mid'] = $mid;
            $res1 = $model->where('id', $faka['id'])->update($faka_field);
            $res2 = $MemberModel->where('id', $mid)->update(['grade' => $grade]);
            if ($res1 && $res2) {
                $MemberModel->commit();
                return $this->_result(Status::CODE_OK, '升级成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            $MemberModel->rollBack();
        }
        return $this->_result(Status::CODE_ERR, '升级失败');
    }
}
