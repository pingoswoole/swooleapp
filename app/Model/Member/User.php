<?php

namespace App\Model\Member;
use App\Model\BaseModel;

class User extends BaseModel
{
    //protected $table = ''; 
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        'score' => 'float',
        
    ];
    //integer，real，float，double，decimal:<digits>，string，boolean，object，array，collection，date，datetime 和
    protected $appends = []; 

    protected $attributes = [];

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
    /**
     * 获取用户名
     *
     * @param  string  $value
     * @return string
     */
    public function getFirstNameAttribute($value)
    {
        return ucfirst($value);
    }
    /**
     * 设置用户名
     *
     * @param  string  $value
     * @return void
     */
    public function setFirstNameAttribute($value)
    {
        $this->attributes['first_name'] = strtolower($value);
    }


}