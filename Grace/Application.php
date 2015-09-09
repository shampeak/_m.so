<?php

//只提供系列快捷函数
include 'Common.php';
define(GRACEROOT,__DIR__.'/');


/**
 * 总控类
 */
class Application {
    private static $_instance;
    private function __clone(){}
//      public static function go()
//      {
//            /**
//             * 可以检测的
//             * error 处理
//            //        //设置发生非致命错误的处理
//            //        set_error_handler('Simple\Bootstrap\Bootstrap::handlerNonFatal');
//            //        // 设置对程序中未捕捉异常的处理
//            //        set_exception_handler('Simple\Bootstrap\Bootstrap::handlerException');
//            //        //注册自动加载类方法
//            //        spl_autoload_register('Simple\Bootstrap\Bootstrap::autoload');
//             * 对于配置文件中的响应
//             *
//             * 还有可以调用的::基础函数/基础方法/基础对象
//             *
//             * D(C());
//            request     ok
//            router      ok
//            config      ok
//            */
//           // Bootstrap::init();
//
//
//      }

    public static function run($entrance){
          spl_autoload_register(array('Application', 'autoload'));              //psr-0
          /**
           * 获取配置信息
           * 同步配置包括 / 入口配置 / 模块配置 / app配置  / 默认配置 相互覆盖
           * 验证 D(C());
           */
          ConfigManager::getInstance($entrance)->load();;             //OK 配置完成  验证

          /**
           * 计算路由信息
           * 验证D(C('Router'))
           */
          Router::getInstance()->load();        //路由信息


//            Request::getInstance()->load();       //根据router / config /get /post 获取输入的参数值



          D(C());
          echo 123;
          exit;
          $request = new Router();


          D(C());
          $request = new request();
          D($request->headers);
          D($request->env);
          D($request->cookies);

          exit;
          D(C('env'));
//          D($request->getMethod());       //提交的方法
//          D($request->isGet());           //提交的方法
//          D($request->isPost());          //提交的方法
//          D($request->isPut());           //提交的方法
//          D($request->isPatch());       //提交的方法
//          D($request->isDelete());       //提交的方法
//          D($request->isOptions());       //提交的方法

          D($request->getHost());
          D($request->getHostWithPort());
          D($request->getPort());
          echo '------';
          /**
           * 下面三个path模式下不准确
           */
          D($request->getScriptName());
          D($request->getRootUri());
          D($request->getPath());
          D($request->getPathInfo());     //同下
          D($request->getResourceUri()); //同上

          D($request->getIp());

          D($request->getRootUri());

          /**
           * 调试
          //验证系列配置数据
          D(ConfigManager::get('modulelist'));
          D(ConfigManager::get('app_defaultConfig'));
          D(ConfigManager::get('ent'));
          D(ConfigManager::get('env'));
          D(ConfigManager::get('app'));
          D(C());
          */

          /**
           * 对request的验证
           */



          echo 'mark';
          exit;
            /**
             * 生成对象
             * router
             * config
             * request
             * bootstrap::ini();
            ->>>>>>>>>>>>
            在 go 中
            //=================================
            request     ok
            router      ok
            config      ok
            bootrun     ok
            //=================================
            go中 ini ok

            控制权交给go
            Application::go     -> 生成response对象 ->view/json
            */

          C($conf);
          Bootstrap::init();                    //初期执行单位

          /**
           * 路由执行
           * G(C()) //能获得完整准确的结果
           * request 完成能输出完整的结果
           */
          Router::getInstance()->router();           //进行路由方面的执行



      /**
          //config
          //ConfigManager::Load($conf);
          //D(ConfigManager::get('mysql'));
          //D(ConfigManager::get('Rbacdb'));
          //D(ConfigManager::get('User'));
          //D(ConfigManager::get('modules'));
//        D(ConfigManager::get('Router'));
//        Router::getInstance()->load();
          //$router = Router::getInstance()->getrouter();           //获得router
          //OK



          //这里准备好
//          $router
//          $config
//          $_REQUEST
      */


            $app = $controller;

          Router::getInstance()->start($app);           //进行路由方面的执行

          exit;


        D(C());
        echo "entrance";



        //首先运行自动加载文件

exit;







        if(C('USE_SESSION') == true){
            session_start();
        }
        $router = new router();
        $conf['router'] = $router();        //这个是路由

        C($conf);                           //路由进配置
        $this->loadAppConfig();             //覆盖hmvc配置
        C('APP_FULL_PATH', truepath(getcwd().'/'.C('APP_PATH')).'/');
        C('BASE_FULL_PATH', truepath(getcwd().'/'.C('APP_BASE')).'/');
        spl_autoload_register(array('GracePHP', 'autoload'));              //psr-0
        includeIfExist(C('BASE_FULL_PATH').'Seter/I.php');              //第一时间载入服务层

        //除controllers外，都需要检测根下有没有相对应的组件
        //===========================================================
        $router = C('router');
        $router['params'] = isset($router['params'])?$router['params']:[];
        $params = $router['params_'];
        //===========================================================
        $controllerfile2 = C('APP_FULL_PATH').C('controller_folder').'BaseController'.C('controller_file_subfix');
        includeIfExist($controllerfile2);

        //================================================
        //标准控制器不存在，检查扩展控制器
        $controller_ext_file = $router['Controller'].'.'.$router['Action'].".php";
        $controllerfile = C('APP_FULL_PATH').C('controller_folder').$controller_ext_file;
        includeIfExist($controllerfile);
        if(!class_exists($router['Controller'])){
            //扩展控制器没有加载成功 加载标准控制器
            $controllerfile = C('APP_FULL_PATH').C('controller_folder').$router['Controller'].C('controller_file_subfix');
            includeIfExist($controllerfile);
            //===========================================================
        }

        //判断控制器是否存在
        if(!class_exists($router['Controller'])){
            //404
            error404();
            halt('控制器'.$router['Controller'].'不存在');  //交由扩展进行判断
        }



        //实例化
        $controllerClass = $router['Controller'];
        $controller = new $controllerClass();
        //确定运行的方法
        //判断扩展方法
        $act_ext = $router['ispost']?'_post':'';
        $act_ext = ($router['Action_ext'] != 'post')?$act_ext:'';


        $method = 'do'.ucfirst($router['Action']).'_'.$router['Action_ext'].$act_ext;
        if(!method_exists($controller, $method)){
            //扩展post没找到
            $method = 'do'.ucfirst($router['Action']).'_'.$router['Action_ext'];
            if(!method_exists($controller, $method)){
                //扩展方法不存在，判断主方法
                $method = 'do'.ucfirst($router['Action']);
                if(!method_exists($controller, $method)){
                    error404();
//                    halt('方法'.$method.'不存在2');
                }
            }
        }



//        $params = $router['params'];
//        if(count($router['params']) ==1 ){
//            $nr = current(array_values($router['params']));
//            if(empty($nr)){
//                $params = current(array_keys($router['params']));
//            }
//        }
        //=====================================
        //扩展，对mothod 进行修改

        //标准动作扩展 insert update delete select json
        //_se[post]  _cg [change]    _de [delete]    json[jsonout]   vf[view flit] 显示筛选
        call_user_func(array($controller,$method),$params);
    }


//    /**
//     * 路由已经准备好了
//     * 根据路由获取hmvc的配置信息
//     */
//    public function loadAppConfig()
//    {
//        $router = C('router');
//        $modules = C('modules');
//
//        if($router['Module']){
//            C('APP_PATH',C('APP_PATH').'Modules/'.$modules[$router['Module']].'/');
//            $conf = G(C('APP_PATH').C('CONF_FILE'));
//            /**
//             * 去除掉屏蔽的设置
//             */
//            if(isset($conf['APP_PATH']))    unset($conf['APP_PATH']);
//            if(isset($conf['modules']))     unset($conf['modules']);
//            if(isset($conf['router']))      unset($conf['router']);
//            C($conf);
//        }
//        /**
//         * 补全route信息
//         */
//        $router = C('router');
//        if(empty($router['Controller']))$router['Controller'] = C('default_controller');
//        if(empty($router['Action']))$router['Action'] = C('default_controller_method');
//        C('router',$router);
//        return true;
//    }

      /**
      * 自动加载函数
      * @param string $class 类名
      */
      public static function autoload($class){
            includeIfExist(GRACEROOT.'Lib/'.$class.'.php');
      }
}



