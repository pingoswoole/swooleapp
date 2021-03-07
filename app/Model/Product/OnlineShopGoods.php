<?php

namespace App\Model\Product;
use App\Model\BaseModel;

class OnlineShopGoods extends BaseModel
{
    //protected $table = ''; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = []; 

    protected $attributes = [];

    public function category()
    {
        return $this->belongsTo(OnlineShopCategory::class, 'cate_id', 'id', 'category');
    }


}