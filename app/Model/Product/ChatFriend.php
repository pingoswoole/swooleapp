<?php
namespace App\Model\Product;

use App\Model\BaseModel;
use App\Model\Member\Member;

class ChatFriend extends BaseModel
{
    protected $table = 'product_chat_friend';
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = [];

    protected $attributes = [];


    public function friend()
    {
        return $this->belongsTo(Member::class, 'friend_mid', 'id', 'friend');
    }

    public function app_friend()
    {
        return $this->belongsTo(Member::class, 'mid', 'id', 'friend');
    }
}
