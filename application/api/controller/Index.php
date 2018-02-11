<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/11
 * Time: 16:37
 */
namespace app\api\controller;

class Index extends BaseController
{
    public function index()
    {
        echo json_encode(['code' => 200, 'msg' => 'success']);
    }
}