<?php
/**
 * https://github.com/shampeak/GracePhp
 */

error_reporting(E_ALL ^ E_NOTICE);      //抑制错误
include '../Grace/Application.php';
$config = [
            'APP_PATH'    => '../App/',
    'error_manage'=>'qwer',
           // 'modulelist' =>123,
//    'GRACE_PATH' => '../33/',

//            'GRACE_PATH'    => '../App/',       //有默认值,如果设置会覆盖默认值

//      'APP_BASE'          => C('APP_PATH'),
//      'WDS'               => DIRECTORY_SEPARATOR,
//      'CONF_FILE'         => 'Conf.php',
//      'default_timezone'  => 'PRC',
//      'charset'           => 'utf-8',
//      'CONF_FILE'         => 'Conf.php',
//
//      'error_page_404'    => C('APP_PATH').'error/error_404.php',
//      'error_page_500'    => C('APP_PATH').'error/error_500.php',
//      'error_page_msg'     => C('APP_PATH').'error/error_msg.php',
//      'message_page_view' => C('APP_PATH').'error/error_view.php',
//
//      //相对路径
//      'controller_folder' => 'Controller/',
//      'model_folder'      => 'Models/',
//      'view_folder'       => 'Views/',
//      'library_folder'    => 'Lib/',
//      //            'helper_folder'     => 'helper/',
//      //相对路径
//
//      'default_controller'        => 'home',
//      'default_controller_method' => 'index',
//      'controller_method_prefix'  => 'do',
//
//      //扩展名
//      'controller_file_subfix'    => '.php',
//      'model_file_subfix'         => '.php',
//      'view_file_subfix'          => '.php',
//      'library_file_subfix'       => '.php',
//      'helper_file_subfix'        => '.php',
//      'debug' => true,
];

Application::run($config);

//所有请求都请求道 GracePHP::RUN 下面

/*
<li>所有的请求都会进入Application的run方法,整个请求到相应返回的生命周期都是在这个方法中进行的。</li>
<li>在Application的run方法中会生成Router对象。</li>
<li>根据Router对象，会生成Request对象，所有的请求参数都会包装在Request里面。</li>
<li>把生成的Request对象传递给Caller对象，负责调用具体的接口(这里既可以是Controller，也可以实现为RPC)。</li>
<li>然后接口生成Response对象。</li>
<li>最后根据项目的需要，把Response对象转换为你所需要的格式，返回给客户端。</li>
 *
 */