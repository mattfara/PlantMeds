-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PlantMeds-test` ;

-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PlantMeds-test` DEFAULT CHARACTER SET latin1 ;
USE `PlantMeds-test` ;

-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Illnesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Illnesses` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Illnesses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Plants` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plants` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `plant_type` VARCHAR(45) NULL DEFAULT NULL,
  `description` TEXT NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL DEFAULT NULL,
  `growing_season` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'growing_season would help with relevant search results -- filter out plants that you won\'t actually find at their designated locations';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_Illnesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Plant_Illnesses` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_Illnesses` (
  `plant_illnesses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `plant_id` INT(11) NOT NULL,
  `illness_id` INT(11) NOT NULL,
  `date_created` DATE NOT NULL COMMENT '	',
  `last_updated` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`plant_illnesses_id`),
  UNIQUE INDEX `composite_plant_illness` (`illness_id` ASC, `plant_id` ASC),
  INDEX `fk_Plant_Illness_Plant1_idx` (`plant_id` ASC),
  INDEX `fk_Plant_Illness_Illness1_idx` (`illness_id` ASC),
  CONSTRAINT `fk_Plant_Illness_Illness1`
    FOREIGN KEY (`illness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Illness_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`AssessmentForms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`AssessmentForms` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`AssessmentForms` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `effectiveness_score` INT(11) NOT NULL,
  `date_used` DATE NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  `plant_illness_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_AssessmentForms_Plant_Illnesses1_idx` (`plant_illness_id` ASC),
  CONSTRAINT `fk_AssessmentForms_Plant_Illnesses1`
    FOREIGN KEY (`plant_illness_id`)
    REFERENCES `PlantMeds-test`.`Plant_Illnesses` (`plant_illnesses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Users` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `join_date` DATE NOT NULL,
  `last_active` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `username` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Authorities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Authorities` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Authorities` (
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `authority` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `username` (`username` ASC),
  CONSTRAINT `authorities_ibfk_1`
    FOREIGN KEY (`username`)
    REFERENCES `PlantMeds-test`.`Users` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`IllnessCommonNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`IllnessCommonNames` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`IllnessCommonNames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `illness_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IllnessCommonName_Illness1_idx` (`illness_id` ASC),
  CONSTRAINT `fk_IllnessCommonName_Illness1`
    FOREIGN KEY (`illness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`IllnessTechnicalNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`IllnessTechnicalNames` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`IllnessTechnicalNames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `illness_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IllnessTechnicalName_Illness1_idx` (`illness_id` ASC),
  CONSTRAINT `fk_IllnessTechnicalName_Illness1`
    FOREIGN KEY (`illness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Instructions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Instructions` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Instructions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `instructions` TEXT NOT NULL,
  `plant_illness_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Instructions_Plant_Illnesses1_idx` (`plant_illness_id` ASC),
  CONSTRAINT `fk_Instructions_Plant_Illnesses1`
    FOREIGN KEY (`plant_illness_id`)
    REFERENCES `PlantMeds-test`.`Plant_Illnesses` (`plant_illnesses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Locations` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Locations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `lattitude` INT(11) NOT NULL,
  `longitude` INT(11) NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'A location may be owned by a user. If it is not owned by a user, it is public';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantCommonNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`PlantCommonNames` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantCommonNames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `plant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantCommonName_Plant_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantCommonName_Plant`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantImages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`PlantImages` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantImages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(100) NOT NULL,
  `plant_id` INT(11) NOT NULL,
  `date_created` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantImage_Plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantImage_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'for images of a plant generally, not at a particular location';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantTechnicalNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`PlantTechnicalNames` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantTechnicalNames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `plant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantTechnicalName_Plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantTechnicalName_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_LocationImages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Plant_LocationImages` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_LocationImages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(100) NOT NULL,
  `date_created` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'this is for images of particular plants at a particular location that users have uploaded';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlantMeds-test`.`Plant_Locations` ;

CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_Locations` (
  `plant_location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pick_limit` VARCHAR(45) NULL DEFAULT NULL,
  `plant_id` INT(11) NOT NULL,
  `location_id` INT(11) NOT NULL,
  `plant_location_image_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`plant_location_id`),
  UNIQUE INDEX `composite_plant_location` (`plant_id` ASC, `location_id` ASC),
  INDEX `fk_Plant_Location_Plant_idx` (`plant_id` ASC),
  INDEX `fk_Plant_Location_Location1_idx` (`location_id` ASC),
  INDEX `fk_Plant_Location_Plant_LocationImage1_idx` (`plant_location_image_id` ASC),
  INDEX `fk_Plant_Location_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Plant_Location_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `PlantMeds-test`.`Locations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Location_Plant`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Location_Plant_LocationImage1`
    FOREIGN KEY (`plant_location_image_id`)
    REFERENCES `PlantMeds-test`.`Plant_LocationImages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Location_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PlantMeds-test`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
