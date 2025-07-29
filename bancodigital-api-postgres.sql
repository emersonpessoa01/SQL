select * from clientes;
-- delete from clientes;
-- delete from clientes where id=2;
-- drop database bancodigital;

select saldo from contas where id=1;
select saldo from contas where id=2;
select saldo from contas;

select c.id, c.numero, c.agencia, c.saldo,
cl.nome as cliente_nome, cl.email as cliente_email
from contas c
join clientes cl on c.cliente_id = cl.id;

select c.id,c.numero, c.agencia, c.saldo,
cl.nome as cliente_nome, cl.email as cliente_mail
from contas c
join clientes cl on c.cliente_id = cl.id;