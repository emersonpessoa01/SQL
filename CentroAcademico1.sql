-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema centroacademico
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema world
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `world` ;

-- -----------------------------------------------------
-- Schema world
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `world` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos` (
  `codigoMatricula` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `endereco` VARCHAR(255) NULL,
  `telefone` VARCHAR(15) NULL,
  `data_nascimento` DATE NULL,
  `altura` DECIMAL(4,2) NULL,
  `peso` DECIMAL(5,2) NULL,
  PRIMARY KEY (`codigoMatricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professores` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `data_nascimento` DATE NULL,
  `titulacao` VARCHAR(50) NULL,
  `telefone` VARCHAR(100) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `codgio_curso` INT NOT NULL,
  `tipo_curso` VARCHAR(50) NULL,
  `duracao` INT NULL,
  PRIMARY KEY (`codgio_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matriculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculas` (
  `codigo_matricula` INT NOT NULL,
  `data_matricula` VARCHAR(45) NULL,
  `codigo_aluno` INT NULL,
  `codigo_turma` INT NULL,
  `Aluno_codigoMatricula` INT NOT NULL,
  PRIMARY KEY (`codigo_matricula`, `Aluno_codigoMatricula`),
  INDEX `fk_Matricula_Aluno_idx` (`Aluno_codigoMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Aluno`
    FOREIGN KEY (`Aluno_codigoMatricula`)
    REFERENCES `mydb`.`Alunos` (`codigoMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turmas` (
  `codigo_turma` INT NOT NULL,
  `quantidade_alunos` INT NULL,
  `horario_aula` TIME NULL,
  `data_inicail` DATE NULL,
  `data_final` DATE NULL,
  `dofigo_curso` INT NULL,
  `cpf_professor` VARCHAR(11) NULL,
  `Matricula_codigo_matricula` INT NOT NULL,
  `Matricula_Aluno_codigoMatricula` INT NOT NULL,
  `Curso_codgio_curso` INT NOT NULL,
  `Aluno_codigoMatricula` INT NOT NULL,
  `Professor_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`codigo_turma`, `Matricula_codigo_matricula`, `Matricula_Aluno_codigoMatricula`, `Curso_codgio_curso`, `Aluno_codigoMatricula`, `Professor_cpf`),
  INDEX `fk_Turma_Matricula1_idx` (`Matricula_codigo_matricula` ASC, `Matricula_Aluno_codigoMatricula` ASC) VISIBLE,
  INDEX `fk_Turma_Curso1_idx` (`Curso_codgio_curso` ASC) VISIBLE,
  INDEX `fk_Turma_Aluno1_idx` (`Aluno_codigoMatricula` ASC) VISIBLE,
  INDEX `fk_Turma_Professor1_idx` (`Professor_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Matricula1`
    FOREIGN KEY (`Matricula_codigo_matricula` , `Matricula_Aluno_codigoMatricula`)
    REFERENCES `mydb`.`Matriculas` (`codigo_matricula` , `Aluno_codigoMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Curso1`
    FOREIGN KEY (`Curso_codgio_curso`)
    REFERENCES `mydb`.`Cursos` (`codgio_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Aluno1`
    FOREIGN KEY (`Aluno_codigoMatricula`)
    REFERENCES `mydb`.`Alunos` (`codigoMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Professor1`
    FOREIGN KEY (`Professor_cpf`)
    REFERENCES `mydb`.`Professores` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ausencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ausencias` (
  `codigo_ausencia` INT NOT NULL,
  `data` DATE NULL,
  `codigo_matricula` INT NULL,
  `Turma_codigo_turma` INT NOT NULL,
  `Turma_Matricula_codigo_matricula` INT NOT NULL,
  `Turma_Matricula_Aluno_codigoMatricula` INT NOT NULL,
  `Turma_Curso_codgio_curso` INT NOT NULL,
  PRIMARY KEY (`codigo_ausencia`, `Turma_codigo_turma`, `Turma_Matricula_codigo_matricula`, `Turma_Matricula_Aluno_codigoMatricula`, `Turma_Curso_codgio_curso`),
  INDEX `fk_Ausencia_Turma1_idx` (`Turma_codigo_turma` ASC, `Turma_Matricula_codigo_matricula` ASC, `Turma_Matricula_Aluno_codigoMatricula` ASC, `Turma_Curso_codgio_curso` ASC) VISIBLE,
  CONSTRAINT `fk_Ausencia_Turma1`
    FOREIGN KEY (`Turma_codigo_turma` , `Turma_Matricula_codigo_matricula` , `Turma_Matricula_Aluno_codigoMatricula` , `Turma_Curso_codgio_curso`)
    REFERENCES `mydb`.`Turmas` (`codigo_turma` , `Matricula_codigo_matricula` , `Matricula_Aluno_codigoMatricula` , `Curso_codgio_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `world` ;

-- -----------------------------------------------------
-- Table `world`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`country` (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Continent` ENUM('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT NULL DEFAULT NULL,
  `Population` INT NOT NULL DEFAULT '0',
  `LifeExpectancy` DECIMAL(3,1) NULL DEFAULT NULL,
  `GNP` DECIMAL(10,2) NULL DEFAULT NULL,
  `GNPOld` DECIMAL(10,2) NULL DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR(60) NULL DEFAULT NULL,
  `Capital` INT NULL DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `world`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`city` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` CHAR(35) NOT NULL DEFAULT '',
  `CountryCode` CHAR(3) NOT NULL DEFAULT '',
  `District` CHAR(20) NOT NULL DEFAULT '',
  `Population` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `CountryCode` (`CountryCode` ASC) VISIBLE,
  CONSTRAINT `city_ibfk_1`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `world`.`country` (`Code`))
ENGINE = InnoDB
AUTO_INCREMENT = 4080
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `world`.`countrylanguage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`countrylanguage` (
  `CountryCode` CHAR(3) NOT NULL DEFAULT '',
  `Language` CHAR(30) NOT NULL DEFAULT '',
  `IsOfficial` ENUM('T', 'F') NOT NULL DEFAULT 'F',
  `Percentage` DECIMAL(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`CountryCode`, `Language`),
  INDEX `CountryCode` (`CountryCode` ASC) VISIBLE,
  CONSTRAINT `countryLanguage_ibfk_1`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `world`.`country` (`Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
