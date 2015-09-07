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

    public static function run($conf){
          C($conf);
          spl_autoload_register(array('Application', 'autoload'));              //psr-0
          Bootstrap::init();                    //初期执行单位

          /*
           * 路由执行
           * G(C()) //能获得完整准确的结果
           * request 完成能输出完整的结果
           */
          Router::getInstance()->router();           //进行路由方面的执行




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


    /**
     * 路由已经准备好了
     * 根据路由获取hmvc的配置信息
     */
    public function loadAppConfig()
    {
        $router = C('router');
        $modules = C('modules');

        if($router['Module']){
            C('APP_PATH',C('APP_PATH').'Modules/'.$modules[$router['Module']].'/');
            $conf = G(C('APP_PATH').C('CONF_FILE'));
            /**
             * 去除掉屏蔽的设置
             */
            if(isset($conf['APP_PATH']))    unset($conf['APP_PATH']);
            if(isset($conf['modules']))     unset($conf['modules']);
            if(isset($conf['router']))      unset($conf['router']);
            C($conf);
        }
        /**
         * 补全route信息
         */
        $router = C('router');
        if(empty($router['Controller']))$router['Controller'] = C('default_controller');
        if(empty($router['Action']))$router['Action'] = C('default_controller_method');
        C('router',$router);
        return true;
    }

      /**
      * 自动加载函数
      * @param string $class 类名
      */
      public static function autoload($class){
            includeIfExist(GRACEROOT.'Lib/'.$class.'.php');
      }
}



