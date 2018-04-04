<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/4/4
 * Time: 14:30
 */
namespace library;

use phpspider\core\selector;
use think\Log;

class Message
{
    // 消息模板发送地址
    protected static $messageUrl = 'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=';

    /**
     * 模板消息id
     * 快递单号    {{keyword1.DATA}}
     * 快递公司    {{keyword2.DATA}}
     * 发货时间    {{keyword3.DATA}}
     * 商品名称    {{keyword4.DATA}}
     */
    protected static $expressId = 'rL_2UMTFtwz3kpA7e1YtBSHhLj-HZN_s4HJQHV-7Hpk';

    /**
     * 模板消息id
     * 订单号码    {{keyword1.DATA}}
     * 支付时间    {{keyword2.DATA}}
     * 订单金额    {{keyword3.DATA}}
     * 商品名称    {{keyword4.DATA}}
     */
    protected static $orderId = '_OaGSVkjXZoGmV1GMU-FpW_RcMKD4lz6oB_MGVCry6Y';

    // 模板格式
    protected static $template = [
        'touser'           => '', // openid
        'template_id'      => '', // 模板id
        'page'             => '', // 跳转页面，可带参数
        'form_id'          => '', // 表单提交formId
        'emphasis_keyword' => 'keyword1.DATA', // 需要放大的关键字
        'data' => [
            'keyword1' => [
                'value' => '',
                'color' => '#173177'
            ],
        ],
    ];

    /**
     * 支付完成，推送模板消息
     * @param $prepayId string 预支付订单号
     * @param $openId
     * @param $orderInfo
     */
    public static function pushOrderMessage($prepayId, $openId, $orderInfo)
    {
        $template = self::$template;
        $template['touser'] = $openId;
        $template['template_id'] = self::$orderId;
        $template['form_id'] = $prepayId;
        $template['data'] = [
            'keyword1' => [
                'value' => $orderInfo['orderSn'],
                'color' => '#173177'
            ],
            'keyword2' => [
                'value' => $orderInfo['payTime'],
                'color' => '#173177'
            ],
            'keyword3' => [
                'value' => $orderInfo['payAmount'],
                'color' => '#173177'
            ],
            'keyword4' => [
                'value' => $orderInfo['goodsName'],
                'color' => '#173177'
            ],
        ];

        $result = Tool::http_post(self::getUrl(), $template);

        if (empty($result) || $result['errcode'] != 0) {
            Log::record('PUSH Order ERROR: ' . $result['errmsg'] . '; orderSn: ' . $orderInfo['orderSn']);
        }
    }

    /**
     * 发货模板消息推送
     * @param $formId
     * @param $openId
     * @param $expressInfo
     */
    public static function pushExpressMessage($formId, $openId, $expressInfo)
    {
        $template = self::$template;
        $template['touser'] = $openId;
        $template['template_id'] = self::$expressId;
        $template['form_id'] = $formId;
        $template['data'] = [
            'keyword1' => [
                'value' => $expressInfo['expressNo'],
                'color' => '#173177'
            ],
            'keyword2' => [
                'value' => $expressInfo['express'],
                'color' => '#173177'
            ],
            'keyword3' => [
                'value' => $expressInfo['sendTime'],
                'color' => '#173177'
            ],
            'keyword4' => [
                'value' => $expressInfo['goodsName'],
                'color' => '#173177'
            ],
        ];

        $result = Tool::http_post(self::getUrl(), $template);

        if (empty($result) || $result['errcode'] != 0) {
            Log::record('PUSH Express ERROR: ' . $result['errmsg'] . '; expressNo: ' . $expressInfo['expressNo']);
        }
    }

    protected static function getUrl()
    {
        $token = Token::getToken();

        return self::$messageUrl . $token;
    }

}