-- criando banco de dados sql
CREATE DATABASE raro_academy_library;
use raro_academy_library;

-- Criar tabela item
CREATE TABLE item (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255),
    titulo VARCHAR(255)
);
-- Alterano a tabela item e adicionando o atributo numero como FK referenciando estante
ALTER TABLE item
    ADD COLUMN numero INT NOT NULL,
    ADD CONSTRAINT fk_item_estante
    FOREIGN KEY (numero) 
        REFERENCES estante (numero);

SELECT * from item;

-- Criar tabela livro
CREATE TABLE Livro (
    codigo INT PRIMARY KEY,
    anoPublicacao INT,
    sumario TEXT,
    FOREIGN KEY (codigo)
        REFERENCES item (codigo)
);
SELECT * FROM livro;

-- Criar tabela autores_livro e a chave estrangeira referenciando o livro
CREATE TABLE autores_livro (
    codigo INT,
    autor VARCHAR(100),
    PRIMARY KEY (codigo , autor),
    FOREIGN KEY (codigo)
        REFERENCES livro (codigo)
);
SELECT * from autores_livro;

-- Criar tabela editora_livro e a chave estrangeira referenciando o livro
CREATE TABLE editora_livro (
    codigo INT,
    editora VARCHAR(100),
    PRIMARY KEY (codigo , editora),
    FOREIGN KEY (codigo)
        REFERENCES livro (codigo)
);
SELECT * FROM editora_livro;


-- Criar tabela cd
CREATE TABLE cd (
    codigo INT PRIMARY KEY,
    nomeProdutora VARCHAR(100),
    ano INT,
    FOREIGN KEY (codigo)
        REFERENCES item (codigo)
);
SELECT * FROM cd;

-- Criar tablea musica_cd e a chave estrangeira referenciando o cd
CREATE TABLE musica_cd (
    codigo INT,
    nomeMusica VARCHAR(100),
    PRIMARY KEY (codigo , nomeMusica),
    FOREIGN KEY (codigo)
        REFERENCES cd (codigo)
);

SELECT * FROM musica_cd;

-- Criar tabela dvd
CREATE TABLE dvd (
    codigo INT PRIMARY KEY,
    nomeProdutora VARCHAR(100),
    ano INT,
    FOREIGN KEY (codigo)
        REFERENCES item (codigo)
);
SELECT * from dvd;

-- Criar tabela musicas_dvd e a chave estrangeira referenciando o dvd
CREATE TABLE musica_dvd (
    codigo INT,
    codigo_musica INT,
    nome VARCHAR(100),
    PRIMARY KEY (codigo , codigo_musica),
    FOREIGN KEY (codigo)
        REFERENCES dvd (codigo)
);
SELECT * from musica_dvd;

-- Criar a tabela estante 
CREATE TABLE estante (
    numero INT PRIMARY KEY,
    sala VARCHAR(50),
    andar INT
);
SELECT * from estante;

-- Criar tabela fornecedor e a chave estrangeira referenciando o item
CREATE TABLE fornecedor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    FOREIGN KEY (codigo)
        REFERENCES item (codigo)
);
SELECT * FROM fornecedor;

-- Criar tabela endereco_fornecedor e a chave estrangeira referenciando o fornecedor
CREATE TABLE endereco_fornecedor (
    codigo INT PRIMARY KEY,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    FOREIGN KEY (codigo)
        REFERENCES fornecedor (codigo)
);
SELECT * FROM endereco_fornecedor;

-- Criar tabela telefone_fornecedor e a chave estrangeira referenciado o fornecedor
CREATE TABLE telefone_fornecedor (
    codigo INT,
    telefone VARCHAR(20),
    PRIMARY KEY (codigo , telefone),
    FOREIGN KEY (codigo)
        REFERENCES fornecedor (codigo)
);
SELECT * from endereco_fornecedor;

