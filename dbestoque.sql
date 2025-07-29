create database dbestoque;
use dbestoque;
-- INÍCIO DO DDL
CREATE TABLE tbsetor (
    CoSetor INT NOT NULL AUTO_INCREMENT,
    NoSetor VARCHAR(50),
    PRIMARY KEY (CoSetor)
);

CREATE TABLE tbproduto (
    CoProduto INT NOT NULL AUTO_INCREMENT,
    noProduto VARCHAR(100),
    PRIMARY KEY (CoProduto)
);

-- Alterar nome do noProduto
alter TABLE tbproduto rename COLUMN noProduto to NoProduto;

CREATE TABLE tbusuario (
    CoUsuario INT NOT NULL AUTO_INCREMENT,
    NoUsuario VARCHAR(50) NOT NULL,
    NoCPF INT NOT NULL UNIQUE,
    PRIMARY KEY (CoUsuario)
);

-- Alterar nome do NoCPF 
alter table tbusuario rename column NoCPF to NuCPF;

CREATE TABLE tbrequisicao (
    CoRequisicao INT NOT NULL AUTO_INCREMENT,
    DaRequisicao DATE NOT NULL,
    CoUsuario INT NOT NULL,
    CoSetor INT NOT NULL,
    PRIMARY KEY (CoRequisicao)
);

CREATE TABLE tbprodutorequisicao (
    IdProdutoRequisicao INT NOT NULL AUTO_INCREMENT,
    CoRequisicao INT NOT NULL,
    CoProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (IdProdutoRequisicao)
);

select * from tbusuario;

-- CRIAÇÃO DAS CHAVES ESTRANGEIRAS
-- Adicionar uma restrição através de constraint entre tbusuario com tbrequisicao
-- Criando chave estrangeira na tbrequisao nas colunas do CoUsuario e CoSetor
ALTER TABLE tbrequisicao ADD CONSTRAINT fk_tbusuariotbrequisicao FOREIGN KEY (CoUsuario) REFERENCES tbusuario(CoUsuario);
ALTER TABLE tbrequisicao ADD CONSTRAINT fk_tbsetortbrequisicao FOREIGN KEY(CoSetor) REFERENCES	tbsetor(CoSetor);
ALTER TABLE tbprodutorequisicao ADD CONSTRAINT fk_tbprodutorequisicaotbrequisicao FOREIGN KEY(CoRequisicao) REFERENCES tbrequisicao(CoRequisicao);
ALTER TABLE tbprodutorequisicao ADD CONSTRAINT fk_tbprodutorequisicaotbproduto FOREIGN KEY(CoProduto) REFERENCES tbproduto(CoProduto);

-- Como alterar as estrutura das tabelas 
use dbestoque;
ALTER TABLE tbproduto ADD estoque DATE; 
ALTER TABLE tbproduto RENAME COLUMN estoque to Estoque; -- primeira forma de alteração
alter table tbproduto change estoque QtEstoque date; -- segunda forma de alteração
ALTER TABLE tbproduto change QtEstoque QtEstoque int; -- alterando o tipo
ALTER TABLE tbproduto drop QtEstoque; -- Excluir o campo QtEstoque
ALTER TABLE tbusuario drop NuCPF; -- Excluir o campo NuCPF
DROP TABLE tbproduto; -- Apagar a tabela

-- INÍCIO DO DML
INSERT INTO tbusuario(CoUsuario,NoUsuario)
values(14780,"Pascal");

SELECT * from tbusuario;

INSERT INTO	tbsetor(CoSetor,NoSetor) 
VALUES(3,"Recursos Humanos");
SELECT * from tbsetor;

INSERT INTO tbrequisicao (CoRequisicao, DaRequisicao, CoUsuario, CoSetor)
VALUES (1200,'1890-03-22',14780,3);
SELECT * from tbrequisicao;

INSERT INTO tbproduto(CoProduto,NoProduto)
VALUES
(15,'Lapis Grafite'),
(3,'Caneta Azul'),
(9,'Caneta Preta'),
(45,'CAneta Vermelha'),
(33,'Resma de Papel');

SELECT * FROM tbproduto;
-- Inserir dados
INSERT INTO tbprodutorequisicao (IdProdutoRequisicao,CoProduto,CoRequisicao,Quantidade)
VALUES (1, 15, 1200, 2),
	   (2, 3, 1200, 3),
	   (3, 9, 1200, 2),
	   (4, 45, 1200, 1),
	   (5, 33, 1200, 1);
        
-- Inserir dados
SELECT * from tbusuario;
ALTER TABLE tbusuario ADD COLUMN NuCPF CHAR(11); -- Adicionando campo estoque do tipo DATE
INSERT INTO tbusuario(CoUsuario,NoUsuario,NuCPF)
VALUES(102030,'Turing',12345678901);

-- Atualizar dados
UPDATE tbusuario 
SET 
    NuCPF = 1020
WHERE
    CoUsuario = 14780;	

SELECT * FROM tbprodutorequisicao;
SELECT Quantidade FROM tbprodutorequisicao;
SELECT * FROM tbprodutorequisicao WHERE Quantidade < 2;

-- Modiifcar quantidade de produtos de requisiçaõ que possuem valores abaixo de 2
UPDATE tbprodutorequisicao 
SET 
    Quantidade = 5
WHERE
    Quantidade < 2
        AND IdProdutoRequisicao IN (4 , 5);
-- Outra forma de atualizar   
UPDATE tbprodutorequisicao 
SET 
    Quantidade = 1
WHERE
    IdProdutoRequisicao >= 4
        AND IdProdutoRequisicao <= 5;
--  Outra forma de atualizar
UPDATE tbprodutorequisicao 
SET 
    Quantidade = 5
WHERE
    IdProdutoRequisicao = 4
        OR IdProdutoRequisicao = 5;
--  Outra forma de atualizar
UPDATE tbprodutorequisicao 
SET 
    Quantidade = 1
WHERE
    CoRequisicao = 1200 AND CoProduto = 33
        OR CoProduto = 45;