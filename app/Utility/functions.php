<?php

    
if(!function_exists("encrypt")){
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