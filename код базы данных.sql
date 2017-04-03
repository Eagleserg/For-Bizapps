-- MySQL Workbench Synchronization
-- Generated: 2017-03-16 18:23
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Serge

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`Posts` (
  `idPosts` INT(11) NOT NULL,
  `postname` VARCHAR(45) NOT NULL,
  `posttext` TEXT NOT NULL,
  `postdate` DATE NOT NULL,
  `posttime` TIME NOT NULL,
  `postauthor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPosts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `username` (16) NOT NULL,
  `email` (255) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT(11) NOT NULL,
  `name` (255) NOT NULL,
  `blogs_idblogs` INT(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_category_blogs1_idx` (`blogs_idblogs` ASC),
  CONSTRAINT `fk_category_blogs1`
    FOREIGN KEY (`blogs_idblogs`)
    REFERENCES `mydb`.`blogs` (`idblogs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Posts_has_category` (
  `Posts_idPosts` INT(11) NOT NULL,
  `category_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`Posts_idPosts`, `category_category_id`),
  INDEX `fk_Posts_has_category_category1_idx` (`category_category_id` ASC),
  INDEX `fk_Posts_has_category_Posts1_idx` (`Posts_idPosts` ASC),
  CONSTRAINT `fk_Posts_has_category_Posts1`
    FOREIGN KEY (`Posts_idPosts`)
    REFERENCES `mydb`.`Posts` (`idPosts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posts_has_category_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `mydb`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`blogs` (
  `idblogs` INT(11) NOT NULL AUTO_INCREMENT,
  `blogname` VARCHAR(45) NOT NULL,
  `user_id_user` INT(11) NOT NULL,
  PRIMARY KEY (`idblogs`),
  INDEX `fk_blogs_user1_idx` (`user_id_user` ASC),
  CONSTRAINT `fk_blogs_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
