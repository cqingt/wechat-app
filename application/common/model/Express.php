<?php
namespace app\common\model;

use think\Model;

class Express extends Model
{
    // 指定表名,不含前缀
    protected $name = 'express';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function getExpressCode($expressId)
    {
        return $this->where(['id' => $expressId])->value('code');
    }
}
