<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\common\model\ConsumeLog as ModelLog;
use app\common\model\Order;
use app\admin\Controller;

class ConsumeLog extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    protected function filter(&$map)
    {
        // 设置属性
        $map['_table'] = "log";
        $map['_order_by'] = "log.id desc";
        $map['_func'] = function (ModelLog $model) use ($map) {
            $model->alias($map['_table'])->join(Order::getTable() . ' o', 'log.order_id = o.id');
        };
        $map['_field'] = ['o.order_sn','log.id','log.consume','log.amount','log.remark','log.create_time'];
    }
}
