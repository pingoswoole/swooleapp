<?php
namespace App\Model\Product;
use App\Model\BaseModel;
use App\Model\Member\Member;

class ChatMessage extends BaseModel
{
    protected $table = 'product_chat_message'; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        'gps_data' => 'json',
        
    ];
    
    const MSG_TYPES = ['text', 'img', 'voice', 'location', 'video'];

    protected $appends = []; 

    protected $attributes = [];

    public function sendUser()
    {
        return $this->belongsTo(Member::class, 'from_mid', 'id', 'sendUser');
    }
     
}