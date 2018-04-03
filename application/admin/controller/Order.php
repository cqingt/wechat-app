<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\Order as ModelOrder;
use app\common\model\OrderAddress as ModelOrderAddress;
use app\common\model\OrderDetail as ModelOrderDetail;
use library\Constants;
use library\Tool;
use think\exception\HttpException;
use think\Hook;

class Order extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    public function __construct()
    {
        parent::__construct();
        $this->view->assign('status', Constants::$orderStatus);
    }

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
        $map['_field'] = [
            'orders.id','orders.order_sn','orders.price','orders.status','orders.express','orders.express_no',
            'orders.pay_time','address.username','address.telephone'
        ];
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

        return $this->view->fetch();
    }

    /**
     * 编辑
     * @return mixed
     */
    public function detail()
    {
        $controller = $this->request->controller();
        $id = $this->request->param('id');
        if (!$id) {
            throw new HttpException(404, "缺少参数ID");
        }
        $vo = $this->getModel($controller)
            ->alias('orders')
            ->join(ModelOrderAddress::getTable() . ' address', 'address.order_id = orders.id')
            ->field(
                [
                    'orders.id','orders.order_sn','orders.price','orders.status','orders.express','orders.express_no',
                    'orders.pay_time','address.username','address.telephone','address.province','address.city',
                    'address.area','address.address','orders.express_json', 'orders.express_id', 'orders.express_status'
                ]
            )
            ->where(['orders.id' => $id])
            ->find();

        $goods = $this->getModel('OrderDetail')
            ->where(['order_id' => $id])
            ->select();

        if (!$vo) {
            throw new HttpException(404, '该记录不存在');
        }

        $status = $vo['express_status'];

        // 非签收的订单
        if ($vo['express_no'] && $vo['express_status'] != Tool::$expressSigned) {

            $result = Tool::getExpress($id, $vo['express_id'], $vo['express_no']);
            $expressData = isset($result['data']) ? $result['data'] : [];
            $status = isset($result['status']) ? $result['status'] : 1;

        } else if (! empty($vo['express_json'])) {

            $express = json_decode($vo['express_json'], true, JSON_UNESCAPED_UNICODE);
            if (!empty($express['data'])) {
                $expressData = $express['data'];
            }

        }

        $this->view->assign("vo", $vo);
        $this->view->assign("goods", $goods);
        $this->view->assign("express", isset($expressData) ? $expressData : []);
        $this->view->assign("state", Tool::getState($status));

        return $this->view->fetch('edit');
    }

    public function express()
    {
        $controller = $this->request->controller();
        $id = $this->request->param('id');
        if (!$id) {
            throw new HttpException(404, "缺少参数ID");
        }

        $orderInfo = $this->getModel($controller)
            ->where(['id' => $id])
            ->field(['express_id', 'express_no', 'express_json', 'express_status'])
            ->find();
        $expressData = [];
        $status = 1;

        if (! empty($orderInfo)) {
            if ($orderInfo['express_no'] && $orderInfo['express_status'] != Tool::$expressSigned) {
                $result = Tool::getExpress($id, $orderInfo['express_id'], $orderInfo['express_no']);
                $expressData = isset($result['data']) ? $result['data'] : [];
                $status = isset($result['status']) ? $result['status'] : 1;

            } else if (! empty($orderInfo['express_json'])) {

                $express = json_decode($orderInfo['express_json'], true, JSON_UNESCAPED_UNICODE);
                $status = $orderInfo['status'];

                if (! empty($express['data'])) {
                    $expressData = $express['data'];
                }
            }
        }

        $params = ['order_id' => $id];
        Hook::exec('\\app\\admin\behavior\Order', 'run', $params);

        $this->view->assign("express", $expressData);
        $this->view->assign("state", Tool::getState($status));

        return $this->view->fetch();
    }
}
