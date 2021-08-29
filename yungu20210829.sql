-- --------------------------------------------------------
-- 主机:                           rm-bp1ka47q1c925092xyo.mysql.rds.aliyuncs.com
-- 服务器版本:                        5.7.28-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 yungu 的数据库结构
DROP DATABASE IF EXISTS `yungu`;
CREATE DATABASE IF NOT EXISTS `yungu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yungu`;

-- 导出  表 yungu.act_evt_log 结构
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE IF NOT EXISTS `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_evt_log 的数据：~0 rows (大约)
DELETE FROM `act_evt_log`;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;

-- 导出  表 yungu.act_ge_bytearray 结构
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE IF NOT EXISTS `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ge_bytearray 的数据：~0 rows (大约)
DELETE FROM `act_ge_bytearray`;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;

-- 导出  表 yungu.act_ge_property 结构
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE IF NOT EXISTS `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ge_property 的数据：~0 rows (大约)
DELETE FROM `act_ge_property`;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` (`NAME_`, `VALUE_`, `REV_`) VALUES
	('next.dbid', '1', 1),
	('schema.history', 'create(5.22.0.0)', 1),
	('schema.version', '5.22.0.0', 1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_actinst 结构
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE IF NOT EXISTS `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_actinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_actinst`;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_attachment 结构
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE IF NOT EXISTS `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_attachment 的数据：~0 rows (大约)
DELETE FROM `act_hi_attachment`;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_comment 结构
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE IF NOT EXISTS `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_comment 的数据：~0 rows (大约)
DELETE FROM `act_hi_comment`;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_detail 结构
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE IF NOT EXISTS `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_detail 的数据：~0 rows (大约)
DELETE FROM `act_hi_detail`;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_identitylink 结构
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE IF NOT EXISTS `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_identitylink 的数据：~0 rows (大约)
DELETE FROM `act_hi_identitylink`;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_procinst 结构
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE IF NOT EXISTS `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_procinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_procinst`;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_taskinst 结构
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE IF NOT EXISTS `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_taskinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_taskinst`;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;

-- 导出  表 yungu.act_hi_varinst 结构
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE IF NOT EXISTS `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_hi_varinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_varinst`;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;

-- 导出  表 yungu.act_id_group 结构
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE IF NOT EXISTS `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_id_group 的数据：~0 rows (大约)
DELETE FROM `act_id_group`;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;

-- 导出  表 yungu.act_id_info 结构
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE IF NOT EXISTS `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_id_info 的数据：~0 rows (大约)
DELETE FROM `act_id_info`;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;

-- 导出  表 yungu.act_id_membership 结构
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE IF NOT EXISTS `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_id_membership 的数据：~0 rows (大约)
DELETE FROM `act_id_membership`;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;

-- 导出  表 yungu.act_id_user 结构
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE IF NOT EXISTS `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_id_user 的数据：~0 rows (大约)
DELETE FROM `act_id_user`;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;

-- 导出  表 yungu.act_procdef_info 结构
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE IF NOT EXISTS `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_procdef_info 的数据：~0 rows (大约)
DELETE FROM `act_procdef_info`;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;

-- 导出  表 yungu.act_re_deployment 结构
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE IF NOT EXISTS `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_re_deployment 的数据：~0 rows (大约)
DELETE FROM `act_re_deployment`;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;

-- 导出  表 yungu.act_re_model 结构
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE IF NOT EXISTS `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_re_model 的数据：~0 rows (大约)
DELETE FROM `act_re_model`;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;

-- 导出  表 yungu.act_re_procdef 结构
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE IF NOT EXISTS `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_re_procdef 的数据：~0 rows (大约)
DELETE FROM `act_re_procdef`;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_event_subscr 结构
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE IF NOT EXISTS `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_event_subscr 的数据：~0 rows (大约)
DELETE FROM `act_ru_event_subscr`;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_execution 结构
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE IF NOT EXISTS `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_execution 的数据：~0 rows (大约)
DELETE FROM `act_ru_execution`;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_identitylink 结构
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE IF NOT EXISTS `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_identitylink 的数据：~0 rows (大约)
DELETE FROM `act_ru_identitylink`;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_job 结构
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE IF NOT EXISTS `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_job 的数据：~0 rows (大约)
DELETE FROM `act_ru_job`;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_task 结构
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE IF NOT EXISTS `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_task 的数据：~0 rows (大约)
DELETE FROM `act_ru_task`;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;

-- 导出  表 yungu.act_ru_variable 结构
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE IF NOT EXISTS `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  yungu.act_ru_variable 的数据：~0 rows (大约)
DELETE FROM `act_ru_variable`;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;

-- 导出  表 yungu.app_member 结构
DROP TABLE IF EXISTS `app_member`;
CREATE TABLE IF NOT EXISTS `app_member` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `platform` tinyint(1) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `vip_end_time` datetime(6) DEFAULT NULL,
  `vip_start_time` datetime(6) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `vip_status` tinyint(1) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `invite_code` varchar(255) DEFAULT NULL,
  `grade` int(11) unsigned DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `invite_by` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `invite_code` (`invite_code`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.app_member 的数据：~3 rows (大约)
DELETE FROM `app_member`;
/*!40000 ALTER TABLE `app_member` DISABLE KEYS */;
INSERT INTO `app_member` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `avatar`, `email`, `mobile`, `nickname`, `password`, `platform`, `sex`, `status`, `type`, `username`, `vip_end_time`, `vip_start_time`, `permissions`, `vip_status`, `birth`, `address`, `invite_code`, `grade`, `position`, `invite_by`, `description`) VALUES
	(255227305549369344, '', '2020-03-25 21:14:32.000000', 0, 'admin', '2020-04-27 17:20:45.307000', 'https://ooo.0o0.ooo/2020/04/18/NmF3IP4TOoVbLf5.png', '', '18782059031', '187****9031', NULL, -1, '', 0, 1, '1251014922381430800', '2030-04-30 00:00:00.000000', '2020-04-01 00:00:00.000000', 'MEMBER', 1, NULL, '中国 北京市 北京市 朝阳区 酒仙桥路 3号 电子城．国际电子总部', '12N3VE6CK440G', 0, '30.5681733200,104.0666198700', '', NULL),
	(1251783645962833920, 'admin', '2020-04-19 16:04:12.000000', 0, 'admin', '2020-04-27 17:24:23.091000', 'https://ooo.0o0.ooo/2020/04/18/NmF3IP4TOoVbLf5.png', '', '18782059092', '187****9092', NULL, 1, '', 0, 1, '1251783646004776960', '2020-04-07 00:00:00.000000', '2020-04-01 00:00:00.000000', 'MEMBER', 2, NULL, '中国 北京市 北京市 朝阳区 酒仙桥路 3号 电子城．国际电子总部', '12NPQJ01S4400', 0, '30.5681733200,104.0666198700', '1251014922381430800', NULL),
	(1251783729291071489, 'admin', '2020-04-19 16:04:32.000000', 0, 'admin', '2020-04-27 22:03:48.509000', 'https://ooo.0o0.ooo/2020/04/18/NmF3IP4TOoVbLf5.png', '', '18782059033', '187****9093', NULL, 2, '', 0, 0, '1251783729303654400', NULL, NULL, 'MEMBER', 0, NULL, '中国 北京市 北京市 朝阳区 酒仙桥路 3号 电子城．国际电子总部', '12NPQLDKC4400', 0, '30.5681733200,104.0666198700', '1251014922381430800', NULL);
/*!40000 ALTER TABLE `app_member` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_blob_triggers 结构
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_blob_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_blob_triggers`;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_calendars 结构
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_calendars 的数据：~0 rows (大约)
DELETE FROM `qrtz_calendars`;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_cron_triggers 结构
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_cron_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_cron_triggers`;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_fired_triggers 结构
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_fired_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_fired_triggers`;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_job_details 结构
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_job_details 的数据：~0 rows (大约)
DELETE FROM `qrtz_job_details`;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_locks 结构
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_locks 的数据：~0 rows (大约)
DELETE FROM `qrtz_locks`;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES
	('quartzScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_paused_trigger_grps 结构
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_paused_trigger_grps 的数据：~0 rows (大约)
DELETE FROM `qrtz_paused_trigger_grps`;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_scheduler_state 结构
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_scheduler_state 的数据：~0 rows (大约)
DELETE FROM `qrtz_scheduler_state`;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_simple_triggers 结构
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_simple_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simple_triggers`;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_simprop_triggers 结构
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_simprop_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simprop_triggers`;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;

-- 导出  表 yungu.qrtz_triggers 结构
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.qrtz_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_triggers`;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;

-- 导出  表 yungu.t_act_business 结构
DROP TABLE IF EXISTS `t_act_business`;
CREATE TABLE IF NOT EXISTS `t_act_business` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `proc_def_id` varchar(255) DEFAULT NULL,
  `proc_inst_id` varchar(255) DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `table_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_business 的数据：~0 rows (大约)
DELETE FROM `t_act_business`;
/*!40000 ALTER TABLE `t_act_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_business` ENABLE KEYS */;

-- 导出  表 yungu.t_act_category 结构
DROP TABLE IF EXISTS `t_act_category`;
CREATE TABLE IF NOT EXISTS `t_act_category` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_category 的数据：~0 rows (大约)
DELETE FROM `t_act_category`;
/*!40000 ALTER TABLE `t_act_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_category` ENABLE KEYS */;

-- 导出  表 yungu.t_act_model 结构
DROP TABLE IF EXISTS `t_act_model`;
CREATE TABLE IF NOT EXISTS `t_act_model` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `model_key` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_model 的数据：~0 rows (大约)
DELETE FROM `t_act_model`;
/*!40000 ALTER TABLE `t_act_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_model` ENABLE KEYS */;

-- 导出  表 yungu.t_act_node 结构
DROP TABLE IF EXISTS `t_act_node`;
CREATE TABLE IF NOT EXISTS `t_act_node` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `node_id` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `relate_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_node 的数据：~0 rows (大约)
DELETE FROM `t_act_node`;
/*!40000 ALTER TABLE `t_act_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_node` ENABLE KEYS */;

-- 导出  表 yungu.t_act_process 结构
DROP TABLE IF EXISTS `t_act_process`;
CREATE TABLE IF NOT EXISTS `t_act_process` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `deployment_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `diagram_name` varchar(255) DEFAULT NULL,
  `latest` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `process_key` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `xml_name` varchar(255) DEFAULT NULL,
  `business_table` varchar(255) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `all_user` bit(1) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_process 的数据：~0 rows (大约)
DELETE FROM `t_act_process`;
/*!40000 ALTER TABLE `t_act_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_process` ENABLE KEYS */;

-- 导出  表 yungu.t_act_starter 结构
DROP TABLE IF EXISTS `t_act_starter`;
CREATE TABLE IF NOT EXISTS `t_act_starter` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `process_def_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_act_starter 的数据：~0 rows (大约)
DELETE FROM `t_act_starter`;
/*!40000 ALTER TABLE `t_act_starter` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_act_starter` ENABLE KEYS */;

-- 导出  表 yungu.t_audit 结构
DROP TABLE IF EXISTS `t_audit`;
CREATE TABLE IF NOT EXISTS `t_audit` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `audit_msg` varchar(255) DEFAULT NULL,
  `car` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `ccdd` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `jcr` varchar(255) DEFAULT NULL,
  `jssj` varchar(255) DEFAULT NULL,
  `kssj` varchar(255) DEFAULT NULL,
  `mdd` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `shrr` varchar(255) DEFAULT NULL,
  `sqr` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `ycbm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_audit 的数据：~0 rows (大约)
DELETE FROM `t_audit`;
/*!40000 ALTER TABLE `t_audit` DISABLE KEYS */;
INSERT INTO `t_audit` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `audit_msg`, `car`, `car_owner`, `ccdd`, `image`, `jcr`, `jssj`, `kssj`, `mdd`, `reason`, `shrr`, `sqr`, `status`, `ycbm`) VALUES
	('1418386013335719936', NULL, '2021-07-23 09:42:32.594000', 0, NULL, '2021-07-23 09:51:22.398000', NULL, '浙A123456', '张三', '东华门街道锡拉胡同淘汇新天(北京市东城区东华门街道锡拉胡同淘汇新天) 纬度:39.916295经度:116.410344', '543927ed065ee04d040975d05b832f15edbd.png', '李四', '2021-07-23 09:42', '2021-07-23 09:42', '黑芝麻爆珠饮(北京市东城区王府井大街219-1号) 纬度:39.916302经度:116.410961', '我要用车', 'undefined', '管理员', 1, '40322777781112832');
/*!40000 ALTER TABLE `t_audit` ENABLE KEYS */;

-- 导出  表 yungu.t_auto_chat 结构
DROP TABLE IF EXISTS `t_auto_chat`;
CREATE TABLE IF NOT EXISTS `t_auto_chat` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` text,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `good` int(11) DEFAULT NULL,
  `content` text,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `evaluable` bit(1) DEFAULT NULL,
  `hot` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `search` (`title`,`keywords`) /*!50100 WITH PARSER `ngram` */ 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_auto_chat 的数据：~0 rows (大约)
DELETE FROM `t_auto_chat`;
/*!40000 ALTER TABLE `t_auto_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_auto_chat` ENABLE KEYS */;

-- 导出  表 yungu.t_car_archives 结构
DROP TABLE IF EXISTS `t_car_archives`;
CREATE TABLE IF NOT EXISTS `t_car_archives` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `driving_license` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_car_archives 的数据：~2 rows (大约)
DELETE FROM `t_car_archives`;
/*!40000 ALTER TABLE `t_car_archives` DISABLE KEYS */;
INSERT INTO `t_car_archives` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `driving_license`, `label`, `license`, `remark`, `title`, `user_name`, `value`) VALUES
	('1413102190175850496', 'admin', '2021-07-08 19:46:31.005000', 0, NULL, NULL, '512121212', '私人车辆A', '浙A-000000', '测试', '私人车辆A', '人事员工A', '私人车辆A'),
	('1413102320337686529', 'admin', '2021-07-08 19:47:02.020000', 0, NULL, NULL, '455555454', '私人车辆2', '浙B-000000', '测试', '私人车辆2', '人事员工B', '私人车辆2'),
	('1413103588556804097', 'admin', '2021-07-08 19:52:04.390000', 0, NULL, NULL, '2442424242', '私人车辆3', '浙C-000000', '测试', '私人车辆3', '人事经理', '私人车辆3');
/*!40000 ALTER TABLE `t_car_archives` ENABLE KEYS */;

-- 导出  表 yungu.t_client 结构
DROP TABLE IF EXISTS `t_client`;
CREATE TABLE IF NOT EXISTS `t_client` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `home_uri` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `auto_approve` bit(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_client 的数据：~0 rows (大约)
DELETE FROM `t_client`;
/*!40000 ALTER TABLE `t_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_client` ENABLE KEYS */;

-- 导出  表 yungu.t_convenient_service 结构
DROP TABLE IF EXISTS `t_convenient_service`;
CREATE TABLE IF NOT EXISTS `t_convenient_service` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_convenient_service 的数据：~0 rows (大约)
DELETE FROM `t_convenient_service`;
/*!40000 ALTER TABLE `t_convenient_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_convenient_service` ENABLE KEYS */;

-- 导出  表 yungu.t_department 结构
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_department 的数据：~11 rows (大约)
DELETE FROM `t_department`;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `parent_id`, `sort_order`, `status`, `title`, `is_parent`) VALUES
	(40322777781112832, '', '2018-08-10 20:40:40', 0, 'admin', '2021-08-16 10:47:11', 0, 1.00, 0, '数字经济总部', b'1'),
	(40322811096469504, '', '2018-08-10 20:40:48', 0, 'admin', '2021-08-16 10:48:13', 40322777781112832, 1.00, 0, '经营管理委员会', b'0'),
	(40343262766043136, '', '2018-08-10 22:02:04', 0, 'admin', '2021-08-16 10:47:18', 0, 2.00, 0, '中电智谷项目', b'1'),
	(40344005342400512, '', '2018-08-10 22:05:01', 0, 'admin', '2021-08-16 10:49:48', 40343262766043136, 2.00, 0, '工程部', NULL),
	(40389030113710080, '', '2018-08-11 01:03:56', 0, 'admin', '2021-08-16 10:49:41', 40343262766043136, 1.00, 0, '总经办', b'0'),
	(40652270295060480, '', '2018-08-11 18:29:57', 0, 'admin', '2021-08-16 10:47:23', 0, 3.00, 0, '电子产业项目', b'1'),
	(40652338142121984, '', '2018-08-11 18:30:13', 0, 'admin', '2021-08-16 10:50:07', 40652270295060480, 1.00, 0, '总经办', b'0'),
	(40681289119961088, '', '2018-08-11 20:25:16', 0, 'admin', '2021-08-16 10:50:11', 40652270295060480, 2.00, 0, '工程部', b'0'),
	(1427099671964291073, 'admin', '2021-08-16 10:47:31', 0, 'admin', '2021-08-16 10:50:26', 0, 4.00, 0, '云谷数据项目', b'1'),
	(1427099706592464896, 'admin', '2021-08-16 10:47:39', 0, 'admin', '2021-08-16 10:51:03', 0, 5.00, 0, '云谷企业', b'1'),
	(1427099884938465281, 'admin', '2021-08-16 10:48:21', 0, 'admin', '2021-08-16 10:48:21', 40322777781112832, 2.00, 0, '综合管理部', b'0'),
	(1427099911844925440, 'admin', '2021-08-16 10:48:28', 0, 'admin', '2021-08-16 10:48:28', 40322777781112832, 3.00, 0, '法务部', b'0'),
	(1427099939351171073, 'admin', '2021-08-16 10:48:34', 0, 'admin', '2021-08-16 10:48:34', 40322777781112832, 4.00, 0, '运营管理部', b'0'),
	(1427099960591126529, 'admin', '2021-08-16 10:48:40', 0, 'admin', '2021-08-16 10:49:08', 40322777781112832, 5.00, 0, '资金管理部', b'0'),
	(1427099993612881921, 'admin', '2021-08-16 10:48:47', 0, 'admin', '2021-08-16 10:48:47', 40322777781112832, 6.00, 0, '发展策划部', b'0'),
	(1427100126320660480, 'admin', '2021-08-16 10:49:19', 0, 'admin', '2021-08-16 10:49:19', 40322777781112832, 7.00, 0, '方案设计部', b'0'),
	(1427100169236779008, 'admin', '2021-08-16 10:49:29', 0, 'admin', '2021-08-16 10:49:29', 40322777781112832, 8.00, 0, '成本招采部', b'0'),
	(1427100281782538240, 'admin', '2021-08-16 10:49:56', 0, 'admin', '2021-08-16 10:49:56', 40343262766043136, 3.00, 0, '销售部', b'0'),
	(1427100376401842176, 'admin', '2021-08-16 10:50:19', 0, 'admin', '2021-08-16 10:50:19', 40652270295060480, 3.00, 0, '销售部', b'0'),
	(1427100408882532353, 'admin', '2021-08-16 10:50:26', 0, 'admin', '2021-08-16 10:50:26', 1427099671964291073, 1.00, 0, '总经办', b'0'),
	(1427100439043772417, 'admin', '2021-08-16 10:50:34', 0, 'admin', '2021-08-16 10:50:43', 1427099671964291073, 3.00, 0, '营销部', b'0'),
	(1427100510816702464, 'admin', '2021-08-16 10:50:51', 0, 'admin', '2021-08-16 10:50:51', 1427099671964291073, 2.00, 0, '运维部', b'0'),
	(1427100539010813952, 'admin', '2021-08-16 10:50:57', 0, 'admin', '2021-08-16 10:50:57', 1427099671964291073, 4.00, 0, '数字创新事业部', b'0'),
	(1427100561253208064, 'admin', '2021-08-16 10:51:03', 0, 'admin', '2021-08-16 10:51:03', 1427099706592464896, 1.00, 0, '综合部', b'0'),
	(1427100586754576384, 'admin', '2021-08-16 10:51:09', 0, 'admin', '2021-08-16 10:51:09', 1427099706592464896, 2.00, 0, '财务部', b'0');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 yungu.t_department_header 结构
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE IF NOT EXISTS `t_department_header` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_department_header 的数据：~0 rows (大约)
DELETE FROM `t_department_header`;
/*!40000 ALTER TABLE `t_department_header` DISABLE KEYS */;
INSERT INTO `t_department_header` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `department_id`, `type`, `user_id`) VALUES
	(1427099589135175680, 'admin', '2021-08-16 10:47:11', 0, 'admin', '2021-08-16 10:47:11', 40322777781112832, 0, 682265633886208);
