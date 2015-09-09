<?php


class Router
{
    public $rs = [];        //路由源数据 第一步初始

    //传入的初始信息
    public $app_defaultConfig = [];
    public $ent = [];
    public $env = [];
    public $headers = [];
    public $app = [];
    public $modulelist = [];
    //==========================================


    public $routerInfo = [];


    public $query   = [];
    public $get     = [];
    public $router_s = [];
    public $ActionExt = [];
    public $router_ = [];        //mix前

    public static  $_instance;

    //扩展方法 /c/a/ex
    public function ActionExt()
    {
        return [
            'po',       //post  有post
            'ed',       //修改
            'cf',       //修改状态
            'de',       //删除
            'json',     // json
            'vf',       //显示
        ];
    }

    public function MethodType()
    {
        return [
            'POST',
            'GET',
            'PUT',
            'DELETE',
            'PATCH',
            'OPTIONS',
        ];
    }

    //路由结果模板
    public function RouterDefault(){
        return [
            'method_modules'        => '',
            'method_controller'     => '',
            'method_action'         => '',
            'method_action_ext'     => '',
            'methodtype'            => '',
            'ActionPrefix'      => C('controller_method_prefix'),
        ];
    }

    private function __construct(){}

    public function load()
    {

        echo 'mark router';
        //ok 已有可以用的数据包括
        D(C());
        exit;
    }

    //针对地址栏参数,querystring模式获取到的GET
    public function getquery_mca($ar)
    {
        $get = $ar['_getmca'];
        if(!$get)return [];

        if (in_array($get['m'], $this->moduleslist)) {      //模块
            $router['method_modules'] = $get['m'];
        }
        $router['method_controller'] = $get['c'];
        $router['method_action'] = $get['a'];
        if (in_array($get['ext'], $this->ActionExt)) {      //模块
            $router['method_action_ext'] = $get['ext'];
        }
        $router['params'] = $get;
        return $router;
    }

    //URI模式后面跟的参数
    public function getquery_urimca($ar)
    {
        $str = $ar['_querymca'];
        if(!$str)return [];

        foreach($str as $value){
            $v = explode('=',$value);
            $params[strtolower($v[0])] = isset($v[1])?$v[1]:'';
        }
        if (in_array($params['m'], $this->moduleslist)) {      //模块
            $router['method_modules'] = $params['m'];
        }
        $router['method_controller'] = $params['c'];
        $router['method_action'] = $params['a'];
        if (in_array($params['ext'], $this->ActionExt)) {      //模块
            $router['method_action_ext'] = $params['ext'];
        }
        $router['params'] = $params;
        return $router;
    }

    //URI模式后面跟的参数
    public function getquery_uri($ar)
    {
        $str = $ar['_queryuri'];
        if(!$str)return [];
        $p = explode('/', $str);

        if (in_array(current($p), $this->moduleslist)) {      //模块
            $router['method_modules'] = current($p);
            array_shift($p);
        }

        $router['method_controller'] = array_shift($p) ?: '';
        $router['method_action'] = array_shift($p) ?: '';

        if (in_array(current($p), $this->ActionExt)) {      //模块
            $router['method_action_ext'] = current($p);
            array_shift($p);
        }

        if(count($p) ==1){      //单一参数
            $router['params'] = [];
            $router['sparams'] = $p[0];
        }else{
            //参数
            $_params = [];
            $count = ceil(count($p) / 2);
            for ($i = 0; $i < $count; $i++) {
                $ii = $i * 2;
                isset($p[$ii + 1]) && $_params[$p[$ii]] = $p[$ii + 1] ;
            }
            $router['params'] = $_params;            //这个是path后面的参数
        }
        return $router;
    }

    //分离要分析的数据源
    public function router_s()
    {
        $p = explode('&', $this->query);
        $router_s['_queryuri'] = '';
        if(!isset(explode('=',  current($p))[1])){
            $router_s['_queryuri'] = trim(array_shift($p),'/');
        }

        $router_s['_querymca'] = $p;
        $router_s['_getmca'] = $this->get;
        return $router_s;
    }

//    //原始解析获取到的数据
//    public function routerini()
//    {
//        $query = $this->pathinfo_query();
//        $query = strtolower($query);
//        //这里包含两部分 path 和params
//        $p = explode('&', $query);
//        $router = $this->RouterDefault();
//        $params['m'] = $params['__mm'] = $params['__cc'] = $params['__aa'] = $params['__c'] = $params['__a'] = $params['a'] = $params['c'] = '';
//        if(!isset(explode('=',  current($p))[1])){
//            $router['_path'] = trim(array_shift($p),'/');
//        }
//        foreach($p as $value){
//            $v = explode('=',$value);
//            $params[strtolower($v[0])] = isset($v[1])?$v[1]:'';
//        }
//        //解码修正 mix 和 mca 修正
//        if(isset($params['m'])){
//            $ar = explode('.',$params['m']);
//            //判断第一个是c还是m 值有两种形式 c.a 或者 m.c.a
//            if(count($ar)==2){
//                $params['m'] = '';
//                $params['__c'] = array_shift($ar);
//                $params['__a'] = array_shift($ar);
//            }
//            if(count($ar)==3){
//                $params['m'] = array_shift($ar);
//                $params['__c'] = array_shift($ar);
//                $params['__a'] = array_shift($ar);
//            }
//        }
//        $router['_params'] = $params;
//        /*
//         * router like
//         *
//Array
//(
//    [Module] =>
//    [Controller] =>
//    [Action] =>
//    [ispost] =>
//    [_path] => userr/oper/de
//    [_params] => Array
//        (
//            [c] => asdf.asdf
//            [a] => aasdf
//            [__a] =>
//            [__c] =>
//            [__aa] =>
//            [__cc] =>
//            [__mm] =>
//            [m] =>
//        )
//
//)         * */
//        $this->router = $router;
//        return $this;
//    }


//    //返回route值
//    public function __invoke()
//    {
//        $this->routerini()->routerpath()->routermcapathmix();
//        $this->router['ispost'] = $_POST ? 'post' : '';      //标记post
//        $ext = $this->router['Action_ext'];
//        $postf = $_POST?'post':'';
//        $this->router['Action_ext'] = $ext ?:$postf;      //标记post
//
//        return $this->router;
//    }

