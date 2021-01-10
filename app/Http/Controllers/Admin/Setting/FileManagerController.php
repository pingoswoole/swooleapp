<?php
namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Admin\AdminController;
use App\Utility\Status;
use App\Service\Admin\Common\FileManagerService;
class FileManagerController extends AdminController
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
             
            $this->render('setting.filemanager.all');
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
            $data = (new FileManagerService)->getPageList($page_data['page'], $page_data['limit'], []);
            $this->jsonPage(0, $data['count'], $data['list']);
        }

         
}