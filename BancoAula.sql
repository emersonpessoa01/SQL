CREATE DATABASE BancoAula; 
USE BancoAula;
#DROP DATABASE bancoaula;

CREATE TABLE Bancos (
    id_banco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    FundosTotais DECIMAL(15, 2) NOT NULL
);

CREATE TABLE Agencias (
    id_agencia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fundos DECIMAL(15, 2) NOT NULL,
    fk_idBanco INT NOT NULL,
    FOREIGN KEY (fk_idBanco) REFERENCES Bancos(id_banco)
);

CREATE TABLE Funcionarios ( 
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT, 
    cpf VARCHAR(11) NOT NULL UNIQUE, 
    nome VARCHAR(30) NOT NULL, 
    telefone VARCHAR(15) NOT NULL, 
    dataContratacao DATE NOT NULL, 
    fk_idGerente INT, 
    FOREIGN KEY (fk_idGerente) REFERENCES Funcionarios(id_funcionario) 
);

CREATE TABLE Dependentes ( 
    id_dependente INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(50) NOT NULL, 
    fk_idFuncionario INT NOT NULL, 
    FOREIGN KEY (fk_idFuncionario) REFERENCES Funcionarios(id_funcionario) 
);
#DROP TABLE Dependentes;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    cpf VARCHAR(11) NOT NULL UNIQUE, 
    telefone VARCHAR(15) NOT NULL
);
#DROP TABLE Clientes;

CREATE TABLE Contas (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    nr_conta VARCHAR(45) NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    ultimoAcesso DATE NOT NULL,
    taxaJuros DECIMAL(5, 2),
    limiteExcesso DECIMAL(15, 2),
    tipo ENUM('Corrente', 'Poupanca') NOT NULL,
    fk_idCliente INT NOT NULL,
    fk_idAgencia INT NOT NULL,
    FOREIGN KEY (fk_idAgencia) REFERENCES Agencias(id_agencia),
    FOREIGN KEY (fk_idCliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE ClienteFuncionario (
    fk_idFuncionario INT NOT NULL,
    fk_idCliente INT NOT NULL,
    PRIMARY KEY (fk_idFuncionario, fk_idCliente),
    FOREIGN KEY (fk_idFuncionario) REFERENCES Funcionarios(id_funcionario)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (fk_idCliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);