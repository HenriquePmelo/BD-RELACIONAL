\c bd_aula13
CREATE TABLE tabela01 (id integer, nome text, salario real);
INSERT INTO tabela01 VALUES (1,'Paulo',1000),(2,'Pedro',5000),(3,'Maria',10000);
SELECT * from tabela01;
CREATE USER usuario01 with password 'teste';
\du
\conninfo
\c bd_aula15 usuario01
SELECT * from tabela01;

GRANT select on tabela01 to usuario01;

REVOKE select on tabela01 FROM usuario01;

CREATE VIEW v_tabela01 as select * from tabela01 where salario < 10000;

select * from v_tabela01;

GRANT select on v_tabela01 to usuario01;

ALTER USER usuario01 WITH superuser;
