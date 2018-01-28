<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\Order as ModelOrder;
use app\common\model\OrderAddress as ModelOrderAddress;
use library\Constants;

class Order extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    protected function filter(&$map)
    {
        if ($this->request->param("order_sn")) {
            $map['order_sn'] = ["like", "%" . $this->request->param("order_sn") . "%"];
        }
        if ($this->request->param("express_no")) {
            $map['express_no'] = ["like", "%" . $this->request->param("express_no") . "%"];
        }

        if ($this->request->param("status")) {
            $map['status'] = ["=", $this->request->param("status")];
        }

        // 设置属性
        $map['_table'] = "orders";
        $map['_order_by'] = "orders.id desc";
        $map['_func'] = function (ModelOrder $model) use ($map) {
            $model->alias($map['_table'])->join(ModelOrderAddress::getTable() . ' address', 'address.order_id = orders.id');
        };
        $map['_field'] = ['orders.id','orders.order_sn','orders.price','orders.status','orders.express','orders.express_no','orders.pay_time','address.username','address.telephone'];
    }

    /**
     * 首页
     * @return mixed
     */
    public function index()
    {
        $model = $this->getModel();

        // 列表过滤器，生成查询Map对象
        $map = $this->search($model, [$this->fieldIsDelete => $this::$isdelete]);

        // 特殊过滤器，后缀是方法名的
        $actionFilter = 'filter' . $this->request->action();
        if (method_exists($this, $actionFilter)) {
            $this->$actionFilter($map);
        }

        // 自定义过滤器
        if (method_exists($this, 'filter')) {
            $this->filter($map);
        }

        $this->datalist($model, $map);

        $this->view->assign('status', Constants::$orderStatus);
        return $this->view->fetch();
    }
}
