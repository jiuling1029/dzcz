<?php
/**
 * Created by PhpStorm.
 * User: zhang
 * Date: 2016/9/4 0004
 * Time: 0:17
 */
/**
 * 文章分页查询方法
 * @param string $tag  查询标签，以字符串方式传入,例："cid:1,2;field:post_title,post_content;limit:0,8;order:post_date desc,listorder desc;where:id>0;"<br>
 * 	ids:调用指定id的一个或多个数据,如 1,2,3<br>
 * 	cid:数据所在分类,可调出一个或多个分类数据,如 1,2,3 默认值为全部,在当前分类为:'.$cid.'<br>
 * 	field:调用post指定字段,如(id,post_title...) 默认全部<br>
 * 	limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)<br>
 * 	order:排序方式，如：post_date desc<br>
 *	where:查询条件，字符串形式，和sql语句一样
 * @param int $pagesize 每页条数.
 * @param string $pagetpl 以字符串方式传入,例："{first}{prev}{liststart}{list}{listend}{next}{last}"
 * @return array 带分页数据的文章列表

 */

function sp_sql_posts_paged($tag,$pagesize=20,$pagetpl='{first}{prev}{liststart}{list}{listend}{next}{last}'){
    $where=array();
    $tag=sp_param_lable($tag);
    $field = !empty($tag['field']) ? $tag['field'] : '*';
    $limit = !empty($tag['limit']) ? $tag['limit'] : '';
    $order = !empty($tag['order']) ? $tag['order'] : 'post_date';

    //根据参数生成查询条件
    $where['status'] = array('eq',1);
    $where['post_status'] = array('eq',1);

    if (isset($tag['cid'])) {
        $where['term_id'] = array('in',$tag['cid']);
    }

    if (isset($tag['ids'])) {
        $where['object_id'] = array('in',$tag['ids']);
    }

    if (isset($tag['where'])) {
        $where['_string'] = $tag['where'];
    }

    $join = "".C('DB_PREFIX').'posts as b on a.object_id =b.id';
    $join2= "".C('DB_PREFIX').'users as c on b.post_author = c.id';
    $rs= M("TermRelationships");
    $totalsize=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->count();

    import('Page');
    if ($pagesize == 0) {
        $pagesize = 20;
    }
    $PageParam = C("VAR_PAGE");
    //判断是否超过当前所有页面
    $page = $_REQUEST[$PageParam];
    $pageTotal = ceil($totalsize / $pagesize);
    if($page > $pageTotal){
        return null;
    }

    $page = new \Page($totalsize,$pagesize);
    $page->setLinkWraper("li");
    $page->__set("PageParam", $PageParam);
    $page->SetPager('default', $pagetpl, array("listlong" => "9", "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "下一页", "list" => "*", "disabledclass" => ""));
    $posts=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->order($order)->limit($page->firstRow . ',' . $page->listRows)->select();

    $content['posts']=$posts;
    $content['page']=$page->show('default');
    $content['count']=$totalsize;
    return $content;
}

/**
 * 获取指定id的文章
 * @param int $tid 分类表下的tid.
 * @param string $tag 查询标签，以字符串方式传入,例："field:post_title,post_content;"<br>
 *	field:调用post指定字段,如(id,post_title...) 默认全部<br>
 * @return array 返回指定id的文章
 */
function sp_sql_post($tid,$tag){
    $where=array();
    $tag=sp_param_lable($tag);
    $field = !empty($tag['field']) ? $tag['field'] : '*';

    //根据参数生成查询条件
    $where['status'] = array('eq',1);
    $where['tid'] = array('eq',$tid);

    $join = "".C('DB_PREFIX').'posts as b on a.object_id =b.id';
    $join2= "".C('DB_PREFIX').'users as c on b.post_author = c.id';
    $term_relationships_model= M("TermRelationships");

    $post=$term_relationships_model->alias("a")->join($join)->join($join2)->field($field)->where($where)->find();
    return $post;
}

/**
 * 查询文章列表，不做分页
 * @param string $tag  查询标签，以字符串方式传入,例："cid:1,2;field:post_title,post_content;limit:0,8;order:post_date desc,listorder desc;where:id>0;"<br>
 *  ids:调用指定id的一个或多个数据,如 1,2,3<br>
 *  cid:数据所在分类,可调出一个或多个分类数据,如 1,2,3 默认值为全部,在当前分类为:'.$cid.'<br>
 *  field:调用post指定字段,如(id,post_title...) 默认全部<br>
 *  limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)<br>
 *  order:排序方式，如：post_date desc<br>
 *  where:查询条件，字符串形式，和sql语句一样
 * @param array $where 查询条件，（暂只支持数组），格式和thinkphp where方法一样；
 */
function sp_sql_posts($tag,$where=array()){
    if(!is_array($where)){
        $where=array();
    }
    
    $tag=sp_param_lable($tag);
    $field = !empty($tag['field']) ? $tag['field'] : '*';
    $limit = !empty($tag['limit']) ? $tag['limit'] : '';
    $order = !empty($tag['order']) ? $tag['order'] : 'post_date';


    //根据参数生成查询条件
    $where['status'] = array('eq',1);
    $where['post_status'] = array('eq',1);

    if (isset($tag['cid'])) {
        $where['term_id'] = array('in',$tag['cid']);
    }
    
    if (isset($tag['ids'])) {
        $where['object_id'] = array('in',$tag['ids']);
    }
    


    $join = "".C('DB_PREFIX').'posts as b on a.object_id =b.id';
    $join2= "".C('DB_PREFIX').'users as c on b.post_author = c.id';
    $rs= M("TermRelationships");

    $posts=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->order($order)->limit($limit)->select();
    return $posts;
}