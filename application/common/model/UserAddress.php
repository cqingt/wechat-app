<?php
namespace app\common\model;

use think\Model;

class UserAddress extends Model
{
    // 指定表名,不含前缀
    protected $name = 'user_address';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    public function addressList($userId)
    {
        return $this->where(['user_id' => $userId, 'enabled' => 'Y'])
            ->field(['id', 'username', 'telephone', 'province', 'city', 'area', 'address', 'is_default'])
            ->order('create_time desc')
            ->select()
            ->toArray();
    }

    public function addressInfo($userId, $addressId)
    {
        return $this->where(['id' => $addressId, 'user_id' => $userId, 'enabled' => 'Y'])
            ->field(['id', 'username', 'telephone', 'province', 'city', 'area', 'address', 'sex', 'is_default'])
            ->find();
    }

    public function addAddress($data, $addressId = 0)
    {
        if ($addressId) {
            return $this->where(['id' => $addressId])->update($data);
        } else {
            return $this->insert($data);
        }
    }

    public function delAddress($userId, $addressId)
    {
        $this->where(['user_id' => $userId, 'id' => $addressId])->delete();
        return $this->getError() ? false : true;
    }
}
