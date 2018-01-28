<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Category extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function __construct()
    {
        parent::__construct();
        $categories = model('category')->getParents();

        $categoryArr = array_column($categories, 'name', 'id');
        $this->view->assign('categories', $categories);
        $this->view->assign('categoryArr', $categoryArr);
    }
}
