<?php

namespace Sham\Ap;

use Sham\Set\Base;

    /*
    |--------------------------------------------------------------------------
    | 数据处理流
    |--------------------------------------------------------------------------
    |
    */


class Ap extends Base
{

      private $_config  = array();
      public function __construct($config = array()){
            $this->_config = $config;
      }

      /*
      |--------------------------------------------------------------------------
      | 把bus教给中间件处理
      |--------------------------------------------------------------------------
      |
      */
      public function md($params = [])
      {
            print_r($params);
            return $this;
      }

      public function go($params = [])
      {
            print_r($params);
            //显示输出 [view json toarray toobject]
      }

      //=======================================
      public function demo()
      {
            echo 'bus demo!';
            /**
             *    获得对get post cookie file session 的支持
             */
      }

}
