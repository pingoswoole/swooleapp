<?php
namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use \App\Service\Admin\Common\DatabaseService;
use \App\Service\Admin\Product\SuggestionService;
class DatabaseController extends AdminController
{
        /**
         * 列表展示
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function viewAll()
        {
             
            $this->render('setting.database.all');
        }
        /**
         * 列表数据
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function getPageList()
        {
            $page_data = $this->getPage();
            $data = (new  DatabaseService)->getTables();
            $this->jsonPage(0, $data['count'], $data['list']);
        }
 
        /**
         * 清空生产数据
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function clearData()
        {
            $result = (new DatabaseService)->clearData();
            return $this->__service($result);
            
        }

}