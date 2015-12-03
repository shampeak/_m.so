<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/1 0001
 * Time: 19:47
 */

namespace App\Middleware;


class User
{

      //根据login返回用户
      public function login($userlogin = '')
      {

            if ($request->input('age') <= 200) {
                  return redirect('home');
            }

            return $next($request);

            return $test;
      }




}

//前置操作
class BeforeMiddleware
{
      public function handle($request, Closure $next)
      {
            // Perform action

            return $next($request);
      }
}

//后置操作
class AfterMiddleware
{
      public function handle($request, Closure $next)
      {
            $response = $next($request);

            // Perform action

            return $response;
      }
}