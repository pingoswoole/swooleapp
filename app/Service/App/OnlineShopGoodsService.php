<?php
namespace App\Service\App;

use App\Utility\Status;

class OnlineShopGoodsService extends Base
{
    public function getList($cate, $sales, $composite)
    {
        try {
            //code...
            $column = "*";
            $where = [
                'state'        => 1,
                'is_hot'       => 0,
                'is_recommend' => 0,
            ];
            if($cate){
                $where['cate_id'] = $cate;
            }
            if($composite){
                switch ($composite) {
                    case 'add_time':
                        # code...
                        $where['ORDER'] = ['id' => 'DESC'];
                        break;
                    case 'hight_price':
                        # code...
                        $where['ORDER'] = ['price' => 'DESC'];
                        break;
                    case 'low_price':
                        # code...
                        $where['ORDER'] = ['price' => 'ASC'];
                        break;
                        
                    default:
                        # code...
                        break;
                }
            }
            $list = model()->select("online_shop_goods", $column, $where);
            if($list){
                 
                foreach ($list as $key => &$row) {
                    # code...
                    $row['morepic'] = json_decode($row['morepic'], true);
                }
                
                return $this->_result(Status::CODE_OK, 'success', $list);
            }
        } catch (\Throwable $th) {
            //throw $th;
            
        }
        return $this->_result(Status::CODE_ERR, 'error');

    }

    public function getChannel($tag = '')
    {
        try {
            //code...
            $hot = model()->get('online_shop_goods', "*", ['is_hot' => 1, 'state' => 1]);
            $recommend_list = model()->select('online_shop_goods', "*", ['is_recommend' => 1, 'LIMIT' => 2, 'state' => 1]);
            $result = [
                'hot'       => $hot,
                'recommend' => $recommend_list
            ];
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getCatesList()
    {
        try {
            //code...
          
            $list = model()->select('online_shop_category', "*", []);
            if($list){
                $cate = [];
                foreach ($list as $key => $row) {
                    # code...
                    $cate[] = [
                        'title' => $row['title'],
                        'value' => $row['id'],
                    ];
                }
                return $this->_result(Status::CODE_OK, 'success', $cate);
            }
            
        } catch (\Throwable $th) {
            //throw $th;
             
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getItem(int $id)
    {
        try {
            //code...
            $item = model()->get('online_shop_goods', "*", ['id' => $id]);
            if($item){
                $item['morepic'] = json_decode($item['morepic'], true);
                return $this->_result(Status::CODE_OK, 'success', $item);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getCateGoodsList()
    {
        try {
            //code...
            $where = [
                'online_shop_goods.state' => 1
            ];
            $join = [
                '[>]online_shop_category' => ['cate_id' => 'id']
            ];
            $column = [
                'online_shop_goods.id',
                'online_shop_goods.title',
                'online_shop_goods.thumb',
                'online_shop_goods.price',
                'online_shop_goods.cate_id',
                'online_shop_category.title(cate_title)',
                
            ];

            $list = model()->select('online_shop_goods', $join, $column, $where);
            if($list){
                $cate_list = [];
                foreach ($list as $key => $row) {
                    # code...
                    $cate_list[$row['cate_id']]['title'] = $row['cate_title'];
                    $cate_list[$row['cate_id']]['subCategoryList'][] = $row;
                }
                $list = array_values($cate_list);
            }
            return $this->_result(Status::CODE_OK, 'success', $list);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR, 'error');
    }

}