<?php

require_once "WxPay.Api.php";
require_once 'WxPay.Notify.php';

class PayNotifyCallBack extends WxPayNotify
{
    /**
     * 查询订单
     * @param $transactionId string
     * @param string $orderSn string
     * @return bool
     */
    public function queryOrder($transactionId, $orderSn = '')
    {
        $input = new WxPayOrderQuery();

        if ($transactionId) {
            $input->SetTransaction_id($transactionId);
        } else if ($orderSn) {
            $input->SetOut_trade_no($orderSn);
        }

        $result = WxPayApi::orderQuery($input);

        if(array_key_exists("return_code", $result)
            && array_key_exists("result_code", $result)
            && array_key_exists('trade_state', $result)
            && $result["return_code"] == "SUCCESS"
            && $result["result_code"] == "SUCCESS"
            && $result["trade_state"] == "SUCCESS")
        {
            $recharge = new \app\index\model\MembersRecharge();
            $orderInfo = $recharge->getInfoByCondition(['order_sn' => $result['out_trade_no']]);

            if (empty($orderInfo)) {
                return false;
            }

            // 已支付
            if ($orderInfo['status'] != \library\Constant::PAY_STATUS_UNPAID) {
                return true;
            }

            if (array_key_exists('total_fee', $result) && $result['total_fee'] == $orderInfo['amount'] * 100) {
                // 支付金额
                $payAmount = sprintf('%.2f', $result['total_fee'] / 100);

                // 更新订单状态，用户账户余额，账户变化日志
               return $recharge->paySuccess($orderInfo['order_sn'], $orderInfo['user_id'], $result['transaction_id'], $payAmount);
            }
        }

        return false;
    }

    //重写回调处理函数
    public function NotifyProcess($data, &$msg)
    {
        if (! array_key_exists("transaction_id", $data)) {
            return false;
        }

        //查询订单，判断订单真实性
        if (! $this->queryOrder($data["transaction_id"])) {
            return false;
        }

        return true;
    }
}