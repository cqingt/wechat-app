<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Product extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function __construct()
    {
        parent::__construct();
        $categories = model('productCategory')->getMenu();

        $cates = array_column($categories, 'title', 'id');
        $this->view->assign('categories', $categories);
        $this->view->assign('cates', $cates);

        //$this->view->assign('indexUrl', url('menuTopic/index'));
    }
    protected function filter(&$map)
    {
        if ($this->request->param("title")) {
            $map['title'] = ["like", "%" . $this->request->param("title") . "%"];
        }
    }
}
