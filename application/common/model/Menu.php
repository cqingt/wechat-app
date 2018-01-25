<?php
namespace app\common\model;

use think\Model;

class Menu extends Model
{
    // 指定表名,不含前缀
    protected $name = 'menu';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $resultSetType = 'collection';

    /**
     * 获取父级菜单
     */
    public function getParentMenu()
    {
        $result = $this->where(['parent_id' => 0, 'enabled' => 'Y'])
            ->order('id ASC')
            ->field(['id', 'name'])
            ->select()
            ->toArray();

        return $result;
    }

    /**
     * @return array
     */
    public function getMenu()
    {
        $result = $this->where([ 'enabled' => 'Y'])
            ->order('id ASC')
            ->field(['id', 'name'])
            ->select()
            ->toArray();

        return $result;
    }

    // 投资开店菜单
    public function getInvestMenu()
    {
        $parentId = $this->where(['pinyin' => 'touzikaidian'])->value('id');
        $result = $this->where([ 'enabled' => 'Y'])
            ->where(['parent_id' => $parentId])
            ->order('id ASC')
            ->field(['id', 'name'])
            ->select()
            ->toArray();

        return $result;
    }

    /**
     * 获取树形结构菜单
     * @return array
     */
    public function getTree()
    {
        $menus = $this
            ->where(['enabled' => 'Y'])
            ->field(['id', 'name', 'pinyin', 'parent_id'])
            ->order('parent_id asc')
            ->select()
            ->toArray();

        $result = [];
        // 分组
        foreach ($menus as $item) {
            if ($item['parent_id'] == 0) {
                $result[$item['id']][] = $item;
            } else {
                $result[$item['parent_id']][] = $item;
            }
        }
        $menus = [];
        // 排序
        foreach ($result as $item) {
            foreach ($item as $it) {
                $menus[] = $it;
            }
        }

        return $menus;
    }
}
