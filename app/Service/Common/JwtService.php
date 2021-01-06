<?php
namespace App\Service\Common;

class JwtService
{
    private static $key = 'pingojwt';
    private static $zone_prefix = 'jwt_';
    private static $refresh_token_key_len = 8;
    private static $hset_uid_prefix = 'uid_';

    /**
     * 加密
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $zone
     * @param integer $user_id
     * @param array $payload
     * @param integer $ttl
     * @return void
     */
    public function encode(string $zone, int $user_id, array $payload, int $ttl = 7200)
    {
        //删除旧的
        $this->delToken($zone, $user_id);
        $data = json_encode($payload);
        $sign_data = $data . uniqid();
        $token = $this->sign($sign_data, self::$key);
        $time = encrypt_code(time() + $ttl);
        $refresh_token = $token . '.' . $time . "." . encrypt_code($user_id) . random_str(self::$refresh_token_key_len);
        cache()->setEx(self::$zone_prefix . $zone . $token, $ttl, $data);
        $result = [
            'token'         => $token,
            'refresh_token' => $refresh_token
        ];
        cache()->hset(self::$zone_prefix . $zone, self::$hset_uid_prefix . $user_id, json_encode($result));

        return $result;

    }
    /**
     * 解密
     *
     * @author pingo
     * @created_at 00-00-00
     * @return void
     */
    public function decode($zone, $token)
    {
        $data = cache()->get(self::$zone_prefix . $zone . $token);
        if($data){
            return json_decode($data, true);
        }
        return false;
    }

    /**
     * refresh token
     *
     * @author pingo
     * @created_at 00-00-00
     * @param string $zone
     * @param string $refresh_token
     * @param integer $ttl
     * @return void
     */
    public function refresh(string $zone, string $refresh_token, int $ttl = 7200)
    {
        $refresh_token = substr($refresh_token, 0, self::$refresh_token_key_len * -1);
         
        if($refresh_token){
            list($token, $expire_time, $user_id) = explode(".", $refresh_token);
            $expire_time = decrypt_code($expire_time);
            $user_id = decrypt_code($user_id);
             
            if($expire_time > time()){
                $data = cache()->get(self::$zone_prefix . $zone . $token);
                if($data){
                    //删除旧的
                    $this->delToken($zone, $user_id);
                    $sign_data = $data . uniqid();
                    $token = $this->sign($sign_data, self::$key);
                    cache()->setEx(self::$zone_prefix . $zone . $token, $ttl, $data);
                    $refresh_token = $token . '.' . encrypt_code(time() + $ttl) . "." . encrypt_code($user_id) . random_str(self::$refresh_token_key_len);
                    $result = [
                        'token'         => $token,
                        'refresh_token' => $refresh_token
                    ];
                    cache()->hset(self::$zone_prefix . $zone, self::$hset_uid_prefix . $user_id, json_encode($result));
                    return $result;
                }
            }

        }
        return false;
    }

    private function sign(string $data, string $key)
    {
        return \hash_hmac('sha256', $data, $key);
    }

    public function delToken($zone, $user_id)
    {
         $token_res = cache()->hget(self::$zone_prefix . $zone, self::$hset_uid_prefix . $user_id);
         if($token_res){
             $token_res = json_decode($token_res, true);
             if(isset($token_res['token'])){
                 cache()->del(self::$zone_prefix . $zone . $token_res['token']);
             }
         }
         return true;
    }

}