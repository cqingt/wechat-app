<?php
namespace app\common\model;

use library\Tool;
use think\Log;
use think\Model;
use think\Cache;

class Order extends Model
{
    // 指定表名,不含前缀
    protected $name = 'order';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    protected $resultSetType = 'collection';

    public function countOrder($dataType)
    {
        $condition = [];
        if ($dataType && $dataType != 'total') {
            $condition = Tool::getBetweenTime($dataType);
        }
        $condition = array_merge(['status' => ['GT', 0]], $condition);

        return $this->where($condition)->count();
    }

    public function getTotal($userId, $status)
    {
        $condition = ['user_id' => $userId];
        if (! is_null($status)) {
            $condition = array_merge($condition, ['status' => $status]);
        }
        return $this->where($condition)->count();
    }

    public function getOrderList($userId, $status, $offset = 0, $rows = 12)
    {
        $condition = ['user_id' => $userId];
        if (! is_null($status)) {
            $condition = array_merge($condition, ['status' => $status]);
        }
        return $this->where($condition)
            ->field(['id', 'user_id', 'order_sn', 'price', 'trade_no', 'remark', 'pay_time', 'status', 'express', 'express_no', 'create_time'])
            ->order('create_time desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();
    }

    // 订单信息
    public function getOrderInfo($userId, $orderId)
    {
        return $this->where(['user_id' => $userId, 'id' => $orderId])
            ->field(['id', 'user_id', 'order_sn', 'remark', 'price', 'trade_no', 'pay_time', 'status', 'express', 'express_no', 'create_time'])
            ->find();
    }
}
