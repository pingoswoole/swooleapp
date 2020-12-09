<?php
namespace App\Http\Controllers\Admin;
use duncan3dc\Laravel\BladeInstance;
use Pingo\Http\Controller;
use Pingo\Http\Request;
use Pingo\Http\Response;

/**
 * 管理后台基控制器
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AdminController extends Controller
{
   /*  public $middleware = ['__construct' => 
    [
        \App\Http\Middleware\Auth::class . "::run",
        ]
    ]; */

    public function initialize()
    {
         
    }
    /**
     * JSON
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $code
     * @param string $msg
     * @param [type] $data
     * @return void
     */
    public function json($code = 0, $msg = 'success', $data = null)
    {
        $format = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data
        ];
        $this->swoole_response->header('Content-type', 'application/json');
        $this->write(json_encode($format, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
    }

    /**
     * 分页数据返回
     *
     * @author pingo
     * @created_at 00-00-00
     * @param integer $code
     * @param integer $count
     * @param [type] $data
     * @param string $msg
     * @return void
     */
    public function jsonPage($code = 0, $count = 0, $data = null, $msg = 'success' )
    {
        $format = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
            'count' => $count,
        ];
        $this->swoole_response->header('Content-type', 'application/json');
        $this->write(json_encode($format, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
    }
    /**
	 * 渲染数据
	 *
	 * @author pingo
	 * @created_at 00-00-00
	 * @param string $template
	 * @param array $data
	 * @return void
	 */
	public function render(string $template, array $data = [])
    {
        $blade = new BladeInstance(WEB_VIEW_PATH, WEB_VIEW_CACHE_PATH);
        $template = "admin/" . $template;
        $content =  $blade->render($template, $data);
        $this->response->write($content);
    }
     
}
