<?php


/**
 * ?  “访客”
 * @  “已授权“
 */
class home extends BaseController {

    public function doIndex(){
        //=======================================
        St::J(200,'登陆成功');
    }


    public function doLogin()
    {
        echo "
        登录界面
        <br>成功跳转main.Dashboard  仪表盘
        <br>关联动作 home.login_POST
        <br>退出登录跳转 home.logout
        ";
    }


}
