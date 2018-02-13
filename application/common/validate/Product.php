<?php
namespace app\common\validate;

use think\Validate;

class Product extends Validate
{
    protected $rule = [
        "name|产品名称" => "require",
        "image|产品图片" => "require",
        "price|产品原价" => "require",
        "category_id|产品分类" => "require",
        "attr|产品属性" => "require",
    ];
}
