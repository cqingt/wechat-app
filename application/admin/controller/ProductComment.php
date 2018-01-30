<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\ProductComment as ModelComment;
use app\common\model\Product;
use app\common\model\User;
use app\common\model\Order;

class ProductComment extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        // 设置属性
        $map['_table'] = "c";
        $map['_order_by'] = "c.id desc";
        $map['_func'] = function (ModelComment $model) use ($map) {
            $model->alias($map['_table'])
                ->join(Product::getTable() . ' p', 'p.id = c.product_id')
                ->join(User::getTable() . ' u', 'u.id = c.user_id')
                ->join(Order::getTable() . ' o', 'o.id = c.order_id')
                ;
        };
        $map['_field'] = ['c.id','c.content','c.enabled','p.name','o.order_sn','u.username', 'c.create_time'];
    }

    public function update()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->get();

            if (! $data['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }

           $flag = $this->getModel('ProductComment')->update(['enabled' => $data['enabled']], ['id' => $data['id']]);

            if ($flag) {
                return json(['code' => 200]);
            }
        }
    }
}
