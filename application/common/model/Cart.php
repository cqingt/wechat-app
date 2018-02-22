<?php
namespace app\common\model;

use think\Model;

class Cart extends Model
{
    // 指定表名,不含前缀
    protected $name = 'cart';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    /**
     * @param $userId int
     * @return array
     */
    public function getCartList($userId)
    {
        $result = $this->alias('cart')
            ->join('product prod', 'cart.product_id = prod.id')
            ->join('product_sku sku', 'cart.sku_id = sku.id')
            ->where(['cart.user_id' => $userId, 'cart.enabled' => 'Y'])
            ->order('cart.update_time DESC')
            ->field(
                ['cart.id', 'cart.num', 'cart.selected','prod.id' => 'product_id',  'prod.name', 'prod.price' => 'original_price', 'prod.image',
                    'prod.attr', 'sku.attr' => 'sku', 'sku.stock', 'sku.price']
            )
            ->select()
            ->toArray();

        return $result;
    }
}
