<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/11
 * Time: 10:19
 */
namespace library;

use app\common\model\Express;
use app\common\model\Order;

class Tool
{
    public static $expressSigned = 5; //快递已签收状态
    public static $express = [
        1 => '无信息',
        2 => '已揽收',
        3 => '运送中',
        4 => '派送中',
        5 => '已签收',
        6 => '问题件',
        'unknown'    => 1,
        'collected'  => 2,
        'sending'    => 3,
        'delivering' => 4,
        'signed'     => 5,
        'question'   => 6,
    ];
    // 快递状态 1无物流信息，2已揽收，3运送中，4派送中，5已签收，6问题件
    // 'signed'已签收,'delivering'派送中,'sending'运送中,'collected'已揽收,question 问题件

    /**
     * 获取物流信息
     * @param $status
     * @return mixed|string
     */
    public static function getState($status)
    {
        if (!empty(self::$express[$status])) {
            return self::$express[$status];
        }

        return '无物流信息';
    }

    /**
     * 根据日期，获取对应的时间戳
     * @return array
     */
    public static function getDateBetween()
    {
        return [
            'total'         => [],
            'today'         => ['today 00:00:00', 'tomorrow 00:00:00'],
            'yesterday'     => ['yesterday 00:00:00', 'today 00:00:00'],
            'current_week'  => ['this week 00:00:00', 'next week 00:00:00'],
            'last_week'     => ['last week 00:00:00', 'this week 00:00:00'],
            'current_month' => ['first Day of this month 00:00:00', 'first Day of next month 00:00:00'],
            'last_month'    => ['first Day of last month 00:00:00', 'first Day of this month 00:00:00']
        ];
    }

    /**
     * 将时间转为时间戳
     * @param $currentType
     * @param string $prefix
     * @return array
     */
    public static function getBetweenTime($currentType, $prefix = '')
    {
        $condition = [];
        $dateBetween = self::getDateBetween();
        if (isset($dateBetween[$currentType])) {
            $timeArray = $dateBetween[$currentType];

            if ($prefix) {
                $prefix = trim($prefix, '.') . '.';
            }

            if (! empty($timeArray)) {
                $condition[$prefix . 'create_time'] = ['BETWEEN', [strtotime($timeArray[0]), strtotime($timeArray[1])]];
            }
        }

        return $condition;
    }

    /**
     * 获取key
     * @param string $prefix
     * @param string $type
     * @return string
     */
    public static function getCacheKey($prefix = '', $type = 'total')
    {
        $prefix = trim($prefix, '_') . '_';
        $key = '';
        switch ($type) {
            case 'total':
                $key = $prefix . 'total';
                break;

            case 'today':
                $key = $prefix . date('Ymd');
                break;

            case 'yesterday':
                $key = $prefix . date('Ymd', strtotime('yesterday 00:00:00'));
                break;

            case 'current_week':
                $key = $prefix . date('Y_W');// 周 2018_05
                break;

            case 'last_week':
                $key = $prefix . date('Y_W', strtotime('last week 00:00:00'));// 周 2018_05
                break;

            case 'current_month':
                $key = $prefix . date('Ym');
                break;

            case 'last_month':
                $key = $prefix . date('Ym', strtotime('first Day of last month 00:00:00'));
                break;
        }

        return $key;
    }

    /**
     * 快递信息更新
     * @param $orderId
     * @param $expressId
     * @param $expressNo
     * @return array|mixed
     */
    public static function getExpress($orderId, $expressId, $expressNo)
    {
        $expressCode = (new Express())->getExpressCode($expressId);
        $result = Tool::queryExpress($expressNo, $expressCode);
        $expressData = [];

        if (! empty($result) && is_array($result)) {
            $status = isset(self::$express[$result['status']]) ? self::$express[$result['status']] : 1;

            (new Order())
                ->where(['id' => $orderId])
                ->update(['express_json' => json_encode($result), 'express_status' => $status]);
            $expressData = ['data' => $result['data'], 'status' => $status];
        }

        return $expressData;
    }

    /**
     * 快递信息数组
     * @param $expressNo string 快递单号
     * @param $expressCode string 快递拼音标识
     * @return array
     * @throws \Exception
     */
    public static function queryExpress($expressNo, $expressCode)
    {
        $key   = '580ca50702293d9c03cfb7ef3d9961ce72752d78';
        $appId = '100142';
        $url   = 'https://kop.kuaidihelp.com/api';

        $data = [
            'app_id' => $appId,
            'method' => 'express.info.get',
            'ts'     => time(),
        ];

        ksort($data);
        $valueStr = implode('', array_values($data));
        $data['sign'] = md5($valueStr . $key); // md5(app_id + method + ts + api_key))

        $data['data'] = json_encode([
            'waybill_no'       => $expressNo,
            'exp_company_code' => $expressCode,
        ]);

        $response = self::http_post($url, $data);
        $results = [];

        if (! empty($response)) {
            $dataArr = json_decode($response, true, JSON_UNESCAPED_UNICODE);

            if (! json_last_error()) {
                if ($dataArr['code']) { // 非0 错误
                    //throw new \Exception($dataArr['msg']);
                } else {
                    $expressData = $dataArr['data'][0];
                    $results['status'] = $expressData['status']; // signed 已签收
                    $results['no']     = $expressData['no'];
                    $results['brand']  = $expressData['brand'];
                    $results['data']   = [];

                    $express = $expressData['data'];

                    foreach ($express as $item) {
                        $results['data'][] = [
                            'time'    => $item['time'],
                            'context' => $item['context']
                        ];
                    }

                    $results['data'] = array_reverse($results['data']);
                }
            } else {
                //throw new \Exception('json 字符串解析错误');
            }
        }

        return $results;
    }

    /**
     * @param $url
     * @param array $data
     * @param int $retry
     * @param array $header
     * @return mixed
     * @throws \Exception
     */
    public static function http_post($url, $data = [], $retry = 3, $header = ['Content-Type:application/x-www-form-urlencoded;charset=utf-8']){

        if(function_exists('curl_init')) {
            $urlArr = parse_url($url);
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);

            if(is_array($header) && !empty($header)){
                $setHeader = array();
                foreach ($header as $k=>$v){
                    $setHeader[] = "$k:$v";
                }
                curl_setopt($ch, CURLOPT_HTTPHEADER, $setHeader);
            }

            if (strnatcasecmp($urlArr['scheme'], 'https') == 0) {
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); // 从证书中检查SSL加密算法是否存在
            }

            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_TIMEOUT, 20);
            $output = curl_exec($ch);

            if(curl_errno($ch)){
                return curl_error($ch);
            }

            $info = curl_getinfo($ch);
            curl_close($ch);

            if (is_array($info) && $info['http_code'] == 200) {
                return $output;
            } else {
                if ($retry) {
                    return  self::http_post($url, $data, $retry - 1);
                }
                exit('请求失败（code）：' . $info['http_code']);
            }
        } else {
            throw new \Exception('请开启CURL扩展');
        }
    }

}