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
            ->field(['id', 'name', 'image', 'sales', 'fade_sales', 'hots', 'price', 'origin_price', 'stock'])
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

    public function getProducts($categoryId, $offset = 0, $rows = 10)
    {
        return $this->where(['category_id' => $categoryId, 'online' => 'Y', 'recommend' => 'Y'])
            ->field(['id', 'name', 'image', 'sales', 'fade_sales', 'hots', 'price', 'origin_price', 'stock'])
            ->order('hots desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();
    }

    // 总数
    public function getProductCount($categoryId)
    {
        return $this->where(['category_id' => $categoryId, 'online' => 'Y', 'recommend' => 'Y'])->count();
    }
}
