<?php


/**
 * ?  “访客”
 * @  “已授权“
 */
class home extends BaseController {

    public function doIndex(){
        //=======================================
        //print_r(bus(['user','modules']));     //获取bus信息
//               print_r(sc());
//
//
//        print_r(geter('user.all'));
//        print_r(geter('group.id.1'));

//        $userlogin = 'irones';
//        $logintime = 11111111111;
//        $sccheck = shamhash($userlogin,$logintime);
//        sapp('cookies')->set('userlogin',$userlogin);
//        sapp('cookies')->set('logintime',$logintime);
//        sapp('cookies')->set('sccheck',$sccheck);
        //print_r(bus());

        //print_r(geter('user.all'));

        //ok
        ap()->md([
            'd'=>'md',
        ])->go('v1');
    }

}




