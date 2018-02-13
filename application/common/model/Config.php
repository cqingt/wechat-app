<?php
namespace app\common\model;

use think\Model;

class Config extends Model
{
    // 指定表名,不含前缀
    protected $name = 'config';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    public function getAllConfig()
    {
        return $this->field(['keyword', 'value'])->column('value', 'keyword');
    }

    public function getExpressFee()
    {
        $config = $this->getAllConfig();

        if (! empty($config)) {
            if ($config['EXPRESS'] === 'FREE') {
                return '包邮';
            } else {
                return sprintf('%.2f', $config['EXPRESS_FEE']);
            }
        }
    }
}
