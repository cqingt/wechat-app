<?php
namespace app\common\validate;

use think\Validate;

class Banner extends Validate
{
    protected $rule = [
        "image|轮播图" => "require",
    ];
}
