<?php
namespace app\common\validate;

use think\Validate;

class Category extends Validate
{
    protected $rule = [
        "name|分类名称" => "require",
        "enabled|是否显示" => "require",
    ];
}
