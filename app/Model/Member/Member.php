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
        'wallpaper' => 'array',
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
        $grade = $data['grade']?? 0;
        switch ($grade) {
            case 0:
                # code...
                $default = '非会员';
                break;
            case 1:
                # code...
                $default = 'VIP';
                break;
            case 2:
                # code...
                $default = 'SVIP';
                break;
            default:
                # code...
                break;
        }

        return $default;
    }
}
