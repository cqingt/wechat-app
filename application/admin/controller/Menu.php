<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Menu extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function __construct()
    {
        parent::__construct();
        $topMenus = model('menu')->getParentMenu();

        $tops = array_column($topMenus, 'name', 'id');
        $this->view->assign('topMenus', $topMenus);
        $this->view->assign('tops', $tops);
    }

    protected function filter(&$map)
    {
        if ($this->request->param("name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
    }
}
