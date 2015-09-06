<?php


class Router
{
    //格式永远是mca

    public $router = [];
    public $moduleslist = [];

    public $query   = [];
    public $get     = [];
    public $router_s = [];
    public $ActionExt = [];
    public $router_ = [];        //mix前

    public static  $_instance;

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

    public function RouterDefault(){
        return [
            'method_modules'        => '',
            'method_controller'    => '',
            'method_action'        => '',
            'method_action_ext'    => '',
            'ispost'        => false,
            'ActionPrefix'  => C('controller_method_prefix'),
        ];
    }



    public function load()
    {
        $this->query = strtolower($this->pathinfo_query());
        $this->get = $this->query_get();

        //任务,根据app配置,把路由到的module运算出来
        $this->router = $this->RouterDefault();

        //在这里需要把模块计算出来
        $this->moduleslist = array_keys(C('modules'));              //模块列表索引

        $this->router_s = $this->router_s();        //step one 获得要分析的源数据        D($this->router_s);      //从三个方向来分析路由

        $this->ActionExt =$this->ActionExt();

        //获取mca序列
        $this->router_['_queryuri'] =   $this->getquery_uri($this->router_s);           //单独分析
        $this->router_['_querymca'] =   $this->getquery_urimca($this->router_s);           //单独分析
        $this->router_['_getmca'] =     $this->getquery_mca($this->router_s);             //单独分析


        D(C());
       // ok
        D($this->router);



        //$this->mix($this->router_);

        //D($this->router_);
        //ok 都获取到了数据
        //mix



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


    //获取get中的数据
    public static function query_get( )
    {
        $get = $_GET;
        $get_ = array();
        foreach($get as $key=>$value){
            if($value)$get_[$key] = $value;
        }
        return $get_;
    }

    /**
     * @return string
     * 获取地址栏uri信息
     */
    public static function pathinfo_query( )
    {
        $pathinfo = @parse_url($_SERVER['REQUEST_URI']);
        if (empty($pathinfo)) {
            die('request parse error:' . $_SERVER['REQUEST_URI']);
        }
        //pathinfo模式下有?,那么$pathinfo['query']也是非空的，这个时候查询字符串是PATH_INFO和query
        $query_str = empty($pathinfo['query']) ? '' : $pathinfo['query'];
        $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : (isset($_SERVER['REDIRECT_URL']) ? $_SERVER['REDIRECT_URL'] : '');
//    $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : (isset($_SERVER['REDIRECT_PATH_INFO']) ? $_SERVER['REDIRECT_PATH_INFO'] : '');
        $pathinfo_query = empty($path_info) ? $query_str : $path_info . '&' . $query_str;
        if ($pathinfo_query) {
            $pathinfo_query = trim($pathinfo_query, '/&');
        }
        //urldecode 解码所有的参数名，解决get表单会编码参数名称的问题
        $pq = $_pq = array();
        $_pq = explode('&', $pathinfo_query);
        foreach ($_pq as $value) {
            $p = explode('=', $value);
            if (isset($p[0])) {
                $p[0] = urldecode($p[0]);
            }
            if(!empty($p[0]) || !empty($p[1]))  $pq[] = implode('=', $p);
        }
        $pathinfo_query = implode('&', $pq);
        return $pathinfo_query;
    }

    public static function getInstance(){
        if(!(self::$_instance instanceof self)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }

}
