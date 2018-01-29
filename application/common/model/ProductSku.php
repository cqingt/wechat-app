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
            ->select()
            ->toArray();

        return $skus;
    }
}
