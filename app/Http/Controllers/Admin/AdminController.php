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


    public function initialize()
    {
        
    }


    public function onRequest(?string $action = null)
    {   
        if($this->auth_flag){
            return $this->checkAuth();
        }
        return true;
    }

    
    /**
     * 是否登录
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public  function checkAuth()
    {
        $session_cookie_val = $this->request->cookie(self::ADMIN_SESSION_COOKIE_ID);
        if(empty($session_cookie_val)){
            if($this->isJson()){
                $this->json(0, '请登录后操作');
            }else{
                $this->write("<script>window.location.href='/backend/access/login'</script>");
            }
            return false;
        }
        //
        $session_data = cache($session_cookie_val);
        if(empty($session_data)){
            if($this->isJson()){
                $this->json(0, '会话过期，请重试登录！');
            }else{
                $this->write("<script>window.location.href='/backend/access/login'</script>");
            }
            return false;
        }

        $this->auth_user_data = json_decode($session_data, true);
        return true;
    }

    /**
     * 是否json请求
     *
     * @author pingo
     * @created_at 00-00-00
     * @return boolean
     */
    protected function isJson():bool
    {
        $headers = $this->request()->getHeaders();
        if(!empty($headers)){
            foreach ($headers as $key => $header) {
                # code...
                $key = strtolower($key);
                if(FALSE !== strstr($key, "content-type")){
                    $content = array_shift($header);
                    if(is_string($content)){
                       if( FALSE !== strstr(strtolower($content), "json")) return true;
                    }
                }
            }
        }
        return false;
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
         
        $this->response()->withHeader('Content-type','application/json;charset=utf-8');
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
    public function jsonPage($code = 0, $count = 0, $data = null, $extra = [], $msg = 'success' )
    {
        $format = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
            'count' => $count,
            'extra' => $extra,
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

    /**
     * 服务数据处理结果
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $data
     * @return void
     */
    protected function __service(array $data)
    {
        $code = $data['flag'] ? 0 : -1;
        $this->json($code, $data['msg'], $data['data']);
    }
    
}
