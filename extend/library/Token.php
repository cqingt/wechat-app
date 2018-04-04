<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/4/4
 * Time: 15:35
 */
namespace library;

use think\Cache;
use think\Config;

class Token
{
    protected static $tokenUrl = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET';

    /**
     * 获取token
     * @return string
     */
    public static function getToken()
    {
        $token = Cache::get('wxToken');

        if (! empty($token) && $token['expires_in'] > time()) {
            return $token['access_token'];
        } else {
            return self::setToken();
        }
    }

    // 异步更新，如果在100秒内过期
    public static function asyncUpdateToken()
    {
        $token = Cache::get('wxToken');

        if (! empty($token) && ($token['expires_in'] - 100 <= time())) {
            self::setToken();
        }
    }

    /**
     * @return string
     */
    public static function setToken()
    {
        $appId = Config::get('weixin.appId');
        $secret = Config::get('weixin.appSecret');

        $url = str_replace(['APPID', 'APPSECRET'], [$appId, $secret], self::$tokenUrl);

        $result = Tool::http_get($url);
        $data = [];

        if (! empty($result) && isset($result['access_token'])) {
            $data = [
                'access_token' => $result['access_token'],
                'expires_in'   => $result['expires_in'] - 100 + time()
            ];

            Cache::set('wxToken', $data);
        }

        return $data ? $data['access_token'] : '';
    }
}