<?php

    
if (!function_exists("encrypt")) {
    /**
     * md5加密函数
     *
     * @param [type] $string
     * @param string $salt
     * @return string
     */
    function encrypt($string, $salt = 'mqtt')
    {
        return md5($string . $salt . $string);
    }
}


function rand_uniqid_str($prefix = '')
{
    return $prefix . uniqid() . mt_rand(10000, 99999);
}

if (!function_exists("setting")) {
    /**
     * 获取后台配置项目
     *
     * @author pingo
     * @created_at 00-00-00
     * @param [type] $key
     * @param [type] $default
     * @return void
     */
    function setting($key, $default = null)
    {
        return (new \App\Service\Common\SettingService)->get($key, $default);
    }
}


/**
 * @param $data  要加密的字符串
 * @param $key   密钥
 * @return string
 */
function encrypt_code($data, $key = 'encrypt')
{
    $key = md5($key);
    $x = 0;
    $data = (string) $data;
    $len = strlen($data);
    $l = strlen($key);
    $char = '';
    for ($i = 0; $i < $len; $i++) {
        if ($x == $l) {
            $x = 0;
        }
        $char .= $key{$x};
        $x++;
    }
    $str = '';
    for ($i = 0; $i < $len; $i++) {
        $str .= chr(ord($data{$i}) + (ord($char{$i})) % 256);
    }
    return base64_encode($str);
}


/**
 * @param $data    要解密的字符串
 * @param $key     密钥
 * @return string
 */
function decrypt_code($data, $key = 'encrypt')
{
    $key = md5($key);
    $x = 0;
    $data = base64_decode($data);
    $len = strlen($data);
    $l = strlen($key);
    $char = '';
    for ($i = 0; $i < $len; $i++) {
        if ($x == $l) {
            $x = 0;
        }
        $char .= substr($key, $x, 1);
        $x++;
    }
    $str = '';
    for ($i = 0; $i < $len; $i++) {
        if (ord(substr($data, $i, 1)) < ord(substr($char, $i, 1))) {
            $str .= chr((ord(substr($data, $i, 1)) + 256) - ord(substr($char, $i, 1)));
        } else {
            $str .= chr(ord(substr($data, $i, 1)) - ord(substr($char, $i, 1)));
        }
    }
    return $str;
}

/**
 * 唯一订单号
 *
 * @param string $prefix
 * @return void
 */
function make_order_no($mid = 0, $prefix = 'ZH')
{
    return $prefix . date('YmdHis', time()) . $mid . substr(microtime(), 2, 6) . sprintf('%03d', rand(0, 999));
}

////////////////////////////////////////////////////////////////////
// PHP截取中英文及标点符号混合的字符串函数（绝对不会出现乱码）
// 本程序在utf-8、gb2312中测试通过。使用者自行测试big5。
// 函数 left( 源字符串, 截取指定的字符串个数, 编码（可省略，默认为utf-8） )
////////////////////////////////////////////////////////////////////
function substr_char($str, $len, $charset="utf-8")
{
    //如果截取长度小于等于0，则返回空
    if (!is_numeric($len) or $len <= 0) {
        return "";
    }

    //如果截取长度大于总字符串长度，则直接返回当前字符串
    $sLen = strlen($str);
    if ($len >= $sLen) {
        return $str;
    }
 
    //判断使用什么编码，默认为utf-8
    if (strtolower($charset) == "utf-8") {
        $len_step = 3; //如果是utf-8编码，则中文字符长度为3
    } else {
        $len_step = 2; //如果是gb2312或big5编码，则中文字符长度为2
    }

    //执行截取操作
    $len_i = 0;
    //初始化计数当前已截取的字符串个数，此值为字符串的个数值（非字节数）
    $substr_len = 0; //初始化应该要截取的总字节数

    for ($i=0; $i < $sLen; $i++) {
        if ($len_i >= $len) {
            break;
        } //总截取$len个字符串后，停止循环
        //判断，如果是中文字符串，则当前总字节数加上相应编码的中文字符长度
        if (ord(substr($str, $i, 1)) > 0xa0) {
            $i += $len_step - 1;
            $substr_len += $len_step;
        } else { //否则，为英文字符，加1个字节
            $substr_len ++;
        }
        $len_i ++;
    }
    $result_str = substr($str, 0, $substr_len);
    return $result_str;
}
