<?php
namespace App\Model\Product;
use App\Model\BaseModel;

class ForumAd extends BaseModel
{
    protected $table = 'product_forum_ad'; 

    const RESOURCE_TYPE = ['grid' => '九宫格图', 'banner' => '列表长图'];
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = ['type_txt']; 

    protected $attributes = [];

    public function getTypeTxtAttribute($val, $data)
    {
        return self::RESOURCE_TYPE[$data['type']]?? '';
    }
    
}