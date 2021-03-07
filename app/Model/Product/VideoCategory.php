<?php
namespace App\Model\Product;
use App\Model\BaseModel;

class VideoCategory extends BaseModel
{
    protected $table = 'product_video_category'; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = []; 

    protected $attributes = [];

    public function videoData()
    {
        return $this->hasMany(VideoData::class, 'cate_id', 'id', 'video_data');
    }
     
}