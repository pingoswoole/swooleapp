<?php
namespace App\Model\Product;
use App\Model\BaseModel;
use App\Model\Member\Member;

class ForumArticleComments extends BaseModel
{
    protected $table = 'product_forum_article_comments'; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = []; 

    protected $attributes = [];

    public function member()
    {
        return $this->belongsTo(Member::class, 'mid', 'id', 'member');
    }

}