<?php
namespace App\Http\Controllers\Admin\Member;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use App\Service\Admin\Member\MemberAssetLogService;
/**
 * 用户资产收支
 *
 * @author pingo
 * @created_at 00-00-00
 */
class MemberAssetLogController extends AdminController
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
             
            $this->render('member.assetlog.all');
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
            $get_data = $this->request()->get(['searchParams']);
            $get_data = json_decode($get_data, true);
             
            $data = (new MemberAssetLogService)
                            ->getPageList(
                                $page_data['page'], 
                                $page_data['limit'], 
                                $get_data['mobile']?? '', 
                                $get_data['flow'], 
                                $get_data['from_type']??'', 
                                $get_data['asset_type']?? ''
                             );
            $this->jsonPage(0, $data['count'], $data['list'], $data['total_amount']);
        }
        /**
         * 添加一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function addItem()
        {
            if($this->isPost()){
                 
                $post_data = $this->request()->post(['title', 'cate_id', 'price','expires', 'state', 'thumb', 'onlineshop_goodsid', 'description']);
                 
                $result = (new MemberAssetLogService)->addItem($post_data);
                if($result){
                    $this->json(Status::CODE_OK, 'success');
                }else{
                    $this->json(Status::CODE_ERR, 'error');
                }
            }else{
                $data = (new \App\Service\Admin\CouponShopCategoryService)->getAll();
                 
                return $this->render('member.assetlog.add', ['catelist' => $data]);
            }
        }

        /**
         * 查看一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function viewItem()
        {
            $id = $this->request()->route("id");
            $data = (new MemberAssetLogService)->getItem($id);
            $data['cate_list'] = (new \App\Service\Admin\CouponShopCategoryService)->getAll();
            
            return $this->render('member.assetlog.edit', $data);
        }
        /**
         * 编辑一项
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function editItem()
        {
            $id = $this->request()->route("id");
            $post_data = $this->request()->post(['title', 'cate_id', 'price', 'state', 'expires', 'thumb', 'onlineshop_goodsid', 'description']);
            $result = (new MemberAssetLogService)->editItem($post_data, ['id' => $id]);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }
        
        /**
         * 修改字段
         *
         * @author pingo
         * @created_at 00-00-00
         * @return void
         */
        public function setItem()
        {
            $id = $this->request()->route("id");
            $post_data = $this->request()->post(['key', 'value']);
            $result = (new MemberAssetLogService)->setItem($id, $post_data['key'], $post_data['value']);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
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
            $result = (new MemberAssetLogService)->delItem($id);
            if($result){
                $this->json(Status::CODE_OK, 'success');
            }else{
                $this->json(Status::CODE_ERR, 'error');
            }
        }



}