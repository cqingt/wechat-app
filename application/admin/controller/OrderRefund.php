<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\Order;
use app\common\model\User;
use app\common\model\OrderRefund as RefundModel;
use library\Constants;
use think\Db;
use think\exception\HttpException;
use think\Loader;

class OrderRefund extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    public function __construct()
    {
        parent::__construct();
        $this->view->assign('status', Constants::$refundStatus);
    }

    protected function filter(&$map)
    {
        if ($this->request->param("order_sn")) {
            $map['orders.order_sn'] = ["like", "%" . $this->request->param("order_sn") . "%"];
        }
        if ($this->request->param("refund_sn")) {
            $map['refund.refund_sn'] = ["like", "%" . $this->request->param("refund_sn") . "%"];
        }

        // 设置属性
        $map['_table'] = "refund";
        $map['_order_by'] = "refund.id desc";
        $map['_func'] = function (RefundModel $model) use ($map) {
            $model->alias($map['_table'])->join(Order::getTable() . ' orders', 'refund.order_id = orders.id');
        };
        $map['_field'] = [
            'refund.id', 'orders.order_sn', 'refund.refund_sn', 'refund.refund_price', 'refund.express', 'refund.express_no', 'refund.create_time',
            'refund.status','refund.reason'
        ];
    }

    /**
     * 编辑
     * @return mixed
     */
    public function edit()
    {
        $controller = $this->request->controller();

        if ($this->request->isAjax()) {
            $data = $this->request->post();
            if (!$data['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }

            // 验证
            if (class_exists($validateClass = Loader::parseClass(Config::get('app.validate_path'), 'validate', $controller))) {
                $validate = new $validateClass();
                if (!$validate->check($data)) {
                    return ajax_return_adv_error($validate->getError());
                }
            }

            if (isset($data['sku'])) {
                $skus = $data['sku'];
                unset($data['sku']);
            }

            Db::startTrans();
            try {
                $model = Db::name($this->parseTable($controller));
                $ret = $model->where('id', $data['id'])->update($data);

                $skuArr = [];
                $skuModel = new ProductSku();

                if (isset($skus)) {
                    $length = count($skus['attr']);
                    for ($i = 0; $i < $length; $i++) {
                        foreach ($skus as $key => $sku) {
                            $skuArr[$i][$key] = $sku[$i];
                        }
                        $skuArr[$i]['product_id'] = $data['id'];

                        // 批量更新或新增
                        if ($skuId = $skuArr[$i]['id']) {
                            unset($skuArr[$i]['id']);
                            $skuModel->update($skuArr[$i], ['id' => $skuId]);
                        } else {
                            unset($skuArr[$i]['id']);
                            $skuModel->insert($skuArr[$i]);
                        }
                    }
                }

                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();

                return ajax_return_adv_error($e->getMessage());
            }

            return ajax_return_adv("编辑成功");
        } else {
            // 编辑
            $id = $this->request->param('id');
            if (!$id) {
                throw new HttpException(404, "缺少参数ID");
            }
            $vo = $this->getModel($controller)->find($id);
            if (!$vo) {
                throw new HttpException(404, '该记录不存在');
            }
            $orderSn = (new Order())->where(['id' => $vo['order_id']])->value('order_sn');

            $this->view->assign('order_sn', $orderSn);
            $this->view->assign("vo", $vo);

            return $this->view->fetch();
        }
    }
}
