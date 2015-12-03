<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/1 0001
 * Time: 19:47
 */

namespace App\Geter;


class User
{
      /*
      |--------------------------------------------------
      | 数据接口列表
      |--------------------------------------------------
      | user.cookies    //本地存储的login
      | user.info       //用户的信息
      | user.group      //用户的用户组信息
      | user.rulelib
      | user.all        //用户列表
      | user.id.num     //根据id
      | user.login.chr  //根据login
      |
      */

      /*
      |--------------------------------------------------
      | 用户数据库中的信息
      |--------------------------------------------------
      |
      */
      public function info()
      {
            $res = array();
            $userlogin = $this->cookies();            //$userlogin = 'irones';
            if($userlogin){
                  $userlogin = addslashes($userlogin);
                  //根据用户名查询出用户信息 -> to bus
                  $sql =     "SELECT * FROM `user`, user_profile
                              WHERE `user`.userid = user_profile.userid
                              AND `user`.userid =(
                                select userid from `user`
                                where login = '$userlogin'
                              )";
                  $res = sapp('db')->getrow($sql);
            }
            return $res;
      }

      /*
      |--------------------------------------------------
      | 用户组的信息
      |--------------------------------------------------
      |
      */
      public function group()
      {
            //返回用户组信息
            $groupid = bus('user')['groupId']?:$this->info()['groupId'];
            $res = array();
            if($groupid){
                  $groupid = intval($groupid);
                  $sql = "select * from user_group where groupid = $groupid";
                  $res = sapp('db')->getrow($sql);
            }
            return $res;
      }


      //用户组的RBAC信息 -> 数据库中的rulelib
      public function rulelib()
      {
            return bus('usergroup')['ruleLib']?:$this->group()['ruleLib']?:array();
      }
      /*
      |----------------------------------------------------
      | 获取本地存储的用户信息
      |----------------------------------------------------
      | 首先验证本地存储的cookies 是否有效 通过hash 进行运算判断
      | 先获取cookie记录的username 根据username 查询数据库得到
      |
      */
      public function cookies()
      {
            $userlogin  = sapp('Cookies')->get('userlogin');
            $logintime  = sapp('Cookies')->get('logintime');
            $sccheck    = sapp('Cookies')->get('sccheck');
            if(shamhash($userlogin,$logintime) == $sccheck){
                  //验证通过 返回数据
                  return $userlogin;
            }else{
                  return null;
            }
      }


      //返回所有的用户
      public function all()
      {
            $sql =     "SELECT * FROM `user`, user_profile
                              WHERE `user`.userid = user_profile.userid
                              order by sort desc
                              ";
            return sapp('db')->getall($sql);
      }

      //根据id返回用户
      public function id($userid = 0)
      {
            $sql =     "SELECT * FROM `user`, user_profile
                              WHERE `user`.userid = user_profile.userid
                              and `user`.userid = $userid
                              ";
            return sapp('db')->getrow($sql);
      }

      //根据login返回用户
      public function login($userlogin = '')
      {
            $sql =     "SELECT * FROM `user`, user_profile
                              WHERE `user`.userid = user_profile.userid
                              and `user`.login = $userlogin
                              ";
            return sapp('db')->getrow($sql);
      }




}
