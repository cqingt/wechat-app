<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Loader;

class News extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function __construct()
    {
        parent::__construct();
        $menus = model('menu')->getMenu();
        $menusArr = array_column($menus, 'name', 'id');
        $this->view->assign('menus', $menus);
        $this->view->assign('menusArr', $menusArr);
    }


    protected function filter(&$map)
    {
        if ($this->request->param("title")) {
            $map['title'] = ["like", "%" . $this->request->param("title") . "%"];
        }
    }

    public function editss()
    {
        //if ($this->request->isAjax()) {
            $upload = \Qiniu::instance();
            $info = $upload->upload('image/');
            $error = $upload->getError();

            if (!empty($error)) {
                return ajax_return_adv_error($error);
            } else {
                $_POST['image'] = $info[0]['name'];
            }
            print_r($info);
            print_r($error);exit;
        /*} else {

        }
        parent::edit();*/
    }
}
