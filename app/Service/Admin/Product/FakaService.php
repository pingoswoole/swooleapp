<?php
namespace App\Service\Admin\Product;

use Carbon\Carbon;
use App\Service\Admin\Base;
use Hashids\Hashids;

class FakaService extends Base
{
    protected $model_class = \App\Model\Product\Faka::class;
    /**
     * 获取所有
     *
     * @author pingo
     * @created_at 00-00-00
     * @param array $where
     * @return void
     */
    public function getAll(array $where = [])
    {
        $result = $this->model->where($where)->get();
        return $result ? $result : [];
    }
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
    public function getPageList($page, $pageSize, array $where = []):array
    {
        $data = ['count' => 0, 'list' => []];
        try {
            //code...
            $count = $this->model->where($where)->count();
            $list = $this->model->where($where)->orderBy('id', 'DESC')->page($page, $pageSize)->with(['category', 'area'])->get();
            return  ['count' => $count, 'list' => $list];
        } catch (\Throwable $th) {
            //throw $th;
        }

        return  $data;
    }
      
    public function download(int $type)
    {
        try {
            //code...
            $save_file = WEB_STORAGE_FILE_PATH . \md5($type . "Faka") . ".txt";
            $where['type'] = $type;
            $where['state'] = 0;
            $list = $this->model->where($where)->get();
            if (empty($list) || count($list) <= 100) {
                //不足100重新生成1000
                    $hashids = new Hashids('', 12, '123456789abcdefgh'); //
                    $insert_data = [];
                $time = \time();
                for ($i=0; $i < 500; $i++) {
                    # code...
                    $unid = "" . ($time + $i + mt_rand(100000, 999999));
                    $number = $hashids->encode($unid);
                    $insert_data[] = [
                            'type'      => $type,
                            'number'    => $number,
                        ];
                }
                     
                $this->model->insert($insert_data);
            }
            //
            $list = $this->model->where($where)->page(1, 500)->pluck('number');
            $content = \implode(",", $list);
            \file_put_contents($save_file, $content);
            $downlink = \str_replace(WEB_PUBLIC_PATH, '', $save_file);

            return $downlink;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
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
            if (is_string($data['resource_urls'])) {
                $data['resource_urls'] = [$data['resource_urls']];
            }
            $id = $this->model->insert($data);
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
            $result = $this->model->where($where)->first();
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
                 
            $rowCount = $this->model->where($where)->update($data);
            return $rowCount > 0 ? true : false;
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
            $rowCount = $this->model->where(['id' => $id])->update($data);
            return $rowCount > 0 ? true : false;
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
            $rowCount = $this->model->whereIn('id', $ids)->delete();
            return $rowCount > 0 ? true : false;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
}
