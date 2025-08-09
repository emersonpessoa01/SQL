# Repositório SQL

Este repositório contém uma coleção de scripts SQL e diagramas de banco de dados desenvolvidos para fins educacionais e práticos. Os arquivos abordam desde a criação de bancos de dados até operações complexas, como joins e manipulação de dados, utilizando diferentes sistemas de gerenciamento de banco de dados (SGBDs).

## Conteúdo do Repositório

O repositório inclui diversos scripts SQL que abordam exemplos práticos de criação e manipulação de bancos de dados, como:

- BancoAula.sql
- Cafeteria_bomgosto.sql
- CentroAcademico.sql e CentroAcademico1.sql
- EscolaDB.sql e EscolaInformatica.sql
- GestãoVendas.sql
- Bancos digitais para MySQL e PostgreSQL
- E outros exemplos e diagramas

## Exemplos de JOINs em SQL

Abaixo, uma ilustração visual e exemplos de comandos SQL para diferentes tipos de JOINs, essenciais para combinar registros entre tabelas:

![SQL JOINS](./SQL-JOIN.gif)

| Tipo de JOIN               | Descrição                                                                                         |
|---------------------------|-------------------------------------------------------------------------------------------------|
| **INNER JOIN**             | Retorna registros que possuem valores correspondentes em ambas as tabelas.                      |
| **LEFT JOIN**              | Retorna todos os registros da tabela da esquerda e os registros correspondentes da tabela da direita. |
| **LEFT JOIN com NULL Check** | Retorna somente os registros da tabela da esquerda que não possuem correspondentes na tabela da direita (valores NULL). |
| **RIGHT JOIN**             | Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda. |
| **RIGHT JOIN com NULL Check**| Retorna somente os registros da tabela da direita que não possuem correspondentes na tabela da esquerda (valores NULL). |
| **FULL JOIN**              | Retorna todos os registros quando houver correspondência em qualquer uma das tabelas (esquerda ou direita). |
| **FULL JOIN com NULL Check** | Retorna somente os registros que não possuem correspondência em nenhuma das tabelas (valores NULL). |

## Como usar os scripts

1. Clone o repositório:

   ```bash
   git clone https://github.com/emersonpessoa01/SQL.git
   cd SQL
