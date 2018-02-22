<?php
namespace app\common\model;

use think\Model;

class OrderAddress extends Model
{
    // 指定表名,不含前缀
    protected $name = 'order_address';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    /**
     * 获取订单地址
     * @param $orderId
     * @return array
     */
    public function getAddress($orderId)
    {
        return $this->where(['order_id' => $orderId])
            ->field(['id', 'username', 'telephone', 'province', 'city', 'area', 'address'])
            ->find();
    }
}
