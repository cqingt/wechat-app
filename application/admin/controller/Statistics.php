<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/1/26
 * Time: 14:49
 */
namespace app\admin\controller;

use app\admin\Controller;

class Statistics extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        if ($this->request->param("title")) {
            $map['title'] = ["like", "%" . $this->request->param("title") . "%"];
        }
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function ajaxEchart()
    {
        $year = request()->get('year', 0, 'int');
        $month = request()->get('month', 0, 'int');
        $dates = $this->getDateBetween($year, $month);
        $total = count($dates);

        $data = [
            'dates' => $dates,
            'users' => $this->getUsers($total),
            'amounts' => $this->getAmounts($total),
            'products' => $this->getProducts($total),
            'orders' => $this->getOrders($total),
        ];

        return ajax_return($data);
    }

    public function getDateBetween($year, $month)
    {
        $date = $year . '-' . $month . '-01';
        $total = date('d', strtotime($date . ' +1 month -1 day'));
        $dates = [];

        for ($i = 1; $i <= $total; $i++) {
            $dates[] =  $year . '-' . $month . '-' . ($i < 10 ? '0' . $i : $i);
        }

        return $dates;
    }

    public function getUsers($total)
    {
        $users = [];
        for ($i = 1; $i <= $total; $i++) {
            $users[] =  rand(100, 199);
        }
        return $users;
    }

    public function getAmounts($total)
    {
        $amounts = [];
        for ($i = 1; $i <= $total; $i++) {
            $amounts[] =  rand(200, 999) + rand();
        }
        return $amounts;
    }

    public function getProducts($total)
    {
        $products = [];
        for ($i = 1; $i <= $total; $i++) {
            $products[] =  rand(10, 29);
        }
        return $products;
    }

    public function getOrders($total)
    {
        $orders = [];
        for ($i = 1; $i <= $total; $i++) {
            $orders[] =  rand(10, 99);
        }
        return $orders;
    }
}