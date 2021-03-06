-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;



DROP TABLE IF EXISTS `receipt_model`;
CREATE TABLE `receipt_model` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关id',
  `info` varchar(255) NOT NULL COMMENT '模版信息',
  `model_index` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模版编号',
  `title` varchar(50) NOT NULL COMMENT '模版标题',
  `height` int(10) unsigned zerofill NOT NULL COMMENT '模版长',
  `width` int(10) unsigned zerofill NOT NULL COMMENT '模版宽',
  `file_fomat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '输入文件格式',
  `feature_file_path` varchar(255) DEFAULT NULL COMMENT '切割出来的模版特征识别块存储位置',
  `file_path` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `status` int(2) unsigned zerofill NOT NULL COMMENT '可用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `model_index` (`model_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `receipt_model` (`id`, `info`, `model_index`, `title`, `height`, `width`, `file_fomat`, `feature_file_path`, `file_path`, `create_time`, `create_user`, `update_time`, `update_user`, `status`) VALUES
(6,	'',	'存款账户开户申请书',	'存款账户开户申请书',	0000001415,	0000001000,	'',	'/home/liang/Desktop/Img/ca03e289-4f0e-41c2-9468-f7c402c81ce5.feature.png',	'/home/liang/Desktop/Img/ca03e289-4f0e-41c2-9468-f7c402c81ce5',	'2020-09-28 13:12:19',	'14',	'2020-09-28 13:12:19',	'14',	01),
(30,	'',	'营业执照',	'营业执照',	0000001387,	0000001000,	'',	'',	'/home/dliang/Desktop/Img/fa679fc2-d8c9-4999-ac3b-dc9bdccf5786',	'2020-08-11 17:50:03',	'10',	'2020-08-11 17:50:03',	'10',	01),
(45,	'',	'统一社会信用代码',	'统一社会信用代码',	0000000722,	0000001000,	'',	'',	'/home/dliang/Desktop/Img/ad567f09-a6e7-42df-b7f2-3c18cd06208e',	'2020-08-21 11:55:55',	'4',	'2020-08-21 11:55:55',	'4',	01),
(54,	'',	'实际受益所有人声明书',	'实际受益所有人声明书',	0000000707,	0000001000,	'',	'',	'/home/dliang/Desktop/Img/21c8e171-8c1a-4ef2-afa0-b7d7abbafbe8',	'2020-08-21 15:51:10',	'4',	'2020-08-21 15:51:10',	'4',	01),
(56,	'',	'办理银行结算账户事项委托书',	'办理银行结算账户事项委托书',	0000001414,	0000001000,	'',	'',	'/home/dliang/Desktop/Img/e6ccc5b6-3296-4e46-a746-361fcc1024af',	'2020-08-25 18:16:11',	'10',	'2020-08-25 18:16:11',	'10',	01),
(59,	'',	'基本存款账户信息',	'基本存款账户信息',	0000001368,	0000001000,	'',	'',	'/home/dliang/Desktop/Img/7eaf6d62-82f5-4d8b-8a85-acd01ff29bb0',	'2020-08-26 11:27:58',	'3',	'2020-08-26 11:27:58',	'3',	01);

DROP TABLE IF EXISTS `receipt_model_piece`;
CREATE TABLE `receipt_model_piece` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '业务无关id',
  `piece_index` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '碎片编号',
  `model_index` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模版编号',
  `info` varchar(50) NOT NULL COMMENT '碎片名称',
  `page` int NOT NULL COMMENT '页数',
  `x1` int NOT NULL COMMENT '坐标',
  `y1` int NOT NULL,
  `x2` int NOT NULL,
  `y2` int NOT NULL,
  `weight` int NOT NULL,
  `height` int NOT NULL,
  `engine_type` int NOT NULL COMMENT 'titel:''识别引擎'',source:[{value:1,text:''印刷体识别''},{value:2,text:''模版特征识别''},{value:3,text:''手写字符识别''},{value:4,text:''语音识别''},{value:5,text:''复选框识别''}]',
  `mapping` varchar(255) NOT NULL DEFAULT '0' COMMENT '碎片映射',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建用户',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) NOT NULL COMMENT '更新用户',
  `status` int NOT NULL COMMENT '可用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `piece_index` (`piece_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `receipt_model_piece` (`id`, `piece_index`, `model_index`, `info`, `page`, `x1`, `y1`, `x2`, `y2`, `weight`, `height`, `engine_type`, `mapping`, `create_time`, `create_user`, `update_time`, `update_user`, `status`) VALUES
