<?php
namespace app\common\validate;

use think\Validate;

class ProductCategory extends Validate
{
    protected $rule = [
        "title|分类名称" => "require",
        "pinyin|分类简称" => "require",
        "image|分类图标" => "require",
//        "image_hover|切换图片" => "require",
        "enabled|是否显示" => "require",
    ];
}
