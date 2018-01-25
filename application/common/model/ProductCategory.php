<?php
namespace app\common\model;

use think\Model;

class ProductCategory extends Model
{
    // 指定表名,不含前缀
    protected $name = 'product_category';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    /**
     * @return array
     */
    public function getMenu()
    {
        $result = $this->where([ 'enabled' => 'Y'])
            ->order('id ASC')
            ->field(['id', 'title'])
            ->select()
            ->toArray();

        return $result;
    }
}