-- Criar a tabela associado
CREATE TABLE associado (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
SELECT * from associado;

-- Criar tabela endereco associado (atributo composto)
CREATE TABLE endereco_associado (
    codigo INT PRIMARY KEY,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    FOREIGN KEY (codigo)
        REFERENCES associado (codigo)
);
SELECT * FROM endereco_fornecedor;

-- Criar tabela telefones associado(Atributo multivalorado)
CREATE TABLE telefone_associado (
    codigo INT,
    telefone VARCHAR(20),
    PRIMARY KEY (codigo , telefone),
    FOREIGN KEY (codigo)
        REFERENCES associado (codigo)
);
SELECT * from telefone_fornecedor;

-- Criar tabela emprestimo
create TABLE emprestimo(
id_emprestimo int PRIMARY key AUTO_INCREMENT,
data_emprestimo date not null,
data_devolucao date not null,
status VARCHAR(20) not null,
codigo_associado int not null,
FOREIGN KEY (codigo_associado) REFERENCES associado (codigo)
);
select * from emprestimo;

-- Criar table funcionario
CREATE TABLE funcionario (
    matricula INT,
    codigo INT,
    nome VARCHAR(100) NOT NULL,
    turno VARCHAR(20),
    sexo CHAR(1),
    PRIMARY KEY (matricula , codigo)
);
select * from funcionario;

-- Alterando a tabela emprestimo e adicionando a chave estrangeira
-- (matricula_funcionario, codigo_funcionario) referenciado o funcionrio
ALTER TABLE emprestimo
ADD COLUMN matricula_funcionario INT NOT NULL,
ADD COLUMN codigo_funcionario INT NOT NULL,
ADD CONSTRAINT fk_funcionario
    FOREIGN KEY (matricula_funcionario, codigo_funcionario)
    REFERENCES funcionario(matricula, codigo);

select * from emprestimo;

-- Criar tabela endereco funcionario e a chave estangeira referenciando o funcionario
CREATE TABLE endereco_funcionario (
    matricula INT,
    codigo INT,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    PRIMARY KEY (matricula , codigo),
    FOREIGN KEY (matricula , codigo)
        REFERENCES funcionario (matricula , codigo)
);

SELECT * from endereco_funcionario;

-- Criar tabela telefone funcionario e a chave estrangeira referenciando o funcionario
CREATE TABLE telefone_funcionario (
    matricula INT,
    codigo INT,
    telefone VARCHAR(20),
    PRIMARY KEY (matricula , codigo),
    FOREIGN KEY (matricula , codigo)
        REFERENCES funcionario (matricula , codigo)
);

SELECT * from telefone_funcionario;

-- Criar relacionamento verifica (com atributo data_hora)
 CREATE TABLE verifica (
    matricula INT,
    codigo INT,
    id_emprestimo INT,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (matricula , codigo , id_emprestimo),
    FOREIGN KEY (matricula , codigo)
        REFERENCES funcionario (matricula , codigo),
    FOREIGN KEY (id_emprestimo)
        REFERENCES emprestimo (id_emprestimo)
);

SELECT * from verifica;

-- Criar tabela associativa para o relacionamento N:N 
-- entre estante e funcionário (responsável_por)
CREATE TABLE responsavel_por (
    numero_estante INT,
    matricula_funcionario INT,
    codigo_funcionario INT,
    PRIMARY KEY (numero_estante , matricula_funcionario , codigo_funcionario),
    FOREIGN KEY (numero_estante)
        REFERENCES estante (numero),
    FOREIGN KEY (matricula_funcionario , codigo_funcionario)
        REFERENCES funcionario (matricula , codigo)
);

SELECT * from responsavel_por;

-- Popular as entidades:
-- 1. Estantes
INSERT INTO estante (numero, sala, andar) VALUES
(1, 'A', 1),
(2, 'B', 2),
(3, 'C', 1);

SELECT * from estante;

-- 2. Funcionários
INSERT INTO funcionario (matricula, codigo, nome, turno, sexo) VALUES
(101, 1, 'Ana Souza', 'Manhã', 'F'),
(102, 2, 'Carlos Silva', 'Tarde', 'M'),
(103, 3, 'Beatriz Lima', 'Noite', 'F');

select * from funcionario;

-- 3. Endereço e Telefones de Funcionário
INSERT INTO endereco_funcionario (matricula, codigo, rua, cidade, estado) VALUES
(101, 1, 'Rua das Flores', 'BH', 'MG'),
(102, 2, 'Av. Central', 'Contagem', 'MG'),
(103, 3, 'Rua Azul', 'Betim', 'MG');

INSERT INTO telefone_funcionario (matricula, codigo, telefone) VALUES
(101, 1, '31999990001'),
(102, 2, '31999990002'),
(103, 3, '31999990003');

select * from endereco_funcionario;
select * from telefone_funcionario;

-- 4. Associados
INSERT INTO associado (codigo, nome) VALUES
(201, 'João Prado'),
(202, 'Maria Fernanda'),
(203, 'Lucas Martins');

SELECT * FROM associado;

-- 5. Endereço e Telefones de Associado
INSERT INTO endereco_associado (codigo, rua, cidade, estado) VALUES
(201, 'Rua Verde', 'BH', 'MG'),
(202, 'Av. Palmeiras', 'Contagem', 'MG'),
(203, 'Rua do Sol', 'Betim', 'MG');

INSERT INTO telefone_associado (codigo, telefone) VALUES
(201, '31988887777'),
(202, '31988886666'),
(203, '31988885555');

SELECT * FROM endereco_associado;
SELECT * FROM telefone_associado;

-- 6. Itens (e vínculo com estante através do campo numero)
INSERT INTO item (codigo, descricao, titulo, numero) VALUES
(1001, 'Livro de Java', 'Java Essencial', 1),
(1002, 'Livro de SQL', 'SQL para Iniciantes', 2),
(1003, 'CD Pop', 'Hits 2020', 3),
(1004, 'DVD Rock', 'Rock Legends', 1);

SELECT * FROM item;

-- 7. Livros, Autores e Editoras
INSERT INTO livro (codigo, anoPublicacao, sumario) VALUES
(1001, 2020, 'Sumário de Java Essencial'),
(1002, 2021, 'Sumário de SQL para Iniciantes');

INSERT INTO autores_livro (codigo, autor) VALUES
(1001, 'Paulo Silveira'),
(1002, 'Gabriel Ferreira');

INSERT INTO editora_livro (codigo, editora) VALUES
(1001, 'Casa do Código'),
(1002, 'Novatec');

select * from livro;
select * from autores_livro;
select * from editora_livro;

-- 8. CDs e Músicas
INSERT INTO cd (codigo, nomeProdutora, ano) VALUES
(1003, 'Sony Music', 2020);

INSERT INTO musica_cd (codigo, nomeMusica) VALUES
(1003, 'Pop Star'),
(1003, 'Balada Alegre');

SELECT * FROM cd;
SELECT * FROM musica_cd;

-- 9. DVDs e Músicas
INSERT INTO dvd (codigo, nomeProdutora, ano) VALUES
(1004, 'Universal', 2022);

INSERT INTO musica_dvd (codigo, codigo_musica, nome) VALUES
(1004, 1, 'Rock You'),
(1004, 2, 'Legends Never Die');

SELECT * FROM dvd;
SELECT * FROM musica_dvd;

-- 10. Fornecedores, Endereços e Telefones
INSERT INTO fornecedor (codigo, nome) VALUES
(1001, 'Distribuidora Alfa'),
(1003, 'Música Brasil');

INSERT INTO endereco_fornecedor (codigo, rua, cidade, estado) VALUES
(1001, 'Rua das Editoras', 'BH', 'MG'),
(1003, 'Av. das Gravadoras', 'SP', 'SP');

INSERT INTO telefone_fornecedor (codigo, telefone) VALUES
(1001, '3133334444'),
(1003, '1144445555');

SELECT * FROM fornecedor;
SELECT * FROM endereco_fornecedor;
SELECT * FROM telefone_fornecedor;

-- 11. Empréstimos
INSERT INTO emprestimo (data_emprestimo, data_devolucao, status, codigo_associado, matricula_funcionario, codigo_funcionario) VALUES
('2025-07-01', '2025-07-10', 'ativo', 201, 101, 1),
('2025-07-02', '2025-07-12', 'ativo', 202, 102, 2),
('2025-07-03', '2025-07-13', 'devolvido', 203, 103, 3);

SELECT * FROM emprestimo;

-- 12. Verifica (Funcionário x Empréstimo)
INSERT INTO verifica (matricula, codigo, id_emprestimo, data_hota) VALUES
(101, 1, 1, '2025-07-01 09:00:00'),
(102, 2, 2, '2025-07-02 14:00:00'),
(103, 3, 3, '2025-07-03 19:00:00');

SELECT * FROM verifica;

-- 13. Responsável Por (Estante x Funcionário)

INSERT INTO responsavel_por (numero_estante, matricula_funcionario, codigo_funcionario) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3),
(1, 102, 2); 

