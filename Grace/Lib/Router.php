<?php


class Router
{
    public $rs = [];        //·��Դ���� ��һ����ʼ

    //����ĳ�ʼ��Ϣ
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
    public $router_ = [];        //mixǰ

    public static  $_instance;

    //��չ���� /c/a/ex
    public function ActionExt()
    {
        return [
            'po',       //post  ��post
            'ed',       //�޸�
            'cf',       //�޸�״̬
            'de',       //ɾ��
            'json',     // json
            'vf',       //��ʾ
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

    //·�ɽ��ģ��
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
        //ok ���п����õ����ݰ���
        D(C());
        exit;
    }

    //��Ե�ַ������,querystringģʽ��ȡ����GET
    public function getquery_mca($ar)
    {
        $get = $ar['_getmca'];
        if(!$get)return [];

        if (in_array($get['m'], $this->moduleslist)) {      //ģ��
            $router['method_modules'] = $get['m'];
        }
        $router['method_controller'] = $get['c'];
        $router['method_action'] = $get['a'];
        if (in_array($get['ext'], $this->ActionExt)) {      //ģ��
            $router['method_action_ext'] = $get['ext'];
        }
        $router['params'] = $get;
        return $router;
    }

    //URIģʽ������Ĳ���
    public function getquery_urimca($ar)
    {
        $str = $ar['_querymca'];
        if(!$str)return [];

        foreach($str as $value){
            $v = explode('=',$value);
            $params[strtolower($v[0])] = isset($v[1])?$v[1]:'';
        }
        if (in_array($params['m'], $this->moduleslist)) {      //ģ��
            $router['method_modules'] = $params['m'];
        }
        $router['method_controller'] = $params['c'];
        $router['method_action'] = $params['a'];
        if (in_array($params['ext'], $this->ActionExt)) {      //ģ��
            $router['method_action_ext'] = $params['ext'];
        }
        $router['params'] = $params;
        return $router;
    }

    //URIģʽ������Ĳ���
    public function getquery_uri($ar)
    {
        $str = $ar['_queryuri'];
        if(!$str)return [];
        $p = explode('/', $str);

        if (in_array(current($p), $this->moduleslist)) {      //ģ��
            $router['method_modules'] = current($p);
            array_shift($p);
        }

        $router['method_controller'] = array_shift($p) ?: '';
        $router['method_action'] = array_shift($p) ?: '';

        if (in_array(current($p), $this->ActionExt)) {      //ģ��
            $router['method_action_ext'] = current($p);
            array_shift($p);
        }

        if(count($p) ==1){      //��һ����
            $router['params'] = [];
            $router['sparams'] = $p[0];
        }else{
            //����
            $_params = [];
            $count = ceil(count($p) / 2);
            for ($i = 0; $i < $count; $i++) {
                $ii = $i * 2;
                isset($p[$ii + 1]) && $_params[$p[$ii]] = $p[$ii + 1] ;
            }
            $router['params'] = $_params;            //�����path����Ĳ���
        }
        return $router;
    }

    //����Ҫ����������Դ
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

//    //ԭʼ������ȡ��������
//    public function routerini()
//    {
//        $query = $this->pathinfo_query();
//        $query = strtolower($query);
//        //������������� path ��params
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
//        //�������� mix �� mca ����
//        if(isset($params['m'])){
//            $ar = explode('.',$params['m']);
//            //�жϵ�һ����c����m ֵ��������ʽ c.a ���� m.c.a
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


//    //����routeֵ
//    public function __invoke()
//    {
//        $this->routerini()->routerpath()->routermcapathmix();
//        $this->router['ispost'] = $_POST ? 'post' : '';      //���post
//        $ext = $this->router['Action_ext'];
//        $postf = $_POST?'post':'';
//        $this->router['Action_ext'] = $ext ?:$postf;      //���post
//
//        return $this->router;
//    }

    /**
     * ��������mix
     */
//    public function routermcapathmix()
//    {
//        //mix ���m c a params
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
//        //mix����
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
//        //��ȡ�����е�module
//        //��ȡ_pathmca] => [_paramsmca
//        //���path���м����
//        $p = isset($this->router['_path']) ? explode('/', $this->router['_path']) : [];
//        $m = current($p);
//        if (in_array($m, $this->moduleslist)) {      //ģ��
//            array_shift($p);
//            $this->router['_params']['__mm'] = $m;
//            //$this->router['_pathm']['m']= $m;
//        }
//        $this->router['_params']['__cc'] = array_shift($p) ?: '';
//        $this->router['_params']['__aa'] = array_shift($p) ?: '';
//
//        if (in_array(current($p),$this->ActionExt())) {      //ģ��
//            $this->router['Action_ext'] = array_shift($p);
//        }
//
//        $_params = [];
//        $count = ceil(count($p) / 2);
//        for ($i = 0; $i < $count; $i++) {
//            $ii = $i * 2;
//            $_params[$p[$ii]] = isset($p[$ii + 1]) ? $p[$ii + 1] : '';
//        }
//        $this->router['_paramspath'] = $_params;            //�����path����Ĳ���
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


    /**     �������� �������ڱ������������ ���д�ģ����,���Ҵ��ݳ�ȥ
     * @return array
     * �����conf�е�һ��������ʱ��ڳ���
    //����pathinfo_query ��ȡģ����Ϣ
     */
    public  function getModule()
    {
        //����ģ��
        //���ҷ���
        $config = ConfigManager::getInstance();       //δ��ɵ�
        $pathinfo_query = $config->env['pathinfo_query'];
        $modulelist     = is_array($config->modulelist)?$config->modulelist:[];

        //���������������ģ����Ϣ
//        D($pathinfo_query);
//        D($modulelist);

        $pathinfo_query = strtolower($pathinfo_query);

        $pq = explode('&',$pathinfo_query);

        //��һ�����ڵȺ�
        if(!isset(explode('=',  current($pq))[1])){
            $mo_ = current(explode('/',trim(array_shift($pq),'/')));     //������ڵĻ�,mo���ǵ�һ��/֮ǰ��ֵ
        }

        foreach($pq as $key=>$value){
            $pq_ = explode('=',$value);
            $pq_[0] && $pq_[1] && $pq__[$pq_[0]] = $pq_[1];
        }
        $mo_ = $pq__['m']?:$mo_?:'';

        //����Ƿ���modulelist��
        if($mo_){
            $mo = in_array($mo_,$modulelist)?$mo_:'';
        }
        return $mo;
    }


}
