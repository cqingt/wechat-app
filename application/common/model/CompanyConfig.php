<?php
namespace app\common\model;

use think\Model;

class CompanyConfig extends Model
{
    // 指定表名,不含前缀
    protected $name = 'company_config';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function getFieldValue($field)
    {
        return $this->where(['id' => 1])->value($field);
    }
}
