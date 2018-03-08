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
                ['cart.id', 'cart.num', 'cart.sku_id', 'cart.selected','prod.id' => 'product_id',  'prod.name', 'prod.price' => 'original_price', 'prod.image',
                    'prod.attr', 'sku.attr' => 'sku', 'sku.stock', 'sku.price']
            )
            ->select()
            ->toArray();

        return $result;
    }

    public function updateNum($userId, $productId, $skuId, $num)
    {
        return $this->where(['user_id' => $userId, 'product_id' => $productId, 'sku_id' => $skuId])
            ->update(['num' => $num]);
    }

    public function addCart($userId, $productId, $skuId, $num)
    {
        if ($this->where(['user_id' => $userId, 'product_id' => $productId, 'sku_id' => $skuId])->count()) {
            // 存在更新
            $this->where(['user_id' => $userId, 'product_id' => $productId, 'sku_id' => $skuId])
                ->update(['num' => $num]);
        } else {
            // 不存在 新增
            $this->insert(
                [
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'sku_id' => $skuId,
                    'num' => $num
                ]
            );
        }
        return $this->getError() ? false : true;
    }

    // 删除
    public function deleteById($userId, $id)
    {
        return $this->where(['user_id' => $userId, 'id' => $id])
            ->delete();
    }

    /**
     * 获取选中商品
     * @param $userId
     * @return array
     */
    public function getCartSelected($userId)
    {
        $result = $this->alias('cart')
            ->join('product prod', 'cart.product_id = prod.id')
            ->join('product_sku sku', 'cart.sku_id = sku.id')
            ->field(
                ['cart.id', 'cart.num', 'cart.sku_id', 'cart.product_id', 'prod.name' => 'title', 'prod.image' => 'cover',
                    'prod.attr', 'sku.attr' => 'model_value_str', 'sku.stock', 'sku.price', 'cart.selected']
            )
            ->where(['cart.user_id' => $userId, 'cart.selected' => 'Y'])
            ->order('cart.update_time DESC')
            ->select()
            ->toArray();

        return $result;
    }
}
