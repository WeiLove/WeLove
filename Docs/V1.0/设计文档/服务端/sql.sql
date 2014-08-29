-- MySQL Script generated by MySQL Workbench
-- Tue Aug 26 22:25:24 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db56233
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db56233` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db56233` ;

-- -----------------------------------------------------
-- Table `db56233`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_role` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_role` (
  `user_role_id` TINYINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `role_name` VARCHAR(20) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user` (
  `uid` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(20) NOT NULL,
  `user_sex` TINYINT NOT NULL,
  `user_state_id` TINYINT NOT NULL,
  `user_role_id` TINYINT NOT NULL,
  `user_birth_date_time` DATETIME NOT NULL,
  `has_love` BIT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`uid`));


-- -----------------------------------------------------
-- Table `db56233`.`user_love`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_love` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_love` (
  `user_love_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `uid_from` BIGINT NOT NULL,
  `uid_to` BIGINT NOT NULL,
  `love_name` VARCHAR(20) NOT NULL,
  `love_declare` VARCHAR(200) NOT NULL,
  `love_score` FLOAT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_love_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_qa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_qa` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_qa` (
  `user_qa_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `user_love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `question` VARCHAR(200) NOT NULL,
  `read_time` DATETIME NOT NULL,
  `has_read` BIT NOT NULL,
  `answer_a` VARCHAR(200) NOT NULL,
  `answer_b` VARCHAR(200) NOT NULL,
  `answer_c` VARCHAR(200) NOT NULL,
  `answer` TINYINT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_qa_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_msg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_msg` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_msg` (
  `user_msg_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `user_love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `user_msg` VARCHAR(500) NOT NULL,
  `user_msg_type_id` TINYINT NOT NULL,
  `read_time` DATETIME NOT NULL,
  `has_read` BIT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_msg_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`server`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`server` ;

CREATE TABLE IF NOT EXISTS `db56233`.`server` (
  `server_id` TINYINT NOT NULL AUTO_INCREMENT,
  `server_name` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `port` INT NOT NULL COMMENT '端口',
  `db_server_ip` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `db_name` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `db_user_name` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `db_user_password` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`server_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_status` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_status` (
  `user_status_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `user_love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `user_status` VARCHAR(200) NOT NULL,
  `user_status_type_id` TINYINT NOT NULL,
  `read_time` DATETIME NOT NULL,
  `has_read` BIT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_setting` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_setting` (
  `uid` BIGINT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `has_open_login_protect` BIT NOT NULL,
  `has_set_safe_question` BIT NOT NULL,
  `has_open_msg_notif` BIT NOT NULL,
  `has_show_msg_detail_notif` BIT NOT NULL,
  `has_open_function_msg_notif` BIT NOT NULL,
  `has_open_msg_sound` BIT NOT NULL,
  `has_open_msg_shake` BIT NOT NULL,
  `has_open_ta_state_update_notif` BIT NOT NULL,
  `login_protect_devices` VARCHAR(200) NOT NULL,
  `has_open_push_msg_notif` BIT NOT NULL,
  `begin_push_time` TINYINT NOT NULL,
  `end_push_time` TINYINT NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_login_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_login_log` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_login_log` (
  `user_login_log_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `login_type_id` TINYINT NOT NULL,
  `login_time` DATETIME NOT NULL,
  `login_device` VARCHAR(20) NOT NULL,
  `is_safety` BIT NOT NULL,
  `unsafe_reason` VARCHAR(100) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_login_log_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_safe_center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_safe_center` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_safe_center` (
  `uid` BIGINT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `register_ip` VARCHAR(40) NOT NULL,
  `register_time` DATETIME NOT NULL,
  `has_set_safe_question` BIT NOT NULL,
  `safe_question1` VARCHAR(40) NULL,
  `safe_question1_answer` VARCHAR(40) NULL,
  `safe_question2` VARCHAR(40) NULL,
  `safe_question2_answer` VARCHAR(40) NULL,
  `safe_question3` VARCHAR(40) NULL,
  `safe_question3_answer` VARCHAR(40) NULL,
  `old_passwords` VARCHAR(100) NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_operation_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_operation_log` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_operation_log` (
  `user_operation_log_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `operation_type_id` TINYINT NOT NULL,
  `operation_content` VARCHAR(200) NOT NULL,
  `table_name` VARCHAR(50) NOT NULL,
  `table_column` VARCHAR(50) NOT NULL,
  `old_value` VARCHAR(200) NOT NULL,
  `new_value` VARCHAR(200) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_operation_log_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_modify_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_modify_type` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_modify_type` (
  `user_modify_type_id` TINYINT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `modify_type_name` VARCHAR(20) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_modify_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`system_operation_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`system_operation_log` ;

CREATE TABLE IF NOT EXISTS `db56233`.`system_operation_log` (
  `system_operation_log_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `operation_type_id` TINYINT NOT NULL,
  `operation_content` VARCHAR(200) NOT NULL,
  `table_name` VARCHAR(50) NOT NULL,
  `table_column` VARCHAR(50) NOT NULL,
  `old_value` VARCHAR(200) NOT NULL,
  `new_value` VARCHAR(200) NOT NULL,
  `operation_time` DATETIME NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`system_operation_log_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`operation_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`operation_type` ;

CREATE TABLE IF NOT EXISTS `db56233`.`operation_type` (
  `operation_type_id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `operation_type` VARCHAR(40) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`operation_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`state` ;

CREATE TABLE IF NOT EXISTS `db56233`.`state` (
  `state_id` TINYINT NOT NULL AUTO_INCREMENT,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_login_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_login_type` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_login_type` (
  `user_login_type_id` BIGINT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `modify_time` DATETIME NOT NULL,
  `create_ip` VARCHAR(20) NOT NULL,
  `remote_ip` VARCHAR(20) NOT NULL,
  `state_id` TINYINT NOT NULL,
  `login_type` VARCHAR(20) NOT NULL,
  `extColumn1` TEXT NULL,
  `extColumn2` TEXT NULL,
  `extColumn3` TEXT NULL,
  `extColumn4` TEXT NULL,
  `extColumn5` TEXT NULL,
  `extColumn6` TEXT NULL,
  `extColumn7` TEXT NULL,
  `extColumn8` TEXT NULL,
  `extColumn9` TEXT NULL,
  `extColumn10` TEXT NULL,
  `extColumn11` TEXT NULL,
  `extColumn12` TEXT NULL,
  `extColumn13` TEXT NULL,
  `extColumn14` TEXT NULL,
  `extColumn15` TEXT NULL,
  `extColumn16` TEXT NULL,
  `extColumn17` TEXT NULL,
  `extColumn18` TEXT NULL,
  `extColumn19` TEXT NULL,
  `extColumn20` TEXT NULL,
  `extColumn21` BLOB NULL,
  `extColumn22` BLOB NULL,
  `extColumn23` BLOB NULL,
  `extColumn24` BLOB NULL,
  `extColumn25` BLOB NULL,
  PRIMARY KEY (`user_login_type_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
