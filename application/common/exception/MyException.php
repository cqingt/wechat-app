<?php
/*
 * 报错邮件发送，需在config配置 'exception_handle' => '\\app\\common\\exception\\MyException',
 */
namespace app\common\exception;

use mailer\tp5\Mailer;
use Exception;
use think\Config;
use think\exception\ErrorException;
use think\exception\Handle;

class MyException extends Handle
{
    protected $content = '';

    public function render(Exception $e)
    {
        $trace = $e->getTrace();
        $data = [
            'name'    => get_class($e),
            'file'    => $e->getFile(),
            'line'    => $e->getLine(),
            'message' => $e->getMessage(),
            'trace'   => array_slice($trace, 0, 2), // 太长费劲
            'code'    => $this->getCode($e),
            'source'  => $this->getSourceCode($e),
            'datas'   => $this->getExtendData($e),
            'tables'  => [
                'GET Data'   => $_GET,
                'POST Data'  => $_POST,
                'Files'      => $_FILES
            ],
        ];
        $this->content = var_export($data, true);

        return $this;
    }

    // 邮件发送
    public function send()
    {
        $mailer = Mailer::instance();
        $mailer->from(Config::get('mail.addr'), Config::get('mail.name'))
            ->to(Config::get('mail.sendto'))
            ->subject('程序异常')
            ->text($this->content)
            ->send();
    }

    /**
     * 获取错误编码
     * ErrorException则使用错误级别作为错误编码
     * @access protected
     * @param  \Exception $exception
     * @return integer                错误编码
     */
    protected function getCode(Exception $exception)
    {
        $code = $exception->getCode();
        if (!$code && $exception instanceof ErrorException) {
            $code = $exception->getSeverity();
        }
        return $code;
    }

    /**
     * 获取出错文件内容
     * 获取错误的前9行和后9行
     * @access protected
     * @param  \Exception $exception
     * @return array                 错误文件内容
     */
    protected function getSourceCode(Exception $exception)
    {
        // 读取前9行和后9行
        $line  = $exception->getLine();
        $first = ($line - 9 > 0) ? $line - 9 : 1;

        try {
            $contents = file($exception->getFile());
            $source   = [
                'first'  => $first,
                'source' => array_slice($contents, $first - 1, 19),
            ];
        } catch (Exception $e) {
            $source = [];
        }
        return $source;
    }

    /**
     * 获取异常扩展信息
     * 用于非调试模式html返回类型显示
     * @access protected
     * @param  \Exception $exception
     * @return array                 异常类定义的扩展数据
     */
    protected function getExtendData(Exception $exception)
    {
        $data = [];
        if ($exception instanceof \think\Exception) {
            $data = $exception->getData();
        }
        return $data;
    }
}