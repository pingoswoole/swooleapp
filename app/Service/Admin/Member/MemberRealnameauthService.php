<?php
namespace App\Service\Admin\Member;

use App\Model\Member\Member;
use Carbon\Carbon;
use App\Service\Admin\Base;

class MemberRealnameauthService extends Base
{
    protected $model_class = \App\Model\Member\MemberRealnameauth::class;
    /**
     * 条件查询列表所有
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $page
     * @param [type] $pageSize
     * @param array $where
     * @return array
     */
    public function getPageList($page, $pageSize, array $search = []):array
    {
        $data = ['count' => 0, 'list' => []];
        try {
            //code...
            $where = [];
            if (!empty($search['real_name'])) {
                $where['real_name'] = $search['real_name'];
            }
            if (isset($search['state']) && $search['state'] !== 'all') {
                $where['state'] = $search['state'];
            }
            $list = $this->model->where($where)->orderBy('id', 'DESC')->with(['member'])->page($page, $pageSize)->get();
            $count = $this->model->where($where)->count();
              
            return  ['count' => $count, 'list' => $list];
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
        }

        return  $data;
    }
      
    /**
     * 添加一项
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $data
     * @return boolean
     */
    public function addItem(array $data):bool
    {
        try {
            //code...
            $data['morepic'] = json_encode($data['morepic']);
            $data['created_at'] = Carbon::now()->timestamp;
            $id = model()->insert($this->table, $data);
        } catch (\Throwable $th) {
            //throw $th;
            return false;
        }
        return true;
    }
      
    /**
     * 查询一项
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $where
     * @return array
     */
    public function getItem(array $where = []):array
    {
        try {
            //code...
            $result = model()->get($this->table, '*', $where);
            return $result ? $result : [];
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }
      
    /**
     * 修改一项
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $data
     * @param [type] $where
     * @return boolean
     */
    public function editItem(array $data, array $where): bool
    {
        try {
            //code...
            $data['morepic'] = json_encode($data['morepic']);
            $data['updated_at'] = Carbon::now()->timestamp;
            $pdoStmt = model()->update($this->table, $data, $where);
            return $pdoStmt->rowCount() > 0 ? true : false;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
      
    /**
     * 修改字段
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $data
     * @param [type] $where
     * @return boolean
     */
    public function setItem($id, $field_name, $field_val):bool
    {
        try {
                 
                //code...
            $data = [$field_name => $field_val];
            $pdoStmt = model()->update($this->table, $data, ['id' => $id]);
            return $pdoStmt->rowCount() > 0 ? true : false;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
      
    /**
     * 条件删除一项
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $ids
     * @return boolean
     */
    public function delItem($ids = null):bool
    {
        try {
            //code...
            if (is_string($ids)) {
                $ids = [$ids];
            }
            $pdoStmt = model()->delete($this->table, ['id' => $ids]);
            return $pdoStmt->rowCount() > 0 ? true : false;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }

    public function audit(int $id, int $state)
    {
        try {
            //code...
            $item = $this->model->where('id', $id)->first();
            if ($item && $item['state'] != 1) {
                switch ($state) {
                    case 1:
                        # code...
                        (new Member())->where('id', $item['mid'])->update(['is_realname' => 1]);
                        break;
                    case -1:
                        break;
                    default:
                        # code...
                        break;
                }
                $this->model->where('id', $id)->update(['state' => $state]);
                return true;
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
}
