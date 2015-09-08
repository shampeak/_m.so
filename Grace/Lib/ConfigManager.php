<?php
/**
 * @link http://www.simple-inc.cn/
 * @copyright Copyright (c) 2014 Simple-inc Software inc
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

class ConfigManager
{

    /**
     * 系统的默认配置
     * @var array
     */
    private static $_entrance           = null;
    private static $_module             = null;
    private static $_app                = null;
    private static $_AppDefaultConfig   = null;

    public static function Load($entrance)
    {
        //default
        $conf['app_defaultConfig'] = self::AppDefaultConfig();

        //入口配置
        $conf['ent'] = $entrance;

        //获取环境参数
        $conf['env'] = Environment::getInstance()->getenv();

        //获取app 配置
        $file = $conf['ent']['CONF_FILE'] = $conf['ent']['CONF_FILE']?:'Conf.php';
        $conf['app'] = G($conf['ent']['APP_PATH'].$file);

        //所有配置的模块列表
        $modulelist = $conf['ent']['modulelist']?:$conf['app']['modulelist'];
        $modulelist = is_array($modulelist)?$modulelist:[];
        $conf['modulelist'] = array_keys($modulelist);

        //获取module配置
        $module = Router::getmodule();



        //写入所有配置
        C($conf);

//        self::$_AppDefaultConfig = static::AppDefaultConfig();
//        self::$_entrance = $conf;
//
//        $conf['CONF_FILE'] = $conf['CONF_FILE']?:'Conf.php';
//        self::$_app = array_merge(G($conf['APP_PATH'].$conf['CONF_FILE']),self::$_entrance);      //入口设定覆盖文件设定
//
//        //写入C
//        C(array_merge(self::$_AppDefaultConfig,self::$_app));
    }


    /**
     * 查找配置信息
     * @param $name
     * @return mixed
     */
    public static function get($name)
    {
        return C($name);
    }

    public static function appConfig()
    {
        return self::$_app;
    }

    public static function moduleConfig()
    {
        //这里进行运算
    }

    /**
     * 默认配置
     * @return array
     */
    public static function AppDefaultConfig(){
        return [
            'GRACE_PATH'=>      '../Grace/',
            'APP_BASE'          => C('APP_PATH'),
            'WDS'               => DIRECTORY_SEPARATOR,
            'CONF_FILE'         => 'Conf.php',
            'default_timezone'  => 'PRC',
            'charset'           => 'utf-8',

            'error_page_404'    => 'error/error_404.php',
            'error_page_500'    => 'error/error_500.php',
            'error_page_msg'     => 'error/error_msg.php',
            'message_page_view' => 'error/error_view.php',

            //相对路径
            'controller_folder' => 'Controller/',
            'model_folder'      => 'Models/',
            'view_folder'       => 'Views/',
            'library_folder'    => 'Lib/',
//            'helper_folder'     => 'helper/',
            //相对路径

            'default_controller'        => 'home',
            'default_controller_method' => 'index',
            'default_controller_method_prefix'  => 'do',

            //扩展名
            'controller_file_subfix'    => '.php',
            'model_file_subfix'         => '.php',
            'view_file_subfix'          => '.php',
            'library_file_subfix'       => '.php',
            'helper_file_subfix'        => '.php',
            'debug' => true,
        ];
    }


}