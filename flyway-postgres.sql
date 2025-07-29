SELECT * FROM public.pessoas
ORDER BY id ASC;

SELECT p.id, p.nome AS nome_pessoa, e.endereco AS endereco_pessoa
FROM pessoas p
JOIN pessoa_endereco pe ON p.id = pe.pessoa_id
JOIN enderecos e ON e.id = pe.endereco_id
WHERE p.id = 1;
