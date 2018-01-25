<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author    yuan1994 <tianpian0805@gmail.com>
 * @link      http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

namespace app\admin\controller;

use app\admin\Controller;
use think\Db;
use think\Config;

class Upload extends Controller
{
    /**
     * 首页
     */
    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 文件上传
     */
    public function upload()
    {
        // 改为7牛上传
        $upload = \Qiniu::instance();
        $info = $upload->upload('image/');
        $error = $upload->getError();
        $domain = Config::get('qiniu.domain');

        if (!empty($error)) {
            return ajax_return_error($error);
        } else {
            $insert = [
                'cate'     => 3,
                'name'     => $info[0]['key'],
                'original' => $info[0]['name'],
                'domain'   => $domain,
                'type'     => $info[0]['type'],
                'size'     => $info[0]['size'],
                'mtime'    => time(),
            ];
            Db::name('File')->insert($insert);
        }

        return ajax_return(['name' => $domain . $info[0]['key']]);

        /*$file = $this->request->file('file');
        $path = ROOT_PATH . 'public/tmp/uploads/';
        $info = $file->move($path);
        if (!$info) {
            return ajax_return_error($file->getError());
        }
        $data = $this->request->root() . '/tmp/uploads/' . $info->getSaveName();
        $insert = [
            'cate'     => 3,
            'name'     => $data,
            'original' => $info->getInfo('name'),
            'domain'   => '',
            'type'     => $info->getInfo('type'),
            'size'     => $info->getInfo('size'),
            'mtime'    => time(),
        ];
        Db::name('File')->insert($insert);

        return ajax_return(['name' => $data]);*/
    }

    /**
     * 远程图片抓取
     */
    public function remote()
    {
        $url = $this->request->post('url');
        // validate
        $name = ROOT_PATH . 'public/tmp/uploads/' . get_random();
        $name = \File::downloadImage($url, $name);

        $ret = $this->request->root() . '/tmp/uploads/' . basename($name);

        return ajax_return(['url' => $ret], '抓取成功');
    }

    /**
     * 图片列表
     */
    public function listImage()
    {
        $page = $this->request->param('p', 1);
        if ($this->request->param('count')) {
            $ret['count'] = Db::name('File')->where('cate=3')->count();
        }
        $ret['list'] = Db::name('File')->where('cate=3')->field('id,name,original')->page($page, 10)->select();

        return ajax_return($ret);
    }

    public function video()
    {
        return $this->view->fetch();
    }

    // 视频上传
    public function uploadVideo()
    {
        $upload = \Qiniu::instance();
        $info = $upload->upload('video/');
        $error = $upload->getError();
        $domain = Config::get('qiniu.domain');

        if (! empty($error)) {
            return ajax_return_error($error);
        }

        // 视频截图 url 拼接：?vframe/jpg/offset/10/w/320/h/180
        return ajax_return(['name' => $domain . $info[0]['key']]);
    }
}