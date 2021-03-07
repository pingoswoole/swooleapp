<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\AdminController;

class CommonController extends AdminController
{
    public function index()
    {
        if($this->isPost()){
            //
            $data = $this->request()->all();
            (new \App\Service\Common\SettingService)->store($data['set_key'], $data);
            $this->json(0, '操作成功');
        }else{
            $data = (new \App\Service\Common\SettingService)->get();
            $this->render('setting.index', ['setting' => $data]);
        }
    }
}
