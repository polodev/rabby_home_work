-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rabbydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rabbydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rabbydb` DEFAULT CHARACTER SET utf8 ;
USE `rabbydb` ;

-- -----------------------------------------------------
-- Table `rabbydb`.`PUBLISHER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rabbydb`.`PUBLISHER` (
  `PublisherID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`PublisherID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rabbydb`.`BOOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rabbydb`.`BOOK` (
  `ISBN` VARCHAR(20) NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Price` DECIMAL(10) NULL,
  `PublishDate` DATE NULL,
  `PUBLISHER_PublisherID` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_BOOK_PUBLISHER_idx` (`PUBLISHER_PublisherID` ASC) VISIBLE,
  CONSTRAINT `fk_BOOK_PUBLISHER`
    FOREIGN KEY (`PUBLISHER_PublisherID`)
    REFERENCES `rabbydb`.`PUBLISHER` (`PublisherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rabbydb`.`BOOK_has_BOOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rabbydb`.`BOOK_has_BOOK` (
  `BOOK_ISBN` VARCHAR(20) NOT NULL,
  `Series_ISBN` VARCHAR(20) NULL,
  PRIMARY KEY (`BOOK_ISBN`),
  CONSTRAINT `fk_BOOK_has_BOOK_BOOK1`
    FOREIGN KEY (`BOOK_ISBN`)
    REFERENCES `rabbydb`.`BOOK` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rabbydb`.`AUTHOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rabbydb`.`AUTHOR` (
  `Author_Number` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DateOfBirth` DATE NULL,
  PRIMARY KEY (`Author_Number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rabbydb`.`BOOK_has_AUTHOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rabbydb`.`BOOK_has_AUTHOR` (
  `AUTHOR_Author_Number` INT NOT NULL,
  `BOOK_ISBN` VARCHAR(20) NOT NULL,
  `RoyaltyPct` DECIMAL(20) NULL,
  `LeadAuthor` TINYINT(10) NULL,
  `SequenceNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`AUTHOR_Author_Number`, `BOOK_ISBN`),
  INDEX `fk_BOOK_has_AUTHOR_AUTHOR1_idx` (`AUTHOR_Author_Number` ASC) VISIBLE,
  INDEX `fk_BOOK_has_AUTHOR_BOOK1_idx` (`BOOK_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_BOOK_has_AUTHOR_AUTHOR1`
    FOREIGN KEY (`AUTHOR_Author_Number`)
    REFERENCES `rabbydb`.`AUTHOR` (`Author_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOK_has_AUTHOR_BOOK1`
    FOREIGN KEY (`BOOK_ISBN`)
    REFERENCES `rabbydb`.`BOOK` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
