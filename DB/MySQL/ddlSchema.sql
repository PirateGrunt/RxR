SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `rxr` DEFAULT CHARACTER SET utf8 ;
USE `rxr` ;

-- -----------------------------------------------------
-- Table `rxr`.`tblAccount`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rxr`.`tblAccount` (
  `AccountNumber` BIGINT(20) NOT NULL ,
  `AccountName` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`AccountNumber`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rxr`.`tblPolicy`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rxr`.`tblPolicy` (
  `PolicyID` BIGINT NOT NULL ,
  `AccountNumber` BIGINT NOT NULL ,
  `PolicyNumber` VARCHAR(255) NOT NULL ,
  `EffectiveDate` DATETIME NOT NULL ,
  `ExpirationDate` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`PolicyID`) ,
  INDEX `FK_AccountNumber_idx` (`AccountNumber` ASC) ,
  CONSTRAINT `FK_AccountNumber`
    FOREIGN KEY (`AccountNumber` )
    REFERENCES `rxr`.`tblAccount` (`AccountNumber` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `rxr` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
