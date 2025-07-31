use sistema_gestao_estoque;

show tables;

show databases;

-- Sempre começa a criar tabelas pelas ponts e não pelo meio
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

SELECT * from marca;

select
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
SELECT * from produto;