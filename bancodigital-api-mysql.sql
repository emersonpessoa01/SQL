SELECT * FROM clientes;
SELECT * FROM contas;
SELECT * FROM cartoes;
SELECT saldo FROM contas WHERE id=1;
SELECT saldo FROM contas WHERE id=2;
SELECT c.id, c.numero, c.agencia, c.saldo, cl.nome AS cliente_nome, cl.email AS ciente_email
FROM contas c
JOIN clientes cl ON c.cliente_id = cl.id;

select c.id, c.saldo, cl.nome as cliente_nome, cl.email as cliente_email, cl.cpf as cliente_cpf 
from contas c
join clientes cl on c.cliente_id = cl.id;

SELECT id, tipo FROM contas WHERE id = 1;

UPDATE contas SET tipo = 'corrente' WHERE id = 1;
UPDATE contas SET tipo = 'poupanca' WHERE id = 2;
UPDATE contas SET tipo = 'corrente' WHERE id = 3;

SET SQL_SAFE_UPDATES = 0;

UPDATE lancamentos_cartao
SET pago = false
WHERE pago IS NULL;

SET SQL_SAFE_UPDATES = 1;

UPDATE lancamentos_cartao
SET pago = false
WHERE pago IS NULL AND id IS NOT NULL;

-- Reforce no banco de dados que a coluna status tem valor padrão
ALTER TABLE cartoes MODIFY status BOOLEAN NOT NULL DEFAULT true;

-- Verificar saldo da conta 1
SELECT id, saldo FROM contas WHERE id = 1;

-- Aumentar saldo da conta 1
UPDATE contas SET saldo = 5000.0 WHERE id = 1;









