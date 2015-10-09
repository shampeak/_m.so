<?php
/**
 * 改进 不依赖外部函数和变量
 * */
namespace Seter;
define('SETER_PATH',__DIR__);

include SETER_PATH.'/Core/Base.php';                    //基类
include SETER_PATH.'/Seter.php';                        //基类
\Seter\Seter::registerAutoloader();     //PSR-0

/**
 * 返回资源的绝对定位地址
 * @param $path
 * @return mixed|string
 */
function truepath($path) {
      //是linux系统么？
      $unipath = PATH_SEPARATOR == ':';
      //检测一下是否是相对路径，windows下面没有:,linux下面没有/开头
      //如果是相对路径就加上当前工作目录前缀
      if (strpos($path, ':') === false && strlen($path) && $path{0} != '/') {
            $path = realpath('.') . DIRECTORY_SEPARATOR . $path;
      }
      $path = str_replace(array('/', '\\'), DIRECTORY_SEPARATOR, $path);
      $parts = array_filter(explode(DIRECTORY_SEPARATOR, $path), 'strlen');
      $absolutes = array();
      foreach ($parts as $part) {
            if ('.' == $part)
                  continue;
            if ('..' == $part) {
                  array_pop($absolutes);
            } else {
                  $absolutes[] = $part;
            }
      }
      //如果是linux这里会导致linux开头的/丢失
      $path = implode(DIRECTORY_SEPARATOR, $absolutes);
      //如果是linux，修复系统前缀
      $path = $unipath ? (strlen($path) && $path{0} != '/' ? '/' . $path : $path) : $path;
      //最后统一分隔符为/，windows兼容/
      $path = str_replace(array('/', '\\'), '/', $path);
      return $path;
}


trait Doini
{
      public function getConfig()
      {
            return [
                'RDBC'=>'',
                'debug'=>true,
                  //对现有的路由进行映射
                'Geter'=>[
                    'Base'=> '../G/',
                    'FW' => [
                        'user',
                        'sys',
                    ],
                ],

                  //依赖注入的组件
                'obj'=>[
                    [
                        'classname'=>'db',
                        'class'=>'\Seter\Library\SDb',
                        'parm'=>'',
                    ],
                    [
                        'classname'=>'gpdo',
                        'class'=>'\Seter\Library\Gpdo',
                        'parm'=>'',
                    ],

                    [
                        'classname'=>'table',
                        'class'=>'\Seter\Library\Table',
                        'parm'=>'',
                    ],
                    [
                        'classname'=>'model',
                        'class'=>'\Seter\Library\Model',
                        'parm'=>'',
                    ],
                    [
                        'classname'=>'request',
                        'class'=>'\Seter\Library\Request',
                        'parm'=>'',
                    ],
                    [
                        'classname'=>'user',
                        'class'=>'\Seter\Library\User',
                        'parm'=>'',
                    ],
                    [
                        'classname'=>'rbac',
                        'class'=>'\Seter\Library\Rbac',
                        'parm'=>'',
                    ],

//        [
//            'classname'=>'doc',
//            'class'=>'\Seter\Library\Doc',
//            'parm'=>'',
//        ],
//        [
//        [
//            'classname'=>'mdb',
//            'class'=>'\Seter\Library\Mdb',
//            'parm'=>'',
//        ],
//        [
//            'classname'=>'router',
//            'class'=>'\Seter\Library\Router',
//            'parm'=>'',
//        ],
                ]
            ];
      }

      public function run()
      {
            $this->Config = $this->getConfig();

            //获取数据库数据的配置
            $md =include(APP_ROOT.'Confdb.php');
            $this->Config['db'] = $md;

            $this->singleton('sys', function ($c) {

                  return new \Seter\Core\Sys();
            });

            //=================================================
            /**
             * 注入对象
             */
            foreach($this->Config['obj'] as $key=>$value){
                  $this->singleton($value['classname'], function () use ($key,$value){
                        return new $this->Config['obj'][$key]['class'];
                  });
            }


      }
}

\Seter\Seter::getInstance()->run();           //注入 然后才可以被调用


$conf       = APP_ROOT.'Conf.php';              //数据库配置

echo APP_ROOT;

/**
 * 前面已经定义过APP_ROOT
 * //获取实例
*/
//$S = \Seter\Seter::getInstance();
//var_dump($S);

