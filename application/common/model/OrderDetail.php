<?php
namespace app\common\model;

use think\Model;

class OrderDetail extends Model
{
    // 指定表名,不含前缀
    protected $name = 'order_detail';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    // 订单商品详情
    public function getDetail($orderId)
    {
        return $this
            ->where(['order_id' => $orderId])
            ->field(['product_name', 'product_image', 'product_attr', 'product_sku', 'product_price', 'product_num'])
            ->select()
            ->toArray();
    }
}
