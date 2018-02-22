<?php
namespace app\common\model;

use think\Model;

class Product extends Model
{
    protected $resultSetType = 'collection';
    // 指定表名,不含前缀
    protected $name = 'product';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 推荐
    public function getRecommend($offset = 0, $rows = 10)
    {
        return $this->where(['online' => 'Y', 'recommend' => 'Y'])
            ->field(['id', 'name', 'image', 'sales', 'fade_sales', 'hots', 'price', 'origin_price', 'stock', 'recommend'])
            ->order('hots desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();
    }

    // 推荐总数
    public function getRecommendCount()
    {
        return $this->where(['online' => 'Y', 'recommend' => 'Y'])->count();
    }

    public function getProducts($condition, $offset = 0, $rows = 10, $sortBy = 'hots', $sort = 'DESC')
    {
        $condition = array_merge($condition, ['online' => 'Y', 'recommend' => 'Y']);
        return $this->where($condition)
            ->field(['id', 'name', 'image', 'sales', 'fade_sales', 'hots', 'price', 'origin_price', 'stock', 'recommend'])
            ->order($sortBy . ' ' . $sort)
            ->limit($offset, $rows)
            ->select()
            ->toArray();
    }

    // 总数
    public function getProductCount($condition)
    {
        return $this->where(array_merge($condition, ['online' => 'Y', 'recommend' => 'Y']))->count();
    }

    // info
    public function getInfo($productId)
    {
        $info = $this->where(['id' => $productId, 'online' => 'Y'])
            ->field(
                ['id', 'name' => 'title', 'image' => 'cover', 'sales', 'fade_sales', 'hots', 'price', 'attr',
                    'origin_price', 'stock', 'recommend', 'content' => 'description']
            )
            ->find();

        return $info ? $info->toArray() : [];
    }
}