/*!40000 ALTER TABLE `t_department_header` ENABLE KEYS */;

-- 导出  表 yungu.t_dict 结构
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_dict 的数据：~9 rows (大约)
DELETE FROM `t_dict`;
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
INSERT INTO `t_dict` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `title`, `type`, `sort_order`) VALUES
	(75135930788220928, 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00),
	(75383353938808832, 'admin', '2018-11-15 14:38:53', 0, 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', 1.00),
	(75388696739713024, 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 2.00),
	(75392985935646720, 'admin', '2018-11-15 15:17:10', 0, 'admin', '2018-11-27 01:39:29', '', '腾讯云对象存储区域', 'tencent_bucket_region', 3.00),
	(79717732567748608, 'admin', '2018-11-27 13:42:10', 0, 'admin', '2018-11-27 13:42:10', '', '流程节点类型', 'process_node_type', 4.00),
	(81843858882695168, 'admin', '2018-12-03 10:30:38', 0, 'admin', '2018-12-03 10:30:49', '', '优先级', 'priority', 5.00),
	(82236987314016256, 'admin', '2018-12-04 12:32:47', 0, 'admin', '2018-12-04 12:32:47', '', '业务表', 'business_table', 6.00),
	(82236987314016257, 'admin', '2018-12-04 12:32:47', 0, 'admin', '2018-12-04 12:32:47', '', '业务表单路由', 'business_form', 7.00),
	(99020862912466944, 'admin', '2019-01-19 20:05:54', 0, 'admin', '2019-01-19 20:06:10', '', '请假类型', 'leave_type', 8.00);
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;

-- 导出  表 yungu.t_dict_data 结构
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE IF NOT EXISTS `t_dict_data` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` bigint(20) unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_dict_data 的数据：~55 rows (大约)
DELETE FROM `t_dict_data`;
/*!40000 ALTER TABLE `t_dict_data` DISABLE KEYS */;
INSERT INTO `t_dict_data` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `dict_id`, `sort_order`, `status`, `title`, `value`) VALUES
	(75158227712479232, 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-01 23:53:13', '', 75135930788220928, 0.00, 0, '男', '男'),
	(75159254272577536, 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-01 23:53:17', '', 75135930788220928, 1.00, 0, '女', '女'),
	(75159898425397248, 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-01 23:53:22', '', 75135930788220928, 2.00, -1, '保密', '保密'),
	(75385648017575936, 'admin', '2018-11-15 14:48:00', 0, 'admin', '2019-04-02 00:10:36', '', 75383353938808832, 0.00, 0, '系统公告', '系统公告'),
	(75385706913992704, 'admin', '2018-11-15 14:48:14', 0, 'admin', '2019-04-02 00:10:32', '', 75383353938808832, 1.00, 0, '提醒', '提醒'),
	(75385774274514944, 'admin', '2018-11-15 14:48:30', 0, 'admin', '2019-04-02 00:10:28', '', 75383353938808832, 2.00, 0, '私信', '私信'),
	(75390787835138048, 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', 75388696739713024, 0.00, 0, '查看操作(view)', 'view'),
	(75390886501945344, 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', 75388696739713024, 1.00, 0, '添加操作(add)', 'add'),
	(75390993939042304, 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', 75388696739713024, 2.00, 0, '编辑操作(edit)', 'edit'),
	(75391067532300288, 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', 75388696739713024, 3.00, 0, '删除操作(delete)', 'delete'),
	(75391126902673408, 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', 75388696739713024, 4.00, 0, '清空操作(clear)', 'clear'),
	(75391192883269632, 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', 75388696739713024, 5.00, 0, '启用操作(enable)', 'enable'),
	(75391251024711680, 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', 75388696739713024, 6.00, 0, '禁用操作(disable)', 'disable'),
	(75391297124306944, 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', 75388696739713024, 7.00, 0, '搜索操作(search)', 'search'),
	(75391343379091456, 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', 75388696739713024, 8.00, 0, '上传文件(upload)', 'upload'),
	(75391407526776832, 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', 75388696739713024, 9.00, 0, '导出操作(output)', 'output'),
	(75391475042488320, 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', 75388696739713024, 10.00, 0, '导入操作(input)', 'input'),
	(75391522182270976, 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', 75388696739713024, 11.00, 0, '分配权限(editPerm)', 'editPerm'),
	(75391576364290048, 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', 75388696739713024, 12.00, 0, '设为默认(setDefault)', 'setDefault'),
	(75391798033256448, 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', 75388696739713024, 13.00, 0, '其他操作(other)', 'other'),
	(75393605291741184, 'admin', '2018-11-15 15:19:37', 0, 'admin', '2018-11-15 15:19:37', '', 75392985935646720, 0.00, 0, '北京一区（华北）', 'ap-beijing-1'),
	(75393681254780928, 'admin', '2018-11-15 15:19:55', 0, 'admin', '2018-11-15 15:19:55', '', 75392985935646720, 1.00, 0, '北京', 'ap-beijing'),
	(75393767619694592, 'admin', '2018-11-15 15:20:16', 0, 'admin', '2018-11-15 15:20:16', '', 75392985935646720, 2.00, 0, '上海（华东）', 'ap-shanghai'),
	(75393851484803072, 'admin', '2018-11-15 15:20:36', 0, 'admin', '2018-11-15 15:20:36', '', 75392985935646720, 3.00, 0, '广州（华南）', 'ap-guangzhou'),
	(75393961887272960, 'admin', '2018-11-15 15:21:02', 0, 'admin', '2018-11-15 15:21:02', '', 75392985935646720, 4.00, 0, '成都（西南）', 'ap-chengdu'),
	(75394053969022976, 'admin', '2018-11-15 15:21:24', 0, 'admin', '2018-11-15 15:21:24', '', 75392985935646720, 5.00, 0, '重庆', 'ap-chongqing'),
	(75394122474590208, 'admin', '2018-11-15 15:21:41', 0, 'admin', '2018-11-15 15:21:41', '', 75392985935646720, 6.00, 0, '新加坡', 'ap-singapore'),
	(75394186202845184, 'admin', '2018-11-15 15:21:56', 0, 'admin', '2018-11-15 15:21:56', '', 75392985935646720, 7.00, 0, '香港', 'ap-hongkong'),
	(75394254255427584, 'admin', '2018-11-15 15:22:12', 0, 'admin', '2018-11-15 15:22:12', '', 75392985935646720, 8.00, 0, '多伦多', 'na-toronto'),
	(75394309125312512, 'admin', '2018-11-15 15:22:25', 0, 'admin', '2018-11-15 15:22:25', '', 75392985935646720, 9.00, 0, '法兰克福', 'eu-frankfurt'),
	(75394367044456448, 'admin', '2018-11-15 15:22:39', 0, 'admin', '2018-11-15 15:22:39', '', 75392985935646720, 10.00, 0, '孟买', 'ap-mumbai'),
	(75394448523005952, 'admin', '2018-11-15 15:22:58', 0, 'admin', '2018-11-15 15:22:58', '', 75392985935646720, 11.00, 0, '首尔', 'ap-seoul'),
	(75394604765024256, 'admin', '2018-11-15 15:23:36', 0, 'admin', '2018-11-15 15:23:36', '', 75392985935646720, 12.00, 0, '硅谷', 'na-siliconvalley'),
	(75394659299364864, 'admin', '2018-11-15 15:23:49', 0, 'admin', '2018-11-15 15:23:49', '', 75392985935646720, 13.00, 0, '弗吉尼亚', 'na-ashburn'),
	(75394705700950016, 'admin', '2018-11-15 15:24:00', 0, 'admin', '2018-11-15 15:24:00', '', 75392985935646720, 14.00, 0, '曼谷', 'ap-bangkok'),
	(75394759287377920, 'admin', '2018-11-15 15:24:12', 0, 'admin', '2018-11-15 15:24:12', '', 75392985935646720, 15.00, 0, '莫斯科', 'eu-moscow'),
	(79717808262352896, 'admin', '2018-11-27 13:42:28', 0, 'admin', '2018-11-27 13:42:28', '', 79717732567748608, 0.00, 0, '开始节点', '0'),
	(79717858308788224, 'admin', '2018-11-27 13:42:40', 0, 'admin', '2018-11-27 13:42:40', '', 79717732567748608, 1.00, 0, '审批节点', '1'),
	(79717920061526016, 'admin', '2018-11-27 13:42:54', 0, 'admin', '2018-12-08 20:35:39', '', 79717732567748608, 2.00, 0, '结束节点', '2'),
	(81843987719131136, 'admin', '2018-12-03 10:31:08', 0, 'admin', '2018-12-03 10:31:08', '', 81843858882695168, 0.00, 0, '普通', '0'),
	(81844044015079424, 'admin', '2018-12-03 10:31:22', 0, 'admin', '2018-12-03 10:31:22', '', 81843858882695168, 1.00, 0, '重要', '1'),
	(81844100705292288, 'admin', '2018-12-03 10:31:35', 0, 'admin', '2018-12-03 10:31:35', '', 81843858882695168, 2.00, 0, '紧急', '2'),
	(82237106587439104, 'admin', '2018-12-04 12:33:15', 0, 'admin', '2018-12-04 12:33:15', '', 82236987314016256, 0.00, 0, '请假申请表', 't_leave'),
	(82237106587439105, 'admin', '2018-12-04 12:33:15', 0, 'admin', '2018-12-04 12:33:15', '', 82236987314016257, 0.00, 0, '请假申请表', 'leave'),
	(99020985985929216, 'admin', '2019-01-19 20:06:23', 0, 'admin', '2019-04-01 23:55:48', '', 99020862912466944, 0.00, 0, '年假', '年假'),
	(99021020739932160, 'admin', '2019-01-19 20:06:32', 0, 'admin', '2019-04-01 23:55:52', '', 99020862912466944, 1.00, 0, '事假', '事假'),
	(99021195566911488, 'admin', '2019-01-19 20:07:13', 0, 'admin', '2019-04-01 23:55:56', '', 99020862912466944, 2.00, 0, '病假', '病假'),
	(99021242476007424, 'admin', '2019-01-19 20:07:24', 0, 'admin', '2019-04-01 23:56:01', '', 99020862912466944, 3.00, 0, '调休', '调休'),
	(99021300730695680, 'admin', '2019-01-19 20:07:38', 0, 'admin', '2019-04-01 23:56:05', '', 99020862912466944, 4.00, 0, '产假', '产假'),
	(99021341889400832, 'admin', '2019-01-19 20:07:48', 0, 'admin', '2019-04-01 23:56:10', '', 99020862912466944, 5.00, 0, '陪产假', '陪产假'),
	(99021382393794560, 'admin', '2019-01-19 20:07:58', 0, 'admin', '2019-04-01 23:56:14', '', 99020862912466944, 6.00, 0, '婚假', '婚假'),
	(99021437171404800, 'admin', '2019-01-19 20:08:11', 0, 'admin', '2019-04-01 23:56:18', '', 99020862912466944, 7.00, 0, '例假', '例假'),
	(99021497724571648, 'admin', '2019-01-19 20:08:25', 0, 'admin', '2019-04-01 23:56:23', '', 99020862912466944, 8.00, 0, '丧假', '丧假'),
	(99021556704874496, 'admin', '2019-01-19 20:08:39', 0, 'admin', '2019-04-01 23:56:27', '', 99020862912466944, 9.00, 0, '哺乳假', '哺乳假'),
	(125170157323554816, 'admin', '2019-04-01 23:53:52', 0, 'admin', '2019-04-01 23:53:52', '', 75383353938808832, 3.00, 0, '工作流', '工作流');
/*!40000 ALTER TABLE `t_dict_data` ENABLE KEYS */;

-- 导出  表 yungu.t_dynamic_build 结构
DROP TABLE IF EXISTS `t_dynamic_build`;
CREATE TABLE IF NOT EXISTS `t_dynamic_build` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_dynamic_build 的数据：~0 rows (大约)
DELETE FROM `t_dynamic_build`;
/*!40000 ALTER TABLE `t_dynamic_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dynamic_build` ENABLE KEYS */;

-- 导出  表 yungu.t_family_style 结构
DROP TABLE IF EXISTS `t_family_style`;
CREATE TABLE IF NOT EXISTS `t_family_style` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_family_style 的数据：~0 rows (大约)
DELETE FROM `t_family_style`;
/*!40000 ALTER TABLE `t_family_style` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_family_style` ENABLE KEYS */;

-- 导出  表 yungu.t_file 结构
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE IF NOT EXISTS `t_file` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `secrecy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_file 的数据：~1 rows (大约)
DELETE FROM `t_file`;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `name`, `size`, `type`, `url`, `f_key`, `location`, `department_id`, `department_title`, `secrecy`) VALUES
	(1427431262871752705, 'admin', '2021-08-17 08:45:08', 1, 'admin', '2021-08-17 08:45:08', '卡通一寸照.png', 134919, 'image/png', 'C:\\system-file/2021/8/17/04efc73013db44db899ccc8121eca9b6.png', '04efc73013db44db899ccc8121eca9b6.png', 0, '40322811096469504', '数字经济总部-经营管理委员会', 1),
	(1431566297514250241, 'admin', '2021-08-28 18:36:17', 0, 'admin', '2021-08-28 18:36:17', 'QQ截图20210828183607.png', 7513, 'image/png', '/usr/xboot/oafile/2021/8/28/5d8d579439fe4846b278d4a810700301.png', '5d8d579439fe4846b278d4a810700301.png', 0, '40322811096469504', '数字经济总部-经营管理委员会', 0);
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;

-- 导出  表 yungu.t_folk_activities 结构
DROP TABLE IF EXISTS `t_folk_activities`;
CREATE TABLE IF NOT EXISTS `t_folk_activities` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_folk_activities 的数据：~0 rows (大约)
DELETE FROM `t_folk_activities`;
/*!40000 ALTER TABLE `t_folk_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_folk_activities` ENABLE KEYS */;

-- 导出  表 yungu.t_get_file_audit 结构
DROP TABLE IF EXISTS `t_get_file_audit`;
CREATE TABLE IF NOT EXISTS `t_get_file_audit` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `step1` int(11) NOT NULL,
  `step2` int(11) NOT NULL,
  `step3` int(11) NOT NULL,
  `step4` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_get_file_audit 的数据：~1 rows (大约)
DELETE FROM `t_get_file_audit`;
/*!40000 ALTER TABLE `t_get_file_audit` DISABLE KEYS */;
INSERT INTO `t_get_file_audit` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `department_id`, `department_title`, `file_type`, `flag`, `position`, `reason`, `step1`, `step2`, `step3`, `step4`, `user_id`, `user_name`, `file_id`, `file_name`, `file_url`) VALUES
	('1427431796450136064', 'admin', '2021-08-17 08:47:15.353000', 0, 'admin', '2021-08-17 08:47:41.842000', '40322811096469504', '经营管理委员会', 1, 1, '开发人员', '测试', 1, 1, 1, 1, '682265633886208', '管理员', '1427431262871752705', '卡通一寸照.png', 'C:\\system-file/2021/8/17/04efc73013db44db899ccc8121eca9b6.png');
/*!40000 ALTER TABLE `t_get_file_audit` ENABLE KEYS */;

-- 导出  表 yungu.t_governance_effectiveness 结构
DROP TABLE IF EXISTS `t_governance_effectiveness`;
CREATE TABLE IF NOT EXISTS `t_governance_effectiveness` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_governance_effectiveness 的数据：~0 rows (大约)
DELETE FROM `t_governance_effectiveness`;
/*!40000 ALTER TABLE `t_governance_effectiveness` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_governance_effectiveness` ENABLE KEYS */;

-- 导出  表 yungu.t_learning_materials 结构
DROP TABLE IF EXISTS `t_learning_materials`;
CREATE TABLE IF NOT EXISTS `t_learning_materials` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_learning_materials 的数据：~0 rows (大约)
DELETE FROM `t_learning_materials`;
/*!40000 ALTER TABLE `t_learning_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_learning_materials` ENABLE KEYS */;

-- 导出  表 yungu.t_leave 结构
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE IF NOT EXISTS `t_leave` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` int(11) unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_leave 的数据：~0 rows (大约)
DELETE FROM `t_leave`;
/*!40000 ALTER TABLE `t_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_leave` ENABLE KEYS */;

-- 导出  表 yungu.t_legal_counsel 结构
DROP TABLE IF EXISTS `t_legal_counsel`;
CREATE TABLE IF NOT EXISTS `t_legal_counsel` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_legal_counsel 的数据：~0 rows (大约)
DELETE FROM `t_legal_counsel`;
/*!40000 ALTER TABLE `t_legal_counsel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_legal_counsel` ENABLE KEYS */;

-- 导出  表 yungu.t_log 结构
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE IF NOT EXISTS `t_log` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) unsigned DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` tinyint(1) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_log 的数据：~25 rows (大约)
DELETE FROM `t_log`;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `cost_time`, `ip`, `ip_info`, `name`, `request_param`, `request_type`, `request_url`, `username`, `log_type`, `device`) VALUES
	(1406517591316500480, NULL, '2021-06-20 15:41:40', 0, NULL, '2021-06-20 15:41:40', 206, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"KG1Y","saveLogin":"true","captchaId":"47008b9107be4aceb2ad11091aaa36f7","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406517642902245376, NULL, '2021-06-20 15:41:53', 0, NULL, '2021-06-20 15:41:53', 46, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"YEEA","saveLogin":"true","captchaId":"c518ac38cdfa480d98d29c3f3269033d","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406517818471616512, NULL, '2021-06-20 15:42:34', 0, NULL, '2021-06-20 15:42:34', 45, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ncvs","saveLogin":"true","captchaId":"6565b8afa3c94a939b2690c9bbe2ff25","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406518158306709504, NULL, '2021-06-20 15:43:56', 0, NULL, '2021-06-20 15:43:56', 110, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"PDT7","saveLogin":"true","captchaId":"1b03bc46618d4d26b94f8098b17a3224","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406518483310743552, NULL, '2021-06-20 15:45:13', 0, NULL, '2021-06-20 15:45:13', 69, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"YRQH","saveLogin":"true","captchaId":"b437f143ad8f44ff8d7427ca5771a81b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406518708138020864, NULL, '2021-06-20 15:46:07', 0, NULL, '2021-06-20 15:46:07', 60, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OSYM","saveLogin":"true","captchaId":"6079ba596c57433399a2b3b1a4f8c51f","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406518846768156672, NULL, '2021-06-20 15:46:40', 0, NULL, '2021-06-20 15:46:40', 88, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"KHZH","saveLogin":"true","captchaId":"2fd0121e4a5f4edcbf458d714f75bb38","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406519159159918592, NULL, '2021-06-20 15:47:54', 0, NULL, '2021-06-20 15:47:54', 51, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"URXS","saveLogin":"true","captchaId":"8f053e34c6ae4e19afab2938d075c17e","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406520016609873920, NULL, '2021-06-20 15:51:19', 0, NULL, '2021-06-20 15:51:19', 63, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"7CVZ","saveLogin":"true","captchaId":"0ea07732415048c193fbb452260b3be1","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406520651539419136, NULL, '2021-06-20 15:53:50', 0, NULL, '2021-06-20 15:53:50', 56, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OXOW","saveLogin":"true","captchaId":"2a7b2f14ef4a444eaf7011da21c61d68","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406522028940464128, NULL, '2021-06-20 15:59:18', 0, NULL, '2021-06-20 15:59:18', 55, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"HHPA","saveLogin":"true","captchaId":"6e58b7ce9a9c442b99ca455812eadc58","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406857597465792512, NULL, '2021-06-21 14:12:44', 0, NULL, '2021-06-21 14:12:44', 217, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ws5z","saveLogin":"true","captchaId":"1ae4a3f68dc44265a3db6d4461e4bba3","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406857666600505344, NULL, '2021-06-21 14:13:01', 0, NULL, '2021-06-21 14:13:01', 76, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"p2wd","saveLogin":"true","captchaId":"974d00559a6a41c0b22ebb5640c41cfc","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1406868658533306368, NULL, '2021-06-21 14:56:41', 0, NULL, '2021-06-21 14:56:41', 99, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"EK2Z","saveLogin":"true","captchaId":"b6da85ab37184793a245f8a42ce1e3f3","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 91.0.4472.101 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1420343572816859136, NULL, '2021-07-28 19:21:11', 0, NULL, '2021-07-28 19:21:11', 273, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"KHG8","saveLogin":"true","captchaId":"30a261d22e854bee803744e043d84cd1","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.107 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1420343632656994304, NULL, '2021-07-28 19:21:25', 0, NULL, '2021-07-28 19:21:25', 63, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"EFXK","saveLogin":"true","captchaId":"582d17ad7a8e418ba26c0d66775d1c73","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.107 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1422164670197927936, NULL, '2021-08-02 19:57:35', 0, NULL, '2021-08-02 19:57:35', 254, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"7MTU","saveLogin":"true","captchaId":"5ddbc9cc78a847509ba82ff43c050e82","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.107 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1422355322437242880, NULL, '2021-08-03 08:35:10', 0, NULL, '2021-08-03 08:35:10', 274, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"qbqh","saveLogin":"true","captchaId":"242ff36593c5498da2d5063f62894987","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.107 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1423905026643988480, NULL, '2021-08-07 15:13:08', 0, NULL, '2021-08-07 15:13:08', 199, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"6ZNX","saveLogin":"true","captchaId":"b9c62a3fbd4b4160a58da5ce399e95c5","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1423905088958763008, NULL, '2021-08-07 15:13:23', 0, NULL, '2021-08-07 15:13:23', 57, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"2CVV","saveLogin":"true","captchaId":"76635122d52b4437bd304e2356275a1c","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1423920136909361152, NULL, '2021-08-07 16:13:11', 0, NULL, '2021-08-07 16:13:11', 87, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"JAMP","saveLogin":"true","captchaId":"73132c4f92f9471bbccf4a6a68078a75","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1424171478974337024, NULL, '2021-08-08 08:51:55', 0, NULL, '2021-08-08 08:51:55', 283, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ypdx","saveLogin":"true","captchaId":"d737a0cb30124f9dbbd9f67a3ea94a92","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1424185304335650816, NULL, '2021-08-08 09:46:52', 0, NULL, '2021-08-08 09:46:52', 223, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"sdyh","saveLogin":"true","captchaId":"34bbf25a177a4fc4a114990598dce203","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1424186291012112384, NULL, '2021-08-08 09:50:47', 0, NULL, '2021-08-08 09:50:47', 90, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"q1u3","saveLogin":"true","captchaId":"6b8823ae9a114881aded76b76731692b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1424255214025838592, NULL, '2021-08-08 14:24:39', 0, NULL, '2021-08-08 14:24:39', 222, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"VQ1M","saveLogin":"true","captchaId":"155702ff101a45b296bb888a6e47fedb","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427098083539423232, NULL, '2021-08-16 10:41:12', 0, NULL, '2021-08-16 10:41:12', 263, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"RHFT","saveLogin":"true","captchaId":"33019bf2f61b4fc5a646f55af89d1443","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427098153563328512, NULL, '2021-08-16 10:41:29', 0, NULL, '2021-08-16 10:41:29', 48, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ZP2P","saveLogin":"true","captchaId":"7cd09474469c47ca8273804f2b1f415a","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427209833391722496, NULL, '2021-08-16 18:05:15', 0, NULL, '2021-08-16 18:05:15', 68, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"wzsk","saveLogin":"true","captchaId":"5b5a5b77a2374f45ba1050ad64db53fd","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427210869338673152, NULL, '2021-08-16 18:09:22', 0, NULL, '2021-08-16 18:09:22', 52, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OXHN","saveLogin":"true","captchaId":"052ff30da96940a7a9d72e7aa846420b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427211215419084800, NULL, '2021-08-16 18:10:45', 0, NULL, '2021-08-16 18:10:45', 56, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"YYXK","saveLogin":"true","captchaId":"8a49caabf11f410dbe7ab93fb2263861","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427214156607655936, NULL, '2021-08-16 18:22:26', 0, NULL, '2021-08-16 18:22:26', 97, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"DAQS","saveLogin":"true","captchaId":"66c63480d3b746ad82c91f348f99bb2b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427219661648433152, NULL, '2021-08-16 18:44:19', 0, NULL, '2021-08-16 18:44:19', 252, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"DPAE","saveLogin":"true","captchaId":"a3a9606c1a4a42f3bf67348232a39085","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1427430212496396288, NULL, '2021-08-17 08:40:58', 0, NULL, '2021-08-17 08:40:58', 256, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"K1BE","saveLogin":"true","captchaId":"63c4942609274284bac8b90c8a75c22a","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1431563719170723840, NULL, '2021-08-28 18:26:03', 0, NULL, '2021-08-28 18:26:03', 28, '122.224.37.226', '未知', '登录系统', '{"password":"你是看不见我的","code":"svcg","saveLogin":"true","captchaId":"2aaaec4697cb47ccb358d1c40e2af2b6","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1431567270596972544, NULL, '2021-08-28 18:40:09', 0, NULL, '2021-08-28 18:40:09', 72, '122.224.37.226', '未知', '登录系统', '{"password":"你是看不见我的","code":"X8NY","saveLogin":"true","captchaId":"995fca7936534a0eb4d9dfeabeaab430","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1431854718396796928, NULL, '2021-08-29 13:42:22', 0, NULL, '2021-08-29 13:42:22', 312, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OZNJ","saveLogin":"true","captchaId":"3b3ebd606d5b42cba058d4b3e8d850a5","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端'),
	(1431861582543065088, NULL, '2021-08-29 14:09:39', 0, NULL, '2021-08-29 14:09:39', 63, '122.224.37.226', '未知', '登录系统', '{"password":"你是看不见我的","code":"W1QT","saveLogin":"true","captchaId":"10e7d42d930145a9bb5fdd9e903ec384","username":"admin"}', 'POST', '/xboot/login', 'admin', 1, 'Chrome 92.0.4515.131 | Windows Windows 10 or Windows Server 2016 | PC端');
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;

-- 导出  表 yungu.t_meeting 结构
DROP TABLE IF EXISTS `t_meeting`;
CREATE TABLE IF NOT EXISTS `t_meeting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_meeting 的数据：~0 rows (大约)
DELETE FROM `t_meeting`;
/*!40000 ALTER TABLE `t_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_meeting` ENABLE KEYS */;

-- 导出  表 yungu.t_message 结构
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_send` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4,
  `is_template` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_message 的数据：~5 rows (大约)
DELETE FROM `t_message`;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `create_send`, `title`, `type`, `content`, `is_template`) VALUES
	(43615268366192640, 'admin', '2018-08-19 22:43:51', 0, 'admin', '2021-01-01 14:49:39', b'1', '欢迎您注册账号使用XBoot 点我查看使用须知', '系统公告', '<p style="text-align: center;">XBoot是很棒的Web前后端分离开发平台，开源版本请遵循GPL v3.0开源协议，不得闭源，商用需求请联系作者签署授权协议。</p><p style="text-align: center;">捐赠获取完整版：<a href="http://xpay.exrick.cn/pay?xboot" target="_blank" style="background-color: rgb(255, 255, 255);">立即去捐赠获取</a></p><p style="text-align: center;"><img src="https://i.loli.net/2018/08/24/5b801c8652227.png" style="max-width:150px;"><br></p><p style="text-align: center;">手机扫一扫支付</p><p style="text-align: center;">获取商用授权：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1012139570&amp;site=qq&amp;menu=yes" target="_blank" style="background-color: rgb(255, 255, 255);">立即联系作者获取商用授权</a></p>', b'0'),
	(1352138048674074624, 'admin', '2021-01-21 14:16:47', 0, 'admin', '2021-01-22 01:35:38', b'0', '您收到了一个新的委托转办的“${processName}”任务，申请人：${applyer}', '工作流', '<p>${nickname}您好，<span style="font-size: 1em;">您收到了一个新的</span>委托转办的“${processName}”任务，申请人：${nickname}，赶快去系统“工作流程-我的待办”中查看处理吧！</p>', b'1'),
	(1352243408286126080, 'admin', '2021-01-21 21:15:27', 0, 'admin', '2021-01-22 01:35:21', b'0', '您收到了一条新的“${processName}”待办任务，申请人：${applyer}', '工作流', '<p>${nickname}您好，您收到了一条新的“${processName}”待办任务，申请人：${applyer}，赶快去“工作流程-我的待办”处理查看吧<br></p>', b'1'),
	(1352244242726129664, 'admin', '2021-01-21 21:18:46', 0, 'admin', '2021-01-22 01:34:57', b'0', '您申请的“${processName}”任务已审批通过', '工作流', '<p>${nickname}您好，您申请的“${processName}”任务已审批通过，赶快去“工作流程-我的申请”处理查看吧<br></p>', b'1'),
	(1352304101387538432, 'admin', '2021-01-22 01:16:37', 0, 'admin', '2021-01-22 01:33:48', b'0', '${nickname}您好，您申请的“${processName}”任务已被驳回', '工作流', '<p>${nickname}您好，您申请的“${processName}”任务已被驳回，赶快去“工作流程-我的申请”处理查看吧<br></p>', b'1');
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;

-- 导出  表 yungu.t_message_send 结构
DROP TABLE IF EXISTS `t_message_send`;
CREATE TABLE IF NOT EXISTS `t_message_send` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_message_send 的数据：~0 rows (大约)
DELETE FROM `t_message_send`;
/*!40000 ALTER TABLE `t_message_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_message_send` ENABLE KEYS */;

-- 导出  表 yungu.t_online_examination 结构
DROP TABLE IF EXISTS `t_online_examination`;
CREATE TABLE IF NOT EXISTS `t_online_examination` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_online_examination 的数据：~0 rows (大约)
DELETE FROM `t_online_examination`;
/*!40000 ALTER TABLE `t_online_examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_online_examination` ENABLE KEYS */;

-- 导出  表 yungu.t_permission 结构
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE IF NOT EXISTS `t_permission` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `show_always` bit(1) DEFAULT NULL,
  `is_menu` bit(1) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_permission 的数据：~83 rows (大约)
DELETE FROM `t_permission`;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `name`, `parent_id`, `type`, `sort_order`, `component`, `path`, `title`, `icon`, `level`, `button_type`, `status`, `url`, `show_always`, `is_menu`, `is_parent`) VALUES
	(5129710648430592, '', '2018-06-04 19:02:29', 0, 'admin', '2021-08-28 18:26:45', '', 'sys', 125909152017944576, 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '', b'1', NULL, b'1'),
	(5129710648430593, '', '2018-06-04 19:02:32', 0, '', '2018-08-13 15:15:33', '', 'user-manage', 5129710648430592, 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '', b'1', NULL, b'1'),
	(5129710648430594, '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', 5129710648430592, 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '', b'1', NULL, b'1'),
	(5129710648430595, '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', 5129710648430592, 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '', b'1', NULL, b'1'),
	(15701400130424832, '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', 5129710648430593, 1, 1.11, '', '/xboot/user/admin/add*', '添加用户', '', 3, 'add', 0, '', b'1', NULL, NULL),
	(15701915807518720, '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', 5129710648430593, 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL, b'1', NULL, NULL),
	(15708892205944832, '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', 5129710648430593, 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, b'1', NULL, NULL),
	(16678126574637056, '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', 5129710648430593, 1, 1.12, '', '/xboot/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', b'1', NULL, NULL),
	(16678447719911424, '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', 5129710648430593, 1, 1.15, '', '/xboot/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '', b'1', NULL, NULL),
	(16687383932047360, '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', 5129710648430594, 1, 1.21, '', '/xboot/role/save*', '添加角色', '', 3, 'add', 0, '', b'1', NULL, NULL),
	(16689632049631232, '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', 5129710648430594, 1, 1.22, '', '/xboot/role/edit*', '编辑角色', '', 3, 'edit', 0, '', b'1', NULL, NULL),
	(16689745006432256, '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', 5129710648430594, 1, 1.23, '', '/xboot/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '', b'1', NULL, NULL),
	(16689883993083904, NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, 5129710648430594, 1, 1.24, NULL, '/xboot/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL, b'1', NULL, NULL),
	(16690313745666048, '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', 5129710648430594, 1, 1.25, '', '/xboot/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', b'1', NULL, NULL),
	(16694861252005888, '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', 5129710648430595, 1, 1.31, '', '/xboot/permission/add*', '添加菜单', '', 3, 'add', 0, '', b'1', NULL, NULL),
	(16695107491205120, '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', 5129710648430595, 1, 1.32, '', '/xboot/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', b'1', NULL, NULL),
	(16695243126607872, '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', 5129710648430595, 1, 1.33, '', '/xboot/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '', b'1', NULL, NULL),
	(25014528525733888, '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', 5129710648430593, 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', b'1', NULL, NULL),
	(40238597734928384, '', '2018-08-10 15:06:10', 0, 'admin', '2020-12-10 02:21:33', '', 'department-manage', 5129710648430592, 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, '', b'1', NULL, b'1'),
	(41363147411427328, '', '2018-08-13 17:34:43', 0, 'admin', '2021-08-16 19:22:41', '', 'log-manage', 1427229274817040385, 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '日志管理', 'md-list-box', 2, '', 0, '', b'1', NULL, b'1'),
	(41363537456533504, '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', 41363147411427328, 1, 2.11, '', '/xboot/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '', b'1', NULL, NULL),
	(41364927394353152, '', '2018-08-13 17:41:48', 0, 'admin', '2020-12-11 16:32:40', '', '', 41363147411427328, 1, 2.12, '', '/xboot/log/delAll*', '清空日志', '', 3, 'clear', 0, '', b'1', NULL, NULL),
	(45235621697949696, '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', 40238597734928384, 1, 1.21, '', '/xboot/department/add*', '添加部门', '', 3, 'add', 0, '', b'1', NULL, NULL),
	(45235787867885568, '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', 40238597734928384, 1, 1.22, '', '/xboot/department/edit*', '编辑部门', '', 3, 'edit', 0, '', b'1', NULL, NULL),
	(45235939278065664, NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', 40238597734928384, 1, 1.23, '', '/xboot/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL, b'1', NULL, NULL),
	(56309618086776832, '', '2018-09-23 23:26:40', 0, 'admin', '2021-08-16 19:26:28', '', 'oss-manage', 1427229525732888577, 0, 1.40, 'sys/oss-manage/ossManage', 'oss-manage', '普通文件档案', 'ios-folder', 2, '', 0, '', b'1', NULL, b'1'),
	(56898976661639168, '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', 5129710648430593, 1, 1.17, '', '/xboot/user/importData*', '导入用户', '', 3, 'input', 0, '', b'1', NULL, NULL),
	(57212882168844288, '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', 56309618086776832, 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '', b'1', NULL, NULL),
	(58480609315524608, '', '2018-09-29 23:13:24', 0, 'admin', '2021-06-21 14:19:55', '', 'setting', 5129710648430592, 0, 1.90, 'sys/setting-manage/settingManage', 'setting', '系统配置', 'ios-settings-outline', 2, '', 0, '', b'1', NULL, b'1'),
	(61394706252173312, NULL, '2018-10-08 00:12:59', 0, NULL, '2018-10-08 00:12:59', NULL, '', 58480609315524608, 1, 1.81, '', '/xboot/setting/seeSecret/**', '查看私密配置', '', 3, 'view', 0, NULL, b'1', NULL, NULL),
	(61417744146370560, '', '2018-10-08 01:44:32', 0, '', '2018-10-08 01:50:03', '', '', 58480609315524608, 1, 1.82, '', '/xboot/setting/*/set*', '编辑配置', '', 3, 'edit', 0, '', b'1', NULL, NULL),
	(61560041605435392, NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', 56309618086776832, 1, 1.42, '', '/xboot/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL, b'1', NULL, NULL),
	(61560275261722624, NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', 56309618086776832, 1, 1.43, '', '/xboot/file/copy*', '复制文件', '', 3, 'edit', 0, NULL, b'1', NULL, NULL),
	(61560480518377472, NULL, '2018-10-08 11:11:43', 0, NULL, '2018-10-08 11:11:43', NULL, '', 56309618086776832, 1, 1.44, '', '/xboot/file/delete/*', '删除文件', '', 3, 'delete', 0, NULL, b'1', NULL, NULL),
	(75002207560273920, 'admin', '2018-11-14 13:24:21', 0, 'admin', '2018-11-20 20:06:22', '', 'dict', 5129710648430592, 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', 2, '', 0, '', b'1', NULL, b'1'),
	(76215889006956544, 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', 75002207560273920, 1, 1.81, '', '/xboot/dict/add*', '添加字典', '', 3, 'add', 0, '', b'1', NULL, NULL),
	(76216071333351424, 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', 75002207560273920, 1, 1.82, '', '/xboot/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL, b'1', NULL, NULL),
	(76216264070008832, 'admin', '2018-11-17 21:48:34', 0, 'admin', '2018-11-17 21:48:34', NULL, '', 75002207560273920, 1, 1.83, '', '/xboot/dict/delByIds/**', '删除字典', '', 3, 'delete', 0, NULL, b'1', NULL, NULL),
	(76216459709124608, 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', 75002207560273920, 1, 1.84, '', '/xboot/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL, b'1', NULL, NULL),
	(76216594207870976, 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', 75002207560273920, 1, 1.85, '', '/xboot/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL, b'1', NULL, NULL),
	(76216702639017984, 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', 75002207560273920, 1, 1.86, '', '/xboot/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL, b'1', NULL, NULL),
	(125909152017944576, 'admin', '2019-04-04 00:50:22', 0, 'admin', '2021-08-16 19:25:19', 'undefined', 'xboot', 0, -1, 0.00, 'false', '', '系统管理', 'md-home', 0, '', 0, '', b'1', b'1', b'1'),
	(156365156580855808, 'admin', '2019-06-27 01:51:39', 0, 'admin', '2019-06-27 01:51:39', NULL, '', 5129710648430593, 1, 1.18, '', '/xboot/user/resetPass', '重置密码', '', 3, 'other', 0, NULL, b'1', NULL, NULL),
	(1422168282022154240, 'admin', '2021-08-02 20:11:56', 0, 'admin', '2021-08-02 20:11:56', NULL, 'vueTemp', 5129710648430592, 0, 8.00, 'sys/oneJavaVue/tableGenerator', 'vueTemp', 'Vue', 'md-analytics', 2, '', 0, NULL, b'1', b'1', b'0'),
	(1427156489642053632, 'admin', '2021-08-16 14:33:17', 0, 'admin', '2021-08-16 19:26:50', '', 'oss-manage1', 1427229525732888577, 0, 1.50, 'sys/oss-manage/ossManage1', 'oss-manage1', '保密文件档案', 'ios-boat', 2, '', 0, '', b'1', b'1', b'1'),
	(1427156719879983105, 'admin', '2021-08-16 14:34:12', 0, 'admin', '2021-08-16 14:34:12', NULL, '', 1427156489642053632, 1, 1.00, '', '无', '上传保密文件', '', 3, 'upload', 0, NULL, b'1', b'1', b'0'),
	(1427156815107461121, 'admin', '2021-08-16 14:34:35', 0, 'admin', '2021-08-16 14:34:35', NULL, '', 1427156489642053632, 1, 2.00, '', '/xboot/file/rename*', '重命名保密文件', '', 3, 'edit', 0, NULL, b'1', b'1', b'0'),
	(1427156888222568448, 'admin', '2021-08-16 14:34:52', 0, 'admin', '2021-08-16 14:34:52', NULL, '', 1427156489642053632, 1, 3.00, '', '/xboot/file/copy*', '复制保密文件', '', 3, 'edit', 0, NULL, b'1', b'1', b'0'),
	(1427156946070409216, 'admin', '2021-08-16 14:35:06', 0, 'admin', '2021-08-16 14:35:06', NULL, '', 1427156489642053632, 1, 4.00, '', '/xboot/file/delete/*', '删除保密文件', '', 3, 'delete', 0, NULL, b'1', b'1', b'0'),
	(1427174656896536576, 'admin', '2021-08-16 15:45:29', 0, 'admin', '2021-08-16 19:27:38', '', 'file-audit', 1427230507636232193, 0, 10.00, 'sys/file-audit/index', 'file-audit', '文件申请审批', 'md-alert', 2, '', 0, '', b'1', b'1', b'0'),
	(1427189277841821696, 'admin', '2021-08-16 16:43:34', 0, 'admin', '2021-08-16 19:27:48', '', 'file-audit1', 1427230507636232193, 0, 11.00, 'sys/file-audit/my', 'file-audit1', '我的文件申请', 'md-aperture', 2, '', 0, '', b'1', b'1', b'0'),
	(1427222058772860929, 'admin', '2021-08-16 18:53:50', 0, 'admin', '2021-08-16 19:21:46', '', 'siCheGongYong', 0, -1, 3.00, '', '', '私车公用', 'ios-car', 0, '', 0, '', b'1', b'1', b'1'),
	(1427222215434309633, 'admin', '2021-08-16 18:54:27', 0, 'admin', '2021-08-16 18:55:00', NULL, 'scgy', 1427222058772860929, 0, 1.00, 'Main', '/scgy', '私车公用', 'md-cart', 1, '', 0, NULL, b'1', b'1', b'1'),
	(1427222350520258560, 'admin', '2021-08-16 18:55:00', 0, 'admin', '2021-08-16 18:55:00', NULL, 'carAudit', 1427222215434309633, 0, 1.00, 'zwz/audit/index', 'carAudit', '私车公用审核', 'ios-card', 2, '', 0, NULL, b'1', b'1', b'0'),
	(1427222477083381761, 'admin', '2021-08-16 18:55:30', 0, 'admin', '2021-08-16 18:55:30', NULL, 'carAr', 1427222215434309633, 0, 2.00, 'zwz/car/index', 'carAr', '车辆档案', 'md-car', 2, '', 0, NULL, b'1', b'1', b'0'),
	(1427229156130820097, 'admin', '2021-08-16 19:22:02', 0, 'admin', '2021-08-16 19:23:44', '', 'dagl', 0, -1, 2.00, '', '', '档案管理', 'md-battery-full', 2, '', 0, '', b'1', b'1', b'0'),
	(1427229207863365633, 'admin', '2021-08-16 19:22:14', 0, 'admin', '2021-08-16 19:22:30', NULL, 'xtjk', 0, -1, 4.00, NULL, NULL, '系统监控', 'md-battery-charging', 0, NULL, 0, NULL, b'1', b'1', b'1'),
	(1427229274817040385, 'admin', '2021-08-16 19:22:30', 0, 'admin', '2021-08-16 19:22:30', NULL, 'systemLog', 1427229207863365633, 0, 1.00, 'Main', '/systemLog', '系统日志', 'md-analytics', 1, '', 0, NULL, b'1', b'1', b'0'),
	(1427229525732888577, 'admin', '2021-08-16 19:23:30', 0, 'admin', '2021-08-16 19:23:30', NULL, 'fileArch', 1427230044878671873, 0, 1.00, 'Main', '/fileArch', '文件档案', 'md-aperture', 1, '', 0, NULL, b'1', b'1', b'0'),
	(1427230044878671873, 'admin', '2021-08-16 19:25:34', 0, 'admin', '2021-08-16 19:27:24', NULL, 'dangAn', 0, -1, 2.00, NULL, NULL, '档案管理', 'md-at', 0, NULL, 0, NULL, b'1', b'1', b'1'),
	(1427230507636232193, 'admin', '2021-08-16 19:27:24', 0, 'admin', '2021-08-16 19:27:24', NULL, 'fileAuditPage', 1427230044878671873, 0, 2.00, 'Main', '/fileAuditPage', '文件审批', 'ios-bonfire', 1, '', 0, NULL, b'1', b'1', b'0');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;

-- 导出  表 yungu.t_quartz_job 结构
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE IF NOT EXISTS `t_quartz_job` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_class_name` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_quartz_job 的数据：~0 rows (大约)
DELETE FROM `t_quartz_job`;
/*!40000 ALTER TABLE `t_quartz_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_quartz_job` ENABLE KEYS */;

-- 导出  表 yungu.t_role 结构
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_role 的数据：~2 rows (大约)
DELETE FROM `t_role`;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `del_flag`, `default_role`, `description`, `data_type`) VALUES
	(496138616573952, '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0),
	(496138616573953, '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- 导出  表 yungu.t_role_department 结构
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE IF NOT EXISTS `t_role_department` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_role_department 的数据：~0 rows (大约)
DELETE FROM `t_role_department`;
/*!40000 ALTER TABLE `t_role_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role_department` ENABLE KEYS */;

-- 导出  表 yungu.t_role_permission 结构
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE IF NOT EXISTS `t_role_permission` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_role_permission 的数据：~60 rows (大约)
DELETE FROM `t_role_permission`;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `permission_id`, `role_id`) VALUES
	(1427230726373380096, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 125909152017944576, 496138616573952),
	(1427230726373380097, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 5129710648430592, 496138616573952),
	(1427230726373380098, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 5129710648430593, 496138616573952),
	(1427230726373380099, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 15701400130424832, 496138616573952),
	(1427230726373380100, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16678126574637056, 496138616573952),
	(1427230726373380101, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 15701915807518720, 496138616573952),
	(1427230726373380102, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 15708892205944832, 496138616573952),
	(1427230726373380103, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16678447719911424, 496138616573952),
	(1427230726373380104, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 25014528525733888, 496138616573952),
	(1427230726373380105, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 56898976661639168, 496138616573952),
	(1427230726373380106, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 156365156580855808, 496138616573952),
	(1427230726373380107, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 40238597734928384, 496138616573952),
	(1427230726373380108, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 45235621697949696, 496138616573952),
	(1427230726373380109, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 45235787867885568, 496138616573952),
	(1427230726373380110, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 45235939278065664, 496138616573952),
	(1427230726373380111, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 5129710648430594, 496138616573952),
	(1427230726373380112, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16687383932047360, 496138616573952),
	(1427230726373380113, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16689632049631232, 496138616573952),
	(1427230726373380114, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16689745006432256, 496138616573952),
	(1427230726373380115, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16689883993083904, 496138616573952),
	(1427230726373380116, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16690313745666048, 496138616573952),
	(1427230726373380117, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 5129710648430595, 496138616573952),
	(1427230726373380118, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16694861252005888, 496138616573952),
	(1427230726373380119, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16695107491205120, 496138616573952),
	(1427230726373380120, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 16695243126607872, 496138616573952),
	(1427230726373380121, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 75002207560273920, 496138616573952),
	(1427230726373380122, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76215889006956544, 496138616573952),
	(1427230726373380123, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76216071333351424, 496138616573952),
	(1427230726373380124, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76216264070008832, 496138616573952),
	(1427230726373380125, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76216459709124608, 496138616573952),
	(1427230726373380126, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76216594207870976, 496138616573952),
	(1427230726373380127, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 76216702639017984, 496138616573952),
	(1427230726373380128, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 58480609315524608, 496138616573952),
	(1427230726373380129, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 61394706252173312, 496138616573952),
	(1427230726373380130, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 61417744146370560, 496138616573952),
	(1427230726373380131, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1422168282022154240, 496138616573952),
	(1427230726373380132, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427230044878671873, 496138616573952),
	(1427230726373380133, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427229525732888577, 496138616573952),
	(1427230726373380134, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 56309618086776832, 496138616573952),
	(1427230726373380135, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 57212882168844288, 496138616573952),
	(1427230726373380136, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 61560041605435392, 496138616573952),
	(1427230726373380137, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 61560275261722624, 496138616573952),
	(1427230726373380138, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 61560480518377472, 496138616573952),
	(1427230726373380139, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427156489642053632, 496138616573952),
	(1427230726373380140, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427156719879983105, 496138616573952),
	(1427230726373380141, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427156815107461121, 496138616573952),
	(1427230726373380142, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427156888222568448, 496138616573952),
	(1427230726373380143, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427156946070409216, 496138616573952),
	(1427230726373380144, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427230507636232193, 496138616573952),
	(1427230726373380145, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427174656896536576, 496138616573952),
	(1427230726373380146, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427189277841821696, 496138616573952),
	(1427230726373380147, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427222058772860929, 496138616573952),
	(1427230726373380148, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427222215434309633, 496138616573952),
	(1427230726373380149, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427222350520258560, 496138616573952),
	(1427230726373380150, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427222477083381761, 496138616573952),
	(1427230726373380151, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427229207863365633, 496138616573952),
	(1427230726373380152, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 1427229274817040385, 496138616573952),
	(1427230726373380153, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 41363147411427328, 496138616573952),
	(1427230726373380154, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 41363537456533504, 496138616573952),
	(1427230726373380155, 'admin', '2021-08-16 19:28:17', 0, 'admin', '2021-08-16 19:28:17', 41364927394353152, 496138616573952);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;

-- 导出  表 yungu.t_setting 结构
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE IF NOT EXISTS `t_setting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_setting 的数据：~3 rows (大约)
DELETE FROM `t_setting`;
/*!40000 ALTER TABLE `t_setting` DISABLE KEYS */;
INSERT INTO `t_setting` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `value`) VALUES
	('LOCAL_OSS', 'admin', '2021-06-21 14:20:58', 0, 'admin', '2021-08-28 18:39:07', '{"serviceName":"LOCAL_OSS","accessKey":"","secretKey":"**********","endpoint":"125.124.223.192:8088/xboot/file/view","bucket":"","http":"http://","bucketRegion":"","filePath":"/usr/xboot/oafile"}'),
	('OSS_USED', 'admin', '2021-06-21 14:20:58', 0, 'admin', '2021-06-21 14:20:58', 'LOCAL_OSS'),
	('OTHER_SETTING', 'admin', '2021-06-21 14:21:02', 0, 'admin', '2021-06-21 14:21:02', '{"domain":"http://127.0.0.1:8888","ssoDomain":"","blacklist":""}');
/*!40000 ALTER TABLE `t_setting` ENABLE KEYS */;

-- 导出  表 yungu.t_social 结构
DROP TABLE IF EXISTS `t_social`;
CREATE TABLE IF NOT EXISTS `t_social` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `platform` tinyint(1) unsigned DEFAULT NULL,
  `relate_username` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relate_open_id` (`open_id`,`platform`) USING BTREE,
  UNIQUE KEY `relate_username` (`relate_username`,`platform`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_social 的数据：~0 rows (大约)
DELETE FROM `t_social`;
/*!40000 ALTER TABLE `t_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_social` ENABLE KEYS */;

-- 导出  表 yungu.t_stop_word 结构
DROP TABLE IF EXISTS `t_stop_word`;
CREATE TABLE IF NOT EXISTS `t_stop_word` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_stop_word 的数据：~0 rows (大约)
DELETE FROM `t_stop_word`;
/*!40000 ALTER TABLE `t_stop_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_stop_word` ENABLE KEYS */;

-- 导出  表 yungu.t_task_disclosure 结构
DROP TABLE IF EXISTS `t_task_disclosure`;
CREATE TABLE IF NOT EXISTS `t_task_disclosure` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_task_disclosure 的数据：~0 rows (大约)
DELETE FROM `t_task_disclosure`;
/*!40000 ALTER TABLE `t_task_disclosure` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_task_disclosure` ENABLE KEYS */;

-- 导出  表 yungu.t_universal_law 结构
DROP TABLE IF EXISTS `t_universal_law`;
CREATE TABLE IF NOT EXISTS `t_universal_law` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_universal_law 的数据：~0 rows (大约)
DELETE FROM `t_universal_law`;
/*!40000 ALTER TABLE `t_universal_law` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_universal_law` ENABLE KEYS */;

-- 导出  表 yungu.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_user 的数据：~1 rows (大约)
DELETE FROM `t_user`;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `address`, `avatar`, `description`, `email`, `mobile`, `nickname`, `password`, `sex`, `status`, `type`, `username`, `del_flag`, `department_id`, `street`, `pass_strength`, `department_title`, `birth`, `mobile2`, `position`) VALUES
	(682265633886208, '', '2018-05-01 16:13:51', 'admin', '2021-08-16 17:53:54', '北京市,市辖区,东城区', 'https://ooo.0o0.ooo/2019/04/28/5cc5a71a6e3b6.png', '我是大帅逼', 'admin@exrick.cn', '17857058888', '管理员', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, 40322811096469504, '天府1街', '弱', '经营管理委员会', '2020-04-15 00:00:00.000000', '', '开发人员'),
	(1427143647157161989, 'admin', '2021-08-16 13:42:15', 'admin', '2021-08-16 13:42:15', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13688888888@163.com', '13688888888', '黄献锋', '$2a$10$6ipQhXQlUWVd7Qb/FeWNJ.BjnK0aEQ83xw/aS3NMm8P39f6p8B7Ha', NULL, 0, 0, '13688888888', 0, 40322811096469504, NULL, NULL, '经营管理委员会', NULL, NULL, '主任、董事长'),
	(1427143647937302528, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13858882626@163.com', '13858882626', '孙永福', '$2a$10$ZrsABC/WS3t5hbW5A1nUFOSP6sY.Cxn.KA8gtEN/oThqVYl46I0Ui', NULL, 0, 0, '13858882626', 0, 40322811096469504, NULL, NULL, '经营管理委员会', NULL, NULL, '高级顾问'),
	(1427143648637751297, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18640980872@163.com', '18640980872', '杨世伟', '$2a$10$zXA/W9VItMACVrSlbE51l.FexVBf1Kd17D12C7U6kmjuU8OLozsi2', NULL, 0, 0, '18640980872', 0, 40322811096469504, NULL, NULL, '经营管理委员会', NULL, '19906505850', '区域总经理'),
	(1427143649250119681, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13819821218@163.com', '13819821218', '卢钢', '$2a$10$aCnkPfNc1EhAw4cAqa03JO.EVccqxfyO2vw2IyeiBeZ0L1ZDD2m9S', NULL, 0, 0, '13819821218', 0, 40322811096469504, NULL, NULL, '经营管理委员会', NULL, '19906505959', '区域副总经理兼运营管理部、设计工程部总监'),
	(1427143649845710849, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15962182649@163.com', '15962182649', '李国红', '$2a$10$z4h6N.aQg8HG1fVb7QuA1u8zEH/gTlp3TewKP.RjF7X5KwhImMDdO', NULL, 0, 0, '15962182649', 0, 40322811096469504, NULL, NULL, '经营管理委员会', NULL, NULL, '区域副总经理兼成本招采部总监'),
	(1427143650428719105, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13857779510@163.com', '13857779510', '陈东', '$2a$10$DbwyRNMAyPZJY2zhnQ6UqOkhC10wE6AsjrjbEoRmMTyBXVl21.fUG', NULL, 0, 0, '13857779510', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '19906505610', '人力行政经理'),
	(1427143651024310272, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15968756007@163.com', '15968756007', '何小微', '$2a$10$2V389WuvgId.4le.xB7IseF6xWYceKiZLE5o3sPPkmZ2qujrvOE.m', NULL, 0, 0, '15968756007', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '行政总监'),
	(1427143651615707137, 'admin', '2021-08-16 13:42:16', 'admin', '2021-08-16 13:42:16', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18066290596@163.com', '18066290596', '林海凌', '$2a$10$rhQUWgavjQ/wVVeQGV3Gt.HmYu7GnfvIO3B.Bj12xiadqY5cB0Hxi', NULL, 0, 0, '18066290596', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '人力经理'),
	(1427143652211298304, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15858824879@163.com', '15858824879', '陈销', '$2a$10$hCmetYVWQ5LjZX5VRq3IhOZbSb5IYmOi7uouQ9FQkAlsEPqOSUBYu', NULL, 0, 0, '15858824879', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '18957789928', '人力行政主管'),
	(1427143652785917953, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15167182965@163.com', '15167182965', '马榛江', '$2a$10$Gkh3RXDI0qYedE0cnnJoHu1m2FWYHXuCREf0LOrEbG.yTkxrXimPq', NULL, 0, 0, '15167182965', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '19906505796', '企宣专员'),
	(1427143653356343297, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18257705203@163.com', '18257705203', '王嫣茹', '$2a$10$sG8oQjPWmyFH6mK4bI8VKu8YJWo2k9q398gNiu.BrWp8L17.w0vum', NULL, 0, 0, '18257705203', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '企宣专员'),
	(1427143653939351552, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13868421108@163.com', '13868421108', '邵佩佩', '$2a$10$w.m2GgsvZwAITM0T77NmueJw4TPtuBi56NS3JeyN01eo.RACEC1im', NULL, 0, 0, '13868421108', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '19906505870', '行政主管'),
	(1427143654526554112, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13914094675@163.com', '13914094675', '程方圆', '$2a$10$KJKynwO2e86pwkC7Irpu3.pVS9klmJ8eCJadSxwp0ekshEfyEh/M.', NULL, 0, 0, '13914094675', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '19906505790', '行政文员'),
	(1427143655105368065, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15825677103@163.com', '15825677103', '蔡慕菲', '$2a$10$z8cqvAyJ6FcRVKF4/imRi.3glxourXLro2AoX..YRguJrgmjiUeE6', NULL, 0, 0, '15825677103', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, '19906505781', '行政文员'),
	(1427143655688376320, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13989792521@163.com', '13989792521', '叶浩儒', '$2a$10$3ijLZXIiOmXKZmAyXkw0KOxceMmsQ8xoGt4TZmXZci6b8pEzmwzDO', NULL, 0, 0, '13989792521', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '运营专员'),
	(1427143656275578881, 'admin', '2021-08-16 13:42:17', 'admin', '2021-08-16 13:42:17', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '17367186208@163.com', '17367186208', '林育智', '$2a$10$JK8M1k78.XWSCK6/57lhZuxaYy9eyrXOdnTuS8ovFmeVOCvkK8xba', NULL, 0, 0, '17367186208', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '企宣专员'),
	(1427143656871170048, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13588998057@163.com', '13588998057', '陈乐丹', '$2a$10$y7Xc172HHZRW/acWPatNbuNLXbXQJHw/7OR4fkng4WT1YKjgbxmj6', NULL, 0, 0, '13588998057', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '档案管理员'),
	(1427143657458372609, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18616832891@163.com', '18616832891', '曹友华', '$2a$10$1pFPeZfo96FBVD1ctDWxFeu5MEtnkC3KnN0abr.rk7j3L1do/zIZ6', NULL, 0, 0, '18616832891', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '见习生'),
	(1427143658062352384, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '17350752227@163.com', '17350752227', '王哲岸', '$2a$10$RP0wmOB1DTT.yOfzCCne2etmPr.01gskXFxdxs2f/KeF/11VPWSjK', NULL, 0, 0, '17350752227', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '管培生'),
	(1427143658645360640, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18367897044@163.com', '18367897044', '周潮伟', '$2a$10$/sQOb4DqgtORIFZMo0hJQeaS1lj6pxWsv.2CF.VVd1666siicXz5G', NULL, 0, 0, '18367897044', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '实习生'),
	(1427143659240951808, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15623776595@163.com', '15623776595', '汪雪梅', '$2a$10$NJkjSIU0sZPKtAsRfbKJIO7ESQ24lPwYweFwvxiOR5eQfFUpkG4k2', NULL, 0, 0, '15623776595', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '见习生'),
	(1427143659882680321, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13968729330@163.com', '13968729330', '郑玉茹', '$2a$10$xQzxfd5z0afUinooZ14Ndez7AYVY/.iiFUK4/o3NGh5Ccy8Pv2BVK', NULL, 0, 0, '13968729330', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '管培生'),
	(1427143660457299969, 'admin', '2021-08-16 13:42:18', 'admin', '2021-08-16 13:42:18', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13868755542@163.com', '13868755542', '杨艳艳', '$2a$10$F2hKn1MZN2PzjrdaC1SCsOGJbdvrxiFDRtaN6iZ4maBRHOCwK4qSG', NULL, 0, 0, '13868755542', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '实习生'),
	(1427143661040308225, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18237213987@163.com', '18237213987', '路露', '$2a$10$Tp2fSXwuYqHlQsAI2haj4.q6mYCCSdGQpKR6NVDNK4K6bkVS5b8U2', NULL, 0, 0, '18237213987', 0, 1427099884938465281, NULL, NULL, '综合管理部', NULL, NULL, '实习生'),
	(1427143661631705089, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18320798665@163.com', '18320798665', '于鹤', '$2a$10$FlCaZRElWXWSlnnI8Ewhp.yr1C4L57ztDJNUuBoMsdnrRK8eP/qoK', NULL, 0, 0, '18320798665', 0, 1427099911844925440, NULL, NULL, '法务部', NULL, NULL, '法务经理'),
	(1427143662214713345, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15868879532@163.com', '15868879532', '朱瑶拉', '$2a$10$PjT/fHmokeXQb3cMS0orte/LZFqcZH.ecKZhdYFyhf3JBWjQGcEt6', NULL, 0, 0, '15868879532', 0, 1427099939351171073, NULL, NULL, '运营管理部', NULL, '19906505572', '运营专员'),
	(1427143662801915905, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13819735116@163.com', '13819735116', '董尹乐', '$2a$10$s3UgC7pclZ4fS5CKd/oeZe6C/8gvSBYuhBrUhwT/6.rQxexQLUZ6K', NULL, 0, 0, '13819735116', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, '19906505567', '资金管理部副总监'),
	(1427143663397507073, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13758771357@163.com', '13758771357', '韩文燕', '$2a$10$0Mp7UweC2AbRY/r7NAHVtuCzCaUKSs3BRGt5i.1ZLYZzS7LPTcMka', NULL, 0, 0, '13758771357', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, '19906505568', '（29/34亩）会计'),
	(1427143663993098241, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13868354640@163.com', '13868354640', '蔡璐璐', '$2a$10$b73sa0eCr8rSTvs4zjyPv.NaFYPoiGYF7x2hhRy0zkCYR9dweMbci', NULL, 0, 0, '13868354640', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, NULL, '（29/34亩）出纳'),
	(1427143664576106497, 'admin', '2021-08-16 13:42:19', 'admin', '2021-08-16 13:42:19', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13587766269@163.com', '13587766269', '高丽云', '$2a$10$TmWgwzmUK54gV8QoSZIFtOJmlodOmiI1IeXPK.GgMhiSMQ7FYzmPC', NULL, 0, 0, '13587766269', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, '19906505569', '（80亩）财务经理'),
	(1427143665180086273, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13588950036@163.com', '13588950036', '陈丹', '$2a$10$aNEepmwSXV5SsQOwO7T8EuibBlOUQI1DftU/ZN225KkgtmN4HFAQi', NULL, 0, 0, '13588950036', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, NULL, '（80亩案场）会计助理'),
	(1427143665771483137, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15906775612@163.com', '15906775612', '李路丹', '$2a$10$OCwR13MZDWZkoX8c9HflWe54r0x.iqdO2TLQ3Y2dXApigI2YSjmk.', NULL, 0, 0, '15906775612', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, '19906505583', '（80亩案场）出纳'),
	(1427143666333519873, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15990729539@163.com', '15990729539', '孙旭青', '$2a$10$5mxPmtQRtiV3LCbDOULqm.8gTo3FTxnD5Q5fxhbD3Ug/joE6em1j.', NULL, 0, 0, '15990729539', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, NULL, '（50亩）会计'),
	(1427143666933305345, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15068299382@163.com', '15068299382', '胡舒怡', '$2a$10$2sdfebupRv7zV7vKe.X8iuqGt95TAEJBzI6HQvzOmhzR/g64vSxRK', NULL, 0, 0, '15068299382', 0, 1427099960591126529, NULL, NULL, '资金管理部', NULL, '19906505600', '（50亩）出纳'),
	(1427143667516313600, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15321173175@163.com', '15321173175', '张颖', '$2a$10$dq.PwVobdmq6QBBZmdU.6uHu1ycSEoeBIBeNSbh956MUAU/e8FVIa', NULL, 0, 0, '15321173175', 0, 1427099993612881921, NULL, NULL, '发展策划部', NULL, '19906505768', '发展策划副总监'),
	(1427143668317425664, 'admin', '2021-08-16 13:42:20', 'admin', '2021-08-16 13:42:20', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13968859558@163.com', '13968859558', '王锋', '$2a$10$aukU3q/r3Q2Icp0h3e6gh./p6qGR/1.OfdQrkSi6fIa1RRv/WIycW', NULL, 0, 0, '13968859558', 0, 1427099993612881921, NULL, NULL, '发展策划部', NULL, '19906505585', '前期经理'),
	(1427143669424721921, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13588955899@163.com', '13588955899', '王政', '$2a$10$dBwz0jt9971lWE5i33HHDevWSOjRbKTX9nkyNE2u2XMxuUpeATt2m', NULL, 0, 0, '13588955899', 0, 1427100126320660480, NULL, NULL, '方案设计部', NULL, '19906505899', '方案设计副总监'),
	(1427143670053867521, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18055339950@163.com', '18055339950', '曹放荣', '$2a$10$bkdFv7eWFojY4ey3aXnELu5ZLiiRTTI6mSH9FIvjlqw6E2lmbXaK6', NULL, 0, 0, '18055339950', 0, 1427100126320660480, NULL, NULL, '方案设计部', NULL, '19906505802', '结构设计师'),
	(1427143670699790336, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13910457040@163.com', '13910457040', '郑尧', '$2a$10$niCGz4D/5RISiXT1d4kSOufX1OdpzyFVtHq70ydqlxl4MC15.zYgq', NULL, 0, 0, '13910457040', 0, 1427100126320660480, NULL, NULL, '方案设计部', NULL, '19906505813', '精装设计师'),
	(1427143671295381504, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15901153539@163.com', '15901153539', '邵振', '$2a$10$UhEKBWOzLHfP.4IwFrV0AOcUNTwMfeZQfUGshOpa0ThzmYkAmNTPm', NULL, 0, 0, '15901153539', 0, 1427100126320660480, NULL, NULL, '方案设计部', NULL, '19906505808', '景观设计师'),
	(1427143671907749889, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13968812253@163.com', '13968812253', '周醒黎', '$2a$10$br2dZXaQGltAEg7o1zdDgOq1iKXILqzms8mjsgHt/YfPuSLdw3eDe', NULL, 0, 0, '13968812253', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '19906505595', '成本招采副总监'),
	(1427143672520118272, 'admin', '2021-08-16 13:42:21', 'admin', '2021-08-16 13:42:21', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18658840626@163.com', '18658840626', '卢辉阳', '$2a$10$7cIX75BOqMpt9VI1DnQZ1OISdgUXCVe7dw3p1ZcaF0Hqn.UvTSKYW', NULL, 0, 0, '18658840626', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '18957788228', '招采经理'),
	(1427143673103126529, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13819772822@163.com', '13819772822', '孙琼丹', '$2a$10$Z7iHBFByhtz7Ve4jZz3Tt.Dgco/Xr7ETGSuuUtndIl6LyjG85hncy', NULL, 0, 0, '13819772822', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '18957789891', '土建造价师'),
	(1427143673690329089, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18367872620@163.com', '18367872620', '何曼曼', '$2a$10$axVdW8VyxCGPQFATKY6frOX1R.c4L1jgP17BQbJvSP/7DYUZNQxFi', NULL, 0, 0, '18367872620', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '19906505900', '土建造价师'),
	(1427143674302697472, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18741127877@163.com', '18741127877', '邹春红', '$2a$10$VlHimetJhSs3mJ21baZ19.zY6Hp8IWLTLg9im.TNhcJcbYRPQOxiu', NULL, 0, 0, '18741127877', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '19906505799', '安装造价师'),
	(1427143674915065857, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13736371770@163.com', '13736371770', '陈祎怡', '$2a$10$uIRiA9kZ7Dk6hJcV/c6dr.q5WuiZaTaGzSF6I5hr4CroPdWngb2oC', NULL, 0, 0, '13736371770', 0, 1427100169236779008, NULL, NULL, '成本招采部', NULL, '19906505596', '资料员'),
	(1427143675527434241, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13641459190@163.com', '13641459190', '毛明阳', '$2a$10$qu3PjAb968XTagMYxeCFHOSBJ.oPQQxsY/EZPzQt38bJeCcDXqgjO', NULL, 0, 0, '13641459190', 0, 40389030113710080, NULL, NULL, '总经办', NULL, '18957789920', '总经理'),
	(1427143676118831105, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15858800858@163.com', '15858800858', '尹文琳', '$2a$10$tVA6YAUSbGnP.3OaOjaVie/ILrORlmdmkcUQBADrkdWMJsuSn3S6i', NULL, 0, 0, '15858800858', 0, 40389030113710080, NULL, NULL, '总经办', NULL, NULL, '项目副总经理'),
	(1427143676706033665, 'admin', '2021-08-16 13:42:22', 'admin', '2021-08-16 13:42:22', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13901194052@163.com', '13901194052', '宋东升', '$2a$10$q.jhBG1deG6ei.9Wq2V/I.XbEQjrasQs0ENZ8wi0o6o/cA/XF38am', NULL, 0, 0, '13901194052', 0, 40389030113710080, NULL, NULL, '总经办', NULL, '19906505611', '营销总监'),
	(1427143677310013440, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15068753702@163.com', '15068753702', '黄鑫', '$2a$10$ZQptm6YDQb4c5azFms6QGOHH2pd9tQKSGvO4zOI1q9aEciB3jzFvO', NULL, 0, 0, '15068753702', 0, 40344005342400512, NULL, NULL, '工程部', NULL, '18957788939', '工程经理'),
	(1427143677893021697, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15156859881@163.com', '15156859881', '张洋', '$2a$10$c7aUz0nrnK5kuM.oJiUJPewN1Z7XCVli3YV0jlpMoBzcU9wBMgxSi', NULL, 0, 0, '15156859881', 0, 40344005342400512, NULL, NULL, '工程部', NULL, NULL, '土建工程师'),
	(1427143678476029953, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15088518650@163.com', '15088518650', '蒋晨', '$2a$10$XUKcqU.pBNZzKZ2YRGOOIuMsprJ4aCq.RN4OKlqgctHgkXrv2SNy6', NULL, 0, 0, '15088518650', 0, 40344005342400512, NULL, NULL, '工程部', NULL, NULL, '土建工程师（实习）'),
	(1427143679067426817, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '17681759024@163.com', '17681759024', '蒋阿香', '$2a$10$jelvc3JfhUxIlSSF74ig0O5xOkjUkUy5KZW781DL6ZoCnSBxn.xrm', NULL, 0, 0, '17681759024', 0, 40344005342400512, NULL, NULL, '工程部', NULL, '19906505810', '资料员'),
	(1427143679683989505, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13601994656@163.com', '13601994656', '杨翔', '$2a$10$uJ51sxjK2jcV4rhU.ElYteazeDyEvRMACKlAT0sPqhliHDTdatWFa', NULL, 0, 0, '13601994656', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, NULL, '营销经理'),
	(1427143680283774977, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18668798878@163.com', '18668798878', '余海娅', '$2a$10$we5XtlLP6nCCAI8YjAqSKu5p1gHACB5aOkN3Fi5l5WPJEwOutO.5y', NULL, 0, 0, '18668798878', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, '19906505811', '策划经理'),
	(1427143680883560448, 'admin', '2021-08-16 13:42:23', 'admin', '2021-08-16 13:42:23', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15967459902@163.com', '15967459902', '周利燕', '$2a$10$emxEILJbyqspgiwMzgQ0oO4RGouOHBIAhRsL9qH3uVg1st.3.Igja', NULL, 0, 0, '15967459902', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, NULL, '客服经理'),
	(1427143681521094656, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18136553188@163.com', '18136553188', '余强强', '$2a$10$y.NjCjqnhtwHMiC/FWiRM.5DWn/rt0Ek7B/agl6Q0bW5Ju.u1SDf6', NULL, 0, 0, '18136553188', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, NULL, '销售主管'),
	(1427143682095714305, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18006885922@163.com', '18006885922', '沈斌杰', '$2a$10$lvM.g.jr/6gHiB5THY/W0.58BVwd5WX1.yJKMJb26niwJlVBDj2hu', NULL, 0, 0, '18006885922', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, '18957788931', '置业顾问'),
	(1427143682674528257, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13325987355@163.com', '13325987355', '沈建', '$2a$10$awfh4HOgwnh2/iN1Mu25L.3CK7hsvH0SNpd2oxg2satfqSJHuQ/qa', NULL, 0, 0, '13325987355', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, '18957788377', '置业顾问'),
	(1427143683253342209, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18968826123@163.com', '18968826123', '杨君男', '$2a$10$S3CQX1ylrjkohd/Ta7hZneUHIkSqIv/EBJ7jbm63uouHfg4CNg.rC', NULL, 0, 0, '18968826123', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, '19906505618', '置业顾问'),
	(1427143683832156161, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15088917073@163.com', '15088917073', '黄文贤', '$2a$10$AUQkEixreUli6OQF6O9J2uQkY5akY25DhoxCCoTw5CP3fSat230B2', NULL, 0, 0, '15088917073', 0, 1427100281782538240, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143684817817600, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18505059838@163.com', '18505059838', '林文斌', '$2a$10$30ebgCThlZlsUQrlQAXeUO/xk8tYbLIuUnNC95vnqVi9m2jQRTGEe', NULL, 0, 0, '18505059838', 0, 40681289119961088, NULL, NULL, '工程部', NULL, '19906505860', '工程经理'),
	(1427143685329522688, 'admin', '2021-08-16 13:42:24', 'admin', '2021-08-16 13:42:24', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15558768986@163.com', '15558768986', '江秋明', '$2a$10$y8Qg9FAX17Tx0SXyv//7keY9s.nV3OtbmqBv0sQRj8j3.yI1atZLG', NULL, 0, 0, '15558768986', 0, 40681289119961088, NULL, NULL, '工程部', NULL, '19906505582', '机电工程师'),
	(1427143685958668288, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18158335800@163.com', '18158335800', '叶阳', '$2a$10$8M4JoQCD1pCIT2vaLa3x/eCoG7qm.ff1lFqjmIlrJD.ZyoCPFNUvS', NULL, 0, 0, '18158335800', 0, 40681289119961088, NULL, NULL, '工程部', NULL, NULL, '土建工程师'),
	(1427143686537482240, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18723788955@163.com', '18723788955', '张园园', '$2a$10$u3n537RecIqMh1p3RDfOSO31BpFP/urStDzo2Xa7jro5xinkMlj/m', NULL, 0, 0, '18723788955', 0, 40681289119961088, NULL, NULL, '工程部', NULL, '19906505580', '资料员'),
	(1427143687116296193, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18511138881@163.com', '18511138881', '刘健军', '$2a$10$YPqBzR8wky/6VZRAZvbrA.kPQLfh0W/rHel/pP1C.pQu869z5qQzG', NULL, 0, 0, '18511138881', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, '19906505612', '营销经理'),
	(1427143687690915841, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13676429221@163.com', '13676429221', '党青梅', '$2a$10$f49cZELRgHlS/yWiszlW7ObrQJH3vJqpeF1MffChIPemFgEyHiwSO', NULL, 0, 0, '13676429221', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, '19906505615', '客服经理'),
	(1427143688278118401, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15988776816@163.com', '15988776816', '柴欣欣', '$2a$10$VGVlIdQ4PaFl74TB8Gf57u5p/Cxffnel4OsULMwwtGUTQHu12Q0W2', NULL, 0, 0, '15988776816', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '策划经理'),
	(1427143688869515265, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15858815290@163.com', '15858815290', '周仲衡', '$2a$10$YiY..ZMfrGDoQsXIZmeptu/6D3sGqApZdovj3adarJqH0txL3J9UW', NULL, 0, 0, '15858815290', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, '19906505623', '策划主管'),
	(1427143689452523521, 'admin', '2021-08-16 13:42:25', 'admin', '2021-08-16 13:42:25', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18657766150@163.com', '18657766150', '余海洋', '$2a$10$67WI.bWT7eeJxXGuYHklJ.nn4hbgjXzqzBeafEdplTNDs2Ux59aii', NULL, 0, 0, '18657766150', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '客服主管'),
	(1427143690060697601, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15308013729@163.com', '15308013729', '梁金平', '$2a$10$xCpz6OsNdA/BzXB7ERpPDOoZYxd1QdhW9l0M2YyD6pv/8rlA98QuO', NULL, 0, 0, '15308013729', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '销售助理'),
	(1427143690631122945, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13616875758@163.com', '13616875758', '胡梦露', '$2a$10$fdBsEPnOLd7EUAH8KRsXDexBfArROcBa2oua341pv3XN2pcxhrNdy', NULL, 0, 0, '13616875758', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143691218325505, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13486737598@163.com', '13486737598', '叶青青', '$2a$10$l.1CNbzQPE.s3AEAEViP7u97XKgPRkrqEeF54GdVhBDYsvq3XiB7a', NULL, 0, 0, '13486737598', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, '19906505607', '置业顾问'),
	(1427143691797139457, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15606633062@163.com', '15606633062', '柯生市', '$2a$10$Gjupct8iIOQvloMh2EetW.R71cRhPyRuEgA8fMjM5.GJZ7ok7zzva', NULL, 0, 0, '15606633062', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, '19906505592', '置业顾问'),
	(1427143692388536321, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15958778020@163.com', '15958778020', '姜峰', '$2a$10$1LAWc1GciiI0vX.tV1edieau0lXAbhMYdecq4.p6LxqLM8alxnOUK', NULL, 0, 0, '15958778020', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143692971544577, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18072125635@163.com', '18072125635', '陈康', '$2a$10$TtjGkrGU/nw7emJ4igBKyudUfBcxDIskCn7Do77kdv6r5p9OAsxA6', NULL, 0, 0, '18072125635', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143693558747137, 'admin', '2021-08-16 13:42:26', 'admin', '2021-08-16 13:42:26', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18858865930@163.com', '18858865930', '邱海盟', '$2a$10$TwI6K.aScNMa3XDy7DYvqOVo4ili0hePf0Qg43UN9yWdRRiZD1Dma', NULL, 0, 0, '18858865930', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143694133366785, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15057503709@163.com', '15057503709', '金一格', '$2a$10$dQtJNCXA59TcFbtVVAfgru5RaX2hRihg9eNqrHuwkxqgNPuW7k25m', NULL, 0, 0, '15057503709', 0, 1427100376401842176, NULL, NULL, '销售部', NULL, NULL, '置业顾问'),
	(1427143694905118720, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18600094996@163.com', '18600094996', '黄开宇', '$2a$10$vh2taEGGqpTwQf9f9BrviuztPEZshbNH1vSSLMWuvugQGcO5GPzDq', NULL, 0, 0, '18600094996', 0, 1427100408882532353, NULL, NULL, '总经办', NULL, '19906505855', '项目副总经理'),
	(1427143695429406720, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13910392421@163.com', '13910392421', '陈浩', '$2a$10$/CFkcAVQe5CmUz73G5jI4O67yrXkDF6.bvtWgTE75Ps1hT3iQ2hS2', NULL, 0, 0, '13910392421', 0, 1427100408882532353, NULL, NULL, '总经办', NULL, NULL, '项目副总经理'),
	(1427143696004026369, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13910392422@163.com', '13910392422', '林建珍', '$2a$10$v4iQ3q.acnNvm504WsIu4ehw7sLHVft9AiCcOaioBebNpNcWBXKOu', NULL, 0, 0, '13910392422', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505578', '高级顾问'),
	(1427143696599617536, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18910626246@163.com', '18910626246', '刘强', '$2a$10$psdAkgcxJ8ByzszcJ1ewmOi7.09bJTV6ZlfHe80OtlGlAy0PvTl5y', NULL, 0, 0, '18910626246', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505780', '项目经理'),
	(1427143697174237185, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15588866370@163.com', '15588866370', '吴昊', '$2a$10$0HsSEYsUFCUP7hS0w5f4bODeAEy1F0vnPPp1zN4L7dL5BjzSu7AyS', NULL, 0, 0, '15588866370', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505758', '技术经理'),
	(1427143697794994177, 'admin', '2021-08-16 13:42:27', 'admin', '2021-08-16 13:42:27', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15024459133@163.com', '15024459133', '曾瑞长', '$2a$10$1iFIP4zSTvTtzf4xZRwH5ORwOSRqHjp8A/YbBRg0Q2H9bX2WeO.2q', NULL, 0, 0, '15024459133', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505757', '工程经理'),
	(1427143698357030913, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18757162784@163.com', '18757162784', '杜建鹏', '$2a$10$Og6YR/DSS/BFsU2dtJK8WO40nNsBCy4hKs1Iut71uqGrftLOxU8Cq', NULL, 0, 0, '18757162784', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505766', '运维工程师'),
	(1427143698931650561, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18136348889@163.com', '18136348889', '徐久金', '$2a$10$lZyIwnaoSa0VH/TlTsMEkucKJhFvlYm90HnfLV6Yu9Qds1Xw4pB.i', NULL, 0, 0, '18136348889', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '运维工程师'),
	(1427143699544018945, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13867809536@163.com', '13867809536', '尹小云', '$2a$10$TKHCY7qSkhZOdIJWo4BXS.SvYZ/ZAr8ZVp8ElLLhrJt1.9E9U7bPK', NULL, 0, 0, '13867809536', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '运维工程师'),
	(1427143700114444289, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13780117658@163.com', '13780117658', '赵晨', '$2a$10$CK1VG.ChdPJOyA8ezG9.4ucqmbcXwg4XwOxSZHtjmnMMfrENmxyfq', NULL, 0, 0, '13780117658', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505825', '运维专员'),
	(1427143700726812673, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15967736771@163.com', '15967736771', '何孟龙', '$2a$10$7ZBRiOiX.Ig8a7C6p4yK/./gz5qb4siwFY3dWM/D6yw5SKFQR1c.m', NULL, 0, 0, '15967736771', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505571', '运维专员'),
	(1427143701288849409, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15058701516@163.com', '15058701516', '黄开一', '$2a$10$QURmImdv8J.luh4rYvfz2.PfwMdGaCAgR0Q1iY3LOMGNj.Wz1qt86', NULL, 0, 0, '15058701516', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '运维助理'),
	(1427143701859274753, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15888221574@163.com', '15888221574', '陈浩伟', '$2a$10$7n4iJ/d42Kes86ZugGibgOf2359aFHEbKwDT4P2KVrbu8zQylhqxy', NULL, 0, 0, '15888221574', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505776', '运维助理'),
	(1427143702446477313, 'admin', '2021-08-16 13:42:28', 'admin', '2021-08-16 13:42:28', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13306775755@163.com', '13306775755', '雷景捷', '$2a$10$.C/GTXb1BVuBA0Lqvd.Umu84x33Zccn9fli4u9vUkHQik0R/hjhVy', NULL, 0, 0, '13306775755', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, '19906505803', '资料员'),
	(1427143703021096960, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13780100874@163.com', '13780100874', '黄天豪', '$2a$10$IG93aBgcGAocrwV1hGDDWOYbnNecCZD3dsnz5/7J/ZzFDCF5PcWPa', NULL, 0, 0, '13780100874', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '运维见习'),
	(1427143703616688129, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13968780814@163.com', '13968780814', '赖情情', '$2a$10$kSnfvvyV9r8.qge/zuBPae.EfClIdafVKzcnsUlGWh4rT7KIe.87e', NULL, 0, 0, '13968780814', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '客服专员'),
	(1427143704182919169, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15058998076@163.com', '15058998076', '钱思佳', '$2a$10$O9ypOeNzrIgdc6e2NppLGOq/XPJnBGTIAtgv/2KX57S0xwyEzlrVS', NULL, 0, 0, '15058998076', 0, 1427100510816702464, NULL, NULL, '运维部', NULL, NULL, '客服专员'),
	(1427143704753344513, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13505870587@163.com', '13505870587', '鲍向东', '$2a$10$XRI7LTMPVZplzTNnqjZ4ie5LrkVdYYfZHQf360A6kxqj/ZrQKMNNO', NULL, 0, 0, '13505870587', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '18958770003', '高级顾问'),
	(1427143705319575553, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13554172929@163.com', '13554172929', '林开亮', '$2a$10$lFLz5YMMWt7UlR2F.S4.Sej67uYR2EM43SPkQ7DOEpIG28GeWAzia', NULL, 0, 0, '13554172929', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '19906505590', 'IDC销售副总经理'),
	(1427143705894195201, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13588929692@163.com', '13588929692', '胡明辉', '$2a$10$uWgbp8l2RnEKWa4Rg.NOKeRFxpst0SS7NwJSDxzFoLcTLmUzYvN5O', NULL, 0, 0, '13588929692', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, NULL, '总经理助理'),
	(1427143706456231937, 'admin', '2021-08-16 13:42:29', 'admin', '2021-08-16 13:42:29', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '17605876830@163.com', '17605876830', '林笑', '$2a$10$o/FHdvtZjKVsiprpKOBt3OJIB1110pcEa.VdaXJME.HClyZkPCNTO', NULL, 0, 0, '17605876830', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, NULL, 'IDC销售总监助理'),
	(1427143707030851585, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13601816964@163.com', '13601816964', '张喆', '$2a$10$nGalykxYYsV5YV2mXr3gZuHj8A/apcwSIuy9j.53NAfQIuDA8dR7C', NULL, 0, 0, '13601816964', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, NULL, 'IDC销售副总经理（上海）'),
	(1427143707597082625, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18958157081@163.com', '18958157081', '李勇', '$2a$10$e4gwSZnpXqANOocgwdHYOu7ZOZ1TEWpgC5OG4DoikF4BUq2WtC2H.', NULL, 0, 0, '18958157081', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, NULL, 'IDC销售总监（杭州）'),
	(1427143708171702273, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13372531382@163.com', '13372531382', '徐渊', '$2a$10$isw.AYjp8AOegtasKAS82eEygcERet3UIFgRGWlzLs6jhFaEGhx62', NULL, 0, 0, '13372531382', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '19906505756', 'IDC销售经理（杭州）'),
	(1427143708742127617, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13372531383@163.com', '13372531383', '黄开昊', '$2a$10$ujh9j795Bj9HRmcQsxQZ7.jF/m./Ye5DUrkFRSxJyurxHSlfC3XRm', NULL, 0, 0, '13372531383', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '19906505995', 'IDC销售主管'),
	(1427143709320941568, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13520722155@163.com', '13520722155', '吴嶴', '$2a$10$25qqiwzn0x53nrTOWqE8Cuu9Nk2x1dmkHoDA1VDPqXUG01ahTUY5S', NULL, 0, 0, '13520722155', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '19906505782', 'IDC销售主管'),
	(1427143709887172608, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13750901505@163.com', '13750901505', '陈赞', '$2a$10$copDUghsNYz.bCNUbVCUqOGgqriqMUeJdgYlzx7s8mzIvIYSwfCbW', NULL, 0, 0, '13750901505', 0, 1427100439043772417, NULL, NULL, '营销部', NULL, '19906505778', 'IDC售前工程师'),
	(1427143710461792257, 'admin', '2021-08-16 13:42:30', 'admin', '2021-08-16 13:42:30', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13958895854@163.com', '13958895854', '尹伊群', '$2a$10$l2fFqO7VQ6AGp.XcnS2Tj.KMe/zGfMXu2qSK5LzlYmMgUke6wgXzW', NULL, 0, 0, '13958895854', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, '19906505787', '经理'),
	(1427143711061577729, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18767701177@163.com', '18767701177', '鲍洪森', '$2a$10$RnefGnWXpSWMrb38aQtiXu/JDK6RrBhbclNEWRkOWK.pyjs1uuJG.', NULL, 0, 0, '18767701177', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, '19906505828', '副经理'),
	(1427143711640391681, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18267875765@163.com', '18267875765', '石岳仁', '$2a$10$.wCaO3ErkinoZnNg5P2Uc.i653y6luHJ0w9utgajCaijxN32gJkQq', NULL, 0, 0, '18267875765', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, NULL, '实施工程师'),
	(1427143712202428417, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15990772113@163.com', '15990772113', '林江滨', '$2a$10$d.3dXyNQBMPSYYzVMMgkuO0gGDiFyxsiHg6DMVsa3O9aEgQ7WZbJa', NULL, 0, 0, '15990772113', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, NULL, '项目经理'),
	(1427143712772853761, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13868372116@163.com', '13868372116', '黄培', '$2a$10$wxTO/HDcvZFWSmH5h9WVROa.MHqM5.k1/U0dLnh2vgZ4RldjykS96', NULL, 0, 0, '13868372116', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, '19906505867', '项目经理'),
	(1427143713347473408, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13677130184@163.com', '13677130184', '詹鹏飞', '$2a$10$jgZ.ITNwINfe5WlCXZb6ieXZb0Oyi8AJY7HAXbMz1TPq.3ZgHXkxS', NULL, 0, 0, '13677130184', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, NULL, '项目经理'),
	(1427143713951453185, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18858802727@163.com', '18858802727', '陈茉蕾', '$2a$10$Zz6pnY98H/h5lsrkT6P9UuadUX/GWFTnaxUl6VtLbwz1o2E7Ty2ny', NULL, 0, 0, '18858802727', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, NULL, '高级商务'),
	(1427143714517684224, 'admin', '2021-08-16 13:42:31', 'admin', '2021-08-16 13:42:31', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13388530119@163.com', '13388530119', '黄昌义', '$2a$10$csIvwu5ZK5i4Oo/7O.YUQOeuvYtcJhZI8xHWWyXTj3ADonHUs0gJ.', NULL, 0, 0, '13388530119', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, '19906505785', '商务专员'),
	(1427143715083915265, 'admin', '2021-08-16 13:42:32', 'admin', '2021-08-16 13:42:32', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '19921772499@163.com', '19921772499', '王颖晓', '$2a$10$2Zkj7zjwkGj.VXd33YAup.xXYtSZjDxnAj1qMRvR4d/Ub0p4FiN4u', NULL, 0, 0, '19921772499', 0, 1427100539010813952, NULL, NULL, '数字创新事业部', NULL, NULL, '行政运营专员'),
	(1427143715662729217, 'admin', '2021-08-16 13:42:32', 'admin', '2021-08-16 13:42:32', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '15896128808@163.com', '15896128808', '黄瑞敏', '$2a$10$bRNVa.00/Kx20g.oVazVV.JKnxWfmGi/xRztHZ/urBfq3aW8d.zda', NULL, 0, 0, '15896128808', 0, 1427100561253208064, NULL, NULL, '综合部', NULL, '19906505617', '行政经理'),
	(1427143716245737473, 'admin', '2021-08-16 13:42:32', 'admin', '2021-08-16 13:42:32', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13958970311@163.com', '13958970311', '章步炜', '$2a$10$2WmIIg3LcR8RQsxgG.Vb7uPjQNy3VFUmyf38aUrbTBZpvBHP1PvAS', NULL, 0, 0, '13958970311', 0, 1427100561253208064, NULL, NULL, '综合部', NULL, '19906505793', '行政司机'),
	(1427143716832940033, 'admin', '2021-08-16 13:42:32', 'admin', '2021-08-16 13:42:32', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '18006889016@163.com', '18006889016', '柯雷娜', '$2a$10$QwrjNkn61u918oLQf5Z3R.eNSZDvWcoZm2IDkO1ccqybVZ7rCcr6m', NULL, 0, 0, '18006889016', 0, 1427100586754576384, NULL, NULL, '财务部', NULL, NULL, '会计助理'),
	(1427143717415948289, 'admin', '2021-08-16 13:42:32', 'admin', '2021-08-16 13:42:32', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '13506559233@163.com', '13506559233', '施深怡', '$2a$10$SQvB3Vu.BpDWZiANJh2FPerIfTaFKmQxHobY88LZFF9puVwTzj7Y6', NULL, 0, 0, '13506559233', 0, 1427100586754576384, NULL, NULL, '财务部', NULL, NULL, '出纳');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 yungu.t_user_role 结构
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE IF NOT EXISTS `t_user_role` (
  `id` bigint(20) unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_user_role 的数据：~0 rows (大约)
DELETE FROM `t_user_role`;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `role_id`, `user_id`) VALUES
	(1427139915648471040, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139914843164673),
	(1427139916487331840, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139915736551424),
	(1427139917183586305, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139916537663488),
	(1427139917867257856, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139917238112257),
	(1427139918538346496, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139917917589505),
	(1427139919209435136, 'admin', '2021-08-16 13:27:26', 0, 'admin', '2021-08-16 13:27:26', 496138616573953, 1427139918588678144),
	(1427139919880523777, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139919259766785),
	(1427139920547418113, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139919930855425),
	(1427139921222701057, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139920606138368),
	(1427139921897984001, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139921273032705),
	(1427139922577461248, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139921952509953),
	(1427139923244355584, 'admin', '2021-08-16 13:27:27', 0, 'admin', '2021-08-16 13:27:27', 496138616573953, 1427139922623598593),
	(1427139923907055616, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139923290492929),
	(1427139924582338561, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139923957387264),
	(1427139925257621505, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139924636864513),
	(1427139925924515841, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139925312147457),
	(1427139926624964608, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139925974847489),
	(1427139927291858945, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139926679490561),
	(1427139927971336193, 'admin', '2021-08-16 13:27:28', 0, 'admin', '2021-08-16 13:27:28', 496138616573953, 1427139927342190593),
	(1427139928655007744, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139928025862145),
	(1427139929326096384, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139928709533696),
	(1427139930005573632, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139929380622337),
	(1427139930676662273, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139930051710977),
	(1427139931410665472, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139930726993921),
	(1427139932211777537, 'admin', '2021-08-16 13:27:29', 0, 'admin', '2021-08-16 13:27:29', 496138616573953, 1427139931460997121),
	(1427139932895449089, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139932266303489),
	(1427139933566537729, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139932945780737),
	(1427139934241820672, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139933616869376),
	(1427139934917103617, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139934287958017),
	(1427139935596580865, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139934967435265),
	(1427139936255086592, 'admin', '2021-08-16 13:27:30', 0, 'admin', '2021-08-16 13:27:30', 496138616573953, 1427139935646912512),
	(1427139936917786624, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139936301223937),
	(1427139937580486657, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139936968118273),
	(1427139938251575297, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139937630818305),
	(1427139938926858241, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139938301906944),
	(1427139939602141185, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139938977189888),
	(1427139940264841216, 'admin', '2021-08-16 13:27:31', 0, 'admin', '2021-08-16 13:27:31', 496138616573953, 1427139939652472833),
	(1427139940944318465, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139940315172864),
	(1427139941619601409, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139940998844416),
	(1427139942286495745, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139941669933057),
	(1427139942945001473, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139942336827393),
	(1427139943704170496, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139942995333120),
	(1427139944484311041, 'admin', '2021-08-16 13:27:32', 0, 'admin', '2021-08-16 13:27:32', 496138616573953, 1427139943750307841),
	(1427139945172176896, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139944534642688),
	(1427139945843265537, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139945226702849),
	(1427139946493382657, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139945889402881),
	(1427139947160276992, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139946543714305),
	(1427139947831365632, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139947206414337),
	(1427139948485677056, 'admin', '2021-08-16 13:27:33', 0, 'admin', '2021-08-16 13:27:33', 496138616573953, 1427139947881697281),
	(1427139949156765697, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139948536008704),
	(1427139949815271424, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139949207097345),
	(1427139950477971457, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139949861408769),
	(1427139951140671489, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139950532497409),
	(1427139951799177217, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139951191003136),
	(1427139952474460160, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139951845314561),
	(1427139953200074753, 'admin', '2021-08-16 13:27:34', 0, 'admin', '2021-08-16 13:27:34', 496138616573953, 1427139952520597505),
	(1427139953862774785, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139953250406401),
	(1427139954533863425, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139953908912129),
	(1427139955192369153, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139954584195073),
	(1427139955855069184, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139955242700801),
	(1427139956513574912, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139955905400832),
	(1427139957167886337, 'admin', '2021-08-16 13:27:35', 0, 'admin', '2021-08-16 13:27:35', 496138616573953, 1427139956563906560),
	(1427139957834780673, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139957218217985),
	(1427139958497480705, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139957889306625),
	(1427139959164375040, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139958547812353),
	(1427139959827075073, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139959214706689),
	(1427139960493969409, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139959885795328),
	(1427139961165058049, 'admin', '2021-08-16 13:27:36', 0, 'admin', '2021-08-16 13:27:36', 496138616573953, 1427139960544301057),
	(1427139961836146688, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139961215389697),
	(1427139962503041024, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139961882284033),
	(1427139963169935361, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139962553372672),
	(1427139963836829697, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139963220267009),
	(1427139964507918337, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139963882967041),
	(1427139965179006977, 'admin', '2021-08-16 13:27:37', 0, 'admin', '2021-08-16 13:27:37', 496138616573953, 1427139964558249985),
	(1427139965833318401, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139965229338625),
	(1427139966537961472, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139965883650048),
	(1427139967238410241, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139966584098817),
	(1427139967901110273, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139967288741889),
	(1427139968563810305, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139967951441920),
	(1427139969218121729, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139968618336257),
	(1427139969864044545, 'admin', '2021-08-16 13:27:38', 0, 'admin', '2021-08-16 13:27:38', 496138616573953, 1427139969264259073),
	(1427139970535133185, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139969914376193),
	(1427139971197833217, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139970581270529),
	(1427139971856338945, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139971248164864),
	(1427139972514844673, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139971906670593),
	(1427139973177544705, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139972565176321),
	(1427139973831856129, 'admin', '2021-08-16 13:27:39', 0, 'admin', '2021-08-16 13:27:39', 496138616573953, 1427139973223682049),
	(1427139974502944769, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139973882187777),
	(1427139975169839105, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139974549082113),
	(1427139975866093569, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139975215976449),
	(1427139976532987905, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139975920619520),
	(1427139977195687937, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139976583319553),
	(1427139977862582273, 'admin', '2021-08-16 13:27:40', 0, 'admin', '2021-08-16 13:27:40', 496138616573953, 1427139977246019585),
	(1427139978525282305, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139977912913921),
	(1427139979192176640, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139978571419649),
	(1427139979846488065, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139979242508288),
	(1427139980521771008, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139979892625409),
	(1427139981192859649, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139980572102657),
	(1427139981859753985, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139981243191297),
	(1427139982539231233, 'admin', '2021-08-16 13:27:41', 0, 'admin', '2021-08-16 13:27:41', 496138616573953, 1427139981914279937),
	(1427139983193542657, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139982585368577),
	(1427139983856242689, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139983243874305),
	(1427139984518942721, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139983902380033),
	(1427139985185837057, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139984573468672),
	(1427139985861120001, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139985236168704),
	(1427139986536402944, 'admin', '2021-08-16 13:27:42', 0, 'admin', '2021-08-16 13:27:42', 496138616573953, 1427139985919840257),
	(1427139987194908673, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139986586734593),
	(1427139987870191616, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139987245240321),
	(1427139988541280257, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139987916328961),
	(1427139989212368897, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139988587417601),
	(1427139989883457537, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139989262700545),
	(1427139990541963265, 'admin', '2021-08-16 13:27:43', 0, 'admin', '2021-08-16 13:27:43', 496138616573953, 1427139989933789184),
	(1427139991208857601, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139990592294913),
	(1427139991858974721, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139991259189249),
	(1427139992530063361, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139991909306368),
	(1427139993201152001, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139992580395009),
	(1427139993880629249, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139993251483649),
	(1427139994568495105, 'admin', '2021-08-16 13:27:44', 0, 'admin', '2021-08-16 13:27:44', 496138616573953, 1427139993930960897),
	(1427139995256360961, 'admin', '2021-08-16 13:27:45', 0, 'admin', '2021-08-16 13:27:45', 496138616573953, 1427139994618826753),
	(1427139995923255297, 'admin', '2021-08-16 13:27:45', 0, 'admin', '2021-08-16 13:27:45', 496138616573953, 1427139995306692608),
	(1427139996594343937, 'admin', '2021-08-16 13:27:45', 0, 'admin', '2021-08-16 13:27:45', 496138616573953, 1427139995973586945),
	(1427141487933657088, 'admin', '2021-08-16 13:33:40', 0, 'admin', '2021-08-16 13:33:40', 496138616573953, 1427141487136739328),
	(1427141488743157761, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141488017543168),
	(1427141489414246401, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141488793489409),
	(1427141490072752128, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141489464578049),
	(1427141490731257856, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141490118889473),
	(1427141491402346497, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141490781589505),
	(1427141492073435137, 'admin', '2021-08-16 13:33:41', 0, 'admin', '2021-08-16 13:33:41', 496138616573953, 1427141491456872448),
	(1427141492731940865, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141492123766785),
	(1427141493390446593, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141492782272513),
	(1427141494057340928, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141493440778241),
	(1427141494720040961, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141494103478273),
	(1427141495378546689, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141494770372608),
	(1427141496037052416, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141495428878337),
	(1427141496695558145, 'admin', '2021-08-16 13:33:42', 0, 'admin', '2021-08-16 13:33:42', 496138616573953, 1427141496087384064),
	(1427141498004180992, 'admin', '2021-08-16 13:33:43', 0, 'admin', '2021-08-16 13:33:43', 496138616573953, 1427141496750084097),
	(1427141499056951297, 'admin', '2021-08-16 13:33:43', 0, 'admin', '2021-08-16 13:33:43', 496138616573953, 1427141498071289856),
	(1427141499979698176, 'admin', '2021-08-16 13:33:43', 0, 'admin', '2021-08-16 13:33:43', 496138616573953, 1427141499124060160),
	(1427141500680146944, 'admin', '2021-08-16 13:33:43', 0, 'admin', '2021-08-16 13:33:43', 496138616573953, 1427141500030029825),
	(1427141501384790016, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141500730478592),
	(1427141502051684352, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141501435121664),
	(1427141502764716033, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141502102016001),
	(1427141503423221761, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141502815047680),
	(1427141504098504704, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141503477747713),
	(1427141504757010433, 'admin', '2021-08-16 13:33:44', 0, 'admin', '2021-08-16 13:33:44', 496138616573953, 1427141504148836352),
	(1427141505411321857, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141504807342081),
	(1427141506078216192, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141505461653505),
	(1427141506728333313, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141506128547840),
	(1427141507403616257, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141506778664961),
	(1427141508070510592, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141507449753601),
	(1427141508737404928, 'admin', '2021-08-16 13:33:45', 0, 'admin', '2021-08-16 13:33:45', 496138616573953, 1427141508116647937),
	(1427141509391716352, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141508783542273),
	(1427141510046027777, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141509442048001),
	(1427141510704533505, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141510096359424),
	(1427141511346262016, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141510750670849),
	(1427141511992184833, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141511392399360),
	(1427141512646496256, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141512038322177),
	(1427141513300807681, 'admin', '2021-08-16 13:33:46', 0, 'admin', '2021-08-16 13:33:46', 496138616573953, 1427141512692633601),
	(1427141513971896321, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141513346945025),
	(1427141514651373569, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141514026422273),
	(1427141515314073601, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141514697510913),
	(1427141515980967937, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141515360210945),
	(1427141516668833792, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141516035493889),
	(1427141517331533825, 'admin', '2021-08-16 13:33:47', 0, 'admin', '2021-08-16 13:33:47', 496138616573953, 1427141516714971137),
	(1427141517994233856, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141517377671169),
	(1427141518669516800, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141518040371201),
	(1427141519315439617, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141518711459840),
	(1427141519990722561, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141519374159873),
	(1427141520678588417, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141520041054209),
	(1427141521341288448, 'admin', '2021-08-16 13:33:48', 0, 'admin', '2021-08-16 13:33:48', 496138616573953, 1427141520728920065),
	(1427141522037542912, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141521383231489),
	(1427141522725408769, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141522083680257),
	(1427141523379720193, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141522779934721),
	(1427141524029837313, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141523434246145),
	(1427141524684148736, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141524071780353),
	(1427141525338460160, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141524730286081),
	(1427141525996965889, 'admin', '2021-08-16 13:33:49', 0, 'admin', '2021-08-16 13:33:49', 496138616573953, 1427141525392986112),
	(1427141526651277313, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141526047297537),
	(1427141527318171648, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141526701608961),
	(1427141527989260288, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141527364308993),
	(1427141528630988800, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141528035397633),
	(1427141529302077440, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141528681320448),
	(1427141529960583169, 'admin', '2021-08-16 13:33:50', 0, 'admin', '2021-08-16 13:33:50', 496138616573953, 1427141529348214785),
	(1427141530614894593, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141530010914817),
	(1427141531273400321, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141530665226241),
	(1427141531948683265, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141531340509184),
	(1427141532598800384, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141531994820608),
	(1427141533265694721, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141532649132033),
	(1427141533915811840, 'admin', '2021-08-16 13:33:51', 0, 'admin', '2021-08-16 13:33:51', 496138616573953, 1427141533316026368),
	(1427141534574317569, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141533961949185),
	(1427141535224434689, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141534620454913),
	(1427141535891329025, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141535270572033),
	(1427141536541446145, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141535941660673),
	(1427141537199951872, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141536595972097),
	(1427141537871040513, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141537250283521),
	(1427141538525351936, 'admin', '2021-08-16 13:33:52', 0, 'admin', '2021-08-16 13:33:52', 496138616573953, 1427141537921372161),
	(1427141539179663361, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141538571489281),
	(1427141539833974785, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141539229995008),
	(1427141540496674817, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141539884306433),
	(1427141541167763457, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141540542812160),
	(1427141541826269185, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141541218095105),
	(1427141542476386305, 'admin', '2021-08-16 13:33:53', 0, 'admin', '2021-08-16 13:33:53', 496138616573953, 1427141541872406529),
	(1427141543134892033, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141542526717953),
	(1427141543785009153, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141543185223681),
	(1427141544451903489, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141543835340800),
	(1427141545122992128, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141544506429440),
	(1427141545773109249, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141545169129473),
	(1427141546423226369, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141545823440897),
	(1427141547073343489, 'admin', '2021-08-16 13:33:54', 0, 'admin', '2021-08-16 13:33:54', 496138616573953, 1427141546469363713),
	(1427141547727654913, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141547123675137),
	(1427141548377772033, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141547773792257),
	(1427141549036277761, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141548423909377),
	(1427141549703172096, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141549082415105),
	(1427141550357483521, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141549749309441),
	(1427141551011794945, 'admin', '2021-08-16 13:33:55', 0, 'admin', '2021-08-16 13:33:55', 496138616573953, 1427141550407815168),
	(1427141551674494977, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141551057932289),
	(1427141552333000704, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141551720632321),
	(1427141552987312129, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141552383332353),
	(1427141553645817857, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141553033449473),
	(1427141554295934976, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141553696149505),
	(1427141554950246401, 'admin', '2021-08-16 13:33:56', 0, 'admin', '2021-08-16 13:33:56', 496138616573953, 1427141554342072321),
	(1427141555600363520, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141555000578048),
	(1427141556237897729, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141555642306561),
	(1427141556883820545, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141556284035073),
	(1427141557550714881, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141556938346497),
	(1427141558205026305, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141557596852225),
	(1427141558855143424, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141558251163649),
	(1427141559513649153, 'admin', '2021-08-16 13:33:57', 0, 'admin', '2021-08-16 13:33:57', 496138616573953, 1427141558905475072),
	(1427141560163766273, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141559563980800),
	(1427141560826466305, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141560209903617),
	(1427141561489166337, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141560872603649),
	(1427141562181226497, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141561543692289),
	(1427141562831343617, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141562231558145),
	(1427141563489849345, 'admin', '2021-08-16 13:33:58', 0, 'admin', '2021-08-16 13:33:58', 496138616573953, 1427141562877480961),
	(1427141564139966464, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141563535986689),
	(1427141564806860801, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141564190298112),
	(1427141565456977921, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141564852998145),
	(1427141566107095041, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141565503115265),
	(1427141566757212161, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141566157426688),
	(1427141567419912193, 'admin', '2021-08-16 13:33:59', 0, 'admin', '2021-08-16 13:33:59', 496138616573953, 1427141566807543808),
	(1427141568070029313, 'admin', '2021-08-16 13:34:00', 0, 'admin', '2021-08-16 13:34:00', 496138616573953, 1427141567466049537),
	(1427141568715952129, 'admin', '2021-08-16 13:34:00', 0, 'admin', '2021-08-16 13:34:00', 496138616573953, 1427141568120360961),
	(1427143647849222144, 'admin', '2021-08-16 13:42:15', 0, 'admin', '2021-08-16 13:42:15', 496138616573953, 1427143647157161989),
	(1427143648600002561, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143647937302528),
	(1427143649208176641, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143648637751297),
	(1427143649807962113, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143649250119681),
	(1427143650386776065, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143649845710849),
	(1427143650986561537, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143650428719105),
	(1427143651577958400, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143651024310272),
	(1427143652173549569, 'admin', '2021-08-16 13:42:16', 0, 'admin', '2021-08-16 13:42:16', 496138616573953, 1427143651615707137),
	(1427143652748169217, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143652211298304),
	(1427143653322788864, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143652785917953),
	(1427143653897408513, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143653356343297),
	(1427143654488805376, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143653939351552),
	(1427143655067619328, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143654526554112),
	(1427143655646433281, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143655105368065),
	(1427143656237830145, 'admin', '2021-08-16 13:42:17', 0, 'admin', '2021-08-16 13:42:17', 496138616573953, 1427143655688376320),
	(1427143656833421312, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143656275578881),
	(1427143657420623873, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143656871170048),
	(1427143658020409345, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143657458372609),
	(1427143658607611904, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143658062352384),
	(1427143659199008768, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143658645360640),
	(1427143659840737281, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143659240951808),
	(1427143660419551232, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143659882680321),
	(1427143661002559489, 'admin', '2021-08-16 13:42:18', 0, 'admin', '2021-08-16 13:42:18', 496138616573953, 1427143660457299969),
	(1427143661598150657, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143661040308225),
	(1427143662176964609, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143661631705089),
	(1427143662764167169, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143662214713345),
	(1427143663359758337, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143662801915905),
	(1427143663951155201, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143663397507073),
	(1427143664534163457, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143663993098241),
	(1427143665142337537, 'admin', '2021-08-16 13:42:19', 0, 'admin', '2021-08-16 13:42:19', 496138616573953, 1427143664576106497),
	(1427143665733734400, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143665180086273),
	(1427143666295771137, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143665771483137),
	(1427143666895556609, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143666333519873),
	(1427143667478564865, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143666933305345),
	(1427143668275482624, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143667516313600),
	(1427143669378584577, 'admin', '2021-08-16 13:42:20', 0, 'admin', '2021-08-16 13:42:20', 496138616573953, 1427143668317425664),
	(1427143670011924481, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143669424721921),
	(1427143670657847297, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143670053867521),
	(1427143671245049857, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143670699790336),
	(1427143671870001153, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143671295381504),
	(1427143672478175233, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143671907749889),
	(1427143673069572096, 'admin', '2021-08-16 13:42:21', 0, 'admin', '2021-08-16 13:42:21', 496138616573953, 1427143672520118272),
	(1427143673656774656, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143673103126529),
	(1427143674256560129, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143673690329089),
	(1427143674881511424, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143674302697472),
	(1427143675485491201, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143674915065857),
	(1427143676081082369, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143675527434241),
	(1427143676672479232, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143676118831105),
	(1427143677268070400, 'admin', '2021-08-16 13:42:22', 0, 'admin', '2021-08-16 13:42:22', 496138616573953, 1427143676706033665),
	(1427143677855272960, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143677310013440),
	(1427143678442475520, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143677893021697),
	(1427143679029678081, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143678476029953),
	(1427143679650435072, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143679067426817),
	(1427143680241831937, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143679683989505),
	(1427143680837423105, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143680283774977),
	(1427143681483345920, 'admin', '2021-08-16 13:42:23', 0, 'admin', '2021-08-16 13:42:23', 496138616573953, 1427143680883560448),
	(1427143682062159872, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143681521094656),
	(1427143682636779521, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143682095714305),
	(1427143683215593473, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143682674528257),
	(1427143683794407424, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143683253342209),
	(1427143684385804289, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143683832156161),
	(1427143685291773953, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143684817817600),
	(1427143685916725249, 'admin', '2021-08-16 13:42:24', 0, 'admin', '2021-08-16 13:42:24', 496138616573953, 1427143685329522688),
	(1427143686499733504, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143685958668288),
	(1427143687082741760, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143686537482240),
	(1427143687653167105, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143687116296193),
	(1427143688240369665, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143687690915841),
	(1427143688835960832, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143688278118401),
	(1427143689414774785, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143688869515265),
	(1427143690027143169, 'admin', '2021-08-16 13:42:25', 0, 'admin', '2021-08-16 13:42:25', 496138616573953, 1427143689452523521),
	(1427143690601762816, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143690060697601),
	(1427143691184771073, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143690631122945),
	(1427143691759390721, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143691218325505),
	(1427143692350787585, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143691797139457),
	(1427143692937990145, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143692388536321),
	(1427143693520998401, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143692971544577),
	(1427143694095618049, 'admin', '2021-08-16 13:42:26', 0, 'admin', '2021-08-16 13:42:26', 496138616573953, 1427143693558747137),
	(1427143694674432001, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143694133366785),
	(1427143695391657985, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143694905118720),
	(1427143695966277632, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143695429406720),
	(1427143696557674497, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143696004026369),
	(1427143697136488449, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143696599617536),
	(1427143697757245441, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143697174237185),
	(1427143698323476480, 'admin', '2021-08-16 13:42:27', 0, 'admin', '2021-08-16 13:42:27', 496138616573953, 1427143697794994177),
	(1427143698893901825, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143698357030913),
	(1427143699514658817, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143698931650561),
	(1427143700080889857, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143699544018945),
	(1427143700689063937, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143700114444289),
	(1427143701251100673, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143700726812673),
	(1427143701821526017, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143701288849409),
	(1427143702408728576, 'admin', '2021-08-16 13:42:28', 0, 'admin', '2021-08-16 13:42:28', 496138616573953, 1427143701859274753),
	(1427143702983348225, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143702446477313),
	(1427143703578939393, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143703021096960),
	(1427143704145170433, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143703616688129),
	(1427143704719790081, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143704182919169),
	(1427143705281826817, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143704753344513),
	(1427143705860640769, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143705319575553),
	(1427143706422677505, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143705894195201),
	(1427143706993102848, 'admin', '2021-08-16 13:42:29', 0, 'admin', '2021-08-16 13:42:29', 496138616573953, 1427143706456231937),
	(1427143707559333889, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143707030851585),
	(1427143708133953537, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143707597082625),
	(1427143708704378881, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143708171702273),
	(1427143709283192833, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143708742127617),
	(1427143709849423873, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143709320941568),
	(1427143710428237825, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143709887172608),
	(1427143711015440384, 'admin', '2021-08-16 13:42:30', 0, 'admin', '2021-08-16 13:42:30', 496138616573953, 1427143710461792257),
	(1427143711602642945, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143711061577729),
	(1427143712164679681, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143711640391681),
	(1427143712735105025, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143712202428417),
	(1427143713309724673, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143712772853761),
	(1427143713913704449, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143713347473408),
	(1427143714479935489, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143713951453185),
	(1427143715050360832, 'admin', '2021-08-16 13:42:31', 0, 'admin', '2021-08-16 13:42:31', 496138616573953, 1427143714517684224),
	(1427143715624980481, 'admin', '2021-08-16 13:42:32', 0, 'admin', '2021-08-16 13:42:32', 496138616573953, 1427143715083915265),
	(1427143716203794433, 'admin', '2021-08-16 13:42:32', 0, 'admin', '2021-08-16 13:42:32', 496138616573953, 1427143715662729217),
	(1427143716799385601, 'admin', '2021-08-16 13:42:32', 0, 'admin', '2021-08-16 13:42:32', 496138616573953, 1427143716245737473),
	(1427143717378199553, 'admin', '2021-08-16 13:42:32', 0, 'admin', '2021-08-16 13:42:32', 496138616573953, 1427143716832940033),
	(1427143717957013505, 'admin', '2021-08-16 13:42:32', 0, 'admin', '2021-08-16 13:42:32', 496138616573953, 1427143717415948289),
	(1427206977901170688, 'admin', '2021-08-16 17:53:54', 0, 'admin', '2021-08-16 17:53:54', 496138616573952, 682265633886208);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;

-- 导出  表 yungu.t_village_appointment 结构
DROP TABLE IF EXISTS `t_village_appointment`;
CREATE TABLE IF NOT EXISTS `t_village_appointment` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_village_appointment 的数据：~0 rows (大约)
DELETE FROM `t_village_appointment`;
/*!40000 ALTER TABLE `t_village_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_village_appointment` ENABLE KEYS */;

-- 导出  表 yungu.t_village_introduce 结构
DROP TABLE IF EXISTS `t_village_introduce`;
CREATE TABLE IF NOT EXISTS `t_village_introduce` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `audit_status` int(11) NOT NULL,
  `content` varchar(16384) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_village_introduce 的数据：~2 rows (大约)
DELETE FROM `t_village_introduce`;
/*!40000 ALTER TABLE `t_village_introduce` DISABLE KEYS */;
INSERT INTO `t_village_introduce` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `audit_status`, `content`, `create_date`, `level`, `remark`, `title`, `type`, `url`) VALUES
	('1424207211793616896', 'admin', '2021-08-08 11:13:54.470000', 0, 'admin', '2021-08-08 15:02:01.474000', 1, '<p style="text-align: center;"><span style="font-size: 36px;"><strong>&nbsp;XX村介绍</strong></span></p><p><br/></p><p>**村位于乡政府所在地东部，距乡政府所在地2公里，距石阡县城38公里，内属中亚热带温暖湿润气候，四季分明，夏热冬凉，年平均降水量1100毫米。全**村共有5个**村民组，665户，1838人，是一个以侗族为主的多民族杂居**村寨。全**村总面积17.8平方公里，耕地面积为2345亩，森林覆盖率达36%，主要农作物有烤烟、水稻、玉米等。</p><p style="text-align: center;"><img src="https://artskyhome.com:8082/ueditor/ueditor/jsp/upload/image/20210808/1628392424368003298.png" title="1628392424368003298.png" alt="微信截图_20210808111121.png"/>&nbsp;&nbsp;&nbsp;</p><p>**村内建有**村级小学、卫生室、**村委会，但大部分**村民组为砼硬路面，无公共厕所，没有垃圾池，无路灯，没有公共活动广场，公共服务设施欠缺，极大地影响着农民群众生活质量的提高。<br/>&nbsp;&nbsp;&nbsp;本次整**村推进一事一议项目共39个，受益人数1083人，总投入276万元，其中申请省级财政奖补152万元，县级财政预算安排62万元，县级整合62万元。水利类财政奖补7个项目，投入资金106.4万元；交通类18个项目，投入95.6万元；环卫类5个项目，投入3.8万元；其它类9个，投入70.2万元。<br/>&nbsp;&nbsp;&nbsp;通过该项目的实施，可改造农**村生活环境，完善各种基础设施建设，促进农**村产业快速发展，创新**村庄管理机制，改变农民精神风貌，大力打造新经济、新生活、新**村庄、新机制、新风尚的新型农**村，构建和谐社会。同时带动养殖业、种植业、传统农业等各项产业的全面发展，使农民的年人均纯收入由原来的6500元增加到9000元左右。</p>', '2021-08-08 11:13:54', 10, '测试', 'XX村庄介绍', '0', NULL),
	('1424239586393067521', 'admin', '2021-08-08 13:22:33.169000', 0, 'admin', '2021-08-08 15:01:57.780000', 2, '', '2021-08-08 13:22:33', 10, '测试', '外链文章测试', '1', 'http://baijiahao.baidu.com/s?id=1707427551447931571');
/*!40000 ALTER TABLE `t_village_introduce` ENABLE KEYS */;

-- 导出  表 yungu.t_village_style 结构
DROP TABLE IF EXISTS `t_village_style`;
CREATE TABLE IF NOT EXISTS `t_village_style` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_village_style 的数据：~0 rows (大约)
DELETE FROM `t_village_style`;
/*!40000 ALTER TABLE `t_village_style` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_village_style` ENABLE KEYS */;

-- 导出  表 yungu.t_village_travel 结构
DROP TABLE IF EXISTS `t_village_travel`;
CREATE TABLE IF NOT EXISTS `t_village_travel` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yungu.t_village_travel 的数据：~0 rows (大约)
DELETE FROM `t_village_travel`;
/*!40000 ALTER TABLE `t_village_travel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_village_travel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
