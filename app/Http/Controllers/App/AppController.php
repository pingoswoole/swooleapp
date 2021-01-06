<?php
namespace App\Http\Controllers\App;

use App\Service\Common\JwtService;
use App\Utility\Status;
use duncan3dc\Laravel\BladeInstance;
use Pingo\Http\Controller;
use Pingo\Http\Request;
use Pingo\Http\Response;

/**
 * APP基控制器
 *
 * @author pingo
 * @created_at 00-00-00
 */
class AppController extends Controller
{

     
    //登录用户信息
    protected $auth_user_data = [];
    //是否鉴权
    protected $login_check = true;
    
    protected $post_data = [];
    protected $get_data  = [];
    protected $route_data = [];
    /**
     * 初始化
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function initialize()
    {
        $this->post_data = $this->request()->post();
        $content_type = $this->request()->getHeader('content-type');
        $content_type = array_shift($content_type);
        if($content_type){
            if(stripos($content_type, "json")){
                $this->post_data = json_decode($this->request()->getRaw(), true);
            }
        }
        $this->get_data = $this->request()->get();
        $this->route_data = $this->request()->route();
    }


    public function onRequest(?string $action = null)
    {   
        if($this->login_check){
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
        $headers = $this->request()->getHeaders();
        if(isset($headers['token'])){
            $token_res = (new JwtService)->decode('app', $headers['token'][0]);
            if(false !== $token_res){
                $this->auth_user_data = $token_res;
                return true;
            }
        }
        $this->json(Status::CODE_SESSION_EXP, '重新登录后操作');
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
    protected function json($code = 0, $msg = 'success', $data = null)
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
     * 服务数据处理结果
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $data
     * @return void
     */
    protected function __service(array $data)
    {
        $this->json($data['status'], $data['msg'], $data['data']);
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
    protected function jsonPage($code = 0, $count = 0, $data = null, $msg = 'success' )
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
        $template = "app/" . $template;
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
     * postdata
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] ...$args
     * @return void
     */
    protected function _post(...$args)
    {
        if(count($args) === 0 ) return $this->post_data;
        if(count($args) == 1 && is_string($args[0])){
            //单个参数
            return $this->post_data[$args[0]]?? null;
        }
        //
        if(count($args) === 1 ) $args = array_shift($args);
        $data = [];
        foreach ($args as $key => $name) {
            # code...
            if(isset($this->post_data[$name])){
                $data[$name] = $this->post_data[$name];
            }
        }
        return $data;
    }
     
    
}
