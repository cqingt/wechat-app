<?php
namespace app\common\model;

use think\Model;

class UserIntegral extends Model
{
    // 指定表名,不含前缀
    protected $name = 'user_integral';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function getTotal($userId, $type = 'GET')
    {
        return $this->where(['user_id' => $userId, 'type' => $type])->sum('amount');
    }

    public function getCount($userId, $type = 'GET')
    {
        return $this->where(['user_id' => $userId, 'type' => $type])->count();
    }

    public function getList($userId, $type, $offset, $limit)
    {
        return $this->where(['user_id' => $userId, 'type' => $type])
            ->field(['create_time', 'amount', 'remark'])
            ->order('create_time desc')
            ->limit($offset, $limit)
            ->select()
            ->toArray();
    }
}
