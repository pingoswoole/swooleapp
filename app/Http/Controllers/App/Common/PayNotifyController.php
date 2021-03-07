<?php
namespace App\Http\Controllers\App\Common;

use App\Http\Controllers\AppController;
use App\Logic\App\PayNotifyLogic;
use App\Logic\Common\PaymentLogic;
use App\Service\App\PlatformService;
use App\Service\Common\SettingService;
use App\Utility\Status;
use Pingo\Validate\Validate;

use function GuzzleHttp\Promise\settle;

/**
 *  支付异步处理
 * @author pingo
 * @created_at 00-00-00
 */
class PayNotifyController extends AppController
{
    protected $login_check = false;
    /**
     * 异步通知
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function notify()
    {
        $type = $this->request()->route('name');
        if($type === 'alipay'){
            $data = $this->request()->post();
        }else{
            $data = $this->request()->getRaw();
        }
         
        $result = (new PaymentLogic)->notify($type, $data);
        return $this->response()->write($result);
    }


}