create database cafeteria_bomgosto;
use cafeteria_bomgosto;

-- 1. Criar tabela Cardapio
CREATE TABLE Cardapio (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) UNIQUE NOT NULL,
    PrecoUnitario DECIMAL(10 , 2 ) NOT NULL
);
-- Adicionar a coluna Descricao na Tabela
alter table Cardapio add column Descricao text;
SELECT * from cardapio;

-- 2. Criar Tabela Comanda
CREATE TABLE Comanda (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Mesa INT NOT NULL,
    NomeCliente VARCHAR(100) NOT NULL
);
SELECT * from comanda;

-- 3. Inserir tabela ItemComanda
CREATE TABLE ItemComanda (
    CodigoComanda INT,
    CodigoCardapio INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (CodigoComanda , CodigoCardapio),
    FOREIGN KEY (CodigoComanda)
        REFERENCES Comanda (Codigo),
    FOREIGN KEY (CodigoCardapio)
        REFERENCES Cardapio (Codigo)
);

SELECT * from ItemComanda;

-- 4.Inserir dados no Cardápio
INSERT INTO Cardapio (Nome, Descricao, PrecoUnitario)
VALUES 
('Expresso', 'Café puro e forte', 5.00),
('Cappuccino', 'Café com leite vaporizado e espuma', 8.00),
('Latte', 'Café com leite cremoso', 7.50),
('Mocha', 'Café com chocolate e leite', 9.00),
('Americano', 'Café diluído com água quente', 6.00);

SELECT * from cardapio;

-- 5.Inserir dados na tabela Comanda
insert into Comanda(Data, Mesa, NomeCliente)
values
('2025-01-05',1,'Carlos Silva'),
('2025-01-05',2,'Ana Costa'),
('2025-01-06',3,'joão Souza'),
('2025-01-06',4,'Mariana Lima'),
('2025-01-06',5,'pedro Alves');

SELECT * from Comanda;
-- Atualizando nome de clientes
UPDATE comanda 
SET 
    NomeCliente = 'João Souza'
WHERE
    Codigo = 3;
UPDATE comanda 
SET 
    NomeCliente = 'Pedro Alves'
WHERE
    Codigo = 5;


-- Inserir dados nos Itens da Comanda
INSERT into itemcomanda(CodigoComanda, CodigoCardapio,Quantidade)
values
(1,1,2),
(1,3,1),
(2,2,1),
(2,4,2),
(3,5,3),
(4,1,1),
(4,3,2),
(5,2,1),
(5,4,1),
(5,5,1);
SELECT * from itemcomanda;
-- EXERCÍCIO
-- 1) Listagem do cardápio ordenada por nome
SELECT 
    *
FROM
    Cardapio
ORDER BY Nome;

-- 2) Todas as comandas e itens ordenados por data, código da comanda e nome do café
SELECT 
    c.Codigo AS CodigoComanda,
    c.Data,
    c.Mesa,
    c.NomeCliente,
    ca.Nome AS NomeCafe,
    ca.Descricao,
    ic.Quantidade,
    ca.PrecoUnitario,
    (ic.Quantidade * ca.PrecoUnitario) AS PrecoTotalCafe
FROM
    Comanda c
        JOIN
    itemComanda ic ON c.Codigo = ic.CodigoComanda
        JOIN
    Cardapio ca ON ic.CodigoCardapio = ca.Codigo
ORDER BY c.Data , c.Codigo , ca.Nome;

-- 3) Todas as comandas com o valor total, ordenadas por data
SELECT 
    c.Codigo AS CodigoComanda,
    c.Data,
    c.Mesa,
    c.NomeCliente,
    SUM(ic.Quantidade * ca.PrecoUnitario) AS ValorTotal
FROM
    Comanda c
        JOIN
    ItemComanda ic ON c.Codigo = ic.CodigoComanda
        JOIN
    Cardapio ca ON ic.CodigoCardapio = ca.Codigo
GROUP BY c.Codigo , c.Data , c.Mesa , c.NomeCliente
ORDER BY c.Data;

-- 4) Comandas com mais de um tipo de café, ordenadas por data
SELECT 
    c.Codigo AS CodigoComanda,
    c.Data,
    c.Mesa,
    c.NomeCliente,
    SUM(ic.Quantidade * ca.PrecoUnitario) AS ValorTotal
FROM Comanda c
JOIN ItemComanda ic ON c.Codigo = ic.CodigoComanda
JOIN Cardapio ca ON ic.CodigoCardapio = ca.Codigo
GROUP BY c.Codigo, c.Data, c.Mesa, c.NomeCliente
HAVING COUNT(DISTINCT ic.CodigoCardapio) > 1
ORDER BY c.Data;

-- 5) Total de faturamento por data
SELECT 
    c.Data,
    SUM(ic.Quantidade * ca.PrecoUnitario) AS FaturamentoTotal
FROM Comanda c
JOIN ItemComanda ic ON c.Codigo = ic.CodigoComanda
JOIN Cardapio ca ON ic.CodigoCardapio = ca.Codigo
GROUP BY c.Data
ORDER BY c.Data;
