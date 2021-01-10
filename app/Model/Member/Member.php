<?php

namespace App\Model\Member;
use App\Model\BaseModel;


class Member extends BaseModel
{
    //protected $table = ''; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
    ];
    //integer，real，float，double，decimal:<digits>，string，boolean，object，array，collection，date，datetime 和
    protected $appends = ['grade_name']; 

    protected $attributes = [];


    public function asset()
    {
        return $this->hasOne(MemberAsset::class, 'mid', 'id', 'asset');
    }
    
    public function realnameauth()
    {
        return $this->hasOne(MemberRealnameauth::class, 'mid', 'id', 'realnameauth');
    }

     
    public function getGradeNameAttribute($val, $data)
    {
        $default = $val;
        switch ($data['grade']) {
            case 0:
                # code...
                $default = '游客';
                break;
            case 1:
                # code...
                $default = 'VIP';
                break;
            case 2:
                # code...
                $default = '代理商';
                break;
            case 3:
                # code...
                $default = '运营商';
                break;
            
            default:
                # code...
                break;
        }

        return $default;
    }

}