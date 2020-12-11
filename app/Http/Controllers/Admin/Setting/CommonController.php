<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Admin\AdminController;

class CommonController extends AdminController
{
    public function index()
    {
        var_dump("asdfasdfasdf");
        $this->render('setting.index');
    }
}
