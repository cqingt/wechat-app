<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\Product as ModelProduct;
use app\common\model\ProductSku;
use app\common\model\Category as ModelCategory;
use think\Loader;
use think\Config;
use think\Db;
use think\exception\HttpException;
use think\Log;

class Product extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function __construct()
    {
        parent::__construct();

        $categories = model('category')->getCategory();

        $categoryArr = array_column($categories, 'name', 'id');
        $this->view->assign('categories', $categories);
        $this->view->assign('categoryArr', $categoryArr);
    }

    protected function filter(&$map)
    {
        if ($this->request->param("name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
        if ($this->request->param("category_id")) {
            $map['category_id'] = ["=", $this->request->param("category_id")];
        }
        // 设置属性
        $map['_table'] = "product";
        $map['_order_by'] = "product.id desc";
        $map['_func'] = function (ModelProduct $model) use ($map) {
            $model->alias($map['_table'])->join(ModelCategory::getTable() . ' category', 'product.category_id = category.id')
            ->where(['product.online' => 'Y']);
        };
        $map['_field'] = [
            'product.id','product.name','product.image','product.sales','product.attr','product.price','product.stock',
            'category.name as category' , 'product.create_time'
        ];
    }

    protected function filterOffline(&$map)
    {
        if ($this->request->param("name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
        if ($this->request->param("category_id")) {
            $map['category_id'] = ["=", $this->request->param("category_id")];
        }
        // 设置属性
        $map['_table'] = "product";
        $map['_order_by'] = "product.id desc";
        $map['_func'] = function (ModelProduct $model) use ($map) {
            $model->alias($map['_table'])->join(ModelCategory::getTable() . ' category', 'product.category_id = category.id')
                ->where(['product.online' => 'N']);
        };
        $map['_field'] = [
            'product.id','product.name','product.image','product.sales','product.attr','product.price','product.stock',
            'category.name as category' , 'product.create_time'
        ];
    }

    // 下架商品
    public function offline()
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
        if (method_exists($this, 'filterOffline')) {
            $this->filterOffline($map);
        }

        $this->datalist($model, $map);

        return $this->view->fetch();
    }

    // 上架
    public function online()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->post();

            if (! $data['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }

            $this->getModel('Product')->update(['online' => 'Y'], ['id' => $data['id']]);

            return ajax_return_adv("删除成功");
        }
    }

    /**
     * 添加
     * @return mixed
     */
    public function add()
    {
        $controller = $this->request->controller();

        if ($this->request->isAjax()) {
            // 插入
            $data = $this->request->except(['id']);

            if (isset($data['sku'])) {
                $skus = $data['sku'];
                unset($data['sku']);
            }

            // 验证
            if (class_exists($validateClass = Loader::parseClass(Config::get('app.validate_path'), 'validate', $controller))) {
                $validate = new $validateClass();
                if (!$validate->check($data)) {
                    return ajax_return_adv_error($validate->getError());
                }
            }

            // 写入数据
/*            if (
                class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $this->parseCamelCase($controller)))
                || class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $controller))
            ) {
                //使用模型写入，可以在模型中定义更高级的操作
                $model = new $modelClass();
                $ret = $model->isUpdate(false)->save($data);
            } else {*/
                // 简单的直接使用db写入
                Db::startTrans();
                try {
                    $data['create_time'] = time();
                    $data['content'] = 'aa'; //todo
                    $data['stock'] = 0;
                    $model = Db::name($this->parseTable($controller));
                    $result = $model->insert($data);
                    $productId = $model->getLastInsID();

                    $stock = 0;
                    $skuArr = [];
                    $skuModel = new ProductSku();

                    if (isset($skus)) {
                        $length = count($skus['attr']);
                        for ($i = 0; $i < $length; $i++) {
                            foreach ($skus as $key => $sku) {
                                $skuArr[$i][$key] = $sku[$i];
                            }
                            $skuArr[$i]['product_id'] = $productId;
                            $stock += $skuArr[$i]['stock'];
                            // 批量更新或新增
                            $skuModel->insert($skuArr[$i]);
                        }
                    }
                    // 更新库存
                    $model->where(['id' => $productId])->update(['stock' => $stock]);

                    // 提交事务
                    Db::commit();
                } catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();

                    return ajax_return_adv_error($e->getMessage());
                }
            //}
            return ajax_return_adv('添加成功');
        } else {
            // 添加
            $this->view->assign('skus', []);
            return $this->view->fetch('add');
        }
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

            // 更新数据
            /*if (
                class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $this->parseCamelCase($controller)))
                || class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $controller))
            ) {
                // 使用模型更新，可以在模型中定义更高级的操作
                $model = new $modelClass();
                $ret = $model->isUpdate(true)->save($data, ['id' => $data['id']]);
            } else {*/
                // 简单的直接使用db更新
                Db::startTrans();
                try {
                    $data['update_time'] = time();
                    $model = Db::name($this->parseTable($controller));
                    $ret = $model->where('id', $data['id'])->update($data);

                    $skuArr = [];
                    $stock = 0;
                    $skuModel = new ProductSku();

                    if (isset($skus)) {
                        $length = count($skus['attr']);
                        for ($i = 0; $i < $length; $i++) {
                            foreach ($skus as $key => $sku) {
                                $skuArr[$i][$key] = $sku[$i];
                            }
                            $skuArr[$i]['product_id'] = $data['id'];
                            $stock += $skuArr[$i]['stock'];
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
                    // 更新库存
                    $model->where(['id' => $data['id']])->update(['stock' => $stock]);
                    // 提交事务
                    Db::commit();
                } catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();

                    return ajax_return_adv_error($e->getMessage());
                }
            //}

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

            $skus = (new ProductSku())->getAll($id);

            $this->view->assign('skus', $skus);
            $this->view->assign("vo", $vo);

            return $this->view->fetch();
        }
    }

    // 获取所有sku
    public function getSku()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->get();

            if (! $data['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }

            $skus = (new ProductSku())->getAll($data['id']);

            return json($skus);
        }
    }

    // 删除单个sku
    public function delSku()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->post();

            if (! $data['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }

            (new ProductSku())->where(['id' => $data['id']])->delete();

            return ajax_return_adv("删除成功");
        }
    }
}
