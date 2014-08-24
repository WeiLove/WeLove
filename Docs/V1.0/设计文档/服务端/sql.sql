-- MySQL Script generated by MySQL Workbench
-- Wed Aug 20 00:02:39 2014
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
  `role_id` TINYINT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user` (
  `uid` BIGINT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(20) NOT NULL,
  `user_sex` TINYINT NOT NULL,
  `role_id` TINYINT NOT NULL,
  `user_birth_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`uid`),
  INDEX `fk_user_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `db56233`.`user_role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db56233`.`user_love`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_love` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_love` (
  `love_id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid_from` BIGINT NOT NULL,
  `uid_to` BIGINT NOT NULL,
  `create_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`love_id`),
  INDEX `fk_user_love_user1_idx` (`uid_from` ASC),
  INDEX `fk_user_love_user2_idx` (`uid_to` ASC),
  CONSTRAINT `fk_user_love_user1`
    FOREIGN KEY (`uid_from`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_love_user2`
    FOREIGN KEY (`uid_to`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_qa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_qa` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_qa` (
  `qa_id` BIGINT NOT NULL AUTO_INCREMENT,
  `love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `question` VARCHAR(200) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `read_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`qa_id`),
  INDEX `fk_user_qa_user_idx` (`uid` ASC),
  INDEX `fk_user_qa_user_love1_idx` (`love_id` ASC),
  CONSTRAINT `fk_user_qa_user`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_qa_user_love1`
    FOREIGN KEY (`love_id`)
    REFERENCES `db56233`.`user_love` (`love_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_msg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_msg` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_msg` (
  `msg_id` BIGINT NOT NULL AUTO_INCREMENT,
  `love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `user_msg` VARCHAR(500) NOT NULL,
  `msg_type` TINYINT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `read_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`msg_id`),
  INDEX `fk_user_msg_user1_idx` (`uid` ASC),
  INDEX `fk_user_msg_user_love1_idx` (`love_id` ASC),
  CONSTRAINT `fk_user_msg_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_msg_user_love1`
    FOREIGN KEY (`love_id`)
    REFERENCES `db56233`.`user_love` (`love_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`server_config`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`server_config` ;

CREATE TABLE IF NOT EXISTS `db56233`.`server_config` (
  `server_id` TINYINT NOT NULL AUTO_INCREMENT,
  `server_name` VARCHAR(40) NOT NULL COMMENT '消息服务器地址',
  `port` INT NOT NULL COMMENT '端口',
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
-- Table `db56233`.`user_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_state` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_state` (
  `state_id` BIGINT NOT NULL AUTO_INCREMENT,
  `love_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `state` VARCHAR(200) NOT NULL,
  `state_type` TINYINT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `read_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`state_id`),
  INDEX `fk_user_state_user_love1_idx` (`love_id` ASC),
  INDEX `fk_user_state_user1_idx` (`uid` ASC),
  CONSTRAINT `fk_user_state_user_love1`
    FOREIGN KEY (`love_id`)
    REFERENCES `db56233`.`user_love` (`love_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_state_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_setting` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_setting` (
  `uid` BIGINT NOT NULL,
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
  PRIMARY KEY (`uid`),
  CONSTRAINT `fk_user_setting_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_login` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_login` (
  `login_id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `login_type` TINYINT NOT NULL,
  `login_date` DATETIME NOT NULL,
  `login_address` VARCHAR(40) NOT NULL,
  `login_ip` VARCHAR(20) NOT NULL,
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
  PRIMARY KEY (`login_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_safe_center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_safe_center` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_safe_center` (
  `uid` BIGINT NOT NULL,
  `register_ip_address` VARCHAR(40) NOT NULL,
  `register_date` DATETIME NOT NULL,
  `safe_question1` VARCHAR(40) NULL,
  `safe_question1_answer` VARCHAR(40) NULL,
  `safe_question2` VARCHAR(40) NULL,
  `safe_question2_answer` VARCHAR(40) NULL,
  `safe_question3` VARCHAR(40) NULL,
  `safe_question3_answer` VARCHAR(40) NULL,
  `old_passwords` VARCHAR(100) NULL,
  `has_set_safe_question` BIT NOT NULL,
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
  PRIMARY KEY (`uid`),
  CONSTRAINT `fk_user_safe_center_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_operation_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_operation_log` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_operation_log` (
  `operation_id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `operation_content` VARCHAR(200) NOT NULL,
  `operation_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`operation_id`),
  INDEX `fk_user_operate_log_user1_idx` (`uid` ASC),
  CONSTRAINT `fk_user_operate_log_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_modify_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_modify_type` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_modify_type` (
  `modify_type_id` TINYINT NOT NULL,
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
  PRIMARY KEY (`modify_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db56233`.`user_modify_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db56233`.`user_modify_log` ;

CREATE TABLE IF NOT EXISTS `db56233`.`user_modify_log` (
  `modify_id` BIGINT NOT NULL,
  `uid` BIGINT NOT NULL,
  `modify_type_id` TINYINT NOT NULL,
  `old_value` VARCHAR(100) NOT NULL,
  `new_value` VARCHAR(100) NOT NULL,
  `modify_date` DATETIME NOT NULL,
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
  PRIMARY KEY (`modify_id`),
  INDEX `fk_user_modify_user1_idx` (`uid` ASC),
  INDEX `fk_user_modify_log_user_modify_type1_idx` (`modify_type_id` ASC),
  CONSTRAINT `fk_user_modify_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `db56233`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_modify_log_user_modify_type1`
    FOREIGN KEY (`modify_type_id`)
    REFERENCES `db56233`.`user_modify_type` (`modify_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
