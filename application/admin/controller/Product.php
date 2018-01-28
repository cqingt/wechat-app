<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use app\common\model\Product as ModelProduct;
use app\common\model\Category as ModelCategory;

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
            $model->alias($map['_table'])->join(ModelCategory::getTable() . ' category', 'product.category_id = category.id');
        };
        $map['_field'] = ['product.id','product.name','product.image','product.attr','product.price','product.stock', 'category.name as category' , 'product.create_time'];
    }
}
