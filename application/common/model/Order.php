<?php
namespace app\common\model;

use library\Tool;
use think\Log;
use think\Model;
use think\Cache;

class Order extends Model
{
    // 指定表名,不含前缀
    protected $name = 'order';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function countOrder($dataType)
    {
        $condition = [];
        if ($dataType && $dataType != 'total') {
            $condition = Tool::getBetweenTime($dataType);
        }
        $condition = array_merge(['status' => ['GT', 0]], $condition);

        return $this->where($condition)->count();
    }
}
