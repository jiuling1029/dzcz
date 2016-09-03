<?php
/**
 * Created by PhpStorm.
 * User: zhang
 * Date: 2016/9/3 0003
 * Time: 20:18
 */
namespace Blog\Controller;
use Common\Controller\HomebaseController;
class IndexController extends HomebaseController{
    function index(){
        $slides=sp_getslide('app_dzcz');    //top_slide是你在后台创建的幻灯片标识
        print_r($slides);       //打印出获取的结果
    }
}