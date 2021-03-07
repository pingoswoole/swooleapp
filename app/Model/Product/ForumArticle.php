<?php
namespace App\Model\Product;
use App\Model\BaseModel;
use App\Model\Member\Member;

class ForumArticle extends BaseModel
{
    protected $table = 'product_forum_article'; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [

         'resource_urls' => 'array',
    ];
    
    protected $appends = []; 

    protected $attributes = [];

     public function category()
     {
        return $this->belongsTo(ForumCategory::class, 'cate_id', 'id', 'category');
     }

     public function member()
     {
        return $this->belongsTo(Member::class, 'mid', 'id', 'member');
     }

}