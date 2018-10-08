-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Compraventa
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Compraventa` ;

-- -----------------------------------------------------
-- Schema Compraventa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Compraventa` ;
USE `Compraventa` ;

-- -----------------------------------------------------
-- Table `Compraventa`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compraventa`.`Cliente` (
  `DNI` CHAR(9) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compraventa`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compraventa`.`Articulo` (
  `CodArt` VARCHAR(10) NOT NULL,
  `PVP` FLOAT NULL,
  PRIMARY KEY (`CodArt`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compraventa`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compraventa`.`Factura` (
  `NumFac` INT NOT NULL,
  `Año` DATE NOT NULL,
  `Cliente_DNI` CHAR(9) NOT NULL,
  PRIMARY KEY (`NumFac`, `Año`),
  INDEX `fk_Factura_Cliente_idx` (`Cliente_DNI` ASC),
  CONSTRAINT `fk_Factura_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `Compraventa`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compraventa`.`Linea de Facura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compraventa`.`Linea de Facura` (
  `Cantidad` INT NULL,
  `Factura_NumFac` INT NOT NULL,
  `Factura_Año` DATE NOT NULL,
  `Articulo_CodArt` VARCHAR(10) NOT NULL,
  INDEX `fk_Linea de Facura_Factura1_idx` (`Factura_NumFac` ASC, `Factura_Año` ASC),
  INDEX `fk_Linea de Facura_Articulo1_idx` (`Articulo_CodArt` ASC),
  PRIMARY KEY (`Articulo_CodArt`, `Factura_NumFac`, `Factura_Año`),
  CONSTRAINT `fk_Linea de Facura_Factura1`
    FOREIGN KEY (`Factura_NumFac` , `Factura_Año`)
    REFERENCES `Compraventa`.`Factura` (`NumFac` , `Año`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Linea de Facura_Articulo1`
    FOREIGN KEY (`Articulo_CodArt`)
    REFERENCES `Compraventa`.`Articulo` (`CodArt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
