<?php
/**
 * 接口代码说明
 * User: cqingt
 * Date: 2017/12/5
 * Time: 14:14
 */
namespace library;

class Code{
    static protected $code = [
        'SUCCESS'             => ['code' => '200', 'msg' => '请求成功'],
        'UNKNOWN_ERROR'       => ['code' => '401', 'msg' => '未知错误'],
        'PARAM_NOT_EMPTY'     => ['code' => '402', 'msg' => '参数不能为空'],
        'SIGN_NOT_MATCH'      => ['code' => '403', 'msg' => '签名错误'],
        'API_NOT_FOUND'       => ['code' => '404', 'msg' => '接口未找到'],
        'SERVICE_IS_BUSINESS' => ['code' => '405', 'msg' => '服务忙，请稍后'],
        'OVERFLOW_STOCK'      => ['code' => '406', 'msg' => '库存不足'],
        'SAVE_USER_ERROR'     => ['code' => '407', 'msg' => '保存用户信息失败'],
    ];

    /**
     * @param $key
     * @param string $errorMsg
     * @return array|mixed
     */
    public static function get($key, $errorMsg = '')
    {
        if (! empty($errorMsg)) {
            return array_merge(self::$code['UNKNOWN_ERROR'], ['msg' => $errorMsg]);
        } else {
            return ! empty(self::$code[$key]) ? self::$code[$key] : [];
        }
    }
}
