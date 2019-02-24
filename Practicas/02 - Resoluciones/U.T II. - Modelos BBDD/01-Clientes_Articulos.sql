-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Clientes_y_articulos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Clientes_y_articulos` ;

-- -----------------------------------------------------
-- Schema Clientes_y_articulos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clientes_y_articulos` ;
USE `Clientes_y_articulos` ;

-- -----------------------------------------------------
-- Table `Clientes_y_articulos`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes_y_articulos`.`Clientes` (
  `DNI` CHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes_y_articulos`.`Articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes_y_articulos`.`Articulos` (
  `Referenia` CHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Referenia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes_y_articulos`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes_y_articulos`.`Facturas` (
  `Año` DATE NOT NULL,
  `Numero` INT NOT NULL,
  `Concepto` VARCHAR(45) NULL,
  `Clientes_DNI` CHAR(9) NOT NULL,
  PRIMARY KEY (`Año`, `Numero`),
  INDEX `fk_Facturas_Clientes_idx` (`Clientes_DNI` ASC),
  CONSTRAINT `fk_Facturas_Clientes`
    FOREIGN KEY (`Clientes_DNI`)
    REFERENCES `Clientes_y_articulos`.`Clientes` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes_y_articulos`.`Lineas de Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes_y_articulos`.`Lineas de Factura` (
  `NumLinea` INT NOT NULL,
  `Cantidad` INT NULL,
  `Facturas_Año` DATE NOT NULL,
  `Facturas_Numero` INT NOT NULL,
  `Articulos_Referenia` CHAR(10) NOT NULL,
  PRIMARY KEY (`NumLinea`, `Facturas_Año`, `Facturas_Numero`),
  INDEX `fk_Lineas de Factura_Facturas1_idx` (`Facturas_Año` ASC, `Facturas_Numero` ASC),
  INDEX `fk_Lineas de Factura_Articulos1_idx` (`Articulos_Referenia` ASC),
  CONSTRAINT `fk_Lineas de Factura_Facturas1`
    FOREIGN KEY (`Facturas_Año` , `Facturas_Numero`)
    REFERENCES `Clientes_y_articulos`.`Facturas` (`Año` , `Numero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Lineas de Factura_Articulos1`
    FOREIGN KEY (`Articulos_Referenia`)
    REFERENCES `Clientes_y_articulos`.`Articulos` (`Referenia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
