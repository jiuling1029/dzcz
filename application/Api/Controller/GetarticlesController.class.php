<?php
/**
 * 文章信息获取接口
 * Created by PhpStorm.
 * User: zhang
 * Date: 2016/9/4 0004
 * Time: 0:07
 */
namespace Api\Controller;
use Common\Controller\HomebaseController;

class GetarticlesController extends HomebaseController{

    /**
     * 获取分类下的所有文章
     * p 代表页数
     * @param $cid
     */
    public function lists($cid){
        $tag = 'cid:'.$cid.';field:tid,post_title,post_excerpt,post_modified,smeta;order:post_modified desc';
        $content = sp_sql_posts_paged($tag, 10);
        $posts = $content['posts'];
        if(!empty($posts)){
            foreach($posts as &$v){
                $v['smeta'] = json_decode($v['smeta']);
            }
        }
        $this->success($posts);
    }

    /**
     * 获取文章详情
     * @param $tid
     */
    public function detail($tid){
        $posts = sp_sql_post($tid,'field:post_title,post_content,post_modified,smeta;');
        if(empty($posts)){
            $this->error('文章不存在');
        }else{
            $posts['smeta'] = json_decode($posts['smeta']);
            $this->success($posts);
        }
    }

    /**
     * 获取幻灯片
     */
    public function get_slide($tag = 'app_dzcz'){
        $slides = sp_getslide($tag);
        if(empty($slides)){
            $this->error('不存在改类幻灯片');
        }else{
            $this->success($slides);
        }
    }
}