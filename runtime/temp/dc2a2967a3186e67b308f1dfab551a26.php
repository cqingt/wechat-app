<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:80:"D:\wamp\www\xiaochengxu\public/../application/admin\view\demo\mail_template.html";i:1516773532;s:75:"D:\wamp\www\xiaochengxu\public/../application/admin\view\template\base.html";i:1516773532;s:86:"D:\wamp\www\xiaochengxu\public/../application/admin\view\template\javascript_vars.html";i:1516773532;}*/ ?>
﻿<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>我的桌面</title>
    <link rel="Bookmark" href="__ROOT__/favicon.ico" >
    <link rel="Shortcut Icon" href="__ROOT__/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="__LIB__/html5.js"></script>
    <script type="text/javascript" src="__LIB__/respond.min.js"></script>
    <script type="text/javascript" src="__LIB__/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/app.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    
    <!--[if IE 6]>
    <script type="text/javascript" src="__LIB__/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--定义JavaScript常量-->
<script>
    window.THINK_ROOT = '<?php echo \think\Request::instance()->root(); ?>';
    window.THINK_MODULE = '<?php echo \think\Url::build("/" . \think\Request::instance()->module(), "", false); ?>';
    window.THINK_CONTROLLER = '<?php echo \think\Url::build("___", "", false); ?>'.replace('/___', '');
</script>
</head>
<body>

<nav class="breadcrumb">
    <div id="nav-title"></div>
    <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="刷新"><i class="Hui-iconfont"></i></a>
</nav>


<div class="page-container">
    <p class="f-20 text-success">欢迎使用 <?php echo \think\Config::get('site.name'); ?> <span class="f-14"><?php echo \think\Config::get('site.version'); ?></span> 后台管理系统！</p>
    <div class="view-body think-editor-content">
        <p>该邮件使用 tp-mailer 发出，强劲而优美的邮件扩展类：<a class="c-blue" href="https://github.com/yuan1994/tp-mailer" target="_blank">https://github.com/yuan1994/tp-mailer</a></p>

        <h2>官方文档</h2>

        <p><a target="_blank" class="c-blue" href="http://doc.tpadmin.yuan1994.com">http://doc.tpadmin.yuan1994.com</a></p>

        <p class="c-red">tpadmin 官方交流群：518162472</p>

        <h2>仓库地址</h2>

        <p class="c-red">如果觉得不错就到 github 给个星哦</p>

        <p><a target="_blank" class="c-blue" href="https://github.com/yuan1994/tpadmin">https://github.com/yuan1994/tpadmin</a></p>

        <h2>使用方法</h2>

        <h3 id="composer-">composer安装：</h3>

        <p>composer create-project yuan1994/tpadmin tpadmin  --prefer-dist</p>

        <h3 id="git-">git克隆：</h3>

        <p>git clone https://github.com/yuan1994/tpadmin</p>

        <h3 id="-">直接下载：</h3>

        <p><a target="_blank" class="c-blue" href="https://github.com/yuan1994/tpadmin/archive/master.zip">https://github.com/yuan1994/tpadmin/archive/master.zip</a></p>

        <blockquote class="info">
            <p>框架的依赖需要通过 composer 下载，请在框架根目录执行 composer install ，已确保依赖的类库能下载下来</p>
        </blockquote>

        <h2>部署</h2>

        <p>参考 <a target="_blank" class="c-blue" href="http://www.kancloud.cn/manual/thinkphp5/129745">ThinkPHP5 - 部署</a></p>

        <p>部署成功后，建立新建数据库 tpadmin，导入项目根目录的 tpadmin.sql 文件，默认管理员帐号：admin，默认管理员密码：123456，然后访问 http://your-tpadmin-root-domain/admin</p>

        <h2>开发规范</h2>

        <p>请参考ThinkPHP5官方开发规范 <a href="http://www.kancloud.cn/manual/thinkphp5/118007">ThinkPHP5 - 开发规范</a></p>

        <h2>注意</h2>

        <p>为了确保代码自动生成可用，请在Linux/MacOS系统上使用项目时保证application文件夹有可写权限，本地开发可用将文件夹的权限改为777，线上部署请注意修改成安全的权限，为了更好的使用代码自动生成，请最好在Linux/MacOS系统上把Apache或php-fpm的用户修改为当前用户然后重启，可以避免权限问题</p>

        <h2>推荐</h2>

        <p>强烈推荐使用 tp-mailer 扩展类发送邮件，基于强大的 swiftmailer 开发，安装、使用非常简单，代码非常优美简便，详情请见 <a class="c-blue" href="https://github.com/yuan1994/tp-mailer" target="_blank">https://github.com/yuan1994/tp-mailer</a></p>

        <p>一款支持所有PHP框架的优美的邮件发送类，ThinkPHP系列框架开箱即用，其他框架初始化配置即可使用</p>

        <p>基于 SwiftMailer 二次开发, 为 ThinkPHP系列框架量身定制, 使 ThinkPHP 支持邮件模板、纯文本、附件邮件发送以及更多邮件功能, 邮件发送简单到只需一行代码</p>

        <p>同时了方便其他框架或者非框架使用, Tp Mailer也非常容易拓展融合到其他框架中, 欢迎大家 Fork 和 Star, 提交代码让Tp Mailer支持更多框架</p>
    </div>

</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="__STATIC__/js/app.js"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js"></script>

</body>
</html>