    /**
     * 参数部分mix
     */
//    public function routermcapathmix()
//    {
//        //mix 获得m c a params
//        /**
//         * [Module] =>
//         * [Controller] =>
//         * [Action] =>
//         */
//        if (!in_array($this->router['_params']['__mm'], $this->moduleslist)) $this->router['_params']['__mm'] = '';
//        if (!in_array($this->router['_params']['m'], $this->moduleslist)) $this->router['_params']['m'] = '';
//
//        if (!$this->is_zm($this->router['_params']['c'])) $this->router['_params']['c'] = '';
//        if (!$this->is_zm($this->router['_params']['__c'])) $this->router['_params']['__c'] = '';
//        if (!$this->is_zm($this->router['_params']['__cc'])) $this->router['_params']['__cc'] = '';
//
//        $this->router['Module'] = $this->router['_params']['m'] ?: $this->router['_params']['__mm'];
//        $this->router['Controller'] = $this->router['_params']['c'] ?: $this->router['_params']['__c'] ?: $this->router['_params']['__cc'];
//        $this->router['Action'] = $this->router['_params']['a'] ?: $this->router['_params']['__a'] ?: $this->router['_params']['__aa'];
//        $this->router['Controller'] = $this->router['Controller'] ?: '';
//        $this->router['Action'] = $this->router['Action'] ?: '';
//
//        //mix参数
//        unset($this->router['_params']['m']);
//        unset($this->router['_params']['__mm']);
//        unset($this->router['_params']['__cc']);
//        unset($this->router['_params']['__aa']);
//        unset($this->router['_params']['__c']);
//        unset($this->router['_params']['__a']);
//        unset($this->router['_params']['c']);
//        unset($this->router['_params']['a']);
//
////        $this->router['params'] = array_merge($this->router['_params'], $this->router['_paramspath']);
//        foreach ($this->router['_params'] as $key => $value) {
//            $this->router['params'][$key] = $value;
//        }
//
//
//        $params_ = '';
//        if (count($this->router['_paramspath']) == 1) {
//            $nr = current(array_values($this->router['_paramspath']));
//            if (empty($nr)) {
//                $params_ = current(array_keys($this->router['_paramspath']));
//            }
//        }
//        $this->router['params_'] = $params_;
//
//        foreach ($this->router['_paramspath'] as $key => $value) {
//            $this->router['params'][$key] = $value;
//        }
//        unset($this->router['_params']);
//        unset($this->router['_paramspath']);
//        return $this;
//    }


//    public function routerpath()
//    {
//        //获取参数中的module
//        //获取_pathmca] => [_paramsmca
//        //标记path的中间变量
//        $p = isset($this->router['_path']) ? explode('/', $this->router['_path']) : [];
//        $m = current($p);
//        if (in_array($m, $this->moduleslist)) {      //模块
//            array_shift($p);
//            $this->router['_params']['__mm'] = $m;
//            //$this->router['_pathm']['m']= $m;
//        }
//        $this->router['_params']['__cc'] = array_shift($p) ?: '';
//        $this->router['_params']['__aa'] = array_shift($p) ?: '';
//
//        if (in_array(current($p),$this->ActionExt())) {      //模块
//            $this->router['Action_ext'] = array_shift($p);
//        }
//
//        $_params = [];
//        $count = ceil(count($p) / 2);
//        for ($i = 0; $i < $count; $i++) {
//            $ii = $i * 2;
//            $_params[$p[$ii]] = isset($p[$ii + 1]) ? $p[$ii + 1] : '';
//        }
//        $this->router['_paramspath'] = $_params;            //这个是path后面的参数
//
//        return $this;
//    }
//




    public static function getInstance(){
        if(!(self::$_instance instanceof self)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }


    /**     独立运行 不依赖于本类的其他方法 运行处模块名,并且传递出去
     * @return array
     * 这个在conf中第一个被调用时入口程序
    //根据pathinfo_query 获取模块信息
     */
    public  function getModule()
    {
        //计算模块
        //并且返回
        $config = ConfigManager::getInstance();       //未完成的
        $pathinfo_query = $config->env['pathinfo_query'];
        $modulelist     = is_array($config->modulelist)?$config->modulelist:[];

        //根据这两个计算出模块信息
//        D($pathinfo_query);
//        D($modulelist);

        $pathinfo_query = strtolower($pathinfo_query);

        $pq = explode('&',$pathinfo_query);

        //第一个存在等号
        if(!isset(explode('=',  current($pq))[1])){
            $mo_ = current(explode('/',trim(array_shift($pq),'/')));     //如果存在的话,mo就是第一个/之前的值
        }

        foreach($pq as $key=>$value){
            $pq_ = explode('=',$value);
            $pq_[0] && $pq_[1] && $pq__[$pq_[0]] = $pq_[1];
        }
        $mo_ = $pq__['m']?:$mo_?:'';

        //监测是否在modulelist中
        if($mo_){
            $mo = in_array($mo_,$modulelist)?$mo_:'';
        }
        return $mo;
    }


}
