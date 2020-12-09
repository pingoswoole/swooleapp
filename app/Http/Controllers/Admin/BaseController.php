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
class BaseController extends Controller
{
    public $middleware = ['__construct' => 
    [
        \App\Http\Middleware\Auth::class . "::run",
        ]
    ];

    public function initialize()
    {

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
