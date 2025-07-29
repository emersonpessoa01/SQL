create database GestaoVendas;
use Gestaovendas;

-- Tabela Vendedores
CREATE TABLE Vendedores (
    nrVendedor INT PRIMARY KEY, 
    nomeVendedor VARCHAR(100),
    idade INT,
    salario DECIMAL(10 , 2 )
);

-- Tabela Clientes
CREATE TABLE Clientes (
    nrCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(100),
    cidade VARCHAR(100),
    tipo VARCHAR(50)
);
SELECT * from clientes;
-- Tabela Pedidos
CREATE TABLE Pedidos (
    nr_pedido INT PRIMARY KEY,
    nrVendedor INT, -- Chave estrangeira
    nrCliente INT,  -- Chave estrangeira
    quantidade_itens INT,
    valor_total DECIMAL(10 , 2 ),
    FOREIGN KEY (nrVendedor)
        REFERENCES Vendedores (nrVendedor),
    FOREIGN KEY (nrCliente)
        REFERENCES Clientes (nrCliente)
);
select * from Pedidos;

# Script para popular as tabelas Vendedores, Clientes e Pedidos
-- Inserindo dados na tabela Vendedores
insert into Vendedores(nrVendedor, nomeVendedor, idade,salario) 
values
(1, 'João Silva',35,3500.00),
(2,'Maria Oliveira',29,4200.00),
(3,'Carlos Santos',40,5000.00),
(4,'Ana Costa','33',3000.00);

-- Atualizar nome dos vendedores

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


UPDATE Vendedores SET nomeVendedor = 'Aragorn' WHERE nrVendedor = 1;
UPDATE Vendedores SET nomeVendedor = 'Arwen' WHERE nrVendedor = 2;
UPDATE Vendedores SET nomeVendedor = 'Gandalf' WHERE nrVendedor = 3;
UPDATE Vendedores SET nomeVendedor = 'Aragor' WHERE nrVendedor = 4;



SELECT * FROM Vendedores WHERE nomeVendedor IN (C);


desc Vendedores;
SELECT 
    *
FROM
    Vendedores;
    


-- Inserindo dados na tabela Clientes
insert into Clientes(nrCliente, nomeCliente, cidade, tipo) 
values
(101,'Indústria Alpha','São Paulo', 'INDÚSTRIA'),
(102,'Comércio Beta','Rio de Janeiro','COMÉRCIO'),
(103,'Serviço Gama', 'Belo Horizonte','SERVIÇO'),
(104,'Indústria Delta','Curitiba','INDÚSTRIA'),
(105,'Comércio Épislon','Porto Alegre','COMÉRCIO');

desc Clientes;
SELECT * FROM Clientes;

# Verificar quais registros serão excluídos antes de executar o comando:
SELECT * FROM Clientes
WHERE nrCliente BETWEEN 11 AND 15;

# Excluir as linhas com IDs no intervalo de 101 a 105 da tabela Clientes:
DELETE FROM Clientes 
WHERE nrCliente BETWEEN 101 AND 105;

-- Confirmando se os registros de nrcliente entre 101 e 105 
-- realmente existem:
SELECT * FROM Clientes WHERE nrcliente BETWEEN 101 AND 105;

-- Certificando-se de que os IDs 11 a 15 não estejam em 
-- uso 
SELECT * FROM Clientes WHERE nrcliente BETWEEN 11 AND 15;

# Atualizando os IDs dos Clientes
UPDATE Clientes SET nrCliente = 11 WHERE nrCliente = 101;
UPDATE Clientes SET nrCliente = 12 WHERE nrCliente = 102;
UPDATE Clientes SET nrCliente = 13 WHERE nrCliente = 103;
UPDATE Clientes SET nrCliente = 14 WHERE nrCliente = 104;
UPDATE Clientes SET nrCliente = 15 WHERE nrCliente = 105;
    
-- Desativando temporariamente a verificação de integridade 
-- referencial:
set foreign_key_checks = 0;

-- Inserindo dados na tabela Pedidos:
insert into Pedidos(
nr_pedido, 
nrVendedor,
nrCliente, 
quantidade_itens,
valor_total 
) values
(1001,1,101,20,5000.00),
(1002,2,102,15,3500.00),
(1003,1,103,10,1500.00),
(1004,3,104,25,7500.00),
(1005,4,105,30,9000.00);

SELECT 
    *
FROM
    Pedidos;

-- ---------------------Exercício ------------------------
-- 1. Quais os nomes de todos os vendedores?
SELECT 
    nomeVendedor
FROM
    Vendedores;
    
-- 2. Quais os números dos vendedores que realizaram algum pedido?
SELECT 
    nrVendedor
FROM
    Pedidos;

-- 3. Quais os números dos vendedores que não realizaram pedidos?
SELECT 
    nrVendedor
FROM
    Vendedores
WHERE
    nrVendedor NOT IN (SELECT DISTINCT
            nrVendedor
        FROM
            Pedidos);

-- 4. Quais os nomes dos vendedores que realizaram pedido para clientes do tipo "INDÚSTRIA"?
SELECT * FROM Vendedores;
select * from Pedidos;
select * from Clientes;

SELECT DISTINCT
    Pedidos.nrVendedor
FROM
    Pedidos 
        JOIN
    Clientes ON pedidos.nrCliente = clientes.nrCliente
WHERE
    clientes.tipo = "INDÚSTRIA";
    
-- 4.1. Quais os números dos vendedores que realizaram pedido para clientes do tipo "INDÚSTRIA"?    
SELECT DISTINCT
    vendedores.nomeVendedor
FROM
    pedidos
        JOIN
    clientes ON pedidos.nrCliente = clientes.nrCliente
    JOIN
	vendedores ON pedidos.nrVendedor = vendedores.nrVendedor
WHERE
    clientes.tipo = 'INDÚSTRIA';

    
-- 5. Quais os números dos vendedores que realizaram pedido para clientes do tipo "INDÚSTRIA"?
SELECT DISTINCT
    c.tipo
FROM
    Pedidos p
        JOIN
    Clientes c ON p.nrCliente = c.nrCliente
        JOIN
    Vendedores v ON p.nrVendedor = v.nrVendedor
WHERE
    v.nomeVendedor = 'João Silva';

-- 6. Quais os nomes e tipos dos clientes com pedidos acima de 5000 reais?
SELECT 
    c.nomeCliente, c.tipo
FROM
    Pedidos p
        JOIN
    Clientes c ON p.nrCliente = c.nrCliente
WHERE
    p.valor_total > 5000;
    
    

-- 7. Quais são os nomes, idades e salários dos vendedores com salários acima de 3000
SELECT 
    nomeVendedor, idade, salario
FROM
    Vendedores
WHERE
    salario > 3000;
    
-- 8. Quais as cidades dos clientes do tipo INDÚSTRIA
SELECT * FROM Vendedores;
select * from Pedidos;
select * from Clientes;
SELECT 
    cidade
FROM
    Clientes
WHERE
    tipo = 'INDÚSTRIA';