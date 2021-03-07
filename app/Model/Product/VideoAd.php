<?php
namespace App\Model\Product;
use App\Model\BaseModel;

class VideoAd extends BaseModel
{
    protected $table = 'product_video_ad'; 
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

    public function area()
    {
        return $this->belongsTo(VideoArea::class, 'area_id', 'id', 'area');
    }

    
}