<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/13
 * Time: 11:00
 */

namespace app\api\controller;

use think\Loader;
use library\Constant;

class Business extends BaseController
{
    public function orderStatus()
    {
        $orderInfo = [];

        // 未支付，查询支付平台
        if ($orderInfo['status'] == Constant::PAY_STATUS_UNPAID) {
            Loader::import('wxpay/lib/PayNotifyCallBack', EXTEND_PATH);

            $callback = new \PayNotifyCallBack();

            // 查询订单状态，更新订单状态，用户账户余额，账户变化日志
            $result = $callback->queryOrder('', $orderInfo['order_sn']);

            if ($result) {
                return ['status' => Constant::PAY_STATUS_SUCCESS];
            }
        }

        return ['status' => Constant::PAY_STATUS_UNPAID];
    }

    // 平台订单支付状态查询
    protected function orderQuery($payType, $orderSn)
    {
        Loader::import('wxpay/lib/PayNotifyCallBack', EXTEND_PATH);

        $callback = new \PayNotifyCallBack();

        // 查询订单状态，更新订单状态，用户账户余额，账户变化日志
        $result = $callback->queryOrder('', $orderSn);

        return $result;
    }

    // 微信支付
    protected function wxpay($payTitle, $orderSn, $amount)
    {
        Loader::import('wxpay/lib/WxPay#Api', EXTEND_PATH);

        $input = new \WxPayUnifiedOrder();
        $input->SetBody($payTitle);
        //$input->SetAttach($payTitle); //  附加信息
        $input->SetOut_trade_no($orderSn);
        $input->SetTotal_fee($amount * 100); //微信支付，单位(分)
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag($payTitle);
        $input->SetNotify_url(self::callbackUrl());
        $input->SetTrade_type("APP");
        $order = \WxPayApi::unifiedOrder($input);

        $params = $this->makeWxPayParams($order);
        $backInfo = [
            'orderSn'     => $orderSn,
            'totalAmount' => (string)($amount * 100),
        ];
        $backInfo = array_merge($backInfo, $params);

        // 存储prepayid

        return $backInfo;
    }

    protected function makeWxPayParams($UnifiedOrderResult)
    {
        if(! array_key_exists("appid", $UnifiedOrderResult)
            || ! array_key_exists("prepay_id", $UnifiedOrderResult)
            || empty($UnifiedOrderResult['prepay_id']))
        {
            throw new \WxPayException("参数错误");
        }

        $api = new \WxPayAppPay();
        $api->SetValue('appid', $UnifiedOrderResult["appid"]);
        $api->SetValue('package', "Sign=WXPay");
        $api->SetValue('prepayid', $UnifiedOrderResult['prepay_id']);
        $api->SetValue('partnerid', \WxPayConfig::MCHID);
        $api->SetValue('noncestr', \WxPayApi::getNonceStr());
        $api->SetValue('timestamp', (string)time());

        $api->SetValue('sign', $api->MakeSign());

        return $api->GetValues();
    }

    // 微信回调
    public function callback()
    {
        Loader::import('wxpay/lib/PayNotifyCallBack', EXTEND_PATH);

        $notify = new \PayNotifyCallBack();

        $notify->Handle(false);
    }

    /**
     * 支付回调地址
     * @return string
     */
    public static function callbackUrl()
    {
        return request()->domain() . '/business/callback';
    }
}