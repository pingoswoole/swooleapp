<?php

namespace App\Model\Member;
use App\Model\BaseModel;

class MemberShopaddress extends BaseModel
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

    public function member()
    {
        return $this->belongsTo(Member::class, 'mid', 'id', 'member');
    }

}