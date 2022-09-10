-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre_apellido` VARCHAR(60) NOT NULL,
  `fecha_nac` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(14) NOT NULL,
  `ocupacion` VARCHAR(45) NULL,
  `foto_perfil` VARCHAR(45) NULL,
  `foto_banner` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `acercademi` VARCHAR(512) NOT NULL,
  `repositorio` VARCHAR(60) NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia_laboral` (
  `idexperiencia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `tareas` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `lugar` VARCHAR(45) NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idexperiencia`, `persona_idpersona`),
  INDEX `fk_experiencia_laboral_persona1_idx` (`persona_idpersona` ASC),
  CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudios` (
  `idestudios` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `institucion` VARCHAR(45) NOT NULL,
  `lugar` VARCHAR(45) NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `promedio` DECIMAL(3) NOT NULL,
  `link` VARCHAR(45) NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idestudios`, `persona_idpersona`),
  INDEX `fk_estudios_persona1_idx` (`persona_idpersona` ASC) ,
  CONSTRAINT `fk_estudios_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conocimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conocimientos` (
  `idconocimientos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NOT NULL,
  `institucion` VARCHAR(45) NULL,
  `nivel` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `duracion` INT NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idconocimientos`, `persona_idpersona`),
  INDEX `fk_conocimientos_persona1_idx` (`persona_idpersona` ASC) ,
  CONSTRAINT `fk_conocimientos_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habilidad_blanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidad_blanda` (
  `idhabilidad` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `habilidad` VARCHAR(45) NOT NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idhabilidad`, `persona_idpersona`),
  UNIQUE INDEX `idhabilidad_UNIQUE` (`idhabilidad` ASC) ,
  INDEX `fk_habilidad_persona1_idx` (`persona_idpersona` ASC) ,
  CONSTRAINT `fk_habilidad_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`idioma` (
  `ididioma` INT NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ididioma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sabe_idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sabe_idiomas` (
  `idsabe_idiomas` INT NOT NULL AUTO_INCREMENT,
  `oral` VARCHAR(45) NOT NULL,
  `escrito` VARCHAR(45) NOT NULL,
  `comprension` VARCHAR(45) NOT NULL,
  `persona_idpersona` INT NOT NULL,
  `idioma_ididioma` INT NOT NULL,
  PRIMARY KEY (`idsabe_idiomas`, `persona_idpersona`, `idioma_ididioma`),
  INDEX `fk_sabe_idiomas_persona1_idx` (`persona_idpersona` ASC) ,
  INDEX `fk_sabe_idiomas_idioma1_idx` (`idioma_ididioma` ASC) ,
  CONSTRAINT `fk_sabe_idiomas_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sabe_idiomas_idioma1`
    FOREIGN KEY (`idioma_ididioma`)
    REFERENCES `mydb`.`idioma` (`ididioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`intereses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`intereses` (
  `idintereses` INT NOT NULL,
  `interes` VARCHAR(60) NOT NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idintereses`, `persona_idpersona`),
  INDEX `fk_intereses_persona1_idx` (`persona_idpersona` ASC) ,
  CONSTRAINT `fk_intereses_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habilidad_dura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidad_dura` (
  `idhabilidad` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `habilidad` VARCHAR(45) NOT NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idhabilidad`, `persona_idpersona`),
  UNIQUE INDEX `idhabilidad_UNIQUE` (`idhabilidad` ASC) ,
  INDEX `fk_habilidad_persona1_idx` (`persona_idpersona` ASC) ,
  CONSTRAINT `fk_habilidad_persona10`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `mydb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
