use sistema_gestao_estoque;

show tables;

show databases;

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
    marca;

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
    marca;

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