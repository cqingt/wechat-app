<?php
namespace app\common\validate;

use think\Validate;

class About extends Validate
{
    protected $rule = [
        "company|公司名称" => "require",
        "image|图片展示" => "require",
        "telephone|加盟热线" => "require",
    ];
}
