use sistema_gestao_estoque;

-- DML (DATA LANGUAGE MANIPULATION LANGUAGE) - LINGUAGEM DE MANIPULAÇÃO DE DADOS
-- DDL (DATA DEFINITION LANGUAGE) - LINGUAGEM DE DEFINIÇÃO DE DADOS
-- DCL (DATA CONTROL LANGUAGE) - LINGUAGEM DE CONTROLE DE DADOS
-- TCL (TRANSACTION CONTROL LANGUAGE) - LINGUAGEM DE CONTROLE DE TRANSAÇÃO
show tables;

show databases;

-- DML (DATA LANGUAGE MANIPULATION LANGUAGE) - LINGUAGEM DE MANIPULAÇÃO DE DADOS
-- Sempre começa a criar tabelas pelas bordas e não pelo meio
create table if not exists categoria(
    id INTEGER primary key auto_increment,
    descricao varchar(100)
);

select
    *
from
    categoria;

create table if not exists marca(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100)
);

SELECT
    *
from
    marca
ORDER BY
    id asc;

-- Tabela de produtos - tabela do meio
-- Deve ter uma chave estrangeira para categoria e marca
create table if not exists produto(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100),
    categoria_id INTEGER,
    marca_id INTEGER,
    preco DECIMAL(10, 2)
);

SELECT
    *
from
    produto;

-- Popular as tabelas de categoria e marca
INSERT INTO
    categoria (descricao)
VALUES
    ('tênis'),
    ('Saptilhas Femininas'),
    ('chinelo');

SELECT
    *
FROM
    categoria;

-- Alterando a descrição da categoria pelo id
UPDATE
    categoria
SET
    descricao = 'Sapatilhas Femininas'
WHERE
    id = 2;

ALTER TABLE
    categoria
ADD
    CONSTRAINT unique_categoria UNIQUE (descricao);

INSERT INTO
    marca (descricao)
VALUES
    ('Olímpicos'),
    ('Adidas'),
    ('Mizuno'),
    ('Shimano'),
    ('Grendene');

-- Deletar campos da tabela marca pleo id
DELETE FROM
    marca
WHERE
    id in(6, 7, 8, 9, 10);

-- Coluna descricao não pode ter valores repetidos
ALTER TABLE
    marca
ADD
    CONSTRAINT unique_descricao UNIQUE (descricao);

SELECT
    *
FROM
    marca
where
    DESC;

-- Visualizando a descrição do produto
DESC PRODUTO;

-- Populando a tabela de produto
INSERT INTO
    produto (categoria_id, marca_id, descricao, preco)
VALUES
    (1, 1, 'Breed 2', 89.99),
    (1, 2, 'Durano Lite 20', 149.99),
    (1, 2, 'Run Falco Feminino', 169.99),
    (1, 3, 'Space Masculino', 150.99),
    (2, 4, 'Speed Shwr61', 328.90),
    (3, 5, 'Monstrinhos', 24.99);

DELETE FROM
    produto
WHERE
    id in(6, 7, 8, 9, 10, 11, 12);

ALTER TABLE
    produto
ADD
    CONSTRAINT unique_produto UNIQUE (categoria_id, marca_id, descricao);

SELECT
    *
FROM
    produto;

desc produto;

-- Listagem de Produtos com Descrição da Marca e Preço
SELECT
    p.id as codigo_produto,
    p.descricao as descricao_produto,
    m.descricao as descricao_marca,
    p.preco as preco_produto
FROM
    produto p
    inner join marca m on (p.marca_id = m.id);

-- Listagem Completa de Produtos e Marcas (Simulação de FULL OUTER JOIN)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    LEFT JOIN marca m ON p.marca_id = m.id
UNION
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    RIGHT JOIN marca m ON p.marca_id = m.id;

-- Juntando tudo
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id;

show TABLES;

-- Ordenando uma query  com ORDER BY(ordenando pelo id do produto)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id
ORDER BY
    p.id DESC;

-- Ordenando uma query  com ORDER BY(ordenando pelo preço do produtomais barato)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id
ORDER BY
    p.preco ASC;

-- Ordenando uma query  com ORDER BY(ordenando pela marca do produtomais barato)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id
ORDER BY
    m.descricao ASC;

-- Ordenando uma query  com ORDER BY(ordenando pela categoria do produtomais barato)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id
ORDER BY
    c.descricao ASC;

-- Ordenando uma query  com ORDER BY(ordenando pela marca do produto mais barato
--com preço na ordem decrescente)
SELECT
    p.id AS codigo_produto,
    p.descricao AS descricao_produto,
    c.descricao AS descricao_categoria,
    m.descricao AS descricao_marca,
    p.preco AS preco_produto
FROM
    produto p
    INNER JOIN categoria c ON p.categoria_id = c.id
    INNER JOIN marca m ON p.marca_id = m.id
ORDER BY
    m.descricao ASC,
    p.preco DESC;

-- FILTROS => WHERE
-- Filtrando produtos por descrição
select
    p.id as codigo_produto,
    p.descricao as descricao_produto,
    c.descricao as descricao_categoria,
    m.descricao as descricao_marca,
    p.preco as preco_produto
from
    produto p
    inner join categoria c on p.categoria_id = c.id
    inner join marca m on p.marca_id = m.id
where
    p.descricao = "Breed 2";

