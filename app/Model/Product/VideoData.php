<?php
namespace App\Model\Product;
use App\Model\BaseModel;
use App\Model\Member\Member;

class VideoData extends BaseModel
{
    protected $table = 'product_video_data'; 

    const RESOURCE_TYPE = ['video' => '短视频', 'image' => '多图'];
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
            'resource_urls' => 'array',
    ];
    
    protected $appends = ['type_name']; 

    protected $attributes = [];

    public function getTypeNameAttribute($val, $data)
    {
        return self::RESOURCE_TYPE[$data['type']]?? '其它';
    } 

    public function category()
    {
        return $this->belongsTo(VideoCategory::class, 'cate_id', 'id', 'category');
    }

    public function area()
    {
        return $this->belongsTo(VideoArea::class, 'area_id', 'id', 'area');
    }

    public function member()
    {
        return $this->belongsTo(Member::class, 'mid', 'id', 'member');
    }

}