<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/1/26
 * Time: 14:49
 */
namespace app\admin\controller;

use app\admin\Controller;
use library\Tool;
use think\Cache;

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
        for ($year = 2018; $year <= 2025; $year++) {
            $years[$year] = $year;
        }

        for ($month = 1; $month <= 12; $month++) {
            $months[$month] = $month ;
        }

        $this->view->assign('year', date('Y'));
        $this->view->assign('month', date('m'));
        $this->view->assign('years', $years);
        $this->view->assign('months', $months);
        return $this->view->fetch();
    }

    public function ajaxEchart()
    {
        $year = request()->get('year', 0, 'int');
        $month = request()->get('month', 0, 'int');
        $dates = $this->getDateBetween($year, $month);
        $total = count($dates);
        $yearMonth = $year . ($month > 9 ?: '0' . $month);

        $data = [
            'dates'    => $dates,
            'users'    => $this->getCacheData('user', $total, $yearMonth),
            'amounts'  => $this->getCacheData('amount', $total, $yearMonth),
            'products' => $this->getCacheData('product', $total, $yearMonth),
            'orders'   => $this->getCacheData('order', $total, $yearMonth),
        ];

        return ajax_return($data);
    }

    // 获取时间范围
    public function getDateBetween($year, $month)
    {
        $date = implode('-', [$year, $month, '01']); // 当前选择的月
        $total = date('d', strtotime($date . ' +1 month -1 day')); // 当前月的下一月
        $dates = [];

        for ($i = 1; $i <= $total; $i++) {
            $dates[] =  implode('-', [$year, $month, $i]);
        }

        return $dates;
    }

    // 缓存中取数据
    public function getCacheData($prefix, $total, $yearMonth)
    {
        $result = [];
        for ($i = 1; $i <= $total; $i++) {
            $day = $i > 9 ?: '0' . $i;
            $result[] =  Cache::get("{$prefix}_{$yearMonth}{$day}", rand(10, 99));
        }
        return $result;
    }
}