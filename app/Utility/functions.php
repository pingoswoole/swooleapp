<?php

 

function get_rand($length = 8, $chars = null, $special = false)
    {
        $s = "";
        if (empty($chars)) {
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" . ($special ? "~!#$%^&*()_+{<>?.}": "");
        }
        while (strlen($s) < $length) {
            $s .= substr($chars, rand(0, strlen($chars) - 1), 1);
        }
        return $s;
    }