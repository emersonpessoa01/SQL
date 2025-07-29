-- Criação do Banco de Dados
create database CentroAcademico;
use CentroAcademico;

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    titulacao VARCHAR(50),
    telefone VARCHAR(15)
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    tipo_curso VARCHAR(50)
);

-- Tabela de Turmas
CREATE TABLE Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    id_curso INT,
    horario TIME,
    duracao_aula DECIMAL(4 , 2 ),
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_professor)
        REFERENCES Professores (id_professor),
    FOREIGN KEY (id_curso)
        REFERENCES Cursos (id_curso)
);
-- Adicionando Coluna data_fim após o data_inioio
#alter table Turmas
#add column data_fim date after data_inicio;

-- Verifica se a coluna foi adicionada
#describe Turmas;
#show columns from Turmas;

-- Tabela d Alunos
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    codigo_matricula VARCHAR(10) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    data_nascimento DATE,
    altura DECIMAL(4 , 2 ),
    peso DECIMAL(5 , 2 )
);

-- Tabela de Matriculas (Relação entre Alunos e Turmas)
CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_professor INT,
    data_matricula DATE NOT NULL,
    ausencias INT DEFAULT 0,
    FOREIGN KEY (id_aluno)
        REFERENCES Alunos (id_aluno),
    FOREIGN KEY (id_turma)
        REFERENCES Turmas (id_turma)
);

-- Tabela de Monitores (Um aluno pode ser monitor em uma turma)
CREATE TABLE Monitores (
    id_monitor INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    FOREIGN KEY (id_aluno)
        REFERENCES Alunos (id_aluno),
    FOREIGN KEY (id_turma)
        REFERENCES Turmas (id_turma)
);

