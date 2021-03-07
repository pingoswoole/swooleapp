<?php
namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use \App\Service\Admin\Product\SuggestionService;
class SuggestionController extends AdminController
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
             
            $this->render('product.suggestion.all');
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
            $data = (new SuggestionService)->getPageList($page_data['page'], $page_data['limit'], []);
            $this->jsonPage(0, $data['count'], $data['list']);
        }

        /**
         * 删除一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function delItem()
        {
            $id = $this->request()->route("id");
            $result = (new SuggestionService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }

}