<?php
/*
 *
 * */
namespace G\Lib;
!defined('FAST_PATH') && die('out of app');

class Sys extends \G\Mg
{

    /**
     * 控制器中调用 $str =         $this->G('user');
     */
    public function index(){

    }

    public function info($parm = '')
    {
        return  'user.info'.$parm;
    }

    public function getlist($parm = '')
    {
        return 'user.getlist'.$parm;
    }

    /**
     * @return array
     * 手动配置
     */
    //对方法的说明
    public function ds()
    {
        return [
            'index'=>'',
            'info'=>'$parm = ""',
            'getlist'=>'$parm = ""',
        ];

    }

}


