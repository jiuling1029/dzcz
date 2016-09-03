<?php
/**
 * Created by PhpStorm.
 * User: zhang
 * Date: 2016/9/3 0003
 * Time: 20:23
 */
namespace Blog\Controller;
use Common\Controller\AdminbaseController;

class IndexadminController extends AdminbaseController{
    public function index(){
        echo 'this is admin controller';
    }
}