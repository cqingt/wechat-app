<?php
namespace app\common\model;

use think\Model;

class ProductSku extends Model
{
    // 指定表名,不含前缀
    protected $name = 'product_sku';

    protected $resultSetType = 'collection';

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function addBatch($data)
    {
        self::insertAll($data);

        return $this->getError() ? false : true;
    }

    public function getAll($productId)
    {
        $skus = $this->where(['product_id' => $productId])
            ->order('attr DESC')
            ->select()
            ->toArray();

        return $skus;
    }

    // 获取库存
    public function getStock($productId, $skuId)
    {
        return $this->where(['product_id' => $productId, 'id' => $skuId, 'enabled'=> 'Y'])->value('stock');
    }

    // 获取价格
    public function getPrice($productId, $skuId)
    {
        return $this->where(['product_id' => $productId, 'id' => $skuId, 'enabled'=> 'Y'])->value('price');
    }

    // 获取sku属性
    public function getAttr($productId, $skuId)
    {
        return $this->where(['product_id' => $productId, 'id' => $skuId, 'enabled'=> 'Y'])->value('attr');
    }

    public function getSku($productId, $skuId)
    {
        return $this->where(['product_id' => $productId, 'id' => $skuId, 'enabled'=> 'Y'])
            ->field(['attr', 'stock', 'price'])
            ->find()
            ->toArray();
    }
}
