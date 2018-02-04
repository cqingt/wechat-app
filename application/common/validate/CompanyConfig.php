<?php
namespace app\common\validate;

use think\Validate;

class CompanyConfig extends Validate
{
    protected $rule = [
        "username|联系人" => "require",
        "telephone|联系电话" => "require",
        "address|详细地址" => "require",
        "delivery|配送方式" => "require",
    ];
}