(79,	'5a717d69-dcac-4236-b311-aa6c275d69c5',	'存款账户开户申请书',	'title',	0,	600,	83,	879,	119,	229,	36,	2,	'0',	'2020-10-08 05:49:35',	'user',	'2020-10-08 05:49:35',	'password',	1),
(80,	'90b69666-0d69-4444-87dd-102c6712fc0a',	'存款账户开户申请书',	'CHNname',	0,	208,	133,	513,	157,	305,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(82,	'e2ad0035-549d-48b8-9001-780de384a9ed',	'存款账户开户申请书',	'ENGname',	0,	539,	131,	932,	154,	393,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(83,	'54164558-95d3-4496-bf16-4167fafdd80a',	'存款账户开户申请书',	'Loc1',	0,	204,	161,	631,	183,	427,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(84,	'74058e10-ea79-4b17-ad1a-39f7a0164c0d',	'存款账户开户申请书',	'Email',	0,	821,	158,	949,	181,	128,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(85,	'fed23da3-7172-401c-a34b-40af720105aa',	'存款账户开户申请书',	'Loc2',	0,	204,	188,	632,	210,	428,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(86,	'c387cda7-3b3f-4986-a912-5724b4b81114',	'存款账户开户申请书',	'Post',	0,	821,	185,	947,	208,	126,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(87,	'4cceb858-9ec6-477b-8a7f-ddd5a9ba9ceb',	'存款账户开户申请书',	'Orgtype',	0,	470,	213,	576,	230,	106,	17,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(88,	'24473572-2b16-45e6-9138-ce43bfb33ae6',	'存款账户开户申请书',	'Locode',	0,	821,	212,	944,	233,	123,	21,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(89,	'795e0371-d0db-447c-bcfb-71a633237f17',	'存款账户开户申请书',	'Orgcode',	0,	539,	241,	670,	263,	131,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(90,	'ff7c3b15-0422-42cf-ac1a-46d27e16a69e',	'存款账户开户申请书',	'Fax',	0,	821,	238,	944,	262,	123,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(91,	'125eb120-a29a-4e84-8153-38e5184d5e6b',	'存款账户开户申请书',	'Mng1name',	0,	309,	269,	390,	293,	81,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(92,	'5e6b6ff5-0be3-4357-8893-0e32ea831209',	'存款账户开户申请书',	'Mng1cell',	0,	541,	268,	670,	292,	129,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(93,	'5b90a0d0-d7aa-41fd-b588-c1b60186f99a',	'存款账户开户申请书',	'Mng1lic',	0,	822,	267,	948,	288,	126,	21,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(94,	'54529408-4550-4afc-be21-6fb44dce6646',	'存款账户开户申请书',	'Mng2name',	0,	310,	298,	390,	322,	80,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(95,	'612bb471-4d20-450d-a831-3341501a6075',	'存款账户开户申请书',	'Mng2lic',	0,	541,	297,	672,	320,	131,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(96,	'ac4067f3-39cf-4fa3-b7f1-3e2b2613655c',	'存款账户开户申请书',	'Mng2lim',	0,	822,	295,	950,	319,	128,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(97,	'1e61a8dc-08d7-459a-91d1-379742f7d3df',	'存款账户开户申请书',	'Mng3name',	0,	310,	327,	390,	350,	80,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(98,	'edf001d4-8f1f-47f2-9d74-ed2641d7e3e2',	'存款账户开户申请书',	'Mng3lic',	0,	540,	325,	672,	349,	132,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(99,	'188c51ab-d7a8-44f2-9b2e-b31ce11c7eab',	'存款账户开户申请书',	'Mng3lim',	0,	821,	324,	950,	348,	129,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(100,	'59c4145f-43d9-44e4-89bd-5d29e231fc54',	'存款账户开户申请书',	'Mng4name',	0,	310,	355,	388,	378,	78,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(101,	'a377b511-f79d-4871-b4a8-b8a3b2f48ab9',	'存款账户开户申请书',	'Mng4cell',	0,	540,	354,	671,	376,	131,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(102,	'e54952a1-e347-4bd8-a3c0-251e771891f4',	'存款账户开户申请书',	'Mng4lic',	0,	821,	352,	950,	376,	129,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(103,	'4403a149-d7dd-4f82-8894-758bb3692888',	'存款账户开户申请书',	'Con1name',	0,	310,	382,	390,	405,	80,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(104,	'87db059a-e5e7-4bf2-9cad-100248b0854e',	'存款账户开户申请书',	'Con1phone',	0,	541,	380,	670,	404,	129,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(105,	'a7cb365e-5554-43b2-9112-39f6c8bfe4a6',	'存款账户开户申请书',	'Con1cell',	0,	821,	379,	946,	403,	125,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(106,	'0993d1bc-8c5f-49d3-bb68-db5ad48547d3',	'存款账户开户申请书',	'Con2name',	0,	311,	410,	391,	432,	80,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(107,	'dd68ca2d-8d0d-4df1-9606-dfec933192d3',	'存款账户开户申请书',	'Con2phone',	0,	542,	408,	668,	431,	126,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(108,	'757ca41e-cb58-4db0-a9a6-cad892943b82',	'存款账户开户申请书',	'Con2cell',	0,	821,	408,	945,	429,	124,	21,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(109,	'ae6e1518-eec0-4022-91b4-df3f3a2438f2',	'存款账户开户申请书',	'Con3name',	0,	311,	436,	390,	459,	79,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(110,	'01dc9041-0d97-4c79-9e2f-a947ec0ce9cf',	'存款账户开户申请书',	'Con3phone',	0,	541,	435,	670,	458,	129,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(111,	'6d3f4ebb-1123-44e5-adae-4a77a15450b4',	'存款账户开户申请书',	'Con3cell',	0,	822,	434,	945,	456,	123,	22,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(112,	'4f2dd960-c112-4bad-a952-e428f941bce1',	'存款账户开户申请书',	'Staff',	0,	821,	461,	943,	484,	122,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(113,	'bc7a9018-8d40-432f-9c7a-42024b5f4f88',	'存款账户开户申请书',	'Sales',	0,	820,	488,	940,	512,	120,	24,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(114,	'90931b9a-a56e-4834-8ea6-ce997f8f3e97',	'存款账户开户申请书',	'Cap1type',	0,	251,	520,	319,	543,	68,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(115,	'50612b79-9593-48c6-81e7-4a9d2f9b3c1b',	'存款账户开户申请书',	'Cap1amt',	0,	410,	518,	564,	544,	154,	26,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(116,	'f01de4e2-3710-473d-bf74-68f9fdda0356',	'存款账户开户申请书',	'Cap2type',	0,	248,	550,	324,	576,	76,	26,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(117,	'14560600-a5c8-4cd6-980f-e319a13a36b8',	'存款账户开户申请书',	'Cap2amt',	0,	409,	549,	564,	575,	155,	26,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(118,	'05e5d3b4-0637-4730-8c8e-c256834fcce2',	'存款账户开户申请书',	'Assets',	0,	821,	517,	940,	542,	119,	25,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(119,	'ea6395d1-e956-41c9-b0ed-80d05f8cf173',	'存款账户开户申请书',	'Netast',	0,	821,	547,	942,	574,	121,	27,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(120,	'da49639b-2302-489a-8aeb-3d9a5f5b47f9',	'存款账户开户申请书',	'Comprod',	0,	207,	581,	953,	602,	746,	21,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(121,	'd7728a96-7ed4-4334-9f90-aa9e23e787f0',	'存款账户开户申请书',	'Lictype',	0,	206,	609,	358,	630,	152,	21,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(122,	'cfab4b53-1b7d-4d21-b22a-8e947bd912eb',	'存款账户开户申请书',	'Licode1',	0,	538,	606,	826,	629,	288,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(123,	'0ee48cc8-7c25-48be-9a47-bb19679d3573',	'存款账户开户申请书',	'Licode2',	0,	206,	662,	370,	685,	164,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(124,	'b46666eb-d919-4a35-bdcf-1111b9a0be3c',	'存款账户开户申请书',	'Licode3',	0,	539,	660,	827,	683,	288,	23,	1,	'0',	'2020-09-28 17:41:54',	'user',	'2020-09-28 17:41:54',	'password',	1),
(141,	'ac988c51-cc6a-4c44-96d6-dd8cca07ddfe',	'营业执照',	'title',	0,	233,	334,	735,	470,	502,	136,	2,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(142,	'5e16a6e5-b190-47b8-bfa1-c7551bcc58ec',	'营业执照',	'Crecode',	0,	655,	475,	817,	501,	162,	26,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(143,	'28e20202-fc85-4e95-9a9e-45497c9d8f65',	'营业执照',	'Licno',	0,	655,	504,	816,	532,	161,	28,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(146,	'63940c1e-f268-4d9a-aef1-08e6faef7f4c',	'营业执照',	'Comname',	0,	363,	553,	816,	588,	453,	35,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(147,	'78a95ab8-8b8d-48de-9154-ae8f78b65d44',	'营业执照',	'Comtype',	0,	364,	602,	816,	639,	452,	37,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(148,	'0860a9a3-1702-4d22-8e5c-017b25341443',	'营业执照',	'Comloc',	0,	364,	655,	816,	692,	452,	37,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(149,	'c815e95a-c70d-4569-8dc0-af8e5ecc908b',	'营业执照',	'Comrep',	0,	362,	706,	732,	737,	370,	31,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(150,	'36f360c7-9f47-4e67-b632-2b229e32fdf0',	'营业执照',	'Comcap',	0,	363,	753,	732,	787,	369,	34,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(151,	'204f2d4b-b0e6-4181-91a9-5241fd7d53da',	'营业执照',	'Comlim',	0,	368,	853,	805,	887,	437,	34,	1,	'0',	'2020-08-11 17:50:03',	'user',	'2020-08-11 17:50:03',	'password',	1),
(219,	'198658ee-02a7-41d2-b526-2ce5f5097aba',	'开户许可证',	'title',	0,	322,	106,	696,	160,	374,	54,	2,	'0',	'2020-08-17 17:18:10',	'user',	'2020-08-17 17:18:10',	'password',	1),
(220,	'649c586c-64d7-4da5-b871-9b4f10023c74',	'开户许可证',	'bisname',	0,	615,	357,	892,	414,	277,	57,	3,	'0',	'2020-08-19 03:53:19',	'user',	'2020-08-19 03:53:19',	'password',	1),
(221,	'8573728a-9632-422c-8434-7ef2b4a14a05',	'开户许可证',	'biscode',	0,	177,	434,	484,	481,	307,	47,	1,	'0',	'2020-08-17 17:18:10',	'user',	'2020-08-17 17:18:10',	'password',	1),
(236,	'b28c98d1-cf44-41b1-9f19-4f7138e172c5',	'统一社会信用代码',	'title',	0,	122,	247,	279,	273,	157,	26,	2,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(237,	'ee6f8c86-dcec-4081-abdc-822f7491af4f',	'统一社会信用代码',	'Crecode',	0,	123,	277,	279,	298,	156,	21,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(238,	'a0c941f9-ecfd-4009-819f-608e7d4f1be2',	'统一社会信用代码',	'Licno',	0,	190,	301,	316,	322,	126,	21,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(239,	'a3e1e32d-7d38-434b-b65b-bade02512635',	'统一社会信用代码',	'Comname',	0,	223,	356,	484,	384,	261,	28,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(240,	'1ce5ab8d-e686-4793-9a43-4ac3f4b08eb6',	'统一社会信用代码',	'Comcap',	0,	656,	341,	894,	372,	238,	31,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(241,	'22d2894d-cc72-464b-ab48-a94407c48593',	'统一社会信用代码',	'Comtype',	0,	223,	386,	484,	413,	261,	27,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(242,	'6e15b36f-995e-4897-b7cd-dd89b8471fab',	'统一社会信用代码',	'Comrep',	0,	222,	415,	423,	439,	201,	24,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(243,	'40d4a95f-00d6-489b-88d8-0533cb31bc48',	'统一社会信用代码',	'Comlim',	0,	654,	401,	897,	432,	243,	31,	1,	'0',	'2020-08-21 11:55:55',	'user',	'2020-08-21 11:55:55',	'password',	1),
(244,	'f220a558-f59a-4016-8edf-8893e40a00f4',	'统一社会信用代码',	'Comprod',	0,	221,	442,	552,	554,	331,	112,	3,	'0',	'2020-08-21 06:34:06',	'user',	'2020-08-21 06:34:06',	'password',	1),
(362,	'6f78504f-7a82-4a5e-996b-2799292e9f57',	'实际受益所有人声明书',	'title',	0,	394,	46,	573,	70,	179,	24,	2,	'0',	'2020-08-21 09:28:29',	'user',	'2020-08-21 09:28:29',	'password',	1),
(363,	'2b0724a4-05d4-46f6-baa4-680f320b3bd6',	'实际受益所有人声明书',	'Act1name',	0,	51,	307,	111,	324,	60,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(364,	'cc0f576c-1cc9-45ae-92f8-66056eee58ec',	'实际受益所有人声明书',	'Act1type',	0,	115,	307,	211,	325,	96,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(365,	'3f5c6cab-88be-48aa-ba86-a20433ddd9fb',	'实际受益所有人声明书',	'Act1id',	0,	217,	307,	336,	325,	119,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(366,	'10f0087d-14c5-4766-b523-decfb39578ea',	'实际受益所有人声明书',	'Act1lim',	0,	342,	305,	413,	342,	71,	37,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(367,	'bb9f8b2d-3f22-4d4f-b3fc-2085f1c49b3f',	'实际受益所有人声明书',	'Act1loc',	0,	418,	306,	565,	347,	147,	41,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(368,	'99fc23b2-7856-4f6c-9e83-ecc02df910d2',	'实际受益所有人声明书',	'Act1cell',	0,	570,	306,	651,	323,	81,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(369,	'a059cf05-7e08-40d7-afb8-cee342f0ca7f',	'实际受益所有人声明书',	'Act1occ',	0,	654,	306,	708,	323,	54,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(370,	'fd828a72-2adf-4121-bdc4-273938b1763e',	'实际受益所有人声明书',	'Act1per',	0,	713,	305,	784,	321,	71,	16,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(371,	'd390b110-ebf9-44a0-9b65-fd94cd40c0e9',	'实际受益所有人声明书',	'Act1way',	0,	789,	305,	869,	325,	80,	20,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(372,	'1b8de936-00a1-48a9-8afd-73ad76fcfd2e',	'实际受益所有人声明书',	'Act2name',	0,	51,	350,	111,	369,	60,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(373,	'ce80bceb-9138-4f45-a0a7-e6899aa2465d',	'实际受益所有人声明书',	'Act2type',	0,	115,	350,	211,	370,	96,	20,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(374,	'7e2200ac-7609-450e-8634-7f007b925ec4',	'实际受益所有人声明书',	'Act2id',	0,	217,	350,	337,	369,	120,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(375,	'8db64a8a-4f10-41fb-99c2-d6c9fb0e3f79',	'实际受益所有人声明书',	'Act2lim',	0,	343,	350,	414,	368,	71,	18,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(376,	'ae65d02e-7c48-42a2-9938-89554fbcd0ec',	'实际受益所有人声明书',	'Act2loc',	0,	419,	350,	565,	391,	146,	41,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(377,	'30904f83-9128-4c05-a4ad-6ecf63f9fa89',	'实际受益所有人声明书',	'Act2cell',	0,	570,	350,	650,	369,	80,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(378,	'224e90f4-e1ec-4092-b2ba-f6b482f50a1c',	'实际受益所有人声明书',	'Act2occ',	0,	654,	350,	708,	368,	54,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(379,	'cc024f44-8c8c-43c5-b0ec-6330b66cb660',	'实际受益所有人声明书',	'Act2per',	0,	713,	349,	784,	367,	71,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(380,	'e8081a88-ef43-422f-8418-539138e681a8',	'实际受益所有人声明书',	'Act2way',	0,	789,	349,	869,	368,	80,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(381,	'3d82237b-8bc8-49a2-a330-b6b9cdc2571d',	'实际受益所有人声明书',	'Act3name',	0,	51,	394,	111,	411,	60,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(382,	'5f667521-b99c-4ea5-8880-6295b598627b',	'实际受益所有人声明书',	'Act3type',	0,	115,	394,	211,	413,	96,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(383,	'5146eafd-e271-4534-a7be-fbde2ce9487c',	'实际受益所有人声明书',	'Act3id',	0,	216,	394,	338,	412,	122,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(384,	'89b879c4-412f-478c-b6d8-7137bf84499d',	'实际受益所有人声明书',	'Act3lim',	0,	344,	394,	413,	411,	69,	17,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(385,	'0948eef4-21ee-411b-9ca0-b8803ef143c3',	'实际受益所有人声明书',	'Act3loc',	0,	419,	394,	565,	434,	146,	40,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(386,	'08faa342-f658-4855-b582-e3c6d1f1bd56',	'实际受益所有人声明书',	'Act3cell',	0,	571,	393,	650,	409,	79,	16,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(387,	'7e5d9be2-00d5-49f7-9924-ec799c6a8e09',	'实际受益所有人声明书',	'Act3occ',	0,	655,	393,	708,	410,	53,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(388,	'38003e1e-1cdd-4885-81b5-3c1d8f2c01e4',	'实际受益所有人声明书',	'Act3per',	0,	713,	393,	783,	412,	70,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(389,	'70dbf75b-35fa-4c1a-b004-f52e0e6aad1c',	'实际受益所有人声明书',	'Act3way',	0,	789,	393,	870,	412,	81,	19,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(390,	'c32136f4-e9bd-48f4-a51e-2fc64dfef2e8',	'实际受益所有人声明书',	'Act4name',	0,	51,	438,	110,	455,	59,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(391,	'689c4646-d345-4a10-a98a-e2096b176ecc',	'实际受益所有人声明书',	'Act4type',	0,	116,	438,	211,	455,	95,	17,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(392,	'4e9079ce-1e43-4c8c-abb3-5400493b9429',	'实际受益所有人声明书',	'Act4id',	0,	217,	438,	337,	456,	120,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(393,	'4a2e19a5-f6cb-41e4-af04-d2370a84a60b',	'实际受益所有人声明书',	'Act4lim',	0,	343,	438,	413,	474,	70,	36,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(394,	'a16b61af-5396-46cc-9f14-bf4d745afb98',	'实际受益所有人声明书',	'Act4loc',	0,	419,	438,	565,	478,	146,	40,	3,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(395,	'7e844440-6efd-41f3-9d54-0f6c8d339ebe',	'实际受益所有人声明书',	'Act4cell',	0,	570,	438,	650,	452,	80,	14,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(396,	'7706c53f-5a1c-4d7a-8d29-afe2bd18a038',	'实际受益所有人声明书',	'Act4occ',	0,	654,	436,	708,	452,	54,	16,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(397,	'3707d95b-8493-4106-ad24-3cabce6389e2',	'实际受益所有人声明书',	'Act4per',	0,	714,	437,	784,	453,	70,	16,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(398,	'70e291b8-9093-4366-bb4d-fcc3539f1358',	'实际受益所有人声明书',	'Act4way',	0,	789,	437,	870,	455,	81,	18,	1,	'0',	'2020-08-21 15:51:10',	'user',	'2020-08-21 15:51:10',	'password',	1),
(401,	'e54a4c2b-6e1c-4139-9b5e-93c156f5c030',	'办理银行结算账户事项委托书',	'title',	0,	300,	267,	683,	324,	383,	57,	2,	'0',	'2020-10-08 08:27:56',	'user',	'2020-10-08 08:27:56',	'password',	1),
(402,	'fb1caad7-17b4-4c53-9d7b-d3428bea3693',	'办理银行结算账户事项委托书',	'content',	0,	146,	419,	881,	626,	735,	207,	3,	'0',	'2020-08-25 18:16:11',	'user',	'2020-08-25 18:16:11',	'password',	1),
(409,	'ac377670-2884-472b-8478-24725b5d8641',	'基本存款账户信息',	'title',	0,	347,	245,	642,	289,	295,	44,	2,	'0',	'2020-08-26 11:27:58',	'user',	'2020-08-26 11:27:58',	'password',	1),
(410,	'aead4c2e-b036-4717-b4d0-c3e2b41454c1',	'基本存款账户信息',	'biscode',	0,	401,	462,	625,	488,	224,	26,	1,	'0',	'2020-08-26 03:30:30',	'user',	'2020-08-26 03:30:30',	'password',	1),
(411,	'd2daeffe-63bc-4c36-ae55-701c6b4be638',	'基本存款账户信息',	'bisname',	0,	396,	520,	750,	554,	354,	34,	1,	'0',	'2020-08-26 03:30:36',	'user',	'2020-08-26 03:30:36',	'password',	1);