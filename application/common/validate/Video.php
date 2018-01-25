<?php
namespace app\common\validate;

use think\Validate;

class Video extends Validate
{
    protected $rule = [
        "title|视频标题" => "require",
        "url|视频链接" => "require",
        "image|视频封面" => "require",
    ];
}
