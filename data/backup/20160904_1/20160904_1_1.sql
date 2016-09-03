-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-09-04 03:21:14
-- Vol : 1
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`) USING BTREE,
  KEY `comment_approved_date_gmt` (`status`) USING BTREE,
  KEY `comment_parent` (`parentid`) USING BTREE,
  KEY `table_id_status` (`post_table`,`post_id`,`status`) USING BTREE,
  KEY `createtime` (`createtime`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`) USING BTREE,
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `model` (`model`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','0','插件管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','','home','','1','0','0-1');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','列表演示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','0','0-2');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','瀑布流','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','','1','0','0-3');
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航');
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662f\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"demo\",\"site_host\":\"http:\\/\\/thinkcmfx.dev.com\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"SEO\\u6807\\u9898\",\"site_seo_keywords\":\"SEO\\u5173\\u952e\\u5b57\",\"site_seo_description\":\"SEO\\u63cf\\u8ff0\\n\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_need_check\":\"1\",\"comment_time_interval\":60}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('3','cmf_settings','{\"banned_usernames\":\"\"}','1');
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`) USING BTREE,
  KEY `post_parent` (`post_parent`) USING BTREE,
  KEY `post_author` (`post_author`) USING BTREE,
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','机关事业单位','','2016-09-02 15:10:03','<p><span style=\"color: rgb(81, 81, 81); font-family: Simsun; text-align: center; line-height: 24px; font-size: 12pt; background-color: rgb(255, 255, 255);\">经省政府同意，近日，省财政厅联合省编办、省人力资源社会保障厅、省审计厅出台了《关于规范机关事业单位财会人员入职资质提高财会人员素质的意见》，从4个方面对规范和加强党政机关、事业单位财会人员入职资质管理和提高财会人员素质提出了要求。</span><span style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height: 24px; font-size: 12pt;\">一是严格入职资质，规范入职程序。明确各单位应科学设置会计机构和财会岗位，事业单位和业务主管部门经批准可以设置总会计师。各单位要严格财会人员入职资质管理，财会人员上岗入职，必须取得会计从业资格证书。财会机构负责人（会计主管）还应具备会计师以上专业技术职务资格或从事财会工作三年以上经历；总会计师还应具备会计师以上专业技术职务资格，连续三年主管一个单位财会工作的经历。各单位要对拟任用财会人员进行资格审核，并对现有财会人员进行资格审查，对不符合条件的财会人员限期取消资质。拟设置总会计师的单位，应将拟任总会计师人员的专业资格证书和其他相关证明材料报财政部门审核确认。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height: 24px; font-size: 12pt;\">二是加大人才培养力度，全面提升财会人员素质。以高端会计人才培养为引领，统筹推进财会人员初任实训、会计机构负责人和业务骨干能力提升培训、总会计师和高级财会人才轮训等各类培训，加强对财会人员职业精神、道德素质的培养，建立机关事业单位会计诚信档案，建立分类明确、档次衔接的会计人才库。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height: 24px; font-size: 12pt;\">三是推进相关改革，完善配套措施。大力推进行政事业单位内部控制体系建设，加快管理会计人才培养，推进财务会计向管理会计转变。明确推进财会管理政府购买服务和会计机构负责人委派工作；完善会计专业技术资格评价制度，形成初、中、高级层次清晰，相互衔接，体系完整的会计专业技术资格体系；启动我省机关事业单位总会计师素质提升工程。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height: 24px; font-size: 12pt;\">四是加强组织领导，严格落实行政问责。明确机构编制、人力资源社会保障等部门要在机关事业单位财会人员配备、岗位设置、评先树优等方面给予支持和倾斜。财政部门要定期开展财会人员任职履职情况专项检查；审计部门要将部门单位会计岗位设置、人员入职资质及程序等情况作为部门单位审计的重要内容。要健全责任追究制度，坚决杜绝隐瞒、截留、坐支、虚报、冒领财政资金等行为，严肃财经纪律。</span></p><p><br/></p>','我省出台规范机关事业单位财会人员入职资质的意见','经省政府同意，近日，省财政厅联合省编办、省人力资源社会保障厅、省审计厅出台了《关于规范机关事业单位财会人员入职资质提高财会人员素质的意见》，从4个方面对规范和加强党政机关、事业单位财会人员入职资质管理和提高财会人员素质提出了要求。','1','1','2016-09-02 15:08:22','','0','','','0','{\"thumb\":\"20160902\\/57c925b427920.jpg\",\"photo\":[{\"url\":\"20160904\\/57caf85745ea3.png\",\"alt\":\"\\u72d7\\u72d7\\u58c1\\u7eb8\"},{\"url\":\"20160904\\/57caf86dcf3f9.jpg\",\"alt\":\"0859c921e56b570ff52c6c3a0a65494d(1)d\"}]}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','1','','','2016-09-04 00:26:59','<p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">今年以来，我省各级把推广运用PPP模式作为稳增长、调结构、促改革、扩就业、惠民生的重要抓手，PPP改革全速推进、成果丰硕。截至6月底，我省纳入全国PPP综合信息平台的项目1024个，投资总额9823亿元，项目数、投资额均居全国第二位。通过物有所值和财政承受能力论证的项目300个，已签约项目161个，其中131个已开工建设，PPP工作呈现出“高、好、优、早、大、强、快、足、浓”等十大特点。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">一是重视程度高。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">山东省委、省政府对推广PPP高度重视，2014年省委、省政府出台的《深化财税体制改革的意见》，明确指出要积极推广PPP模式，吸引和社会资本参与城市基础设施建设和公共事业投资运营。在2015年召开的省委十届十二次全会上，姜异康书记、郭树清省长要求加快PPP项目运作，真正让民间资本“唱主角、挑大梁”。今年，完善政府和社会资本合作模式首次写入省政府工作报告，并列入省委、省政府重大改革和重点督查事项。很多市县都把PPP作为市委、县委理论中心组集体学习的重要内容。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">二是工作机制好。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">按照省政府部署要求，省财政厅成立了PPP工作领导小组，并设立PPP管理中心，专门负责协调PPP推广具体事宜；与发改、教育、科技、住建、民政、农业、水利、卫生计生、环保、旅游、人行等部门建立了联席会议制度，还采购18家专业咨询机构，共同推进PPP各项工作。各级切实加强组织领导，纷纷成立PPP领导小组，并下设PPP专门办事机构，安排精干人员负责，形成了政府主导、财政协调、部门配合、多方协作、专业支撑、协同推进的组织领导和工作推进机制。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">三是制度环境优。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">注重顶层设计先行，上下联动配合，在全国较早出台了《关于在公共服务领域推广政府和社会资本合作模式的指导意见》，明确了推广PPP模式的基本要求和保障措施，成为全省推广运用PPP模式的基本遵循。以此为核心，为规范操作流程，先后研究制定了操作指南、合同指南、物有所值评价指引、财政承受能力论证指引及报告模板、政府和社会资本合作业务操作手册等多个制度办法，形成了直观的全生命周期管理流程图，为推广PPP提供了良好的制度环境。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">四是各方行动早。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">PPP涉及政府、社会资本、金融机构、咨询机构、社会公众等利益群体，是一项复杂的系统性工程。为抓紧形成共识、凝聚合力，分层次、有重点地组织多次针对性、指导性强的专题培训，累计培训政府官员、企业高管、金融机构负责人等超过两万人次，从上到下形成了各方协同推进PPP的科学理念、一致认识和积极行动。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">各级紧紧围绕经济社会发展规划，坚持及早谋划、高点定位、高标起步，精心筹备和组织实施了一批关乎民生发展的大项目、好项目，PPP在我省遍地开花、蓬勃生长。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">五是政策力度大。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">为鼓励社会资本参与公益事业建设，我省制定出台了PPP项目奖补资金管理办法，省级连续两年安排预算1亿元，对</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">基础工作好、项目落地率高、示范价值广、严格规范运作的市县给予一次性奖励和补助，统筹用于项目前期工作费用，有效缓解项目前期开发费用过高的问题，提高社会资本参与的积极性。为解决项目落地“后顾之忧”，省政府在全国率先设立PPP发展基金，</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">首期已募集到位</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">400</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">亿元，并</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">争取用</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">2</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">～</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">3</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">年时间达到</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">1200</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">亿元规模。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">目前已参股发起设立</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">12</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">只子基金，并</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">与项目库中16个项目达成了合作意向，拟投资金额131.5亿元</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">六是示范价值广。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">围绕打造“推介先导-示范推广-样本复制-全面开花”的新格局，加快形成一批可复制、可推广的优质项目，分六批重点推介了375个重点项目，概算投资总额6000多亿元。从中筛选代表性、示范性和可复制性强的69个项目作为省级示范项目，其中4个项目入选财政部示范项目。并以示范项目为标杆，</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">积极推广复制好经验、好做法，探索形成了多方合力、小县城做大PPP的“宁阳模式”；敞开大门、广纳社会资本的“嘉祥样板”；化解民生难题、用PPP模式推进城乡教育综合发展的“禹城经验”；精准招商、快速崛起赶超的“菏泽速度”；规范管理、打造精品工程的“博山做法”等一批规划科学、运作规范、落地迅速、特色突出的典型做法，以典型促全面、以规范促提升</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">，为加快形成“山东经验”奠定了坚实基础</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">七是融资能力强。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">通过广泛招商、公开采购、合作谈判，选定的社会资本方既有中铁置业、中国核工、中国电建等大型央企，又有山东鲁珠集团、山东万紫园旅游开发有限公司、山东欧隆投资置业有限公司等实力较强的民营企业，既有安徽盛运环保、龙元建设集团、岭南园林等上市企业，又有英国、新加坡、香港等境外资本参与投资建设。这些中标的社会资本方都有很强的投资运营能力，在业内享有较高的知名度，在银行等金融机构信用评级也很高，具有较强的后续融资能力。为缓解PPP项目融资难题，实现各类资本融合融通、形成合力，我省着力搭建投融资服务平台，通过召开PPP项目融资推介会，帮助项目公司与金融机构精准对接，推出成熟项目102个，实现一次性融资136亿元。同时，积</span><span style=\"font-family: 仿宋_GB2312;letter-spacing: -0;font-size: 21px\">极推动金融机构开发适合PPP融资需求特点的金融产品，省内外几十家金融机构深入洽谈合作，32个项目达成合作意向，还吸引了世界银行、全球基础设施基金、日本瑞穗银行等国际金融机构和财政部PPP融资支持基金广泛介入，已有部分项目列入备选范围。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">八是落地速度快。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">为打通PPP项目落地关键环节，我省各级在“优环境、广招商、拓融资、强服务、守信誉、抓督查”等方面下了很多功夫，社会资本和金融机构对我省营商环境评价较高，仅仅不到一年的时间，375个重点推介项目中，就有161个项目确定社会资本方并正式签订合同，接近一半的项目已经落地，其中131个项目已开工建设。特别是69个示范项目已全部签约进入执行阶段，落地率达100%，部分项目已建成并投入运营。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">九是发展后劲足。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">从项目储备库看，仅仅一年多时间，我省各级就储备了1000多个项目，投资额一度居全国首位，还在持续大规模增长，无论从发展需求还是工作基础看，我省PPP发展后劲很足，</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">驶入了全速前进、规范发展的快车道</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;line-height: 40px;margin-top: 0;text-indent: 43px;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 黑体;font-size: 21px\">十是社会氛围浓。</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">坚持政府主导、激</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">活市场、放管结合，充分调动有关方面积极性，有效整合各方专业优势。充分借助各种媒介，加大宣传推广力度，提高社会影响力和公众知晓度，</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">全省形成了上下联动、左右配合、内外协作、多方动员、</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">全面推进的良好氛围</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">，凝聚起“政府+中介+金融+企业+媒体</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">+公众</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">”的强大合力，共同助推PPP成为各方广泛共识和积极行动</span><span style=\"font-family: 仿宋_GB2312;font-size: 21px\">。</span></p><p><br/></p>','山东PPP改革全面推进、成果丰硕','今年以来，我省各级把推广运用PPP模式作为稳增长、调结构、促改革、扩就业、惠民生的重要抓手，PPP改革全速推进、成果丰硕。截至6月底，我省纳入全国PPP综合信息平台的项目1024个，投资总额9823亿元，项目数、投资额均居全国第二位。','1','1','2016-09-04 00:26:50','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('3','1','','','2016-09-04 00:27:08','<p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">为规范和加强财政专项资金管理，按照财政部要求，报经省政府同意，我省在全国率先研究出台《工业企业结构调整专项奖补资金管理细则》，从四个方面对专项资金分配、拨付方式、使用管理和监督考核做出规定。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 一是明确资金使用方向。专项奖补资金包括中央财政和省本级安排用于支持钢铁、煤炭行业化解过剩产能的奖补资金，主要用于全省钢铁、煤炭行业化解过剩产能过程中的职工安置，包括解决企业拖欠的职工工资、社会保险费、内部退养费用、经济补偿金等，具体由各市政府和省属企业结合实际统筹确定。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 二是明确资金分配办法。专项奖补资金分为基础奖补资金和梯级奖补资金。基础奖补资金按照化解产能任务量<span style=\"font-family:Times New Roman\">40%</span><span style=\"font-family:宋体\">权重和需安置职工人数</span><span style=\"font-family:Times New Roman\">60%</span><span style=\"font-family:宋体\">权重实行因素法分配；梯级奖补资金与各市、省属企业超额完成化解产能任务量挂钩，并按照各市、省属企业基础奖补资金的一定系数实施梯级奖补，以鼓励企业多退出产能，稳妥做好职工分流安置。</span></span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 三是明确资金拨付方式。专项奖补资金采取预拨方式，年初由省财政根据预算安排和省政府与各市、省属企业签订的目标责任书进行预拨，年度终了后根据国家、省有关部门考核验收情况据实清算和梯级奖补。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 四是明确资金监督考核。各有关部门要切实加强对专项奖补资金的监督检查，堵塞管理漏洞，防止虚报冒领；企业要强化内部监督，建立专项奖补资金发放全流程档案；专项奖补资金发放要通过本级政府网站、企业网站以及向职代会报告等多种方式向社会公开，自觉接受社会监督；审计、财政等部门要强化对奖补资金的审计和监管，对违规违法行为，严格依法依规处理。</span></p><p><br/></p>','我省在全国率先出台《工业企业结构调整专项奖补资金管理细则》','为规范和加强财政专项资金管理，按照财政部要求，报经省政府同意，我省在全国率先研究出台《工业企业结构调整专项奖补资金管理细则》，从四个方面对专项资金分配、拨付方式、使用管理和监督考核做出规定。','1','1','2016-09-04 00:27:01','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('4','1','','','2016-09-04 00:27:16','<p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">为进一步建立完善对权力运行的监督和约束机制，提升财政管理水平，防范各类潜在风险，全省各级财政部门积极推进内部控制机制建设，不断夯实工作责任，加强制度创新，省、市、县三级财政部门提前半年全部建成内部控制制度体系。</span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 内控机制建设启动以来，省财政厅坚持全省上下“同下一盘棋”，整体推进全省财政系统内控工作。各级财政部门都把内控工作作为“一把手”工程，专门成立了内控工作领导小组，由主要负责同志担任组长，多次召开专题会议，对制度建设任务进行分工，明确内控工作责任单位和完成时限<span style=\"font-family:Times New Roman\">,</span><span style=\"font-family:宋体\">理顺了内部控制工作运行机制。省财政厅把市县内控工作列为厅机关</span><span style=\"font-family:Times New Roman\">2016</span><span style=\"font-family:宋体\">年重点专项督查事项，层层分解责任，层层传导压力，在全省财政系统形成一把手亲自抓，班子成员专人管，全体干部齐参与的良好局面。结合全省财政工作实际，探索建立起“</span><span style=\"font-family:Times New Roman\">1+8</span><span style=\"font-family:宋体\">”内控制度体系，进一步明确了各类风险事件的风险点、防控措施和责任主体，督促通过机制优化、流程再造和信息化手段运用，强化对各类风险的事前防范、事中控制、事后监督和纠正，把风险化解在流程中，把工作着力点放在内控制度落实和对业务流程的有效管控上，确保财政干部廉洁和财政资金安全。据统计，全省（不含青岛）省、市、县三级财政部门共出台内控基本制度</span><span style=\"font-family:Times New Roman\">186</span><span style=\"font-family:宋体\">个、专项风险控制办法</span><span style=\"font-family:Times New Roman\">1457</span><span style=\"font-family:宋体\">个，内部各处（科、室）制定操作规程</span><span style=\"font-family:Times New Roman\">3251</span><span style=\"font-family:宋体\">个。截至</span><span style=\"font-family:Times New Roman\">6</span><span style=\"font-family:宋体\">月底，覆盖省、市、县三级财政部门的内控制度体系初步建成，为全省财政系统严格依法行政、依法理财，深入推进法制财政建设，深化财税体制改革，促进财政事业平稳健康发展奠定了坚实基础。</span></span></p><p><br/></p>','我省财政系统全面建立内部控制制度体系','为进一步建立完善对权力运行的监督和约束机制，提升财政管理水平，防范各类潜在风险，全省各级财政部门积极推进内部控制机制建设，不断夯实工作责任，加强制度创新，省、市、县三级财政部门提前半年全部建成内部控制制度体系。','1','1','2016-09-04 00:27:09','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('5','1','','','2016-09-04 01:46:05','<p><span style=\"color: rgb(81, 81, 81); font-family: 宋体; text-align: center; background-color: rgb(255, 255, 255);\">为加大对厉行节约有关制度的宣传力度</span><span style=\"font-family:Times New Roman;color: rgb(81, 81, 81); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\">,</span><span style=\"font-family:宋体;color: rgb(81, 81, 81); font-family: 宋体; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\">便于各级各部门学习贯彻相关财经法律法规和制度规定，近日，省财政厅将近年来中央和我省出台的严肃财经纪律、强化厉行节约相关制度文件进行收集整理并汇编成册，包括《中华人民共和国预算法》《党政机关厉行节约反对浪费条例》《山东省实施〈党政机关厉行节约反对浪费条例〉办法》等</span><span style=\"font-family:Times New Roman;color: rgb(81, 81, 81); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\">18</span><span style=\"font-family:宋体;color: rgb(81, 81, 81); font-family: 宋体; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\">个法规制度，基本涵盖了预算管理、财务管理、支出标准等各个方面，已印发各级各部门学习贯彻和遵照执行。要求各级各部门将《汇编》中的各项制度作为新形势下规范各项支出行为的根本遵循和重要依据，充分认识推进厉行节约、加强财务管理的重要性和紧迫性，增强法制观念，细化管理措施，坚持从严从紧，严格抓好落实，严格遵章办事，切实从源头上形成厉行节约、反对浪费的长效机制。</span></p>','省财政印发严肃财经纪律强化厉行节约制度文件汇编','为加大对厉行节约有关制度的宣传力度,便于各级各部门学习贯彻相关财经法律法规和制度规定，','1','1','2016-09-04 01:45:43','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('6','1','','','2016-09-04 01:49:55','<p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">全面推开营改增试点前，营业税主要是地方收入，只有部分银行总行、保险总公司缴纳的少量营业税为中央收入（如2015年中央营业税收入占当年全国营业税的0.78%）。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　按照国务院部署，从2016年5月1日起全面推开营改增试点，并实施调整中央与地方增值税收入划分过渡方案，其中国内增值税由中央与地方按75:25分享调整为按50:50分享，营业税和营业税改征的增值税由主要为地方收入调整为中央与地方按50:50分享。也就是说，5月份以后入库的营业税（包括税款所属期为4月在5月入库的营业税，以及补缴以前的营业税）由地方收入调整为50%归中央（5-7月合计1160亿元），因体制调整引起的口径变化，导致1-7月中央营业税收入大幅增加。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　需要说明的是，根据《国务院关于印发全面推开营改增试点后调整中央与地方增值税收入划分过渡方案的通知》（国发〔2016〕26号）的有关规定，中央上划收入通过税收返还方式给地方，确保地方既有财力不变，同时，中央集中的收入增量，通过均衡性转移支付分配给地方，主要用于加大对中西部地区的支持力度。</p><p><br/></p>','财政部有关负责人对2016年1-7月中央营业税情况的说明','全面推开营改增试点前，营业税主要是地方收入，只有部分银行总行、保险总公司缴纳的少量营业税为中央收入（如2015年中央营业税收入占当年全国营业税的0.78%）。','1','1','2016-09-04 01:49:34','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('7','1','','','2016-09-04 01:50:26','<p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">中国人民银行、财政部等七部委近日联合印发的《关于构建绿色金融体系的指导意见》中称，研究提出设立绿色发展基金，并通过运用财政政策支持绿色金融体系建立健全。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　未来财政政策如何支持绿色金融发展？绿色发展基金将扮演何种角色？记者２日采访了财政部相关负责人。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>以市场化原则激励社会资本投入绿色产业</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>　　问：从财政角度，如何看待绿色金融发展？</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　答：“绿色”是我国五大发展新理念之一。《指导意见》对构建绿色金融体系进行了全面部署，将有效增加绿色资金供给，助力生态文明建设，推动供给侧结构性改革。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　绿色金融首先是个市场化的制度安排，发展绿色金融就是要以市场化原则引导激励社会资本投入绿色产业，鼓励金融机构提供更多绿色金融产品和服务。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　绿色金融的发展，从根本上要依靠社会力量，政府应侧重构建公平、高效的市场环境。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>中央财政多维度助力绿色产业</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>　　问：在促进绿色产业发展方面，财政领域采取了哪些举措？</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　答：财政部一直高度重视绿色环保领域的发展，并从多方面提供了政策支持。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　具体来看，在财政直接投入方面，中央财政主要对绿色产业给予直接资金支持，设立了“节能减排补助资金”“可再生能源发展专项资金”等多项节能环保领域专项资金，对于环保领域也制定了多项税收方面的鼓励、引导或约束政策。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　根据２０１５年中央一般公共预算支出决算情况，２０１５年中央本级的节能环保支出为４００．４１亿元，比上年增长１６％。２０１５年全国环保财政支出为４８０３亿元，比２０１４年增长２６％。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　在绿色金融发展方面，中央财政主要是针对资金使用端给予定向支持，提高资金使用效率，比如对成品油质量升级项目贷款、林业贷款等给予贴息等。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>推动设立国家和区域绿色发展基金</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>　　问：下一步，将如何继续推动构建绿色金融体系？</strong></p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　答：未来将综合运用财政金融手段，促进建立有利于绿色金融发展的正向激励机制，撬动更多社会资本投入绿色领域。针对《指导意见》提出的一些财政政策措施，下一步将积极贯彻落实。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　具体来看，未来将整合现有节能环保等部分专项资金设立国家绿色发展基金，投资绿色产业，体现国家对绿色投资的引导和政策信号作用。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　同时，鼓励有条件的地方政府和社会资本共同发起区域性的绿色发展基金，支持地方绿色产业发展。绿色产业基金将以市场化方式运作，有效带动社会资本投入，进一步提高资金使用效率。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　下一步，还将落实好绿色金融领域的有关财政政策，包括按规定进行财政贴息、运用政府和社会资本合作（ＰＰＰ）模式等，积极推动绿色产业发展，为绿色金融发展提供良好的政策环境。</p><p class=\"Custom_UnionStyle\" style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　此外，继续广泛、深入地开展绿色金融领域的国际合作，有效利用国际平台交流经验、提升能力，积极利用国际金融组织和外国政府贷款投资，引资引智，助力国内绿色金融和绿色产业发展。</p><p><br/></p>','财政金融“组合拳”助力绿色经济发展 ——访财政部有关负责人','中国人民银行、财政部等七部委近日联合印发的《关于构建绿色金融体系的指导意见》中称，研究提出设立绿色发展基金，并通过运用财政政策支持绿色金融体系建立健全。','1','1','2016-09-04 01:49:57','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('8','1','','','2016-09-04 01:50:46','<p style=\"text-align:left;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　普通高中教育是学生个性形成、能力培养、自主发展的关键时期，对于提高国民素质和培养创新人才具有特殊意义。为贯彻党的十八届五中全会精神，落实《中共中央国务院关于打赢脱贫攻坚战的决定》等要求，经国务院同意，8月30日，财政部、教育部印发了《关于免除普通高中建档立卡家庭经济困难学生学杂费的意见》（以下简称《意见》），决定从2016年秋季学期起，免除普通高中建档立卡等家庭经济困难学生学杂费。</p><p style=\"text-align:left;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　《意见》提出，按照“中央政策引导、地方统筹实施”的原则，从2016年秋季学期起，免除公办普通高中建档立卡等家庭经济困难学生（含非建档立卡的家庭经济困难残疾学生、农村低保家庭学生、农村特困救助供养学生）学杂费。免学杂费标准按照各省级人民政府及其价格、财政主管部门批准的学费标准执行。民办普通高中符合免学杂费政策条件的学生，按照当地同类型公办普通高中免除学杂费标准给予补助。《意见》要求，对因免学杂费导致学校收入减少的部分，由财政按照免学杂费学生人数和免学杂费标准予以补助。免学杂费补助资金由中央与地方按比例分担。各地免学费政策范围大于或标准高于《意见》的，可继续执行。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　免除普通高中建档立卡家庭经济困难学生学杂费，是完善国家助学政策体系、推进教育机会公平、阻断贫困代际传递、实施精准扶贫帮困的重要举措，也是加快普及高中阶段教育、守住民生底线、全面建成小康社会的客观要求，具有十分重要的意义。为确保政策顺利实施，近日，中央财政紧急预拨补助资金4.4亿元，并下发明电对有关工作进行了部署，要求各地加强组织领导，制定切实可行的实施方案，强化监督检查，确保政策和资金落实到位。</p><p><br/></p>','国务院决定从2016年秋季学期起免除 普通高中建档立卡家庭经济困难学生学杂费','普通高中教育是学生个性形成、能力培养、自主发展的关键时期，对于提高国民素质和培养创新人才具有特殊意义。','1','1','2016-09-04 01:50:27','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('9','1','','','2016-09-04 01:51:11','<p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　经国务院同意，8月30日，财政部、教育部联合印发了《关于免除普通高中建档立卡家庭经济困难学生学杂费的意见》（以下简称《意见》），决定从2016年秋季学期起，免除普通高中建档立卡家庭经济困难学生学杂费。为做好相关政策解读，财政部、教育部有关负责人接受了记者采访。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：《意见》出台的背景是什么？</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>普通高中教育是学生个性形成、能力培养、自主发展的关键时期，对于提高国民素质和培养创新人才具有特殊意义。党中央、国务院历来高度重视普通高中教育发展。按照中央决策部署，近年来，各级财政不断加大普通高中投入力度，全国一般公共预算普通高中教育投入由2006年的596亿元增加到2015年的2711亿元，年均增长18.3%，普通高中生均公共财政拨款水平由2006年的2424元提高到2015年的11093元，年均增长18.4%，有力地支持了普通高中教育事业改革发展。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　党的十八届五中全会、国家“十三五”规划纲要和《中共中央 国务院关于打赢脱贫攻坚战的决定》均明确要求：“率先从建档立卡的家庭经济困难学生实施普通高中免除学杂费”，《国务院关于加强困境儿童保障工作的意见》明确“对残疾儿童，要建立随班就读支持保障体系，为其中家庭经济困难的提供包括义务教育、高中阶段教育在内的12年免费教育”。为贯彻中央有关决策部署，财政部、教育部在梳理各省收费政策、深入开展调研、广泛征求意见的基础上，出台了《意见》。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：免除普通高中建档立卡家庭经济困难学生学杂费的重要意义是什么?</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>免除普通高中建档立卡家庭经济困难学生学杂费，是完善国家助学政策体系、推进教育机会公平、阻断贫困代际传递、实施精准扶贫帮困的重要举措，是加快普及高中阶段教育、守住民生底线、全面建成小康社会的客观要求，具有十分重要的意义。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　一是有利于推进教育脱贫攻坚工作，实施精准扶贫帮困。农村贫困人口脱贫是全面建成小康社会最艰巨的任务。扶贫先扶智，教育扶贫是阻断贫困代际传递的治本之策，是脱贫攻坚的优先任务。《中共中央 国务院关于打赢脱贫攻坚战的决定》明确提出，实施教育脱贫等一系列精准扶贫方略，其中一项具体措施就是率先从建档立卡的家庭经济困难学生实施普通高中免除学杂费。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　二是有利于加快普及高中阶段教育，提高国民整体素质。高中阶段教育是国民教育体系承上启下的关键环节。当前，经济全球化深入发展，国际竞争日趋激烈，迫切需要进一步提高我国劳动人口受教育年限，提升劳动者整体素质。免除普通高中建档立卡家庭经济困难学生学杂费，有利于加快普及高中阶段教育，推动高中阶段教育改革发展。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　三是有利于完善国家助学政策体系, 促进教育机会公平。目前，我国已建立起从学前教育到研究生教育全覆盖的学生助学政策体系。对于普通高中家庭经济困难学生，政府已设立了国家助学金，资助面约占在校生20%，平均补助标准每年每生2000元，每年约500万名学生受益。但对于建档立卡等家庭经济困难学生而言，还存在资助强度不够等问题，出台免学杂费政策有利于进一步完善资助政策、加大对特殊困难学生的资助力度。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：本次免学杂费政策的主要内容是什么？</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>《意见》明确，从2016年秋季学期起，免除公办普通高中建档立卡等家庭经济困难学生（含非建档立卡的家庭经济困难残疾学生、农村低保家庭学生、农村特困救助供养学生）学杂费。免学杂费标准按照各省级人民政府及其价格、财政主管部门批准的学费标准执行（不含住宿费）。对因免学杂费导致学校收入减少的部分，由财政按照免学杂费学生人数和免学杂费标准补助学校，以保障学校正常运转。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：免学杂费财政补助所需资金中央和地方如何分担？</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>免学杂费财政补助资金由中央与地方按比例分担，其中：西部地区为8:2，中部地区为6:4；东部地区除直辖市外，按照财力状况分省确定。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：部分地方已实施的普通高中免学杂费政策是否需要调整？</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>各地普通高中免学杂费政策范围或标准低于《意见》的，按照《意见》要求执行；政策范围或标准高于《意见》要求的，可继续执行。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：本次免学杂费政策是否对民办教育“一视同仁”？</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>民办教育是我国教育事业的重要组成部分。党中央、国务院高度重视民办教育发展。近年来，财政部、教育部认真贯彻中央有关精神，不断完善政策措施，鼓励社会力量和民间资本提供多样化教育服务。此次出台的免学杂费政策，对于政府教育行政管理部门依法批准的民办学校符合条件的学生，与公办学校学生“一视同仁”，按照当地同类型公办学校免除学杂费标准给予补助。民办学校学费标准高于补助的部分，学校可以按规定继续向学生收取。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>问：目前，两部主要采取了哪些措施，确保政策落实到位?</strong></p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>答：</strong>为确保免学杂费工作顺利实施，近日，财政部、教育部紧急预拨2016年秋季学期免除普通高中建档立卡等家庭经济困难学生学杂费中央财政补助经费4.4亿元，并下发明电对有关工作进行了部署，要求各地加强组织领导，制定切实可行的实施方案，做好免收或退费工作，强化监督检查和信息公开，确保政策和资金落实到位。</p><p><br/></p>','财政部 教育部就免除普通高中建档立卡 家庭经济困难学生学杂费答记者问','　经国务院同意，8月30日，财政部、教育部联合印发了《关于免除普通高中建档立卡家庭经济困难学生学杂费的意见》（以下简称《意见》），决定从2016年秋季学期起，免除普通高中建档立卡家庭经济困难学生学杂费。为做好相关政策解读，财政部、教育部有关负责人接受了记者采访。','1','1','2016-09-04 01:50:47','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('10','1','','','2016-09-04 01:51:36','<p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>编者按：</strong>近日，在财政部与经合组织（OECD）联合举办的“应对经济挑战新方法”高级别国际研讨会上，财政部部长楼继伟在开幕式上致辞，肯定了双方合作成果及OECD在推进G20结构性改革进程中的重要作用，指出了中国推进结构性改革的重要举措。现将其观点摘要如下。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　财政部楼继伟部长代表本次高级别研讨会联合主办方，首先肯定了近年来，尤其是OECD与财政部签署《合作备忘录》以来的工作成效，指出今年中国作为G20轮值主席国，提出了制定G20结构性改革的优先领域、指导原则，以及设计衡量改革进展和成效的指标体系，目前有关各方对此已达成共识。这项工作得到了OECD及其他国际同仁的大力支持与配合，是今年G20财金渠道的重要成果，凸显了各成员国对实行结构性改革的坚定承诺，对推动全球经济强劲、可持续、平衡增长具有重要意义。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>一、结构性改革是实现包容性增长的关键所在</strong></p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　当前，世界经济仍然处在深度调整期，经济增长动力不足，恐怖主义、难民潮等非经济因素对世界经济的影响更加明显。主要经济体经济走势和宏观政策取向分化，国际金融市场动荡不稳，大宗商品价格低位震荡，新兴经济体困难和风险明显加大。尤其是近期英国“脱欧”对世界金融、贸易、资本流动等带来短期冲击，从长期看，“脱欧”有可能成为新的风险源头。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　全球经济这种复杂严峻的低增长困境，究其深层次原因，主要是结构性矛盾和问题。虽然各国国情和所处发展阶段不同，结构性问题的具体表现特征和严重程度也不尽相同，但在应对策略上，国际社会对推进结构性改革有普遍共识，强调加强结构性改革和提升潜在增长率的重要性。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　包容性增长是公平参与、效率最优、合理共享和可持续的增长，核心是减少或者消除发展机会上的不公平。包容性增长需要包容性制度的支撑、要依靠结构性改革实现。用改革的思维、办法，消除体制机制障碍，形成促进要素积累和技术创新的制度，包括劳动力自由流动、鼓励平等竞争、市场价格形成机制等一系列包容性经济制度。结构性改革的关键在于处理好政府与市场的关系，充分发挥市场配置资源的决定性作用，更好地——而不是更多——发挥政府作用。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　结构性改革必然是个艰难的过程，涉及的利益关系错综复杂，面临的风险难以准确把握，需要总体规划，合理安排结构性改革的优先顺序、力度和节奏，做好长短搭配。同时，宏观经济政策和结构性改革之间的关系同样值得关注。一些结构性改革短期内具有紧缩趋势，应该有扩张性的财政政策、货币政策与之相配合。结构性改革的着力点在供给侧，需求侧主要是政策支持。推进供给侧结构性改革需要与需求侧的政策有效衔接。当然两者的协调是一个难题，各国的协调空间也不一样。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>二、中国结构性改革总体思路</strong></p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　中国结构性改革的思路是区分轻重缓急，加快推进短期内就能见效的改革项目，如继续简政放权，放松行政管制，推进政务公开，提高行政效率等，缓解经济下行压力；同时，积极有序推进养老保险、医疗保险、劳动力市场等中长期改革。放松行政管制，这是见效最快的结构性改革措施。中国近两年多来大幅解除管制，减少行政审批，加强政府部门之间的信息联动，推动了创业和创新，激发了市场主体的动力和创造力。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　当前，中国实施积极的财政政策，阶段性适当提高赤字率，是为供给侧结构性改革营造稳定的宏观经济环境，特别是为“三去一降一补”创造一定空间，缓解改革“阵痛”。同时，要继续深化财税体制改革，改革完善财政自身的结构性问题，加快建立现代财政制度，真正发挥国家治理的基础和重要支柱作用。具体包括继续完善税制，进一步加强预算管理，研究调整中央和地方收入划分总体方案，推进中央与地方财政事权和支出责任划分改革，完善转移支付制度，加强地方政府债务管理等。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>三、财政支持中国结构性改革的重要举措</strong></p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　推动结构性改革，实现包容性增长，要从优化资源配置、充分发挥市场配置资源的决定性作用入手。财政支持中国结构性改革的重点措施包括：</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>第一，支持“三去一降一补”。</strong>“三去一降一补”是针对中国产能过剩、库存高企、杠杆偏高、成本过高、短板突出等结构性问题提出来的五大任务，也是工作目标。这需要以改革为基本手段，充分发挥市场机制作用。在此过程中政府不能决定谁生谁死，优胜劣汰是市场出清的结果，财政要做的主要是为下岗职工提供基本生活保障，并创造培训、转岗再就业的条件。同时，继续优化财政支出结构，重点支持扶贫、环境治理等薄弱领域，多“雪中送炭”，少“锦上添花”。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>第二，推动理顺价格关系。</strong>当前的重点是减少对市场价格形成的不当干预，着力完善灵活有效、无扭曲的价格形成机制。以支持农产品收储制度改革为例，近年来已陆续出台了棉花、大豆目标价格改革，相应取消了最低保护价收购，市场有效发现并形成价格、进而引导农户理性决策的机制已初步形成。下一步，要继续改革完善农产品价格形成机制，让市场起决定性作用，将产业链的扭曲矫正过来，提高资源配置和供给效率。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>第三，推进城乡要素流动。</strong>中国正实施的以人为本新型城镇化，将成为经济增长的新动能，促进产业发展、就业转移、公共服务和人口集聚相统一。2015年财政开始实现义务教育资源可携带，使农民工子女享受城市的免费教育。下一步将落实好支持农业转移人口市民化的财政政策，进一步打破人口自由流动障碍，使得更多的劳动要素能够从农业、农村有序有效转移到生产率水平更高的非农产业和城市，促进进城农民安居创业。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>第四，优化投资结构。</strong>中国储蓄率高，城镇化、工业化、信息化、农业现代化正在协同推进。保持一定的投资水平，既有基础，也有必要，关键是要淘汰落后产能，优化投资结构。中国将通过保护知识产权、提供税收鼓励等方式，推动企业增加研发投入，着力提高设备和高附加价值产业的投资。面对社会急需的一些公共服务遇到的资金瓶颈，中国政府大力推广PPP模式，吸引私人资本投向公共服务，提高公共服务供给水平和效率。</p><p style=\"text-align:justify;margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　总之，挑战与机遇并存，以改革的方式为经济发展注入新的活力，在适度扩大总需求的同时，着力加强供给侧结构性改革，优化劳动力、资本、土地、技术、管理等要素配置，培育经济增长新动能，提高经济发展质量和效率，实现中国经济包容性、可持续中高速增长。</p><p style=\"margin-bottom: 1em; line-height: 28.8px; font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　注：本次研讨会其他嘉宾发言及议题观点摘要详见：财政部国合司子网站——财政部与OECD合作信息共享专栏“国际研讨会”子模块。</p><p><br/></p>','楼继伟：包容性增长与结构性改革','编者按：近日，在财政部与经合组织（OECD）联合举办的“应对经济挑战新方法”高级别国际研讨会上，财政部部长楼继伟在开幕式上致辞，肯定了双方合作成果及OECD在推进G20结构性改革进程中的重要作用，指出了中国推进结构性改革的重要举措。现将其观点摘要如下。','1','1','2016-09-04 01:51:12','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('11','1','','','2016-09-04 01:54:15','<p>近日，我省出台《关于加强公立医院财务和预算管理的实施意见》，明确公立医院、业务主管部门、财政部门三方职责，推行“五项制度”，助推公立医院综合改革。</p><p>一是实行全面预算管理制度。公立医院所有收支全部纳入部门预算统一管理，严格按预算批复组织收入、规范支出，强化内部预算管理。业务主管部门负责对公立医院预算、决算、结余资金、资产、负债等事项进行全面管理，并加强公立医院年度预算审核。财政部门按照政府卫生投入政策和“核定任务、核定收支、定项补助、超支不补、结余按规定使用”的预算管理办法核定政府补助。</p><p>二是推行成本核算制度。公立医院在实行医疗业务成本核算的基础上，逐步实行医院全成本核算，以全面反映医院经济运行状况。业务主管部门负责建立医疗机构成本信息库，根据各类医院分项平均成本制定本地区成本定额指导水平，作为医院绩效考核的重要指标；建立健全医院支出标准体系，规范支出预算核定办法。财政部门将医院成本控制情况作为安排补助资金的重要依据。</p><p>三是建立健全财务报告制度。公立医院按照预算管理级次和规定时间定期向主管部门和财政部门报送财政报告。业务主管部门对医院财务报告进行不定期监督抽查，并对年度财务报告委托注册会计师事务所进行审计，审计结果在一定范围内公开，并将其作为医院评价、医院院长及相关责任人绩效考核的依据。</p><p>四是建立财务信息公开制度。公立医院是财务信息公开的主体，按照规定权限和程序向社会披露相关财务信息，做到公开内容真实、程序规范。公开内容以经专业机构审计核实后的财务报告为基础，重点公开公立医院收支情况等社会公众较为关心的信息。业务主管部门督促公立医院主动定期向社会公开相关信息。</p><p>五是落实三级医院总会计师制度。三级公立医院必须设置总会计师岗位，其他医院有条件的也应设置总会计师岗位。总会计师通过公开公平方式选拔，参与医院重大问题的决策。三级医院上报年度部门预算、决算及相关财务报表时须经总会计师签字。有条件的地区可实行总会计师委派制和财务主管委派制。</p><p><br/></p>','我省推行五项财务管理制度助推公立医院综合改革','近日，我省出台《关于加强公立医院财务和预算管理的实施意见》，明确公立医院、业务主管部门、财政部门三方职责，推行“五项制度”，助推公立医院综合改革。','1','1','2016-09-04 01:53:28','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('12','1','','','2016-09-04 01:54:50','<p>经省政府同意，近日，省财政厅联合省编办、省人力资源社会保障厅、省审计厅出台了《关于规范机关事业单位财会人员入职资质提高财会人员素质的意见》，从4个方面对规范和加强党政机关、事业单位财会人员入职资质管理和提高财会人员素质提出了要求。</p><p>&nbsp; &nbsp; 一是严格入职资质，规范入职程序。明确各单位应科学设置会计机构和财会岗位，事业单位和业务主管部门经批准可以设置总会计师。各单位要严格财会人员入职资质管理，财会人员上岗入职，必须取得会计从业资格证书。财会机构负责人（会计主管）还应具备会计师以上专业技术职务资格或从事财会工作三年以上经历；总会计师还应具备会计师以上专业技术职务资格，连续三年主管一个单位财会工作的经历。各单位要对拟任用财会人员进行资格审核，并对现有财会人员进行资格审查，对不符合条件的财会人员限期取消资质。拟设置总会计师的单位，应将拟任总会计师人员的专业资格证书和其他相关证明材料报财政部门审核确认。</p><p>&nbsp; &nbsp; 二是加大人才培养力度，全面提升财会人员素质。以高端会计人才培养为引领，统筹推进财会人员初任实训、会计机构负责人和业务骨干能力提升培训、总会计师和高级财会人才轮训等各类培训，加强对财会人员职业精神、道德素质的培养，建立机关事业单位会计诚信档案，建立分类明确、档次衔接的会计人才库。</p><p>&nbsp; &nbsp; 三是推进相关改革，完善配套措施。大力推进行政事业单位内部控制体系建设，加快管理会计人才培养，推进财务会计向管理会计转变。明确推进财会管理政府购买服务和会计机构负责人委派工作；完善会计专业技术资格评价制度，形成初、中、高级层次清晰，相互衔接，体系完整的会计专业技术资格体系；启动我省机关事业单位总会计师素质提升工程。</p><p>&nbsp; &nbsp; 四是加强组织领导，严格落实行政问责。明确机构编制、人力资源社会保障等部门要在机关事业单位财会人员配备、岗位设置、评先树优等方面给予支持和倾斜。财政部门要定期开展财会人员任职履职情况专项检查；审计部门要将部门单位会计岗位设置、人员入职资质及程序等情况作为部门单位审计的重要内容。要健全责任追究制度，坚决杜绝隐瞒、截留、坐支、虚报、冒领财政资金等行为，严肃财经纪律。</p><p><br/></p>','我省出台规范机关事业单位财会人员入职资质的意见','经省政府同意，近日，省财政厅联合省编办、省人力资源社会保障厅、省审计厅出台了《关于规范机关事业单位财会人员入职资质提高财会人员素质的意见》','1','1','2016-09-04 01:54:16','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('13','1','','','2016-09-04 01:55:20','<p>为加强专项资金管理，近日，该市财政局下发《关于在财政专项资金管理领域实行信用负面清单制度的通知》，在市级财政专项资金管理领域实行信用负面清单制度,对专项资金管理领域中存在的弄虚作假、虚报冒领、骗取套取、截留挪用财政资金等行为的单位和个人，由财政部门会同有关主管部门纳入信用负面清单，对其以后年度申报所有财政专项资金项目予以限制，以此引导专项资金申请人的行为趋于理性，保证财政资金使用效益得到有效发挥。</p><p>&nbsp; &nbsp; 在市级专项资金项目申报及资金使用过程中，凡是经市级及以上审计和财政监督检查机构认定，存在以下七种情形的，都将全部纳入信用负面清单管理。一是申报虚假项目或伪造、篡改项目立项等批复文件的；二是虚报项目投资额等专项资金分配依据指标的；三是伪造项目单位财务状况及经济效益指标并直接影响专项资金分配结果的；四是伪造、篡改相关合同文本、技术工艺等指标，使之达到项目申报条件的；五是因主观原因导致项目建设期严重滞后或无法实施，影响资金使用效益的；六是截留、挤占、挪用财政专项资金的；七是因管理不善导致财政专项资金重大损失浪费的。</p><p>&nbsp; &nbsp; 被列入负面清单的企业或个人，在有关部门严格依法依规进行处理、处罚的基础上，两年内取消其市级所有专项资金申报资格；情节特别严重的，延长至三至五年。出具虚假报告的社会中介机构，两年内取消鉴证资格。对相关县（市、区）财政及主管部门因审核把关不严造成本地区违纪违规问题突出的，除在一定范围内通报外，还将调减该县（市、区）申报额度直至取消申报资格。对市直相关主管部门因审核把关不严造成市级专项资金出现重大损失浪费的，市财政局将报请市政府批准暂停、减少直至取消该项资金。</p><p>&nbsp; &nbsp; 从7月1日起，泰安市市级公共财政、政府性基金、国有资本经营预算安排的专项资金都要实行这一制度，中央和省下达的专项转移支付资金也按照省级信用负面清单制度执行。市财政局将建立负面清单管理台账，不仅与市级相关部门信息共享，还将与市财政项目库管理系统紧密结合，实现新项目申报与台账的实时、无缝比对，让违规企业单位无所遁形，保证制度得到有效落实。</p><p><br/></p>','泰安市财政建立信用负面清单制度加强专项资金管理','为加强专项资金管理，近日，该市财政局下发《关于在财政专项资金管理领域实行信用负面清单制度的通知》，在市级财政专项资金管理领域实行信用负面清单制度','1','1','2016-09-04 01:54:52','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('14','1','','','2016-09-04 01:55:47','<p>为保障城乡居民享受均等化的基本公共卫生服务，截至7月底，省财政已筹集预拨2016年基本公共卫生服务省级补助资金20.67亿元，同比增长13.1%，支持各地将基本公共卫生服务人均经费标准由2015年的40元提高到45元。提标新增经费主要用于提高服务质量效率和均等化水平及开展国家基本公共卫生服务项目签约服务，并适当增加高血压、糖尿病和严重精神障碍患者的管理人数，服务项目内容扩大到12大类46项。</p>','省财政筹资20.67亿元支持基本公共卫生服务经费提标','为保障城乡居民享受均等化的基本公共卫生服务，截至7月底，省财政已筹集预拨2016年基本公共卫生服务省级补助资金20.67亿元，','1','1','2016-09-04 01:55:22','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('15','1','','','2016-09-04 01:56:09','<p>近日，日照市获批国家蓝色海湾整治行动城市，财政部已下达第一批中央海岛和海域保护资金1.5亿元，专项用于该市开展蓝色海湾整治行动。该项目紧紧围绕建设美丽海洋的总目标，坚持海陆统筹、区域联动，积极推进海湾综合整治和生态岛礁建设，推动海洋生态环境质量逐步改善，最终实现“水清、岸绿、滩净、湾美、岛丽”的海洋生态文明建设目标。</p>','日照市成功申请国家蓝色海湾整治行动项目','近日，日照市获批国家蓝色海湾整治行动城市，财政部已下达第一批中央海岛和海域保护资金1.5亿元，','1','1','2016-09-04 01:55:48','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('16','1','','','2016-09-04 02:46:10','<p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">一是适当提高稳岗补贴标准。</span><span style=\"line-height: 24px; font-size: 12pt;\">对符合稳岗补贴条件的钢铁、煤炭等行业过剩产能企业，可按不高于上年度实际缴纳失业保险费总额的70%给予稳岗补贴，比原来提高20%，支持企业按规定用于职工生活补助、缴纳社会保险费、转岗培训和技能提升培训等相关支出。2016年全省社会保险基金预算安排12.4亿元，保障稳岗补贴政策落实到位。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">二是完善内部退养人员参保缴费政策。</span><span style=\"line-height: 24px; font-size: 12pt;\">钢铁、煤炭等行业过剩产能企业内部退养人员因破产等原因无企业主体并无出资控股企业的，与原企业之间的劳动合同终止，可自愿选择领取经济补偿金或预留社会保险费和基本生活费。对选择预留社会保险费和基本生活费的，免除企业和个人应缴纳的失业、工伤和生育保险费。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 12pt;\">三是加大对就业困难人员的帮扶力度。</span><span style=\"font-size: 12pt;\">对钢铁、煤炭等行业过剩产能企业符合就业困难条件的失业人员，实行建档立卡，提供“一对一”就业援助；对吸纳就业困难人员的用人单位，以及从事灵活就</span></p><p><br/></p>','我省进一步完善社会保险政策促进过剩产能企业职工安置','一是适当提高稳岗补贴标准。对符合稳岗补贴条件的钢铁、煤炭等行业过剩产能企业，可按不高于上年度实际缴纳失业保险费总额的70%给予稳岗补贴','1','1','2016-09-04 02:45:49','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('17','1','','','2016-09-04 02:46:30','<p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">近日，省财政进一步修订完善居民基本医疗保险省级财政补助资金拨付办法，强化居民基本医疗保险政府补助资金管理，为参保居民医疗保险待遇落实提供有力资金保障。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">一是提前地方财政补助资金到位时间。</span><span style=\"line-height: 24px; font-size: 12pt;\">从2016年开始，要求省级及以下财政补助资金在8月底前拨付到位，比国家规定时间提前一个月，同时将省级补助资金与市县补助资金到位率挂钩，激励约束各级财政部门加强资金调度，确保补助政策落实到位。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; font-size: 12pt;\">二是鼓励各市提高市级统筹效率。</span><span style=\"line-height: 24px; font-size: 12pt;\">对已实现居民基本医疗保险市级统收统支的市，省财政按照国库集中支付有关规定将省级补助资金直接支付到市级社保专户，并按照全市整体补助资金到位率核拨省级补助资金，促进各市积极完善统筹政策，尽早实现市级统收统支，提高市域内基金统筹互济能力。</span></p><p style=\"color: rgb(81, 81, 81); font-family: Simsun; font-size: 12px; text-align: center; white-space: normal; line-height: 18px; text-indent: 24pt; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 12pt;\">三是简化审核程序提高审核效率。</span><span style=\"font-size: 12pt;\">将原来每年两次申报参保人数简化为申报一次，省财政每年初根据上年参保缴费人数全额预拨当年省级补助资金，各市每年只需要申报截至当年6月底的参保缴费人数，按规定程序审核检查后，作为省级补助资金结算依据。</span></p><p><br/></p>','省财政三项措施强化省级补助资金管理保障居民医疗保险待遇落实','近日，省财政进一步修订完善居民基本医疗保险省级财政补助资金拨付办法，强化居民基本医疗保险政府补助资金管理，为参保居民医疗保险待遇落实提供有力资金保障。','1','1','2016-09-04 02:46:11','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('18','1','','','2016-09-04 02:46:46','<p><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">近日，省财政厅下达</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">2016</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">年第二批居民基本医疗保险补助资金</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">14.6</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">亿元，今年以来已累计下达补助资金</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">157.3</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">亿元，支持各地落实参保居民政府补助每人每年不低于</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">420</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">元的政策。其中：省级财政对济南、淄博、东营、烟台、威海</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">5</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">市参保居民每人补助</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">126</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">元，对潍坊、济宁、泰安、日照、莱芜</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">5</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">市参保居民每人补助</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">189</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">元，对枣庄、临沂、德州、聊城、滨州、菏泽</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">6</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">市参保居民每人补助</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">294</span><span style=\"color: rgb(81, 81, 81);font-family: 宋体;text-align: center;background-color: rgb(255, 255, 255)\">元，对中央、省属高校大学生按照所在地学生、儿童参保政府补助标准给予补助，促进各市居民基本医疗保险制度平稳运行。</span></p>','省财政下达2016年居民基本医疗保险补助资金157亿元','近日，省财政厅下达2016年第二批居民基本医疗保险补助资金14.6亿元，今年以来已累计下达补助资金157.3亿元，','1','1','2016-09-04 02:46:30','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('19','1','','','2016-09-04 02:47:06','<p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">去年以来，在各有关方面共同推动下，我省各地谋划储备的<span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">项目超过千个，概算总投资近万亿元。为鼓励引导更多</span><span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">项目加快落地、规范运作，进一步提高公共服务供给质量和效率，经广泛征集、严格评审、优中选优，近日省财政拨付</span><span style=\"font-family:Times New Roman\">1</span><span style=\"font-family:宋体\">亿元资金，对基础工作好、项目落地率高、严格规范运作的市县</span><span style=\"font-family:Times New Roman\">16</span><span style=\"font-family:宋体\">个市</span><span style=\"font-family:Times New Roman\">8</span><span style=\"font-family:宋体\">个省直管县（市）进行了一次性奖励和补助，由项目所在地统筹用于补助本地区</span><span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">项目前期工作费用。主要呈现以下三个特点：</span></span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 一是实现市级全覆盖。从地域范围上看，这次受到奖补的市县（市、区）覆盖了<span style=\"font-family:Times New Roman\">16</span><span style=\"font-family:宋体\">市（青岛市单独开展），实现了市级全覆盖。从奖补金额上看，由于</span><span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">工作已在全省全面推开，但各地进度不一，资金分配相对比较均匀、差别不大。</span></span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 二是项目落地再提速。从这次评审看，各地都积极采取针对性举措，进一步加大项目推进力度，参评项目全部进入采购或执行阶段、签订合同，落地率达<span style=\"font-family:Times New Roman\">100%</span><span style=\"font-family:宋体\">。</span></span></p><p style=\"color: rgb(81, 81, 81);font-family: Simsun;font-size: 12px;text-align: center;white-space: normal;margin-top: 0;margin-bottom: 0;background-color: rgb(255, 255, 255)\"><span style=\"font-family: 宋体;font-size: 16px\">&nbsp; 三是规范导向更凸显。今年省财政厅修订了奖补资金办法，进一步加大对规范<span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">项目支持额度，按照“规范化债、国家示范、省级示范”三种类型，分别由</span><span style=\"font-family:Times New Roman\">50</span><span style=\"font-family:宋体\">万元、</span><span style=\"font-family:Times New Roman\">40</span><span style=\"font-family:宋体\">万元、</span><span style=\"font-family:Times New Roman\">30</span><span style=\"font-family:宋体\">万元提高到</span><span style=\"font-family:Times New Roman\">70</span><span style=\"font-family:宋体\">万元、</span><span style=\"font-family:Times New Roman\">50</span><span style=\"font-family:宋体\">万元、</span><span style=\"font-family:Times New Roman\">40</span><span style=\"font-family:宋体\">万元，着力引导在运作规范性和科学性上做文章，重点增强采用</span><span style=\"font-family:Times New Roman\">PPP</span><span style=\"font-family:宋体\">模式规范化解存量债务的积极性，激励形成更多具有规范性、代表性、创新性的典型项目。</span></span></p><p><br/></p>','省财政兑付奖补资金1亿元支持引导PPP项目加快落地规范运作','去年以来，在各有关方面共同推动下，我省各地谋划储备的PPP项目超过千个，概算总投资近万亿元。为鼓励引导更多PPP项目加快落地、规范运作，进一步提高公共服务供给质量和效率，','1','1','2016-09-04 02:46:47','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('1','1','小星星','/data/upload/20160903/57cad2b0334a2.png','','','','1','0');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('2','1','小明','/data/upload/20160903/57cad2c527be9.png','','','','1','0');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('3','1','校长','/data/upload/20160903/57cad2d95f273.png','','','','1','0');
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('1','APP幻灯片','app_dzcz','','1');
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','1','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('2','2','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('3','3','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('4','4','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('5','5','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('6','6','2','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','7','2','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','8','2','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','9','2','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('10','10','2','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('11','11','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('12','12','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('13','13','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('14','14','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('15','15','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('16','16','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('17','17','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('18','18','1','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('19','19','1','0','1');
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('1','德州财政','','article','','0','0','0-1','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('2','财政部','','article','','0','0','0-2','','','','list_masonry','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('3','山东省财政厅','','article','','0','0','0-3','','','','list','article','0','1');
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`) USING BTREE,
  KEY `user_nicename` (`user_nicename`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('1','admin','###99e13a1ec060e148a8a39b7e0df905b4','admin','admin@admin.com','http://www.czjdz.gov.cn/','','0','','','10.0.2.2','2016-09-04 02:45:21','2016-09-02 10:07:30','','1','0','1','0','');
