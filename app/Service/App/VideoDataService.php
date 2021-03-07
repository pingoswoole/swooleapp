<?php
namespace App\Service\App;

use App\Model\Member\Member;
use Carbon\Carbon;
use App\Utility\Status;
use App\Model\Product\VideoArea;
use App\Model\Product\VideoAd;

class VideoDataService extends Base
{
    protected $model_class = \App\Model\Product\VideoData::class;
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
    }
    /**
     * 条件查询列表所有
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $page
     * @param [type] $pageSize
     * @param  $type 0:推荐，1：同城
     * @param  $city 城市名称
     * @return array
     */
    public function getPageList($page = 1, $pageSize = 20, $type = 0, $city = null):array
    {
        $data = ['count' => 0, 'list' => []];
        try {
            //code...
            $where['state'] = 1;
            if ($city) {
                $city_item = db()->where('title', $city)->first();
                if ($city_item) {
                    $where['area_id'] = $city_item['id'];
                }
            }
            $count = $this->model->where($where)->count();
            $list = $this->model->where($where)->orderBy('id', 'DESC')->page($page, $pageSize)->get();
            $result = ['count' => $count, 'list' => $list];
            return $this->_result(Status::CODE_OK, 'success', $result);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
      
    /**
     * 发布视频
     *
     * @param integer $mid
     * @param array $data
     * @return void
     */
    public function publish(int $mid, array $data)
    {
        try {
            //权限检查
            $member = (new Member())->where('id', $mid)->select('is_realname', 'grade')->first();
            $privilege = setting('privilege');
            if (isset($privilege['publish_video_need_realname'])) {
                if ($member['is_realname'] !== 1) {
                    return $this->_result(Status::CODE_ERR, '您未通过实名认证');
                }
            }
            if (!isset($privilege['publish_video_member']['all'])) {
                if (isset($privilege['publish_video_member']['vip']) && $member['grade'] < 1) {
                    return $this->_result(Status::CODE_ERR, '您不是VIP用户');
                }
                if (!isset($privilege['publish_video_member']['vip']) && isset($privilege['publish_video_member']['svip']) && $member['grade'] < 2) {
                    return $this->_result(Status::CODE_ERR, '您不是SVIP用户');
                }
            }
            $city_item = (new VideoArea)->where('title', $data['city'])->first();
            if (empty($city_item)) {
                return $this->_result(Status::CODE_ERR, '城市不存在');
            }
            $field['resource_urls'] = [$data['url']];
            $field['area_id'] = $city_item['id'];
            $field['type'] = 'video';
            $field['mid'] = $mid;
            $field['state'] = 1;
            $field['title'] = $data['title'];
            $field['thumb'] = $data['thumb'];
                
            $id = $this->model->insert($field);
            if ($id > 0) {
                return $this->_result(Status::CODE_OK, '发布成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getMyVideoList(int $mid)
    {
        try {
            //code...
            $where['mid'] = $mid;
            $list = $this->model->where($where)->orderBy('id', 'DESC')->get();
            if ($list) {
                return $this->_result(Status::CODE_OK, 'success', $list);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
    
      
    public function getAdDetail(int $id = 0)
    {
        try {
            //code...
            $where['id'] = $id;
            $item = (new VideoAd)->where($where)->first();
            return $this->_result(Status::CODE_OK, 'success', $item);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    public function getVDetail(int $id, int $is_ad = 0)
    {
        try {
            //code...
            $where['id'] = $id;
            if ($is_ad == 1) {
                $item = (new VideoAd)->where($where)->first();
            } else {
                $item = $this->model->where($where)->first();
                $this->model->where($where)->increment('view_count', 1);
            }
               
            return $this->_result(Status::CODE_OK, 'success', $item);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
    /**
     * 喜欢赞
     *
     * @param integer $id
     * @return void
     */
    public function zanVideo(int $id)
    {
        try {
            //code...
            $where['id'] = $id;
            $res = $this->model->where($where)->increment('like_num', 1);
            
            return $this->_result(Status::CODE_OK, '点赞成功');
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
    /**
     * 根据区域城市获取视频
     *
     * @param string $city
     * @param integer $type
     * @param integer $page
     * @param integer $pagesize
     * @return void
     */
    public function getListByCity(string $city = '', int $type = 0, int $page = 1, int $pagesize = 100)
    {
        try {
            $where['state'] = 1;
            if ($city) {
                $VideoArea = (new VideoArea)->where('title', $city)->first();
                if ($VideoArea) {
                    $where['area_id'] = $VideoArea['id'];
                }
            }
            //视频数据
            $video_list = $this->model->where($where)->orderBy('id', 'desc')->with(['member' => function ($Builder) {
                return $Builder->select('id', 'grade', 'nickname', 'avatar');
            }, 'area'])->page($page, $pagesize)->get();
            //广告视频
            $ad_list = (new VideoAd)->where($where)->where('state', 1)->orderBy('id', 'desc')->page($page, $pagesize)->get();
            $list = [];
            if ($ad_list) {
                foreach ($ad_list as $row) {
                    $list[] = [
                        'id'    => $row['id'],
                        'title' => $row['title'],
                        'thumb' => $row['thumb'],
                        //'src'   => $row['resource_urls'][0],
                        //'state' => 'pause',
                        'is_ad' => 1,
                        ];
                }
            }
            if ($video_list) {
                foreach ($video_list as $key => $row) {
                    # code...
                    $list[] = [
                            'id'    => $row['id'],
                            'title' => $row['title'],
                            //'src'   => $row['resource_urls'][0],
                            'thumb' => $row['thumb'],
                            'city'  => $row['area']['title'],
                            'is_ad' => 0,
                            'mid'   => $row['member']['id']?? 0,
                            'nickname' => $row['member']['nickname']??'',
                            'avatar'   => $row['member']['avatar']??'',
                         ];
                }
            }
            \shuffle($list);
            return $this->_result(Status::CODE_OK, 'success', $list);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }

    /**
     * 推荐搜索列表
     *
     * @param string $city 城市名
     * @param string $sort comment view
     * @param string $composite add_time
     * @return void
     */
    public function getSameCityList(string $city = '', $sort = '', $composite = '')
    {
        try {
            $page = 1;
            $pagesize = 100;
            $where = [];
            if ($city) {
                $VideoArea = (new VideoArea)->where('title', $city)->first();
                if ($VideoArea) {
                    $where['area_id'] = $VideoArea['id'];
                }
            }

            //视频数据
            $video_list = $this->model->where($where)->where('state', 1)->orderBy('id', 'desc')->with(['member' => function ($Builder) {
                return $Builder->select('id', 'grade', 'nickname', 'avatar');
            }, 'area'])->page($page, $pagesize);
            //排序
            
            switch ($sort) {
                case 'popular':
                    # code...
                    $video_list->orderBy('view_count', 'desc');
                    break;
                case 'comment':
                    $video_list->orderBy('comments_count', 'desc');
                    break;
                default:
                    # code...
                    break;
            }
            //综合
            switch ($composite) {
                case 'add_time':
                    # code...
                    //$video_list->orderBy('created_at', 'desc');
                    break;
                
                default:
                    # code...
                    break;
            }
            $video_list = $video_list->get();
            
            //广告视频
            $ad_list = (new VideoAd)->where($where)->where('state', 1)->orderBy('id', 'desc')->page($page, $pagesize)->get();
            $list = [];
            if ($ad_list) {
                foreach ($ad_list as $row) {
                    $list[] = [
                        'id'    => $row['id'],
                        'title' => $row['title'],
                        'thumb' => $row['thumb'],
                        //'src'   => $row['resource_urls'][0],
                        //'state' => 'pause',
                        'is_ad' => 1,
                        ];
                }
            }
            if ($video_list) {
                foreach ($video_list as $key => $row) {
                    # code...
                    $list[] = [
                            'id'    => $row['id'],
                            'title' => $row['title'],
                            //'src'   => $row['resource_urls'][0],
                            'thumb' => $row['thumb'],
                            'city'  => $row['area']['title'],
                            'is_ad' => 0,
                            'mid'   => $row['member']['id']?? 0,
                            'nickname' => $row['member']['nickname']??'',
                            'avatar'   => $row['member']['avatar']??'',
                         ];
                }
            }
            \shuffle($list);
            return $this->_result(Status::CODE_OK, 'success', $list);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->_result(Status::CODE_ERR, 'error');
    }
    
    public function remove(int $mid, int $id)
    {
        try {
            //code...
            $where['mid'] = $mid;
            $where['id']  = $id;
            $result = $this->model->where($where)->delete();
            if ($result) {
                return $this->_result(Status::CODE_OK);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        return $this->_result(Status::CODE_ERR);
    }
}
