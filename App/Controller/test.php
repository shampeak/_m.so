<?php
/**
 * Created by PhpStorm.
 * User: 123456
 * Date: 2015/7/17
 * Time: 11:16
 */

class test extends BaseController {

    public function doList()
    {
        //页面能直接用的元素
//        $m = $this->env;
//        D($m);
        $this->display('',[
            'title'=>'登陆',
        ]);       //默认的index.php
    }

    public function doD()
    {
        //页面能直接用的元素
//        $m = $this->env;
//        D($m);
        $this->display('',[
            'title'=>'登陆',
        ]);       //默认的index.php
    }


    public function doMain($param)
    {

        $this->display('',[]);
    }
//

//
//
//
//    public function doIndex_($param)
//    {
//        $rc = $this->db->getall("Select * from dy_user");
//        D($rc);
//        echo 123;
//        print_r($param);//另外一个
//    }




}
