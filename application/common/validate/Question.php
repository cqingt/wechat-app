<?php
namespace app\common\validate;

use think\Validate;

class Question extends Validate
{
    protected $rule = [
        "title|问题" => "require",
        "source|来源" => "require",
        "content|问题回答" => "require",
    ];
}
