<?php
namespace App\Logic\App;

use App\Model\Product\ForumAd;
use App\Model\Product\ForumArticle;
use App\Model\Product\ForumCategory;

class ForumLogic
{
    public function getAdList()
    {
        try {
            //code...
            //分类
            $result['cate_list'] = (new ForumCategory)->where(['state' => 1])->get();
            //广告
            $result['ad_list'] = (new ForumAd())->where(['state' => 1])->select('id', 'title', 'type', 'thumb')->get();
            return $result;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }

    public function getCateList()
    {
        try {
            //code...
            //分类
            $result = (new ForumCategory)->where(['state' => 1])->get();
            
            return $result;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }

    public function getArticleList(int $cate_id, int $page = 1, int $pageSize  = 30)
    {
        try {
            //code...
            $result['cate'] = (new ForumCategory)->where('id', $cate_id)->where('state', 1)->select('title')->first();
            $result['list'] = (new ForumArticle())
                ->where(['cate_id' => $cate_id, 'state' => 1])
                ->orderBy('id', 'DESC')
                ->select('id', 'title', 'thumb', 'created_at', 'mid')
                ->with(['member' => function ($Query) {
                    $Query->select('id', 'nickname', 'avatar', 'mobile', 'grade');
                }])
                ->page($page, $pageSize)
                ->get();
            return $result;
        } catch (\Throwable $th) {
            //throw $th;
            var_dump($th->getMessage());
        }
        return [];
    }
}
