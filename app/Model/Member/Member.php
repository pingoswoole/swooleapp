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
    
    public function goods()
    {
        
        return $this->hasMany(Goods::class, 'uid', 'id', 'goods_item');
        /* return $this->belongsTo('App\Models\User', 'foreign_key', 'other_key');

        return $this->hasMany('App\Models\Comment', 'foreign_key', 'local_key');
        return $this->belongsTo('App\Models\Post', 'foreign_key', 'other_key');

        return $this->belongsToMany('App\Models\Role', 'role_user', 'user_id', 'role_id');

        return $this->belongsToMany('App\Models\User')->using('App\Models\RoleUser'); */
    }

    public function role()
    {
        return $this->belongsToMany(Role::class, RoleUser::class, 'user_id', 'role_id', 'role_item');
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