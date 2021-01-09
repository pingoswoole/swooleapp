<?php

namespace App\Model\Member;
use App\Model\BaseModel;

class Role extends BaseModel
{
    //protected $table = ''; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        'rule_path' => 'json',
    ];
    
    protected $appends = []; 

    protected $attributes = [];


}