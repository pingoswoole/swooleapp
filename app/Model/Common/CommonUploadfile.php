<?php
namespace App\Model\Common;

use App\Model\BaseModel;


class CommonUploadfile extends BaseModel
{
    //protected $table = '';
    ////integer，float，double，，string，boolean，object，array， datetime 
    const STORAGE = ['local','qiniu','aliyun','tencent','baidu','huawei','amazon'];

    const TYPES = ['image','video','audio','file'];

    protected $casts = [

    ];

    protected $with = [];

    

}