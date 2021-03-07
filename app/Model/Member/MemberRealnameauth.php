<?php

namespace App\Model\Member;

use App\Model\BaseModel;

class MemberRealnameauth extends BaseModel
{
    //protected $table = '';
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        
    ];
    
    protected $appends = ['state_txt'];

    protected $attributes = [];

    public function getStateTxtAttribute($val, $data)
    {
        $state = $data['state']?? 0;
        $txt = '未知';
        switch ($state) {
            case 0:
                # code...
                $txt = '待审核';
                break;
            case 1:
                # code...
                $txt = '审核通过';
                break;
            case -1:
                # code...
                $txt = '审核未通过';
                break;
            
            default:
                # code...
                break;
        }
        return $txt;
    }

    public function member()
    {
        return $this->belongsTo(Member::class, 'mid', 'id', 'member');
    }
}
