<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/1/28
 * Time: 21:36
 */
namespace library;

class Constants {
    public static $orderStatus = [
        0  => '待支付',
        10 => '已支付',
        20 => '支付失败',
        30 => '已发货',
        40 => '已收货',
        50 => '已完成',
//        60 => '申请退款',
        70 => '退款中',
        80 => '已退款',
        90 => '已关闭'
    ];
}