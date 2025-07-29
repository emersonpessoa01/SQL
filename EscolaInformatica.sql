-- CREATE SCHEMA escolainformatica;

CREATE TABLE Professor(
    professor_id SERIAL PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Telefone(
    telefone_id SERIAL PRIMARY KEY,
    professor_id INTEGER NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT professor_telefone_fk FOREIGN KEY (professor_id)
        REFERENCES Professor(professor_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Curso(
    curso_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Aluno(
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL,
    altura NUMERIC(5, 2),
    peso NUMERIC(5, 2)
);

CREATE TABLE Turma(
    turma_id SERIAL PRIMARY KEY,
    aluno_monitor_id INTEGER,
    professor_id INTEGER NOT NULL,
    qtde_alunos INTEGER NOT NULL,
    horario TIME NOT NULL,
    duracao numeric(5, 2) NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    CONSTRAINT professor_turma_fk FOREIGN KEY (professor_id)
        REFERENCES Professor(professor_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT aluno_turma_fk FOREIGN KEY (aluno_monitor_id)
        REFERENCES Aluno(aluno_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

COMMENT ON COLUMN Turma.aluno_monitor_id IS 'Aluno Monitor';

CREATE TABLE Turma_Curso(
    turma_curso_id SERIAL PRIMARY KEY,
    curso_id INTEGER NOT NULL,
    turma_id INTEGER NOT NULL,
    CONSTRAINT curso_turma_curso_fk FOREIGN KEY(turma_id)
        REFERENCES Turma(turma_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT curso_curso_fk FOREIGN KEY(curso_id)
        REFERENCES Curso(curso_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Matricula(
    matricula_id SERIAL PRIMARY KEY,
    data_matricula DATE NOT NULL,
    turma_id INTEGER NOT NULL,
    aluno_id INTEGER NOT NULL,
    CONSTRAINT turma_aluno_turma_fk FOREIGN KEY(turma_id)
        REFERENCES Turma(turma_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT aluno_turma_aluno_fk FOREIGN KEY(aluno_id)
        REFERENCES Aluno(aluno_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Ausencia(
    ausencia_id SERIAL PRIMARY KEY,
    matricula_id INTEGER NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT matricula_ausencia_fk FOREIGN KEY(matricula_id)
        REFERENCES Matricula(matricula_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
