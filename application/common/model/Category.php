<?php
namespace app\common\model;

use think\Model;

class Category extends Model
{
    // 指定表名,不含前缀
    protected $name = 'category';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    /**
     * @return array
     */
    public function getCategory()
    {
        $result = $this->where([ 'enabled' => 'Y'])
            ->order('id DESC')
            ->field(['id', 'name'])
            ->select()
            ->toArray();

        return $result;
    }

    public function getParents()
    {
        $result = $this->where([ 'enabled' => 'Y'])
            ->where(['parent_id' => 0])
            ->order('id DESC')
            ->field(['id', 'name'])
            ->select()
            ->toArray();

        return $result;
    }
}
