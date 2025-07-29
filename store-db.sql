create database store;
use store;
show tables;
SELECT * FROM produtos;


-- Produt buscado
SELECT * from produtos WHERE id=1;
DELETE from produtos where id=1;

-- PROCEDURE
-- Remove a procedure antiga, se existir
DROP PROCEDURE IF EXISTS salvar_produto;

-- Define a nova procedure
DELIMITER //
CREATE PROCEDURE salvar_produto(
    IN p_id BIGINT,
    IN p_nome VARCHAR(255),
    IN p_preco DOUBLE
)
BEGIN
    INSERT INTO produtos (id, nome, preco)
    VALUES (p_id, p_nome, p_preco)

    -- atualizar o produto caso o ID já exista
    ON DUPLICATE KEY UPDATE
        nome = VALUES(nome),
        preco = VALUES(preco);
END;
//
DELIMITER ;

-- Para listar todos os produtos
drop procedure if exists listar_produtos;

delimiter //
CREATE PROCEDURE listar_produtos()
BEGIN
    SELECT * FROM produtos;
END;
//
delimiter ;

-- Executar para listar todos os produtos de listar_produtos
CALL listar_produtos();
