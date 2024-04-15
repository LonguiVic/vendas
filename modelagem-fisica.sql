/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE EXEMPLO;
CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

-- CRIANDO A TABELA DE CLIENTES

CREATE TABLE CLIENTE(
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

-- VERIFICANDO TABELAS DO BANCO

SHOW TABLES;

-- DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA

DESC CLIENTE;

-- SINTAXE BÁSICA DE INSERÇÃO: INSERT INTO {TABLE} VALUES()

-- FORMA 01 - OMITINDO AS COLUNAS

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM','988638273','922923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM','541521456','925078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,'885755896','958748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

-- FORMA 02 - COLOCANDO COLUNAS

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

-- FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO 
CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA', 'F', 'CARLA@MICROSOFT.COM',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');


-- INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','987782616',99999999999);
-- INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','987782616',22222222222);

-- COMANDO SELECT 

SELECT NOW();

SELECT 'VICTOR LONGUI'

SELECT 'BANCO DE DADOS'

-- ALIAS DE COLUNAS

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME AS CLIENTE, SEXO, EMAIL, ENDERECO FROM CLIENTE;
SELECT SEXO, EMAIL, ENDERECO, NOME AS CLIENTE FROM CLIENTE;

SELECT NOME AS CLIENTE, SEXO, EMAIL, ENDERECO, NOW() AS DATA_HORA FROM CLIENTE;

-- APENAS PARA FINS ACADEMICOS

SELECT * FROM CLIENTE;

-- FILTRANDO COM WHERE E LIKE

SELECT NOME, SEXO 
FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'F';

/*
SELECT NOME, SEXO 
FROM CLIENTE
WHERE ENDERECO = 'RJ';
*/

SELECT NOME, SEXO
FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO
FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO
FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';

CREATE DATABASE IF NOT EXISTS LIVRARIA;

USE LIVRARIA;

CREATE TABLE IF NOT EXISTS LIVROS(
    NOME_DO_LIVRO VARCHAR(255),
    NOME_DO_AUTOR VARCHAR(255),
    SEXO_DO_AUTOR CHAR(1),
    NUMERO_DE_PAGINAS INT CHECK(NUMERO_DE_PAGINAS > 0),
    NOME_DA_EDITORA VARCHAR(255),
    VALOR_DO_LIVRO DECIMAL(10,2),
    ESTADO_UF_DA_EDITORA CHAR(2),
    ANO_PUBLICACAO YEAR
);

INSERT INTO LIVROS (NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_DO_AUTOR, NUMERO_DE_PAGINAS, NOME_DA_EDITORA, VALOR_DO_LIVRO, ESTADO_UF_DA_EDITORA, ANO_PUBLICACAO) 
VALUES 
('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.90,'RJ',2009),
('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018),
('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008),
('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78.99,'RJ',2018),
('Hábitos Saudáveis','Eduardo Santos','M',630,'Beta',150.98,'RJ',2019),
('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016),
('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015),
('Pra sempre amigas','Leda Silva','F',510,'Insignia',78.98,'ES',2011),
('Copas Inesquecíveis','Marco Alcantra','M',200,'Larson',130.98,'RS',2018),
('O Poder da Mente','Clara Mafra','F',120,'Continental',56.58,'SP',2017);

-- Trazer todos os dados
SELECT * 
FROM LIVROS;

-- Trazer o nome do  livro e o nome da editora
SELECT NOME_DO_LIVRO,NOME_DA_EDITORA 
FROM LIVROS;

-- Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino
SELECT NOME_DO_LIVRO,ESTADO_UF_DA_EDITORA
FROM LIVROS
WHERE SEXO_DO_AUTOR = 'M';

-- Trazer o nome do livro e o numero de paginas dos livros publicados por autores do sexo feminino
SELECT NOME_DO_LIVRO,NOME_DO_AUTOR,NUMERO_DE_PAGINAS
FROM LIVROS
WHERE SEXO_DO_AUTOR = 'F';

-- Trazer os valores dos livros das editoras de SP
SELECT VALOR_DO_LIVRO,ESTADO_UF_DA_EDITORA
FROM LIVROS
WHERE ESTADO_UF_DA_EDITORA = 'SP';

-- Trazer os dados dos autores do sexo masculino que tiveram os livros publicados por SP ou RJ
SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_UF_DA_EDITORA
FROM LIVROS
WHERE (ESTADO_UF_DA_EDITORA = 'RJ' OR ESTADO_UF_DA_EDITORA = 'SP') AND SEXO_DO_AUTOR = 'M';

--OPERADORES LÓGICOS

-- OR
SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

-- AND
SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';