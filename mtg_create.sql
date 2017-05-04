-- MySQL Script generated by MySQL Workbench
-- Thu 04 May 2017 13:45:06 AEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mtg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mtg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mtg` DEFAULT CHARACTER SET utf8 ;
USE `mtg` ;

-- -----------------------------------------------------
-- Table `mtg`.`Format`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Format` (
  `idFormat` INT NOT NULL,
  `Format_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idFormat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Avalaible formats to choose from.';


-- -----------------------------------------------------
-- Table `mtg`.`Sets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Sets` (
  `idSets` INT NOT NULL,
  `Set_Name` VARCHAR(45) NULL,
  `Set_Format` INT NULL,
  `Set_Code` VARCHAR(45) NULL,
  PRIMARY KEY (`idSets`),
  INDEX `fk_Sets_1_idx` (`Set_Format` ASC),
  CONSTRAINT `fk_Sets_1`
    FOREIGN KEY (`Set_Format`)
    REFERENCES `mtg`.`Format` (`idFormat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mtg`.`Card_DB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Card_DB` (
  `idCard_DB` INT NOT NULL,
  `Card_Name` VARCHAR(45) NULL,
  `Card_Set` INT NULL,
  PRIMARY KEY (`idCard_DB`),
  INDEX `fk_Card_DB_1_idx` (`Card_Set` ASC),
  CONSTRAINT `fk_Card_DB_1`
    FOREIGN KEY (`Card_Set`)
    REFERENCES `mtg`.`Sets` (`idSets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mtg`.`Banned`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Banned` (
  `idBanned` INT NOT NULL,
  `Banned_Card` INT NULL,
  `Banned_Format` INT NULL,
  PRIMARY KEY (`idBanned`),
  INDEX `fk_Banned_2_idx` (`Banned_Card` ASC),
  INDEX `fk_Banned_1_idx` (`Banned_Format` ASC),
  CONSTRAINT `fk_Banned_1`
    FOREIGN KEY (`Banned_Format`)
    REFERENCES `mtg`.`Format` (`idFormat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Banned_2`
    FOREIGN KEY (`Banned_Card`)
    REFERENCES `mtg`.`Card_DB` (`idCard_DB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Banned items';


-- -----------------------------------------------------
-- Table `mtg`.`Collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Collection` (
  `idCollection` INT NOT NULL,
  `Col_Card` INT NULL,
  `Col_Count` INT NULL,
  PRIMARY KEY (`idCollection`),
  INDEX `fk_Collection_1_idx` (`Col_Card` ASC),
  CONSTRAINT `fk_Collection_1`
    FOREIGN KEY (`Col_Card`)
    REFERENCES `mtg`.`Card_DB` (`idCard_DB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mtg`.`Value`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mtg`.`Value` (
  `idValue` INT NOT NULL,
  `Value_Card` INT NULL,
  `Value_Mon` FLOAT NULL,
  PRIMARY KEY (`idValue`),
  INDEX `fk_Value_1_idx` (`Value_Card` ASC),
  CONSTRAINT `fk_Value_1`
    FOREIGN KEY (`Value_Card`)
    REFERENCES `mtg`.`Card_DB` (`idCard_DB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;