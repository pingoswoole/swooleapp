<?php

namespace App\Utility;

class Status
{
                                // Informational 1xx
    const CODE_OK         = 0;  // 成功
    const CODE_ERR        = -1; // 失败
    const CODE_VERIFY_ERR = -2; // 验证码错误
    const CODE_RULE_ERR   = -3; // 权限不足
    const CODE_SYS_ERR    = -4; // 服务器异常 
}
