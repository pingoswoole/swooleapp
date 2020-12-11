<?php
namespace App\Http\Controllers\Admin;

use App\Utility\Status;
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

    const ADMIN_SESSION_COOKIE_ID = 'PingoSwooleAdminSession';
    //登录用户信息
    protected $auth_user_data = [];
    //是否鉴权
    protected $auth_flag = true;
    /**
     * 验证器
     *
     * @var array
     * @author pingo
     * @created_at 00-00-00
     */
    public $middleware = ['__construct' => 
    [
            \App\Http\Middleware\AdminAuth::class . "::run",
        ]
    ];

    public function onRequest(?string $action = null)
    {   
        if($this->auth_flag){
            return $this->checkAuth();
        }
        return true;
    }
    public function initialize()
    {
        $this->checkAuth();
    }

    public  function checkAuth()
    {
        $session_cookie_val = $this->request->cookie(self::ADMIN_SESSION_COOKIE_ID);
        if(empty($session_cookie_val)){
            var_dump($this->isPost(), $this->isGet(), $this->request()->getServer(), $this->request()->getBody()->__toString());
           // $this->write("<script>alert(22)</script>");
            //$this->write("getSwooleResponse");
            //$this->response()->withHeader('location','/backend/access/login');
             
           /*  return $response->json([
                'code' => Status::CODE_VERIFY_ERR,
                'msg'  => '请登录后操作',
            ]); */
            return false;
        }
        //
        $session_data = cache($session_cookie_val);
        if(empty($session_data)){
           /*  return $this->json([
                'code' => Status::CODE_VERIFY_ERR,
                'msg'  => '会话过期，请重试登录！',
            ]); */
            return false;
        }

        return true;
        //$this->auth_user_data = json_decode($user_data, true);
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
        $this->response()->withHeader('Content-type', 'application/json');
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
        $this->write($content);
    }

    // 获取 page limit 信息
	public function getPage()
	{
		$data = $this->request->get(['page', 'limit']);
		$data['page'] =  $data['page']?:1;
		$data['limit'] =  $data['limit']?:10;
		return $data;
    }
    
    public function show404()
    {
        $this->render('default.404');
    }

    
}
