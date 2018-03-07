<?php
namespace app\common\model;

use think\Model;

class User extends Model
{
    // 指定表名,不含前缀
    protected $name = 'user';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    public function getUserInfo($userId)
    {
        return $this->where(['id' => $userId])
            ->field(['username' => 'nickname', 'telephone' => 'mobile', 'avatar'])
            ->limit(1)
            ->find();
    }

    public function saveUserInfo($userId, $data)
    {
        $this->where(['id' => $userId])->update($data);

        return $this->getError() ? false : true;
    }

    public function getUserField($userId, $field)
    {
        return $this->where(['id' => $userId])->value($field);
    }

    public function existOpenId($openId)
    {
        return $this->where(['openid' => $openId])->count();
    }

    public function existUsername($openId)
    {
        return $this->where(['openid' => $openId])->value('username');
    }

    public function addUser($openId)
    {
        $this->insert(['openid' => $openId, 'create_time' => time()]);

        return $this->getError() ? false : true;
    }

    public function getUserInfo2($userId)
    {
        return $this->where(['id' => $userId])
            ->field(['username', 'telephone', 'gender', 'avatar'])
            ->limit(1)
            ->find();
    }

    public function getUserId($openId)
    {
        return $this->where(['openid' => $openId])->value('id');
    }
}
