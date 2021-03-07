<?php
namespace App\Model\Product;
use App\Model\BaseModel;

class Faka extends BaseModel
{
    protected $table = 'product_faka'; 

     
    /**
     * 强制转换的属性
     *
     * @var array
     */
    protected $casts = [
        
        'state' => 'integer',
    ];
    
    protected $appends = ['state_txt', 'type_txt']; 

    protected $attributes = [];

    public function getStateTxtAttribute($val, $data)
    {
        $default = $val;
        $state = $data['state']?? 0;
         
        switch ($state) {
            case 0:
                # code...
                $default = '未使用';
                break;
            case 1:
                # code...
                $default = '已使用';
                break;
        }
        
        return $default;
    }

    public function getTypeTxtAttribute($val, $data)
    {
        $default = $val;
        $type = $data['type']?? 0;
        switch ($type) {
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