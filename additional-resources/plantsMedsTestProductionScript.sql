-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PlantMeds-test
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PlantMeds-test` ;
CREATE SCHEMA IF NOT EXISTS `PlantMeds-test` ;
USE `PlantMeds-test` ;

-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plant_type` VARCHAR(45) NULL,
  `description` TEXT NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL,
  `growing_season` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'growing_season would help with relevant search results -- filter out plants that you won\'t actually find at their designated locations';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantCommonNames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantCommonNames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `plant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantCommonName_Plant_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantCommonName_Plant`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantTechnicalNames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantTechnicalNames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `plant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantTechnicalName_Plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantTechnicalName_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Illnesses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Illnesses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`IllnessCommonNames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`IllnessCommonNames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `illness_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IllnessCommonName_Illness1_idx` (`illness_id` ASC),
  CONSTRAINT `fk_IllnessCommonName_Illness1`
    FOREIGN KEY (`illness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`IllnessTechnicalNames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`IllnessTechnicalNames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `llness_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IllnessTechnicalName_Illness1_idx` (`llness_id` ASC),
  CONSTRAINT `fk_IllnessTechnicalName_Illness1`
    FOREIGN KEY (`llness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Instructions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Instructions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `instructions` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`AssessmentForms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`AssessmentForms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `effectiveness_score` INT NOT NULL,
  `date_used` DATE NOT NULL,
  `comments` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_Illnesses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_Illnesses` (
  `plant_illnesses_id` INT NOT NULL AUTO_INCREMENT,
  `plant_id` INT NOT NULL,
  `illness_id` INT NOT NULL,
  `instructions_id` INT NOT NULL,
  `assessment_forms_id` INT NOT NULL,
  `date_created` DATE NOT NULL COMMENT '	',
  `last_updated` DATE NULL,
  INDEX `fk_Plant_Illness_Plant1_idx` (`plant_id` ASC),
  INDEX `fk_Plant_Illness_Illness1_idx` (`illness_id` ASC),
  UNIQUE INDEX `composite_plant_illness` (`illness_id` ASC, `plant_id` ASC),
  INDEX `fk_Plant_Illness_Instructions1_idx` (`instructions_id` ASC),
  INDEX `fk_Plant_Illnesses_AssessmentForms1_idx` (`assessment_forms_id` ASC),
  PRIMARY KEY (`plant_illnesses_id`),
  CONSTRAINT `fk_Plant_Illness_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Illness_Illness1`
    FOREIGN KEY (`illness_id`)
    REFERENCES `PlantMeds-test`.`Illnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Illness_Instructions1`
    FOREIGN KEY (`instructions_id`)
    REFERENCES `PlantMeds-test`.`Instructions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Illnesses_AssessmentForms1`
    FOREIGN KEY (`assessment_forms_id`)
    REFERENCES `PlantMeds-test`.`AssessmentForms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `PlantMeds-test` ;

-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lattitude` INT NOT NULL,
  `longitude` INT NOT NULL,
  `date_created` DATE NOT NULL,
  `last_updated` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'A location may be owned by a user. If it is not owned by a user, it is public';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_LocationImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_LocationImages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` LONGBLOB NOT NULL,
  `date_created` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'this is for images of particular plants at a particular location that users have uploaded';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `join_date` DATE NOT NULL,
  `last_active` DATE NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Plant_Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Plant_Locations` (
  `plant_location_id` INT NOT NULL AUTO_INCREMENT,
  `pick_limit` VARCHAR(45) NULL,
  `plant_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `plant_location_image_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_Plant_Location_Plant_idx` (`plant_id` ASC),
  INDEX `fk_Plant_Location_Location1_idx` (`location_id` ASC),
  UNIQUE INDEX `composite_plant_location` (`plant_id` ASC, `location_id` ASC),
  INDEX `fk_Plant_Location_Plant_LocationImage1_idx` (`plant_location_image_id` ASC),
  INDEX `fk_Plant_Location_User1_idx` (`user_id` ASC),
  PRIMARY KEY (`plant_location_id`),
  CONSTRAINT `fk_Plant_Location_Plant`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plant_Location_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `PlantMeds-test`.`Locations` (`id`)
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`PlantImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`PlantImages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` LONGBLOB NOT NULL,
  `plant_id` INT NOT NULL,
  `date_created` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PlantImage_Plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_PlantImage_Plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'for images of a plant generally, not at a particular location';


-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Authorities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Authorities` (
  `username` VARCHAR(45) NULL,
  `authority` VARCHAR(45) NULL,
  KEY `username` (`username`)
  )
ENGINE = InnoDB;

ALTER TABLE `Authorities`
 ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `Users` (`username`);

-- -----------------------------------------------------
-- Table `PlantMeds-test`.`Seasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlantMeds-test`.`Seasons` (
  `season_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `plants_id` INT(11) NOT NULL,
  PRIMARY KEY (`season_id`),
  INDEX `fk_Seasons_Plants1_idx` (`Plants_id` ASC),
  CONSTRAINT `fk_Seasons_Plants1`
    FOREIGN KEY (`plants_id`)
    REFERENCES `PlantMeds-test`.`Plants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
