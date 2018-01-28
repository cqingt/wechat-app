<?php
namespace app\common\validate;

use think\Validate;

class User extends Validate
{
    protected $rule = [
        "username|昵称" => "require",
        "telephone|手机号" => "require",
    ];
}
