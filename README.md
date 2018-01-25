## wechat-app
小程序商城管理# wechat-app

## 环境变量配置 .env
* app_debug =  true
* app_trace =  true
* exception_handle = false

### [database]
* hostname = hostname
* database = database
* username = username
* password = password

> 在配置文件中，使用 Env::get( 'database.xxx', [默认值可选]) 来设置环境变量