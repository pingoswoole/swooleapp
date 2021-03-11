<?php
namespace App\Http\Controllers\Admin\Home;

use App\Http\Controllers\AdminController;
use App\Service\Admin\Common\DashboardService;

/**
 * 首页
 *
 * @author pingo
 * @created_at 00-00-00
 */
class IndexController extends AdminController
{

    /**
     * initMenu
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function initMenu()
    {
        $result = (new \App\Service\Admin\Auth\AdminRuleService)->getMenuRules($this->auth_user_data['id']);
        $this->write($result);
    }
    
    public function clearApi()
    {
        $this->json(1);
    }
    /**
     * Undocumented function
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $request
     * @param [type] $response
     * @param array $vars
     * @return void
     */
    public function index($request, $response, $vars = [])
    {
        $this->render("home.index");
    }

    /**
     * 数据统计报表
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function dashboard()
    {
        //获取统计数据
        $data = (new DashboardService)->getStatis();
        
        $this->render("home.dashboard", $data);
    }
}
