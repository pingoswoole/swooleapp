<?php
namespace App\Service\App;

use App\Utility\Status;

class Base
{
    protected $model; //默认模型实例

    protected $model_class = null; //默认模型类


    public function __construct()
    {
            if($this->model_class){
                $this->model = new $this->model_class;
            }
    }
    
     /**
     * 返回消息
     *
     * @author pingo
     * @created_at 00-00-00
     * @param boolean $flag
     * @param string $msg
     * @param array $data
     * @return void
     */
    public function _result(int $status = Status::CODE_OK, string $msg = '', $data = [], $err_code = 0, $err_msg = null): array
    {
        if(empty($msg)){
            switch ($status) {
                case Status::CODE_OK:
                    # code...
                    $msg = '操作成功';
                    break;
                case Status::CODE_ERR:
                    # code...
                    $msg = '操作失败';
                    break;
                case Status::CODE_RULE_ERR:
                    # code...
                    $msg = '权限不足';
                    break;
                    case Status::CODE_SESSION_EXP:
                        # code...
                        $msg = '登录过期';
                        break;
                case Status::CODE_SYS_ERR:
                    # code...
                    $msg = '系统异常';
                    break;
                        
                default:
                    # code...
                    break;
            }
        }
        return [
            'status'   => $status,
            'msg'      => $msg,
            'data'     => $data,
            'err_code' => $err_code,
            'err_msg'  => $err_msg,
        ];
    }
}