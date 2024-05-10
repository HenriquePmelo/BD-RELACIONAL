create database bd_aula07;
\c bd_aula07
create table tbl_fornecedor (cod_fornecedor serial primary key, nome text not null, status integer, cidade text);
create table tbl_peca (cod_peca serial primary key, nome text not null, cor text, preco numeric, cidade text);
create table tbl_estoque (cod_compra serial primary key, 
						 cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
						cod_peca integer references tbl_peca(cod_peca),
						quantidade integer);
						
insert into tbl_fornecedor(nome,status,cidade) 
values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');

INSERT INTO tbl_peca(nome, cor, preco, cidade) values
('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
('TESOURA','VERMELHA',12,'LONDRES');

INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
(1,1,30),(2,1,30),(3,2,10),(3,3,50);

--1 Listar o nome dos fornecedores(maiusculo) e das peças(minusculo) que se situam na mesma cidade, ordenado pelo nome

bd_aula07=# SELECT Upper(f.nome), lower(p.nome) FROM tbl_fornecedor f INNER JOIN tbl_peca p ON f.cidade = p.cidade ORDER  BY f.nome ASC;

--2 listar as cidades onde existem fornecedores (sem valores duplicados)
SELECT DISTINCT cidade FROM tbl_fornecedor;

--3 Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça
SELECT nome,cor FROM tbl_peca WHERE cod_peca == 3 ORDER BY nome ASC;

--4 Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1. 
SELECT nome.p,cidade.p FROM tbl_peca p , tbl_estoque e WHERE sum(quantidade.e) > 10 AND cod_peca.p == 1 ;

--5 Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
SELECT quantidade.e FROM tbl_estoque e, tbl_fornecedor f WHERE cod_fornecedor.f == 1;

--6 Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
SELECT AVG(preco.p) AS 'avg' FROM tbl_peca p, tbl_estoque.e WHERE cod_fornecedor.e == 3;

--7 lista o valor da pecas mais cara e a mais barata.
SELECT MAX(preco) AS 'Mais Cara' , MIN(preco) AS 'Mais Barata' FROM tbl_peca;

--8 listar a quantidade de peças cadastradas
SELECT COUNT nome FROM tbl_peca;

--9 listar a quantidade de cidades diferentes onde existem peças cadastradas
SELECT COUNT cidade FROM tbl_peca  WHERE cod_peca IS NOT NULL;

--10 listar a media dos precos de todas as peças, com somente 1 digito após a virgula.
SELECT AVG ROUND(preco,1) AS 'Media dos preços' FROM tbl_peca;

