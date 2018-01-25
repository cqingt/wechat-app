<?php
namespace app\common\validate;

use think\Validate;

class Product extends Validate
{
    protected $rule = [
        "category_id|商品分类" => "require",
        "title|商品名称" => "require",
        "image|商品图片" => "require",
        "is_hot|是否爆款" => "require",
        "is_new|是否新品" => "require",
        "enabled|是否显示" => "require",
    ];
}