SELECT * FROM responsavel_por;

-- 
-- A tabela item_emprestimo foi criada para mapear o relacionamento N:N entre empréstimo e item,
-- permitindo registrar quais itens estão vinculados a cada empréstimo, conforme o modelo entidade-relacionamento da biblioteca.
--
CREATE TABLE item_emprestimo (
    id_emprestimo INT,
    codigo_item INT,
    PRIMARY KEY (id_emprestimo, codigo_item),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo),
    FOREIGN KEY (codigo_item) REFERENCES item(codigo)
);
SELECT * FROM item_emprestimo;

-- Criar realizar_procedure
DELIMITER $$

CREATE PROCEDURE realizar_emprestimo (
    IN p_codigo_associado INT,
    IN p_codigo_item INT,
    IN p_data_emprestimo DATE,
    IN p_data_devolucao DATE,
    IN p_status VARCHAR(20),
    IN p_matricula_funcionario INT,
    IN p_codigo_funcionario INT
)
BEGIN
    -- Insere um novo empréstimo
    INSERT INTO emprestimo (
        data_emprestimo,
        data_devolucao,
        status,
        codigo_associado,
        matricula_funcionario,
        codigo_funcionario
    ) VALUES (
        p_data_emprestimo,
        p_data_devolucao,
        p_status,
        p_codigo_associado,
        p_matricula_funcionario,
        p_codigo_funcionario
    );

    -- Recupera o id do empréstimo recém-criado
    SET @novo_id_emprestimo = LAST_INSERT_ID();

    -- Insere o vínculo do item ao empréstimo
    INSERT INTO item_emprestimo (
        id_emprestimo,
        codigo_item
    ) VALUES (
        @novo_id_emprestimo,
        p_codigo_item
    );
END $$


DELIMITER ;

-- Criar procedure para listar todos os empréstimos
delimiter //
CREATE PROCEDURE listar_emprestimos()
BEGIN
    SELECT * FROM emprestimo;
END;
//
delimiter ;

-- Executar para listar itens do listar_emprestimos
CALL listar_emprestimos();

-- Executar para chamar realizar_emprestimo
CALL realizar_emprestimo(201, 1001, '2025-07-05', '2025-07-15', 'ativo', 101, 1);

-- Verificar as tabelas
SELECT * FROM emprestimo;
SELECT * FROM item_emprestimo;


