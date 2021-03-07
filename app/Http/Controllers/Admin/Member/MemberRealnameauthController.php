<?php
namespace App\Http\Controllers\Admin\Member;

use App\Http\Controllers\AdminController;
use App\Utility\Status;
use App\Service\Admin\Member\MemberRealnameauthService;

/**
 * 实名认证
 *
 * @author pingo
 * @created_at 00-00-00
 */
class MemberRealnameauthController extends AdminController
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
        $this->render('member.realnameauth.all');
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
        $data = (new MemberRealnameauthService)->getPageList($page_data['page'], $page_data['limit'], $page_data['search']);
        $this->jsonPage(0, $data['count'], $data['list']);
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
        if ($this->isPost()) {
            $post_data = $this->request()->post(['title', 'cate_id', 'price','expires', 'state', 'thumb', 'onlineshop_goodsid', 'description']);
                 
            $result = (new MemberRealnameauthService)->addItem($post_data);
            if ($result) {
                $this->json(Status::CODE_OK, 'success');
            } else {
                $this->json(Status::CODE_ERR, 'error');
            }
        } else {
            return $this->render('member.realnameauth.add');
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
        $data = (new MemberRealnameauthService)->getItem($id);
        $data['cate_list'] = (new \App\Service\Admin\CouponShopCategoryService)->getAll();
            
        return $this->render('member.realnameauth.edit', $data);
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
        $result = (new MemberRealnameauthService)->editItem($post_data, ['id' => $id]);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
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
        $result = (new MemberRealnameauthService)->setItem($id, $post_data['key'], $post_data['value']);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
            $this->json(Status::CODE_ERR, 'error');
        }
    }
    public function audit()
    {
        $id = intval($this->request()->route("id"));
        $state = $this->request()->post('state');
        $result = (new MemberRealnameauthService)->audit($id, $state);
        if ($result) {
            $this->json(Status::CODE_OK, '操作成功');
        } else {
            $this->json(Status::CODE_ERR, '操作失败');
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
        $result = (new MemberRealnameauthService)->delItem($id);
        if ($result) {
            $this->json(Status::CODE_OK, 'success');
        } else {
            $this->json(Status::CODE_ERR, 'error');
        }
    }
}
