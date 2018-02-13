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

    public function getTotal($productId)
    {
        return $this->where(['product_id' => $productId, 'enabled' => 'Y'])->count();
    }

    public function getComments($productId, $type = 0, $offset, $rows = 12)
    {
        $comments = $this->alias('c')
            ->join('user u', 'u.id = c.user_id')
            ->find(['u.username', 'u.avatar', 'c.content', 'c.images', 'c.create_time'])
            ->where(['c.product_id' => $productId, 'c.enabled'=> 'Y'])
            ->order('c.id desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();

        return $comments;
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
