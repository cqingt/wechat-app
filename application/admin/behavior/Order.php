<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/1/29
 * Time: 15:02
 */
namespace app\admin\behavior;

use think\Log;

class Order
{
    public function run(&$params)
    {
        // 统计订单，统计金额
        Log::record('order_id:' . var_export($params, true));
    }
}