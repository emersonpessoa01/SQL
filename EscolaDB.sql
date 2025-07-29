CREATE DATABASE EscolaDB;
use EscolaDB;

-- Criar tabela turmas
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    ano INT NOT NULL
);
-- Criar a tabela Estudantes
CREATE TABLE Estudantes (
    id_estudante INT PRIMARY KEY,
    nome VARCHAR(90) NOT NULL,
    idade INT NOT NULL,
    id_turma INT,
    FOREIGN KEY (id_turma)
        REFERENCES Turmas (id_turma)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Professores (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_turma INT,
    FOREIGN KEY (id_turma)
        REFERENCES Turmas (id_turma)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Inserir turmas
insert INTO Turmas(
	id_turma,nome_turma,ano
) values
(1,'Turma A',2024),
(2,'Turma B',2024);

select * from turmas;

-- Inserir Estudantes
INSERT INTO Estudantes(id_estudante, nome,idade, id_turma) 
VALUES 
(1, "Joao Silva",15,1),
(2,"Maria Oliveira",16,2),
(3,"Carlos Souza",14,1);

select * from estudantes;

-- Inserir professores
insert into Professores() 
values 
(1,"Prof. Ana Paula",1),
(2, "Prof. Roberto",2);

select * from professores;

-- 1.Listar estudantes e suas turmas
SELECT 
    E.nome AS estudantes, t.nome_turma AS turma, t.ano
FROM
    estudantes E
        JOIN
    turmas T ON E.id_turma = T.id_turma; 

-- 2.Listar professores e as turmas que ensinam
SELECT 
    professores.nome AS professores,
    turmas.nome_turma,
    turmas.ano
FROM
    professores
        JOIN
    turmas ON professores.id_turma = turmas.id_turma;