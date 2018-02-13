<?php
namespace app\common\model;

use think\Model;

class Banner extends Model
{
    protected $resultSetType = 'collection';
    // 指定表名,不含前缀
    protected $name = 'banner';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function getAll()
    {
        return $this->where(['enabled' => 'Y'])
            ->field(['image', 'id', 'product_id'])
            ->order('position desc')
            ->select()
            ->toArray();
    }
}
