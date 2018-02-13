<?php
namespace app\common\model;

use think\Model;

class ProductComment extends Model
{
    protected $resultSetType = 'collection';
    // 指定表名,不含前缀
    protected $name = 'product_comment';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    /**
     * @param $productId
     * @param int $type
     * @return int|string
     */
    public function getTotal($productId, $type = 0)
    {
        return $this->where(array_merge(['product_id' => $productId, 'enabled' => 'Y'], $this->getCondition($type)))->count();
    }

    public function getCondition($type = 0)
    {
        if ($type > 0 && $type < 4) {
            $condition = ['c.type' => $type];
        } else if ($type == 4) {
            $condition = ['c.images' => ['NEQ', '']];
        } else {
            $condition = [];
        }
        return $condition;
    }

    /**
     * @param $productId
     * @param int $type
     * @param $offset
     * @param int $rows
     * @return array
     */
    public function getComments($productId, $type = 0, $offset, $rows = 12)
    {
        $commentList = $this->alias('c')
            ->join('user u', 'u.id = c.user_id')
            ->field(['u.username', 'u.avatar', 'c.content', 'c.images', 'c.create_time'])
            ->where(array_merge(['c.product_id' => $productId, 'c.enabled'=> 'Y'], $this->getCondition($type)))
            ->order('c.id desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();

        return $commentList;
    }

    // 最新一条评论
    public function getLastComment($productId)
    {
        $comment = $this->alias('c')
            ->join('user u', 'u.id = c.user_id')
            ->field(['u.username', 'u.avatar', 'c.content', 'c.images', 'c.create_time'])
            ->where(['c.product_id' => $productId, 'c.enabled'=> 'Y'])
            ->order('c.id desc')
            ->limit(1)
            ->find();

        return $comment ? $comment->toArray() : [];
    }
}
