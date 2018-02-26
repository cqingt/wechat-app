<?php
/**
 * Created by 七月.
 * Author: 七月
 * 微信公号：小楼昨夜又秋风
 * 知乎ID: 七月在夏天
 * Date: 2017/2/20
 * Time: 1:34
 */

namespace app\common\model;

use think\Model;

class MessageLog extends Model
{
    // 指定表名,不含前缀
    protected $name = 'message_log';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    public function messageList($userId, $offset, $rows)
    {
        return $this->where(['user_id' => $userId])
            ->field(['type', 'content', "FROM_UNIXTIME(create_time,'%Y-%m-%d %H:%i:%s')" => 'add_time'])
            ->order('id desc')
            ->limit($offset, $rows)
            ->select()
            ->toArray();
    }

    public function messageCount($userId)
    {
        return $this->where(['user_id' => $userId])->count();
    }

    public function addLog($data)
    {
        $data = array_merge($data, ['create_time' => time()]);
        return $this->add($data);
    }
}