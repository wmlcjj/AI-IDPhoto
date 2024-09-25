/*
 Navicat Premium Data Transfer

 Source Server         : siam
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : 43.139.60.237:6982
 Source Schema         : idphoto

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 25/09/2024 21:44:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom`  (
                           `id` int NOT NULL AUTO_INCREMENT COMMENT '用户定制尺寸表',
                           `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
                           `width_px` int NOT NULL DEFAULT 0 COMMENT '像素-宽',
                           `height_px` int NOT NULL DEFAULT 0 COMMENT '像素-高',
                           `width_mm` int NOT NULL DEFAULT 0 COMMENT '尺寸-宽',
                           `height_mm` int NOT NULL DEFAULT 0 COMMENT '尺寸-高',
                           `icon` int NULL DEFAULT 1 COMMENT '图标，1-6',
                           `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户自定义' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for customer_user
-- ----------------------------
DROP TABLE IF EXISTS `customer_user`;
CREATE TABLE `customer_user`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
                                  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录账号',
                                  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
                                  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
                                  `salt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
                                  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
                                  `birthday` date NULL DEFAULT NULL COMMENT '生日',
                                  `sex` int NULL DEFAULT NULL COMMENT '性别(0-默认未知,1-男,2-女)',
                                  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
                                  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
                                  `status` int NULL DEFAULT 1 COMMENT '冻结状态(1-正常,2-冻结)',
                                  `type` int NULL DEFAULT 1 COMMENT '1-客户，2-合作方，3-游客，4-员工',
                                  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
                                  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
                                  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
                                  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语言',
                                  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
                                  `source` int NULL DEFAULT NULL COMMENT '用户来源1-手动新增，2-微信公众号,3-微信小程序',
                                  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'openid',
                                  `unionid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'unionid',
                                  `wx_num` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户微信号',
                                  `wx_num_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '添加微信号说明',
                                  `xcx_openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '小程序openid',
                                  `app_openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'APP openid',
                                  `channel_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道',
                                  `wx_nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '微信昵称',
                                  `wx_head_img_Url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '微信头像',
                                  `is_deleted` int NULL DEFAULT 0 COMMENT '是否删除,0-未删除，1-已删除',
                                  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `index_realname`(`realname` ASC) USING BTREE,
                                  INDEX `index_unionid`(`unionid` ASC) USING BTREE,
                                  INDEX `index_openid`(`openid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '客户用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_detail
-- ----------------------------
DROP TABLE IF EXISTS `file_detail`;
CREATE TABLE `file_detail`  (
                                `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件id',
                                `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件访问地址',
                                `size` bigint NULL DEFAULT NULL COMMENT '文件大小，单位字节',
                                `filename` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
                                `original_filename` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名',
                                `base_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基础存储路径',
                                `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储路径',
                                `ext` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件扩展名',
                                `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'MIME类型',
                                `platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储平台',
                                `th_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图访问路径',
                                `th_filename` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图名称',
                                `th_size` bigint NULL DEFAULT NULL COMMENT '缩略图大小，单位字节',
                                `th_content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图MIME类型',
                                `object_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件所属对象id',
                                `object_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件所属对象类型，例如用户头像，评价图片',
                                `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文件元数据',
                                `user_metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文件用户元数据',
                                `th_metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '缩略图元数据',
                                `th_user_metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '缩略图用户元数据',
                                `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附加属性',
                                `file_acl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件ACL',
                                `th_file_acl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图文件ACL',
                                `hash_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '哈希信息',
                                `upload_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传ID，仅在手动分片上传时使用',
                                `upload_status` int NULL DEFAULT NULL COMMENT '上传状态，仅在手动分片上传时使用，1：初始化完成，2：上传完成',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_part_detail
-- ----------------------------
DROP TABLE IF EXISTS `file_part_detail`;
CREATE TABLE `file_part_detail`  (
                                     `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分片id',
                                     `platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储平台',
                                     `upload_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传ID，仅在手动分片上传时使用',
                                     `e_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分片 ETag',
                                     `part_number` int NULL DEFAULT NULL COMMENT '分片号。每一个上传的分片都有一个分片号，一般情况下取值范围是1~10000',
                                     `part_size` bigint NULL DEFAULT NULL COMMENT '文件大小，单位字节',
                                     `hash_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '哈希信息',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件分片信息表，仅在手动分片上传时使用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_part_detail
-- ----------------------------

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
                         `width_px` int NOT NULL DEFAULT 0 COMMENT '像素-宽',
                         `height_px` int NOT NULL DEFAULT 0 COMMENT '像素-高',
                         `width_mm` int NOT NULL DEFAULT 0 COMMENT '尺寸-宽',
                         `height_mm` int NOT NULL DEFAULT 0 COMMENT '尺寸-高',
                         `icon` int NULL DEFAULT 1 COMMENT '图标',
                         `sort` tinyint NULL DEFAULT 100 COMMENT '排序',
                         `category` tinyint(1) NULL DEFAULT 0 COMMENT '1=常用寸照，2=各类签证，3=各类证件',
                         `dpi` int NULL DEFAULT 0,
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 759 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '证件照表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, '一寸', 295, 413, 25, 35, 5, 1, 1, 300);
INSERT INTO `item` VALUES (2, '二寸', 413, 579, 35, 49, 6, 2, 1, 300);
INSERT INTO `item` VALUES (3, '小二寸', 413, 531, 35, 45, 5, 3, 1, 300);
INSERT INTO `item` VALUES (4, '大一寸', 390, 567, 33, 48, 4, 4, 1, 300);
INSERT INTO `item` VALUES (5, '社保证', 358, 441, 26, 32, 3, 5, 3, 300);
INSERT INTO `item` VALUES (6, '小一寸', 260, 378, 22, 32, 2, 6, 1, 300);
INSERT INTO `item` VALUES (7, '驾驶证、驾照（小一寸）', 260, 378, 22, 32, 6, 7, 3, 500);
INSERT INTO `item` VALUES (8, '简历照片', 295, 413, 25, 35, 2, 8, 3, 300);
INSERT INTO `item` VALUES (9, '美国签证', 600, 600, 51, 51, 3, 9, 2, 300);
INSERT INTO `item` VALUES (10, '工商银行网申（100×140）', 100, 140, 8, 12, 3, 100, 3, 300);
INSERT INTO `item` VALUES (11, '交通银行网申（一寸）', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (12, '建设银行网申', 120, 160, 10, 13, 2, 100, 3, 300);
INSERT INTO `item` VALUES (13, '学籍网', 472, 630, 80, 107, 5, 100, 3, 150);
INSERT INTO `item` VALUES (14, '中国人民银行网申', 200, 260, 17, 22, 2, 100, 3, 300);
INSERT INTO `item` VALUES (15, '工商银行网申（240×370）', 240, 370, 20, 31, 5, 100, 3, 300);
INSERT INTO `item` VALUES (16, '工商银行网申生活照', 240, 320, 20, 27, 2, 100, 3, 300);
INSERT INTO `item` VALUES (17, '中国移动网上报名', 96, 120, 8, 10, 6, 100, 3, 300);
INSERT INTO `item` VALUES (18, '上海中考网报名', 168, 240, 14, 20, 6, 100, 3, 300);
INSERT INTO `item` VALUES (19, '成都人事考试网', 102, 126, 9, 11, 5, 100, 3, 300);
INSERT INTO `item` VALUES (20, '网申国企', 70, 100, 6, 8, 2, 100, 3, 300);
INSERT INTO `item` VALUES (21, '北大考研网上报名', 178, 237, 15, 20, 5, 100, 3, 300);
INSERT INTO `item` VALUES (22, '北京教师信息网', 154, 189, 13, 16, 6, 100, 3, 300);
INSERT INTO `item` VALUES (23, '学信网', 480, 640, 41, 54, 4, 100, 3, 300);
INSERT INTO `item` VALUES (24, '合肥人事网招聘（二寸）', 413, 579, 35, 49, 1, 100, 3, 300);
INSERT INTO `item` VALUES (25, '新生网站登记', 144, 172, 12, 15, 4, 100, 3, 300);
INSERT INTO `item` VALUES (26, '农业银行网申（一寸）', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (27, '网约车照片（小二寸）', 455, 661, 33, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (28, '网约车运营证', 358, 448, 30, 38, 4, 100, 3, 300);
INSERT INTO `item` VALUES (29, '兵役登记（全国征兵网）', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (30, '中国人事网报名', 295, 413, 25, 35, 1, 100, 3, 300);
INSERT INTO `item` VALUES (31, '普通话水平测试（大一寸，0~20kb）', 390, 567, 33, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (32, '中国护照（大一寸）', 390, 567, 33, 48, 5, 100, 2, 300);
INSERT INTO `item` VALUES (33, '教师资格证', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (34, '台湾通行证（大一寸）', 390, 567, 33, 48, 1, 100, 2, 300);
INSERT INTO `item` VALUES (35, '港澳通行证（大一寸）', 390, 567, 33, 48, 6, 100, 2, 300);
INSERT INTO `item` VALUES (36, '中级会计职称考试（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (37, '安徽公务员（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (38, '河南公务员（一寸）', 295, 413, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (39, '湖南公务员（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (40, '西藏公务员（一寸）', 295, 413, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (41, '新疆公务员（小二寸）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (42, '健康证（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (43, '社会工作者资格证（一寸）', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (44, '陕西行政执法证（一寸）', 295, 413, 25, 35, 1, 100, 3, 300);
INSERT INTO `item` VALUES (45, '浙江行政执法证（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (46, '雅思考试（大一寸）', 390, 567, 33, 48, 2, 100, 3, 300);
INSERT INTO `item` VALUES (47, '一寸工作证', 295, 413, 25, 35, 5, 100, 1, 300);
INSERT INTO `item` VALUES (48, '江西安全监管执法证（一寸）', 295, 413, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (49, '在职研究生考试（大一寸）', 390, 567, 33, 48, 3, 100, 3, 300);
INSERT INTO `item` VALUES (50, '中国签证（大一寸）', 390, 567, 33, 48, 1, 100, 2, 300);
INSERT INTO `item` VALUES (51, '英语四六级考试（大一寸，20~200kb）', 390, 567, 33, 48, 1, 100, 3, 300);
INSERT INTO `item` VALUES (52, '广州羊城通学生乘车卡（大一寸）', 390, 567, 33, 48, 2, 100, 3, 300);
INSERT INTO `item` VALUES (53, '普通话水平测试（大一寸，150~300kb）', 390, 567, 33, 48, 3, 100, 3, 300);
INSERT INTO `item` VALUES (54, '高考报名（一寸）', 390, 567, 33, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (55, '硕士研究生考试（大一寸）', 390, 567, 33, 48, 1, 100, 3, 300);
INSERT INTO `item` VALUES (56, '西安美术联考（一寸）', 295, 413, 25, 35, 1, 100, 3, 300);
INSERT INTO `item` VALUES (57, '山西省全国计算机等级考试（一寸）', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (58, '宁夏回族自治区专业技术人员（一寸）', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (59, '宁波外语口译考试（大一寸）', 390, 567, 33, 48, 1, 100, 3, 300);
INSERT INTO `item` VALUES (60, '全国计算机等级考试（大一寸，390×567）', 390, 567, 33, 48, 1, 100, 3, 300);
INSERT INTO `item` VALUES (61, '辽宁二级建造证（一寸）', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (62, '医疗类报名（一寸）', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (63, '普通话水平测试（大一寸,30-80kb）', 390, 567, 33, 48, 4, 100, 3, 300);
INSERT INTO `item` VALUES (64, '全国医用设备使用人员业务能力考评（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (65, '入学报名（一寸）', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (66, '成人自考（一寸）', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (67, '执业药师资格考试（一寸）', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (68, '注册会计师考试（一寸）', 295, 413, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (69, '护士执业资格考试（一寸）', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (70, '一寸半身照', 295, 413, 25, 35, 2, 100, 1, 300);
INSERT INTO `item` VALUES (71, '初级护师（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (72, '主管护师（一寸）', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (73, '三支一扶（一寸，大于30kb）', 295, 413, 25, 35, 3, 100, 3, 300);
INSERT INTO `item` VALUES (74, '入学照（一寸）', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (75, '英语AB级（一寸，蓝底）', 295, 413, 25, 35, 1, 100, 3, 300);
INSERT INTO `item` VALUES (76, '英语AB级（小一寸，蓝底）', 260, 378, 22, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (77, '大二寸', 413, 626, 35, 53, 4, 100, 1, 300);
INSERT INTO `item` VALUES (78, '国考（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (79, '徐州公务员（小二寸）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (80, '天津公务员（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (81, '河北省选调生（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (82, '内蒙古公务员（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (83, '辽宁公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (84, '吉林公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (85, '江苏公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (86, '安徽公务员（小二寸）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (87, '福建公务员（小二寸）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (88, '湖南公务员（小二寸）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (89, '广东公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (90, '广州公务员（小二寸）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (91, '广西公务员（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (92, '海南公务员（小二寸）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (93, '重庆公务员（小二寸）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (94, '四川公务员（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (95, '贵州公务员（小二寸）', 260, 320, 22, 27, 4, 100, 3, 300);
INSERT INTO `item` VALUES (96, '云南公务员（小二寸）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (97, '陕西公务员（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (98, '甘肃公务员（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (99, '宁夏公务员（小二寸）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (100, '泰国签证（二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (101, '韩国签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (102, '日本签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (103, '越南签证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (104, '法国签证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (105, '澳大利亚签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (106, '柬埔寨签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (107, '德国签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (108, '加拿大签证（小二寸，413×531px）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (109, '希腊签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (110, '英国签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (111, '西班牙签证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (112, '瑞士签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (113, '南非签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (114, '尼泊尔签证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (115, '老挝签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (116, '意大利签证（成都广州）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (117, '俄罗斯签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (118, '荷兰签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (119, '阿联酋签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (120, '奥地利签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (121, '比利时签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (122, '巴西签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (123, '埃及签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (124, '孟加拉签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (125, '马尔代夫签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (126, '葡萄牙签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (127, '瑞典签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (128, '蒙古签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (129, '丹麦签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (130, '芬兰签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (131, '爱尔兰签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (132, '匈牙利签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (133, '新加坡签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (134, '执业医师资格证（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (135, '菲律宾签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (136, '印度尼西亚签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (137, '墨西哥签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (138, '乌克兰签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (139, '波兰签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (140, '智利签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (141, '文莱签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (142, '马达加斯加签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (143, '沙特阿拉伯签证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (144, '赞比亚签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (145, '克罗地亚签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (146, '罗马尼亚签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (147, '乌兹别克斯坦签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (148, '哈萨克斯坦签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (149, '巴基斯坦签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (150, '纳米比亚签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (151, '尼日利亚签证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (152, '巴林签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (153, '古巴签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (154, '捷克签证（小二寸）', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (155, '斯洛伐克签证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (156, '伊朗签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (157, '卡塔尔签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (158, '四川行政执法证（小二寸）', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (159, '河北行政执法证（小二寸）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (160, '二寸工作证', 413, 579, 35, 49, 3, 100, 1, 300);
INSERT INTO `item` VALUES (161, '北京导游证（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (162, '四川执业药师注册工作照（二寸）', 413, 579, 35, 49, 3, 100, 3, 300);
INSERT INTO `item` VALUES (163, '西班牙商务签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (164, '中华人民共和国外国人工作许可（二寸）', 413, 579, 35, 49, 2, 100, 2, 300);
INSERT INTO `item` VALUES (165, '甘肃民族师范学院学籍卡（二寸）', 413, 579, 35, 49, 6, 100, 3, 300);
INSERT INTO `item` VALUES (166, '国家公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (167, '入台证（小二寸）', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (168, '北京党员代表大会（二寸）', 413, 579, 35, 49, 3, 100, 3, 300);
INSERT INTO `item` VALUES (169, '护士资格证考试（小二寸）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (170, '执业医师资格报名（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (171, '养老护理员（二寸）', 413, 579, 35, 49, 1, 100, 3, 300);
INSERT INTO `item` VALUES (172, '医疗（二寸）', 413, 579, 35, 49, 5, 100, 3, 300);
INSERT INTO `item` VALUES (173, '育婴师考试报名（小二寸）', 413, 531, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (174, '执业药师资格考试（二寸）', 413, 579, 35, 49, 1, 100, 3, 300);
INSERT INTO `item` VALUES (175, '大学入学报名（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (176, '小二寸（33×48mm）', 390, 567, 33, 48, 3, 100, 1, 300);
INSERT INTO `item` VALUES (177, '小二寸（32×40mm）', 378, 472, 32, 40, 5, 100, 1, 300);
INSERT INTO `item` VALUES (178, '二寸半身照', 413, 579, 35, 49, 4, 100, 1, 300);
INSERT INTO `item` VALUES (179, '初级护师（小二寸）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (180, '主管护师（小二寸）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (181, '新西兰签证（小二寸）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (182, '阿根廷签证（小二寸）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (183, '入学照（小二寸）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (184, '泰国签证', 472, 708, 40, 60, 5, 100, 2, 300);
INSERT INTO `item` VALUES (185, '日本签证', 531, 531, 45, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (186, '美国护照照片', 600, 600, 51, 51, 2, 100, 2, 300);
INSERT INTO `item` VALUES (187, '加拿大签证', 420, 540, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (188, '新西兰签证', 900, 1200, 76, 102, 1, 100, 2, 300);
INSERT INTO `item` VALUES (189, '缅甸签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (190, '意大利签证（上海北京）', 413, 472, 35, 40, 4, 100, 2, 300);
INSERT INTO `item` VALUES (191, '印度签证（二英寸）', 591, 591, 51, 51, 5, 100, 2, 300);
INSERT INTO `item` VALUES (192, '阿根廷签证', 472, 472, 40, 40, 2, 100, 2, 300);
INSERT INTO `item` VALUES (193, '挪威签证（小二寸）上海&广州', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (194, '新加坡签证', 400, 514, 34, 44, 4, 100, 2, 300);
INSERT INTO `item` VALUES (195, '马来西亚签证（上海&广州）', 413, 590, 35, 50, 3, 100, 2, 300);
INSERT INTO `item` VALUES (196, '马来西亚签证（成都&北京）', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (197, '肯尼亚签证', 591, 591, 50, 50, 1, 100, 2, 300);
INSERT INTO `item` VALUES (198, '以色列签证（二英寸）上海广州', 591, 591, 51, 51, 3, 100, 2, 300);
INSERT INTO `item` VALUES (199, '越南签证', 472, 708, 40, 60, 5, 100, 2, 300);
INSERT INTO `item` VALUES (200, '墨西哥签证（非营利性访客签证）', 366, 461, 31, 39, 2, 100, 2, 300);
INSERT INTO `item` VALUES (201, '突尼斯签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (202, '马耳他签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (203, '斯里兰卡签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (204, '格鲁吉亚签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (205, '冰岛签证', 472, 590, 40, 50, 1, 100, 2, 300);
INSERT INTO `item` VALUES (206, '立陶宛签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (207, '马里签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (208, '吉尔吉斯斯坦签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (209, '喀麦隆签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (210, '巴西签证', 413, 531, 40, 50, 3, 100, 2, 300);
INSERT INTO `item` VALUES (211, '签证采集', 354, 472, 30, 40, 2, 100, 2, 300);
INSERT INTO `item` VALUES (212, '全国计算机等级考试（大一寸，144×192，25~200kb）	', 144, 192, 33, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (213, '全国计算机等级考试（240×320）', 240, 320, 20, 27, 5, 100, 3, 300);
INSERT INTO `item` VALUES (214, '全国计算机等级考试（144×192）', 144, 192, 12, 16, 6, 100, 3, 300);
INSERT INTO `item` VALUES (215, '北京全国计算机等级考试', 300, 400, 25, 34, 5, 100, 3, 300);
INSERT INTO `item` VALUES (216, '甘肃计算机等级考试', 425, 567, 36, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (217, '全国计算机等级考试（150×210）', 150, 210, 13, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (218, '计算机等级考试（小二寸）', 413, 532, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (219, '英语四六级考试（144×192，0~10kb）', 144, 192, 12, 16, 2, 100, 3, 300);
INSERT INTO `item` VALUES (220, '英语四六级考试（240×320，20~30kb）', 240, 320, 20, 27, 6, 100, 3, 300);
INSERT INTO `item` VALUES (221, '英语四六级考试（150×200）', 150, 200, 13, 17, 4, 100, 3, 300);
INSERT INTO `item` VALUES (222, '英语四六级考试（144×172）', 144, 172, 12, 15, 5, 100, 3, 300);
INSERT INTO `item` VALUES (223, '英语四六级考试（76×101）', 76, 101, 6, 9, 3, 100, 3, 300);
INSERT INTO `item` VALUES (224, '商务英语考试', 300, 400, 25, 34, 6, 100, 3, 300);
INSERT INTO `item` VALUES (225, '职称英语考试', 420, 580, 36, 49, 5, 100, 3, 300);
INSERT INTO `item` VALUES (226, '学位英语', 140, 180, 12, 15, 6, 100, 3, 300);
INSERT INTO `item` VALUES (227, '英语四六级考试（144×192）', 144, 192, 12, 16, 6, 100, 3, 300);
INSERT INTO `item` VALUES (228, '英语四六级报名', 120, 160, 10, 13, 2, 100, 3, 300);
INSERT INTO `item` VALUES (229, '英语四六级考试（150×210）', 150, 210, 13, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (230, '英语四六级考试（480×600）', 480, 600, 41, 51, 1, 100, 3, 300);
INSERT INTO `item` VALUES (231, '英语三级考试', 144, 192, 12, 16, 2, 100, 3, 300);
INSERT INTO `item` VALUES (232, '英语四六级考试（144×192）', 144, 192, 12, 16, 3, 100, 3, 300);
INSERT INTO `item` VALUES (233, '医护英语', 300, 450, 25, 38, 5, 100, 3, 300);
INSERT INTO `item` VALUES (234, '公共英语考试（二寸）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (235, '英语AB级考试', 180, 240, 15, 20, 6, 100, 3, 300);
INSERT INTO `item` VALUES (236, 'METS医护英语水平考试', 300, 450, 35, 38, 2, 100, 3, 300);
INSERT INTO `item` VALUES (237, '英语应用能力考试口试', 310, 420, 25, 36, 3, 100, 3, 300);
INSERT INTO `item` VALUES (238, '学位英语（390*567）', 390, 567, 33, 48, 2, 100, 3, 300);
INSERT INTO `item` VALUES (239, '全国英语等级考试', 144, 192, 12, 16, 5, 100, 3, 300);
INSERT INTO `item` VALUES (240, '全国公共英语考试', 144, 192, 12, 16, 3, 100, 2, 300);
INSERT INTO `item` VALUES (241, '英语A级医专', 144, 192, 33, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (242, '国考（100×140）', 100, 140, 8, 12, 2, 100, 3, 300);
INSERT INTO `item` VALUES (243, '国考（99×128）', 99, 128, 8, 11, 2, 100, 3, 300);
INSERT INTO `item` VALUES (244, '国考（北京）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (245, '国考（天津）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (246, '国考（河北）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (247, '国考（山西）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (248, '国考（内蒙古）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (249, '国考（辽宁）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (250, '国考（吉林）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (251, '国考（黑龙江）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (252, '国考（上海）', 215, 300, 18, 25, 5, 100, 3, 300);
INSERT INTO `item` VALUES (253, '国考（江苏）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (254, '国考（浙江）', 100, 140, 8, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (255, '国考（安徽）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (256, '国考（福建）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (257, '国考（江西）', 99, 128, 8, 11, 3, 100, 3, 300);
INSERT INTO `item` VALUES (258, '国考（山东）', 120, 160, 10, 13, 1, 100, 3, 300);
INSERT INTO `item` VALUES (259, '国考（河南）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (260, '国考（湖北）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (261, '国考（湖南）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (262, '国考（广东）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (263, '国考（广西）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (264, '国考（海南）', 413, 531, 35, 45, 6, 100, 3, 300);
INSERT INTO `item` VALUES (265, '国考（重庆）', 413, 531, 34, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (266, '国考（四川）', 413, 531, 34, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (267, '国考（贵州）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (268, '国考（云南）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (269, '国考（陕西）', 413, 531, 35, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (270, '国考（甘肃）', 215, 300, 18, 25, 1, 100, 3, 300);
INSERT INTO `item` VALUES (271, '国考（青海）', 120, 180, 10, 15, 5, 100, 3, 300);
INSERT INTO `item` VALUES (272, '国考（宁夏）', 215, 300, 18, 25, 4, 100, 3, 300);
INSERT INTO `item` VALUES (273, '国考（新疆）', 413, 531, 35, 45, 3, 100, 3, 300);
INSERT INTO `item` VALUES (274, '国考（西藏）', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (275, '河北公务员', 126, 168, 11, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (276, '山西公务员', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (277, '黑龙江公务员', 130, 170, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (278, '上海公务员', 126, 168, 11, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (279, '江苏公务员（小二寸）', 413, 531, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (280, '江西公务员（90×120）', 90, 120, 8, 10, 5, 100, 3, 300);
INSERT INTO `item` VALUES (281, '山东公务员（小二寸）', 120, 160, 10, 13, 4, 100, 3, 300);
INSERT INTO `item` VALUES (282, '湖北公务员', 215, 300, 18, 25, 4, 100, 3, 300);
INSERT INTO `item` VALUES (283, '海南公务员', 168, 218, 14, 18, 4, 100, 3, 300);
INSERT INTO `item` VALUES (284, '青海公务员', 126, 168, 11, 14, 4, 100, 3, 300);
INSERT INTO `item` VALUES (285, '江西公务员（295×413）', 295, 413, 25, 11, 4, 100, 3, 300);
INSERT INTO `item` VALUES (286, '北京公务员', 400, 600, 34, 51, 3, 100, 3, 300);
INSERT INTO `item` VALUES (287, '成都公务员', 102, 126, 9, 11, 5, 100, 3, 300);
INSERT INTO `item` VALUES (288, '重庆公务员', 280, 373, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (289, '公务员考试', 413, 531, 11, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (290, '江西吉安公务员照片采集', 480, 600, 41, 51, 4, 100, 3, 300);
INSERT INTO `item` VALUES (291, '深圳公务员', 100, 138, 13, 18, 6, 100, 3, 300);
INSERT INTO `item` VALUES (292, '国家司法考试', 413, 626, 35, 53, 6, 100, 3, 300);
INSERT INTO `item` VALUES (293, '初级会计职称考试（240×320）', 240, 320, 20, 27, 6, 100, 3, 300);
INSERT INTO `item` VALUES (294, '初级会计职称考试（114×156）', 114, 156, 10, 13, 4, 100, 3, 300);
INSERT INTO `item` VALUES (295, '全国高等教育自学考试', 144, 192, 12, 16, 1, 100, 3, 300);
INSERT INTO `item` VALUES (296, '护士执业资格考试（160×210）', 160, 210, 14, 18, 1, 100, 3, 300);
INSERT INTO `item` VALUES (297, '全国职称计算机考试', 215, 300, 18, 25, 2, 100, 3, 300);
INSERT INTO `item` VALUES (298, '中级会计职称考试（240×320）', 240, 320, 20, 27, 6, 100, 3, 300);
INSERT INTO `item` VALUES (299, '高级会计职称考试', 114, 156, 10, 13, 4, 100, 3, 300);
INSERT INTO `item` VALUES (300, '计算机二级考试（210×280）', 210, 280, 18, 24, 1, 100, 3, 300);
INSERT INTO `item` VALUES (301, '翻译资格等级考试', 215, 300, 18, 25, 5, 100, 3, 300);
INSERT INTO `item` VALUES (302, '护士执业资格考试（130×170）', 130, 170, 11, 14, 4, 100, 3, 300);
INSERT INTO `item` VALUES (303, '武汉大学研究生考试', 150, 200, 13, 17, 6, 100, 3, 300);
INSERT INTO `item` VALUES (304, '江苏会计考试', 300, 420, 25, 36, 3, 100, 3, 300);
INSERT INTO `item` VALUES (305, '计算机考试（350dpi）', 358, 441, 26, 32, 5, 100, 3, 350);
INSERT INTO `item` VALUES (306, '江西国画书法等级考试', 413, 551, 30, 40, 2, 100, 3, 350);
INSERT INTO `item` VALUES (307, '六级口语考试', 130, 160, 11, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (308, '专升本考试', 300, 450, 25, 38, 3, 100, 3, 300);
INSERT INTO `item` VALUES (309, '托业考试', 379, 484, 32, 41, 3, 100, 3, 300);
INSERT INTO `item` VALUES (310, '自主招生考试', 384, 512, 32, 43, 1, 100, 3, 300);
INSERT INTO `item` VALUES (311, '计算机文化考试', 120, 160, 10, 13, 6, 100, 3, 300);
INSERT INTO `item` VALUES (312, 'SAT考试报名（电子版）', 480, 640, 41, 54, 4, 100, 3, 300);
INSERT INTO `item` VALUES (313, '营销师考试报名', 100, 140, 8, 12, 1, 100, 3, 300);
INSERT INTO `item` VALUES (314, '复旦大学研究生考试', 150, 200, 13, 17, 4, 100, 3, 300);
INSERT INTO `item` VALUES (315, '计算机二级考试（300×400）', 300, 400, 25, 34, 3, 100, 3, 300);
INSERT INTO `item` VALUES (316, '注册计量师考试', 215, 300, 18, 25, 4, 100, 3, 300);
INSERT INTO `item` VALUES (317, '护士执业资格考试（120×160）', 120, 160, 10, 13, 6, 100, 3, 300);
INSERT INTO `item` VALUES (318, '护师（全国卫生专业技术资格考试）', 160, 210, 14, 18, 4, 100, 3, 300);
INSERT INTO `item` VALUES (319, '上海中级会计职称考试', 215, 300, 18, 25, 6, 100, 3, 300);
INSERT INTO `item` VALUES (320, '福建教师招聘考试', 300, 400, 25, 34, 5, 100, 3, 300);
INSERT INTO `item` VALUES (321, '中级会计职称考试（114×156）', 114, 156, 10, 13, 2, 100, 3, 300);
INSERT INTO `item` VALUES (322, '江西特岗教师考试', 90, 120, 8, 10, 5, 100, 3, 300);
INSERT INTO `item` VALUES (323, '江西国编教师考试', 90, 120, 8, 10, 1, 100, 3, 300);
INSERT INTO `item` VALUES (324, '初级会计职称考试（215×300）', 215, 300, 18, 25, 3, 100, 3, 300);
INSERT INTO `item` VALUES (325, '2019全国初级会计资格考试（295×413）', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (326, 'BIM考试', 250, 350, 35, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (327, '2019年初级护师考试', 160, 210, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (328, '2019执业医师考试', 354, 472, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (329, '特岗教师', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (330, '教师资格证（180×240）', 180, 240, 15, 20, 3, 100, 3, 300);
INSERT INTO `item` VALUES (331, '中国教师资格证报名', 114, 156, 10, 13, 3, 100, 3, 300);
INSERT INTO `item` VALUES (332, '福建教师资格证', 300, 400, 25, 34, 6, 100, 3, 300);
INSERT INTO `item` VALUES (333, '全国教师管理信息采集（129×160）', 129, 160, 11, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (334, '全国教师管理信息采集（296×367）', 296, 367, 25, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (335, '教师资格证（150×200）', 150, 200, 13, 17, 5, 100, 3, 300);
INSERT INTO `item` VALUES (336, '教师资格证（384×512）', 384, 512, 32, 43, 3, 100, 3, 300);
INSERT INTO `item` VALUES (337, '教师招聘报名', 110, 140, 9, 14, 6, 100, 3, 300);
INSERT INTO `item` VALUES (338, '教师资格证（360×480）', 360, 480, 30, 41, 3, 100, 3, 300);
INSERT INTO `item` VALUES (339, '江西中医药大学医保卡', 171, 238, 14, 20, 3, 100, 3, 300);
INSERT INTO `item` VALUES (340, '校园卡采集', 240, 320, 20, 27, 4, 100, 3, 300);
INSERT INTO `item` VALUES (341, '校园卡', 150, 210, 13, 18, 1, 100, 3, 300);
INSERT INTO `item` VALUES (342, '湖北经济学院校园卡', 240, 320, 20, 27, 1, 100, 3, 300);
INSERT INTO `item` VALUES (343, '上海学籍卡', 272, 354, 23, 30, 5, 100, 3, 300);
INSERT INTO `item` VALUES (344, '青岛浮山路小学学籍卡', 195, 240, 17, 20, 2, 100, 3, 300);
INSERT INTO `item` VALUES (345, '广东岭南职业技术学院学籍卡', 120, 150, 10, 13, 5, 100, 3, 300);
INSERT INTO `item` VALUES (346, '厦门医保卡', 264, 308, 22, 26, 1, 100, 3, 300);
INSERT INTO `item` VALUES (347, '江苏社保卡（无回执，358×441）', 358, 441, 30, 40, 6, 100, 3, 300);
INSERT INTO `item` VALUES (348, '一卡通', 212, 212, 18, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (349, '工作卡', 120, 162, 10, 14, 5, 100, 3, 300);
INSERT INTO `item` VALUES (350, '江苏社保卡（无回执 252×312）', 252, 312, 21, 26, 1, 100, 3, 300);
INSERT INTO `item` VALUES (351, '工作卡（637×672px）', 637, 672, 54, 57, 2, 100, 3, 300);
INSERT INTO `item` VALUES (352, '河南理工大学校园卡电子照', 300, 400, 25, 34, 5, 100, 3, 300);
INSERT INTO `item` VALUES (353, '湖南社保卡', 358, 441, 26, 32, 4, 100, 3, 350);
INSERT INTO `item` VALUES (354, '江苏社保卡', 358, 441, 30, 40, 1, 100, 3, 300);
INSERT INTO `item` VALUES (355, '长春医保卡', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (356, '山西省社会保障卡照片', 358, 441, 30, 40, 3, 100, 3, 300);
INSERT INTO `item` VALUES (357, '泰安社保卡（无回执）', 236, 295, 20, 25, 1, 100, 3, 300);
INSERT INTO `item` VALUES (358, '学籍照片（390×480）', 390, 480, 33, 41, 1, 100, 3, 300);
INSERT INTO `item` VALUES (359, '学籍照片（307×378）', 307, 378, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (360, '职业鉴定照片', 200, 300, 17, 25, 3, 100, 3, 300);
INSERT INTO `item` VALUES (361, '学籍照片（150×200）', 150, 200, 13, 17, 2, 100, 3, 300);
INSERT INTO `item` VALUES (362, '电子护照人像照片', 390, 567, 33, 48, 4, 100, 3, 300);
INSERT INTO `item` VALUES (363, '海外申请护照在线预约照片', 390, 567, 33, 48, 4, 100, 2, 300);
INSERT INTO `item` VALUES (364, '毕业证照片采集（西安交大）', 480, 640, 41, 54, 2, 100, 3, 300);
INSERT INTO `item` VALUES (365, '学籍照片（90×120）', 90, 120, 8, 10, 3, 100, 3, 300);
INSERT INTO `item` VALUES (366, '会计资格证照片', 500, 700, 42, 59, 6, 100, 3, 300);
INSERT INTO `item` VALUES (367, '毕业证照片采集（西南科技大学、西南大学）', 480, 640, 41, 54, 6, 100, 3, 300);
INSERT INTO `item` VALUES (368, '湖北省中小学毕业证照片采集', 600, 800, 44, 58, 4, 100, 3, 350);
INSERT INTO `item` VALUES (369, '单位照片', 188, 259, 16, 22, 1, 100, 3, 300);
INSERT INTO `item` VALUES (370, '记者照片', 388, 480, 33, 41, 6, 100, 3, 300);
INSERT INTO `item` VALUES (371, '学籍照片（300×420）', 300, 420, 25, 36, 3, 100, 3, 300);
INSERT INTO `item` VALUES (372, '广交会照片', 200, 250, 40, 50, 3, 100, 3, 300);
INSERT INTO `item` VALUES (373, '会计从业资格证（114×156，0~10kb）', 114, 156, 10, 13, 6, 100, 3, 300);
INSERT INTO `item` VALUES (374, '湖北会计职业资格证', 114, 156, 10, 13, 1, 100, 3, 300);
INSERT INTO `item` VALUES (375, '会计从业资格证（114×156）', 114, 156, 10, 13, 3, 100, 3, 300);
INSERT INTO `item` VALUES (376, '深圳会计从业资格证', 358, 441, 30, 40, 6, 100, 3, 300);
INSERT INTO `item` VALUES (377, '黑龙江会计上岗证', 120, 160, 10, 13, 3, 100, 3, 300);
INSERT INTO `item` VALUES (378, '河北唐山初级会计助理', 480, 640, 41, 54, 1, 100, 3, 300);
INSERT INTO `item` VALUES (379, '会计征换证', 144, 192, 12, 16, 2, 100, 3, 300);
INSERT INTO `item` VALUES (380, '会计从业资格证（150×200）', 150, 200, 13, 17, 5, 100, 3, 300);
INSERT INTO `item` VALUES (381, '会计从业资格证（150×210）', 150, 210, 13, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (382, '注册会计师证（178×220）', 178, 220, 15, 19, 3, 100, 3, 300);
INSERT INTO `item` VALUES (383, '会计从业资格证（97×130）', 97, 130, 8, 11, 2, 100, 3, 300);
INSERT INTO `item` VALUES (384, '注册会计师证（102×126）', 102, 126, 9, 11, 1, 100, 3, 300);
INSERT INTO `item` VALUES (385, '执业兽医资格证', 230, 334, 20, 29, 3, 100, 3, 300);
INSERT INTO `item` VALUES (386, '人力资源资格证报名', 160, 210, 14, 18, 1, 100, 3, 300);
INSERT INTO `item` VALUES (387, '全国房地产经济从业职业资格证', 215, 300, 18, 25, 3, 100, 3, 300);
INSERT INTO `item` VALUES (388, '保险从业资格证（210*370）', 210, 370, 18, 31, 2, 100, 3, 300);
INSERT INTO `item` VALUES (389, '保险从业资格证（210*270）', 210, 270, 18, 23, 3, 100, 3, 300);
INSERT INTO `item` VALUES (390, '成人自考（400×576）', 400, 576, 34, 49, 2, 100, 3, 300);
INSERT INTO `item` VALUES (391, '成人自考（360×480）', 360, 480, 30, 41, 1, 100, 3, 300);
INSERT INTO `item` VALUES (392, '成人学士学位外语水平联考', 390, 567, 33, 48, 3, 100, 3, 300);
INSERT INTO `item` VALUES (393, '浙江成人自考', 400, 600, 33, 48, 4, 100, 3, 300);
INSERT INTO `item` VALUES (394, '高考报名（545×763）', 545, 763, 46, 65, 1, 100, 3, 300);
INSERT INTO `item` VALUES (395, '小学登记报名', 125, 175, 11, 15, 2, 100, 3, 300);
INSERT INTO `item` VALUES (396, '高考报名（480×640）', 480, 640, 41, 54, 3, 100, 3, 300);
INSERT INTO `item` VALUES (397, '香港城市大学入学报名', 450, 475, 38, 40, 4, 100, 3, 300);
INSERT INTO `item` VALUES (398, '北京师范大学入学报名', 250, 350, 21, 30, 1, 100, 3, 300);
INSERT INTO `item` VALUES (399, '中国农业大学入学报名', 420, 564, 36, 48, 6, 100, 3, 300);
INSERT INTO `item` VALUES (400, '中南财经政法大学入学报名', 180, 240, 15, 20, 6, 100, 3, 300);
INSERT INTO `item` VALUES (401, '香港学生国内报名', 168, 240, 14, 20, 2, 100, 3, 300);
INSERT INTO `item` VALUES (402, '大数据工程师报名', 358, 441, 26, 32, 3, 100, 3, 350);
INSERT INTO `item` VALUES (403, '运城市临猗事业单位报名', 215, 300, 18, 25, 3, 100, 3, 300);
INSERT INTO `item` VALUES (404, '苏州科技大学研究生报名', 150, 200, 13, 17, 4, 100, 3, 300);
INSERT INTO `item` VALUES (405, '广西贺州高考报名', 480, 640, 41, 54, 6, 100, 3, 300);
INSERT INTO `item` VALUES (406, '广西钦州高考报名', 480, 640, 41, 54, 4, 100, 3, 300);
INSERT INTO `item` VALUES (407, '北京地区中央机构报名', 482, 620, 35, 45, 2, 100, 3, 300);
INSERT INTO `item` VALUES (408, '华师大MBA报名', 150, 200, 13, 17, 2, 100, 3, 300);
INSERT INTO `item` VALUES (409, '高考报名（420×560）', 420, 560, 36, 47, 5, 100, 3, 300);
INSERT INTO `item` VALUES (410, '高考报名（192×256）', 192, 256, 16, 22, 2, 100, 3, 300);
INSERT INTO `item` VALUES (411, '大学报名电子照', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (412, '幼升小报名', 272, 354, 23, 30, 3, 100, 3, 300);
INSERT INTO `item` VALUES (413, '人力资源管理师报名', 390, 567, 33, 48, 2, 100, 3, 300);
INSERT INTO `item` VALUES (414, '幼升小报名(350dpi)', 272, 354, 23, 30, 2, 100, 3, 350);
INSERT INTO `item` VALUES (415, '监理工程师（150×210）', 150, 210, 13, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (416, '监理工程师（215×300）', 215, 300, 18, 25, 5, 100, 3, 300);
INSERT INTO `item` VALUES (417, '监理工程师（295×413）', 295, 413, 25, 35, 1, 100, 3, 300);
INSERT INTO `item` VALUES (418, '亳州人民医院报考2017', 300, 400, 25, 34, 3, 100, 3, 300);
INSERT INTO `item` VALUES (419, '学士学位报考', 120, 160, 10, 13, 5, 100, 3, 300);
INSERT INTO `item` VALUES (420, '执法证冲印版', 307, 378, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (421, '身份证（无回执）', 358, 441, 26, 32, 3, 100, 3, 350);
INSERT INTO `item` VALUES (422, '深圳行政执法证', 358, 441, 26, 32, 1, 100, 3, 350);
INSERT INTO `item` VALUES (423, '二级建造师证（215×300）', 215, 300, 18, 25, 2, 100, 3, 300);
INSERT INTO `item` VALUES (424, '二级建造师证（100×140）', 100, 140, 8, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (425, '河南行政执法证', 472, 630, 40, 53, 3, 100, 3, 300);
INSERT INTO `item` VALUES (426, '广东行政执法证', 472, 630, 40, 53, 3, 100, 3, 300);
INSERT INTO `item` VALUES (427, '江西行政执法证', 283, 378, 24, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (428, '全国林业执法证', 260, 390, 22, 33, 4, 100, 3, 300);
INSERT INTO `item` VALUES (429, '辽宁林业执法证', 260, 390, 22, 33, 5, 100, 3, 300);
INSERT INTO `item` VALUES (430, '导游证', 285, 385, 23, 33, 2, 100, 3, 300);
INSERT INTO `item` VALUES (431, '山东导游证', 288, 385, 23, 33, 4, 100, 3, 300);
INSERT INTO `item` VALUES (432, '厦门大学毕业证', 480, 640, 41, 54, 4, 100, 3, 300);
INSERT INTO `item` VALUES (433, '反假证', 150, 210, 13, 18, 6, 100, 3, 300);
INSERT INTO `item` VALUES (434, '医保证（300dpi）', 358, 441, 30, 40, 5, 100, 3, 300);
INSERT INTO `item` VALUES (435, '深圳社保证（小于20KB， 无回执）', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (436, '医保证（350dpi）', 358, 441, 26, 32, 1, 100, 3, 350);
INSERT INTO `item` VALUES (437, '金蝶认证', 358, 441, 26, 32, 4, 100, 3, 350);
INSERT INTO `item` VALUES (438, '警官证', 400, 533, 34, 45, 4, 100, 3, 300);
INSERT INTO `item` VALUES (439, '一级建造师证（电子版）', 472, 630, 40, 53, 6, 100, 3, 300);
INSERT INTO `item` VALUES (440, '一级建造师证（冲印版）', 401, 531, 34, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (441, '二级建造师证（电子版）', 126, 168, 11, 14, 3, 100, 3, 300);
INSERT INTO `item` VALUES (442, '党员证', 400, 600, 34, 51, 4, 100, 3, 300);
INSERT INTO `item` VALUES (443, '秘书证', 160, 240, 14, 20, 5, 100, 3, 300);
INSERT INTO `item` VALUES (444, '团员证', 254, 372, 22, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (445, '高中毕业证', 272, 354, 23, 30, 2, 100, 3, 300);
INSERT INTO `item` VALUES (446, '陕西二级建造师证', 455, 661, 39, 56, 4, 100, 3, 300);
INSERT INTO `item` VALUES (447, '社保证（350dpi， 无回执，15~35kb）', 358, 441, 26, 32, 3, 100, 3, 350);
INSERT INTO `item` VALUES (448, '计算机三级', 240, 320, 20, 27, 3, 100, 3, 300);
INSERT INTO `item` VALUES (449, '电子导游证', 413, 626, 35, 49, 5, 100, 3, 300);
INSERT INTO `item` VALUES (450, '深圳社保证（大于140KB， 无回执）', 358, 441, 26, 32, 4, 100, 3, 350);
INSERT INTO `item` VALUES (451, '湖北社保证', 358, 441, 26, 32, 2, 100, 3, 350);
INSERT INTO `item` VALUES (452, '江西社保证', 358, 441, 26, 32, 5, 100, 3, 350);
INSERT INTO `item` VALUES (453, '上海电子学生证', 272, 354, 23, 30, 1, 100, 3, 300);
INSERT INTO `item` VALUES (454, '人民警察证', 400, 533, 33, 45, 1, 100, 3, 300);
INSERT INTO `item` VALUES (455, '甘肃社保证', 358, 441, 26, 32, 2, 100, 3, 350);
INSERT INTO `item` VALUES (456, '二级建造师证（295×413）', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (457, '二级建造师证（220×300）', 220, 300, 18, 25, 2, 100, 3, 300);
INSERT INTO `item` VALUES (458, '义工证', 390, 567, 33, 48, 5, 100, 3, 300);
INSERT INTO `item` VALUES (459, '进博会证照', 400, 600, 34, 51, 1, 100, 3, 300);
INSERT INTO `item` VALUES (460, '居住证', 358, 441, 26, 32, 6, 100, 3, 350);
INSERT INTO `item` VALUES (461, '大学个人档案', 160, 160, 14, 14, 2, 100, 3, 300);
INSERT INTO `item` VALUES (462, '闽南师范大学', 600, 800, 51, 68, 6, 100, 3, 300);
INSERT INTO `item` VALUES (463, '云南师范大学文理学院', 144, 214, 12, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (464, '大学生图像信息采集', 480, 640, 41, 54, 2, 100, 3, 300);
INSERT INTO `item` VALUES (465, '大学生信息采集', 540, 720, 46, 61, 3, 100, 3, 300);
INSERT INTO `item` VALUES (466, '大学生入党统计表（天津商业大学）', 378, 496, 32, 42, 1, 100, 3, 300);
INSERT INTO `item` VALUES (467, '重庆西南大学自考', 480, 640, 41, 54, 3, 100, 3, 300);
INSERT INTO `item` VALUES (468, '莱芜职业技术学院学籍照', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (469, '香港特別行政區護照', 472, 590, 40, 50, 2, 100, 3, 300);
INSERT INTO `item` VALUES (470, '相片采集照', 480, 640, 41, 54, 3, 100, 3, 300);
INSERT INTO `item` VALUES (471, '滕州市社保照', 358, 441, 30, 40, 2, 100, 3, 300);
INSERT INTO `item` VALUES (472, '山西省社保照', 358, 441, 26, 32, 5, 100, 3, 350);
INSERT INTO `item` VALUES (473, '河南社保照', 358, 441, 30, 40, 1, 100, 3, 300);
INSERT INTO `item` VALUES (474, '全国房地产经济从业职业资格证', 215, 300, 18, 25, 6, 100, 3, 300);
INSERT INTO `item` VALUES (475, '电子医生注册', 354, 472, 30, 40, 3, 100, 3, 300);
INSERT INTO `item` VALUES (476, '护士电子化注册', 354, 472, 30, 40, 4, 100, 3, 300);
INSERT INTO `item` VALUES (477, '康复治疗师考试（一寸）	', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (478, '保健按摩师', 118, 146, 10, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (479, '摄影师', 118, 146, 10, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (480, '二级建造师（160×180）', 160, 180, 14, 15, 2, 100, 3, 300);
INSERT INTO `item` VALUES (481, '金融服务师', 100, 140, 8, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (482, '执业医师注册', 385, 441, 33, 40, 3, 100, 3, 300);
INSERT INTO `item` VALUES (483, '二级建造师（160×200）', 160, 200, 14, 18, 3, 100, 3, 300);
INSERT INTO `item` VALUES (484, '主管护师（160×210）', 160, 210, 14, 18, 1, 100, 3, 300);
INSERT INTO `item` VALUES (485, '陕西省二级建造师', 455, 661, 39, 56, 2, 100, 3, 300);
INSERT INTO `item` VALUES (486, '主治医师', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (487, '川北医学院自考本科', 360, 480, 30, 41, 4, 100, 3, 300);
INSERT INTO `item` VALUES (488, '学校自考', 480, 640, 41, 54, 4, 100, 3, 300);
INSERT INTO `item` VALUES (489, '四川自考', 360, 480, 30, 41, 1, 100, 3, 300);
INSERT INTO `item` VALUES (490, '上海自考', 480, 720, 41, 61, 3, 100, 3, 300);
INSERT INTO `item` VALUES (491, '北京自考', 400, 576, 33, 48, 2, 100, 3, 300);
INSERT INTO `item` VALUES (492, '河北自考', 390, 567, 33, 48, 1, 100, 3, 300);
INSERT INTO `item` VALUES (493, '新疆自考', 300, 400, 25, 34, 2, 100, 3, 300);
INSERT INTO `item` VALUES (494, '安徽自考', 144, 192, 12, 16, 3, 100, 3, 300);
INSERT INTO `item` VALUES (495, '山东自考', 240, 320, 20, 27, 2, 100, 3, 300);
INSERT INTO `item` VALUES (496, '广州市考', 70, 100, 6, 8, 6, 100, 3, 300);
INSERT INTO `item` VALUES (497, '福建自考', 360, 480, 30, 41, 2, 100, 3, 300);
INSERT INTO `item` VALUES (498, '软考', 295, 413, 25, 35, 6, 100, 3, 300);
INSERT INTO `item` VALUES (499, '三寸', 649, 991, 55, 84, 1, 100, 1, 300);
INSERT INTO `item` VALUES (500, '五寸', 1050, 1499, 89, 127, 6, 100, 1, 300);
INSERT INTO `item` VALUES (501, '四寸', 898, 1205, 76, 102, 3, 100, 1, 300);
INSERT INTO `item` VALUES (502, '重庆选调生', 200, 260, 17, 22, 1, 100, 3, 300);
INSERT INTO `item` VALUES (503, '小学新生学籍', 300, 420, 25, 36, 3, 100, 3, 300);
INSERT INTO `item` VALUES (504, '毕业生图像信息采集（20~40kb）', 480, 640, 41, 54, 5, 100, 3, 300);
INSERT INTO `item` VALUES (505, '毕业生图像信息采集', 480, 640, 41, 54, 5, 100, 3, 300);
INSERT INTO `item` VALUES (506, '研究生（27×36mm）', 318, 425, 27, 36, 1, 100, 3, 300);
INSERT INTO `item` VALUES (507, '普通话水平测试（144×192）', 144, 192, 12, 16, 4, 100, 3, 300);
INSERT INTO `item` VALUES (508, '普通话水平测试（144×172）', 144, 172, 12, 15, 5, 100, 3, 300);
INSERT INTO `item` VALUES (509, '结婚照', 626, 413, 53, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (510, '三支一扶', 130, 160, 11, 14, 1, 100, 3, 300);
INSERT INTO `item` VALUES (511, '日本签证（二寸）上海&成都', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (512, '日本签证上海&北京&广州', 531, 531, 45, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (513, '中高级口译', 413, 626, 35, 53, 5, 100, 3, 300);
INSERT INTO `item` VALUES (514, '社保证（无回执）', 236, 295, 20, 25, 2, 100, 3, 300);
INSERT INTO `item` VALUES (515, '全民健身操舞', 236, 295, 20, 25, 6, 100, 3, 300);
INSERT INTO `item` VALUES (516, '营养配餐员', 236, 295, 20, 25, 4, 100, 3, 300);
INSERT INTO `item` VALUES (517, '制图员（大一寸，350dpi）', 455, 661, 33, 661, 4, 100, 3, 350);
INSERT INTO `item` VALUES (518, '计算机中级操作员', 455, 661, 33, 48, 2, 100, 3, 350);
INSERT INTO `item` VALUES (519, '高速公路管理局', 126, 168, 11, 14, 1, 100, 3, 300);
INSERT INTO `item` VALUES (520, '单招', 260, 390, 22, 33, 5, 100, 3, 300);
INSERT INTO `item` VALUES (521, '事业单位招聘', 120, 160, 10, 13, 5, 100, 3, 300);
INSERT INTO `item` VALUES (522, '出入境申请表', 360, 480, 30, 41, 3, 100, 2, 300);
INSERT INTO `item` VALUES (523, '社保证（350dpi）', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (524, '国企单位存档', 85, 120, 7, 10, 6, 100, 3, 300);
INSERT INTO `item` VALUES (525, '上海专升本', 390, 556, 33, 47, 2, 100, 3, 300);
INSERT INTO `item` VALUES (526, '缅甸签证（上海广州成都）', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (527, '缅甸签证(北京)', 448, 637, 38, 54, 3, 100, 2, 300);
INSERT INTO `item` VALUES (528, '墨西哥签证（北京）', 366, 460, 31, 39, 6, 100, 2, 300);
INSERT INTO `item` VALUES (529, '肯尼亚签证（北京）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (530, '入台证（大一寸）', 389, 566, 33, 48, 1, 100, 2, 300);
INSERT INTO `item` VALUES (531, '冰岛签证（北京）', 472, 590, 40, 50, 2, 100, 2, 300);
INSERT INTO `item` VALUES (532, '冰岛签证（上海广州）', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (533, '黎巴嫩签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (534, '约旦签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (535, '阿曼签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (536, '伊拉克签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (537, '土库曼斯坦签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (538, '亚美尼亚签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (539, '阿富汗签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (540, '也门签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (541, '叙利亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (542, '巴布亚新几内亚签证', 472, 590, 40, 50, 1, 100, 2, 300);
INSERT INTO `item` VALUES (543, '坦桑尼亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (544, '加纳签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (545, '利比亚签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (546, '阿尔及利亚签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (547, '多哥签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (548, '刚果民主共和国签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (549, '莫桑比克签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (550, '津巴布韦签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (551, '科特迪瓦签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (552, '刚果共和国签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (553, '塞拉利昂签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (554, '布隆迪签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (555, '博茨瓦纳签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (556, '塞内加尔签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (557, '索马里签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (558, '厄立特里亚签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (559, '布基纳法索签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (560, '吉布提签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (561, '贝宁签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (562, '马拉维签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (563, '卢旺达签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (564, '乍得签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (565, '几内亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (566, '冈比亚签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (567, '尼日尔签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (568, '利比里亚签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (569, '莱索托签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (570, '中非签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (571, '佛得角签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (572, '几内亚比绍签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (573, '北苏丹签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (574, '埃塞俄比亚签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (575, '赤道几内亚签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (576, '安哥拉签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (577, '马其顿签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (578, '亚美尼亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (579, '摩尔多瓦签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (580, '白俄罗斯签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (581, '保加利亚签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (582, '阿塞拜疆签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (583, '塞浦路斯签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (584, '大溪地签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (585, '摩纳哥签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (586, '爱沙尼亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (587, '拉脱维亚签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (588, '斯洛文尼亚签证', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (589, '阿尔巴尼亚签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (590, '秘鲁签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (591, '哥伦比亚签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (592, '乌拉圭签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (593, '特立尼达和多巴哥签证', 413, 531, 35, 45, 2, 100, 2, 300);
INSERT INTO `item` VALUES (594, '哥斯达黎加签证', 413, 531, 35, 45, 6, 100, 2, 300);
INSERT INTO `item` VALUES (595, '圭亚那签证', 413, 531, 35, 45, 4, 100, 2, 300);
INSERT INTO `item` VALUES (596, '苏里南签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (597, '乌干达签证', 413, 531, 35, 45, 1, 100, 2, 300);
INSERT INTO `item` VALUES (598, '南苏丹签证', 413, 531, 35, 45, 3, 100, 2, 300);
INSERT INTO `item` VALUES (599, '法国签证(柏思睿)', 413, 531, 35, 45, 5, 100, 2, 300);
INSERT INTO `item` VALUES (600, '实名证件照', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (601, '贵州社保卡', 358, 441, 23, 28, 3, 100, 3, 300);
INSERT INTO `item` VALUES (602, '出入境证件', 354, 472, 30, 40, 4, 100, 2, 300);
INSERT INTO `item` VALUES (603, '杭州社保证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (604, '贵州人和一寸正面免冠', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (605, '挪威签证（小二寸）北京', 472, 590, 40, 50, 6, 100, 2, 300);
INSERT INTO `item` VALUES (606, '以色列签证（二英寸）成都北京', 590, 590, 50, 50, 6, 100, 2, 300);
INSERT INTO `item` VALUES (607, '上海义务教育入学', 272, 354, 20, 27, 5, 100, 3, 350);
INSERT INTO `item` VALUES (608, '中小学生教师资格证', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (609, '个别奖学金申请', 126, 160, 11, 14, 4, 100, 3, 300);
INSERT INTO `item` VALUES (610, '微信头像', 300, 300, 25, 25, 3, 100, 3, 300);
INSERT INTO `item` VALUES (611, '中药调剂员', 118, 146, 10, 12, 3, 100, 3, 300);
INSERT INTO `item` VALUES (612, '微商注册', 140, 140, 12, 12, 5, 100, 3, 300);
INSERT INTO `item` VALUES (613, '湖南离婚证', 413, 531, 35, 45, 5, 100, 3, 300);
INSERT INTO `item` VALUES (614, '湖南流动人口婚育证', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (615, '湖南生育证', 413, 579, 35, 49, 2, 100, 3, 300);
INSERT INTO `item` VALUES (616, '湖南老年人优待证', 295, 413, 25, 35, 5, 100, 3, 300);
INSERT INTO `item` VALUES (617, '湖南二级建造师', 413, 579, 35, 49, 6, 100, 3, 300);
INSERT INTO `item` VALUES (618, '湖南一级建造师', 295, 413, 25, 35, 4, 100, 3, 300);
INSERT INTO `item` VALUES (619, '湖南导游证', 295, 413, 25, 35, 2, 100, 3, 300);
INSERT INTO `item` VALUES (620, '湖南教师资格证', 354, 472, 30, 40, 2, 100, 3, 300);
INSERT INTO `item` VALUES (621, '湖南研究生考试', 425, 567, 36, 48, 4, 100, 3, 300);
INSERT INTO `item` VALUES (622, '广东驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (623, '内初版考试', 140, 186, 12, 15, 3, 100, 3, 300);
INSERT INTO `item` VALUES (624, '港澳通行证', 390, 567, 33, 48, 1, 100, 2, 300);
INSERT INTO `item` VALUES (625, '贵州省身份证', 358, 441, 26, 32, 1, 100, 3, 350);
INSERT INTO `item` VALUES (626, '贵阳市社保证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (627, '广州市保安证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (628, '深圳市保安证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (629, '东莞市保安证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (630, '珠海市保安证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (631, '汕头市保安证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (632, '佛山市保安证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (633, '江门市保安证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (634, '湛江市保安证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (635, '茂名市保安证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (636, '肇庆市保安证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (637, '惠州市保安证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (638, '梅州市保安证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (639, '汕尾市保安证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (640, '河源市保安证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (641, '阳江市保安证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (642, '清远市保安证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (643, '韶关市保安证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (644, '中山市保安证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (645, '潮州市保安证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (646, '揭阳市保安证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (647, '云浮市保安证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (648, '广州市社保证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (649, '深圳市社保证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (650, '东莞市社保证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (651, '珠海市社保证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (652, '汕头市社保证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (653, '佛山市社保证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (654, '江门市社保证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (655, '湛江市社保证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (656, '茂名市社保证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (657, '肇庆市社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (658, '惠州市社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (659, '梅州市社保证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (660, '汕尾市社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (661, '河源市社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (662, '阳江市社保证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (663, '清远市社保证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (664, '韶关市社保证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (665, '中山市社保证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (666, '潮州市社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (667, '揭阳市社保证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (668, '云浮市社保证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (669, '广州市身份证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (670, '深圳市身份证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (671, '东莞市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (672, '珠海市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (673, '汕头市身份证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (674, '佛山市身份证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (675, '江门市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (676, '湛江市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (677, '茂名市身份证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (678, '肇庆市身份证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (679, '惠州市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (680, '梅州市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (681, '汕尾市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (682, '河源市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (683, '阳江市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (684, '清远市身份证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (685, '韶关市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (686, '中山市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (687, '潮州市身份证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (688, '揭阳市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (689, '云浮市身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (690, '广州市居住证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (691, '深圳市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (692, '东莞市居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (693, '珠海市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (694, '汕头市居住证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (695, '佛山市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (696, '江门市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (697, '湛江市居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (698, '茂名市居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (699, '肇庆市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (700, '惠州市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (701, '汕尾市居住证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (702, '河源市居住证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (703, '阳江市居住证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (704, '清远市居住证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (705, '韶关市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (706, '中山市居住证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (707, '潮州市居住证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (708, '揭阳市居住证', 358, 441, 26, 32, 2, 100, 3, 300);
INSERT INTO `item` VALUES (709, '云浮市居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (710, '梅州市居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (711, '广东保安证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (712, '广东社保证', 358, 441, 26, 32, 6, 100, 3, 300);
INSERT INTO `item` VALUES (713, '广东身份证', 358, 441, 26, 32, 1, 100, 3, 300);
INSERT INTO `item` VALUES (714, '广东居住证', 358, 441, 26, 32, 5, 100, 3, 300);
INSERT INTO `item` VALUES (715, '广州市驾驶证', 413, 579, 35, 49, 5, 100, 3, 500);
INSERT INTO `item` VALUES (716, '深圳市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (717, '东莞市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (718, '珠海市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (719, '汕头市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (720, '佛山市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (721, '江门市驾驶证', 413, 579, 35, 49, 5, 100, 3, 500);
INSERT INTO `item` VALUES (722, '湛江市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (723, '茂名市驾驶证', 413, 579, 35, 49, 3, 100, 3, 500);
INSERT INTO `item` VALUES (724, '肇庆市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (725, '惠州市驾驶证', 413, 579, 35, 49, 5, 100, 3, 500);
INSERT INTO `item` VALUES (726, '梅州市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (727, '汕尾市驾驶证', 413, 579, 35, 49, 6, 100, 3, 500);
INSERT INTO `item` VALUES (728, '河源市驾驶证', 413, 579, 35, 49, 3, 100, 3, 500);
INSERT INTO `item` VALUES (729, '阳江市驾驶证', 413, 579, 35, 49, 3, 100, 3, 500);
INSERT INTO `item` VALUES (730, '清远市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (731, '韶关市驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (732, '中山市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (733, '潮州市驾驶证', 413, 579, 35, 49, 5, 100, 3, 500);
INSERT INTO `item` VALUES (734, '揭阳市驾驶证', 413, 579, 35, 49, 5, 100, 3, 500);
INSERT INTO `item` VALUES (735, '云浮市驾驶证', 413, 579, 35, 49, 1, 100, 3, 500);
INSERT INTO `item` VALUES (736, '贵州驾驶证', 413, 579, 35, 49, 4, 100, 3, 500);
INSERT INTO `item` VALUES (737, '贵州小学生学籍照', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (738, '湖北行政执法证', 400, 460, 34, 39, 6, 100, 3, 300);
INSERT INTO `item` VALUES (739, '退役军人优待证', 352, 440, 30, 37, 1, 100, 3, 300);
INSERT INTO `item` VALUES (740, '12123电子驾驶证、驾照图像采集', 520, 756, 44, 64, 5, 100, 3, 300);
INSERT INTO `item` VALUES (741, '残疾人证', 358, 441, 26, 32, 2, 100, 3, 350);
INSERT INTO `item` VALUES (742, '志愿者证', 358, 440, 26, 32, 2, 100, 3, 350);
INSERT INTO `item` VALUES (743, '成都驾驶证', 260, 378, 22, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (744, '深圳市会计人员相片采集', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (745, '深圳市网约车驾驶员数码照片', 455, 661, 33, 48, 6, 100, 3, 350);
INSERT INTO `item` VALUES (746, '行政执法证', 469, 537, 34, 39, 1, 100, 3, 350);
INSERT INTO `item` VALUES (747, '职业形象照一寸', 295, 413, 25, 35, 5, 100, 0, 300);
INSERT INTO `item` VALUES (748, '职业形象照二寸', 413, 579, 35, 49, 5, 100, 0, 300);
INSERT INTO `item` VALUES (749, '职业形象照三寸', 649, 991, 55, 84, 3, 100, 0, 300);
INSERT INTO `item` VALUES (750, '职业形象照五寸', 1050, 1499, 89, 127, 1, 100, 0, 300);
INSERT INTO `item` VALUES (751, '职业形象照六寸', 1205, 1795, 102, 152, 4, 100, 0, 300);
INSERT INTO `item` VALUES (752, '湖南成人高考报名', 480, 640, 41, 54, 2, 100, 3, 300);
INSERT INTO `item` VALUES (753, '湖南成人高考报名（240×320）', 240, 320, 20, 27, 2, 100, 3, 300);
INSERT INTO `item` VALUES (754, '海南身份证', 358, 441, 26, 32, 3, 100, 3, 300);
INSERT INTO `item` VALUES (755, '安徽身份证', 358, 441, 26, 32, 4, 100, 3, 300);
INSERT INTO `item` VALUES (756, '深圳港澳通行证', 390, 567, 33, 48, 3, 100, 2, 300);
INSERT INTO `item` VALUES (757, '湖南教师资格证', 307, 437, 26, 37, 4, 100, 3, 300);
INSERT INTO `item` VALUES (758, '海员证', 354, 472, 30, 40, 3, 100, 2, 300);

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '用户保存记录表',
                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
                          `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格名字',
                          `o_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原图，隐私考虑暂不启用',
                          `n_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '保存图',
                          `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '尺寸',
                          `is_deleted` int NULL DEFAULT 0 COMMENT '是否删除,0-未删除，1-已删除',
                          `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for photo_record
-- ----------------------------
DROP TABLE IF EXISTS `photo_record`;
CREATE TABLE `photo_record`  (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '用户行为记录',
                                 `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名字',
                                 `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
                                 `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                            `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者名称',
                            `owner_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者手机号',
                            `owner_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者主体名称',
                            `owner_company_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者主体社会信用代码',
                            `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用名称',
                            `app_type` int NULL DEFAULT NULL COMMENT '应用类型：1-手动新增，2-微信公众号,3-微信小程序',
                            `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用id',
                            `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用密钥',
                            `tenant_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户编号',
                            `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES (1, NULL, NULL, NULL, NULL, '大师兄百宝盒', 3, '1', '1', NULL, NULL, NULL);
INSERT INTO `sys_app` VALUES (2, NULL, NULL, NULL, NULL, '大师兄百宝盒h5', 2, '1', '1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` int NOT NULL AUTO_INCREMENT COMMENT '用户表id',
                         `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'openid',
                         `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名字',
                         `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
                         `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for web_set
-- ----------------------------
DROP TABLE IF EXISTS `web_set`;
CREATE TABLE `web_set`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '应用设置表',
                            `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小程序appid',
                            `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小程序AppSecret',
                            `download_one` int NULL DEFAULT 1 COMMENT '1免费下载，2看广告下载',
                            `download_two` int NULL DEFAULT 1 COMMENT '1免费下载，2看广告下载',
                            `safety_api` int NULL DEFAULT 1 COMMENT '是否开启鉴黄：1关闭，2开启',
                            `video_unit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '广告位id',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_set
-- ----------------------------
INSERT INTO `web_set` VALUES (1, NULL, NULL, 1, 1, 2, NULL);

-- ----------------------------
-- Table structure for wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user`  (
                                `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联用户ID',
                                `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'openid',
                                `unionid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'unionid',
                                `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '哪个公众号',
                                `app_type` int NULL DEFAULT NULL COMMENT '应用类型：1-手动新增，2-微信公众号,3-微信小程序',
                                `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
                                `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
                                `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `index_user_id`(`user_id` ASC) USING BTREE,
                                INDEX `index_unionid`(`unionid` ASC) USING BTREE,
                                INDEX `index_openid`(`openid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '多微信公众号表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
