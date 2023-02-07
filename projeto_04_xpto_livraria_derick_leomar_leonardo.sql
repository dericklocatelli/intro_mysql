-- primeiro vamos criar o banco de dados:
CREATE DATABASE xpto_livraria;

-- vamos logar o banco de dados:
USE xpto_livraria;

-- iremos criar a tabela de generos literarios:
CREATE TABLE generos(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(50)
);


-- criando a tabela de autores:
CREATE TABLE autores(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE
);


-- CRIANDO A TABELA DE EDITORA
CREATE TABLE editoras(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_editora VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	cnpj VARCHAR(15) NOT NULL UNIQUE,
	telefone VARCHAR(15) NOT NULL UNIQUE
);


-- CRIANDO A TABELA DE LIVROS:
CREATE TABLE livros(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	titulo_livro VARCHAR(50) NOT NULL,
	isbn VARCHAR(18) NOT NULL,
	codigo_barras VARCHAR(14) NOT NULL,
	preco DOUBLE NOT NULL,
	data_cadastro_livro DATE NOT NULL,
	id_editoras INTEGER NOT NULL,
	id_autor INTEGER NOT NULL,
	id_genero INT NOT NULL,
	FOREIGN KEY (id_editoras) REFERENCES editoras(id),
	FOREIGN KEY (id_autor) REFERENCES autores(id),
	FOREIGN KEY (id_genero) REFERENCES generos(id)
);


-- CRIANDO A TABELA DE ESTOQUE

CREATE TABLE estoques(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	quantidade_livros INTEGER NOT NULL,
	livros VARCHAR(50) NOT NULL,
	id_livros INTEGER NOT NULL,
	FOREIGN KEY (id_livros) REFERENCES livros(id)
);


-- CRIANDO TABELA FUNÇOES:
CREATE TABLE funcoes(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(45) NOT NULL,
	salario DOUBLE NOT NULL
	
);


-- CRIANDO A TABELA DE FUNCIONARIOS:
-- OBS: para status_funcionario digitar (0 = inativo | 1 = ativo)

CREATE TABLE funcionarios(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	status_funcionario INTEGER NOT NULL,
	matricula INTEGER NOT NULL,
	data_cadastro_sistema DATE NOT NULL,
	id_funcoes INTEGER NOT NULL,
	FOREIGN KEY (id_funcoes) REFERENCES funcoes (id)

);


-- CRIANDO TABELA TURNOS:
CREATE TABLE turnos(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(45) NOT NULL,
	carga_horaria DOUBLE NOT NULL,
	id_funcionario INTEGER NOT NULL,
	FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
);


-- CRIANDO TABELA DE CLIENTES:
CREATE TABLE clientes(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	cpf VARCHAR(11) NOT NULL UNIQUE
);


-- CRIANDO TABELA DE FORMAS DE PAGAMENTO
CREATE TABLE forma_pagamento(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(18) NOT NULL
);


-- CRIANDO TABELA DE VENDAS:
CREATE TABLE vendas(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	data_venda DATE NOT NULL,
	quantidade_livros_vendidos INTEGER NOT NULL,
	id_formas_de_pagamento INTEGER NOT NULL,
	id_livros INTEGER NOT NULL,
	id_clientes INTEGER NOT NULL,
	id_funcionario INTEGER NOT NULL,
	FOREIGN KEY (id_formas_de_pagamento) REFERENCES formas_de_pagamento (id),
	FOREIGN KEY (id_livros) REFERENCES livros(id),
	FOREIGN KEY (id_clientes) REFERENCES clientes (id),
	FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
);


-- CRIANDO INSERT PARA REGISTROS DE GENEROS:
	INSERT INTO generos (tipo) VALUES ("Ação");
	INSERT INTO generos (tipo) VALUES ("Terror"); 
	INSERT INTO generos (tipo) VALUES ("Ficção"); 
	INSERT INTO generos (tipo) VALUES ("Romance");
	INSERT INTO generos (tipo) VALUES ("Drama");


-- CRIANDO INSERT PARA REGISTROS DE AUTORES:
	INSERT INTO autores (nome, email) VALUES ("João", "joão@joão.com");
	INSERT INTO autores (nome, email) VALUES ("Pedro", "pedro@pedro.com");
	INSERT INTO autores (nome, email) VALUES ("Marcos", "marcos@marcos.com");
	INSERT INTO autores (nome, email) VALUES ("Aurélio", "aurélio@aurélio.com");
	INSERT INTO autores (nome, email) VALUES ("Rick", "rick@rick.com");
	INSERT INTO autores (nome, email) VALUES ("Paulo", "paulo@paulo.com");
	INSERT INTO autores (nome, email) VALUES ("Matias", "matias@matias.com");
	INSERT INTO autores (nome, email) VALUES ("Vinicius", "vinicius@vinicius.com");


-- CRIANDO INSERT PARA REGISTROS DE EDITORAS:
	INSERT INTO editoras (nome_editora, email, cnpj, telefone) VALUES ("SENAC", "senaceditora@bymercy.com", "31110931000176", "96 2178-2065"); 
	INSERT INTO editoras (nome_editora, email, cnpj, telefone) VALUES ("Erika", "contato.erika@chotunai.com", "22340375000133", "67 3548-1072");
	INSERT INTO editoras (nome_editora, email, cnpj, telefone) VALUES ("Adevair", "editora.adevair@odeiobancodedados.com", "70539834000155", "82 2881-5174"); 
	INSERT INTO editoras (nome_editora, email, cnpj, telefone) VALUES ("D.L.L Soluções Inteligentes", "contato.ddl@ddleditora.com", "55718654000147", "84 2828-5210");
	


-- CRIANDO INSERT PARA REGISTROS DE LIVROS:
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES ("HARRY POTTER 1",	3717502934,	48,	"2022-05-20",	59308158066,	1,	7,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES ("HARRY POTTER 2",	6037103689,	39,	"2022-01-21",	99895704364,	3,	8	,2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HARRY POTTER 3",	7997100562,	27,	"2022-06-22",	40745635495,	4,	5,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HARRY POTTER 4",	9624849758,	53,	"2022-05-23",	84837016126,	5, 3, 3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HARRY POTTER 5",	9472899286,	60,	"2022-01-24",	92250388426,	5,	4,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HARRY POTTER 6",	8528600203,	56,	"2022-01-25",	12539927956,	2,	7,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HARRY POTTER 7",	6014655524,	30,	"2022-01-26",	57174752904,	3,	5,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("SENHOR DOS ANÉIS 1",	9621192921,	67,	"2022-09-27",	84782979020,	2,	8,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("SENHOR DOS ANÉIS 2",	3752986104,	66,	"2022-10-28",	56562969981,	4,	1,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("SENHOR DOS ANÉIS 3",	2321211855,	21,	"2022-01-29",	83235742401,	4,	5,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("SENHOR DOS ANÉIS 4",	933426280,	70,	"2022-01-30",	73978948413,	4,	3,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("PATATI PATATA EM FAMÍLIA",	6409233573,	4,	"2022-01-31",	38567242352,	1,	6,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("INTROÇÃO AO MYSQL",	4133810231,	45,	"2022-01-30",	42059427634,	1,	7,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("JAVA 8",	9239997621,	78,	"2022-01-21",	32637019714,	2,	3,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HEROI POR UM DIA",	4525767108,	36,	"2022-01-28",	93111460475,	2,	4,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("MÃE GANHEI A COPA",	1376648637,	69,	"2022-01-01",	44656438062,	3,	3,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("MENTE MILIONÁRIA",	554379976,	61,	"2022-01-16",	10151259801,	2,	4,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("1 MILHÃO EM 60 DIAS",	4862801448,	62,	"2022-01-27",	33629646444,	1,	2,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("PAI RICO FILHO POBRE",	6040861313,	33,	"2022-02-28",	92408908319,	1,	3,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("DIÁRIO DE UM BANANA",	8713309107,	40,	"2022-01-29",	98549016009,	4,	8,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ANABELE A HISTÓRIA NÃO CONTADA",	3433283880,	37,	"2022-01-30",	41375702770,	5,	3,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("VONTADE DE VENCER",	3484100484,	70,	"2022-01-21",	33919957628,	2,	6,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ROCK ESTILO DE VIDA",	516010772,	20,	"2022-01-12",	54370307170,	2,	3,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("CÁCLULO 1 - SW",	3715766542,	81,	"2022-01-13",	51564962337,	1,	7,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("CÁLCULO 2 -JWL",	256205462,	10,	"2022-01-14",	94961813528,	3,	3,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("GEOMETRIA",	3025013731,	35,	"2022-01-25",	57837178375,	3,	5,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("INTRODUÇÃO A LÓGICA",	9406304542,	29,	"2022-01-26",	83574001258,	1,	5,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V1",	2945847474,	17,	"2022-01-17",	87781256511,	1,	2,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V2" ,9558040266,	58,	"2022-01-28",	46061764365,	4,	3,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V3",	5035122051,	34,	"2022-01-29",	18222623621,	1,	4,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V4",	1889235348,	30,	"2022-01-20",	5909368764,	4,	4,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V5",	9240713393,	89,	"2022-01-11",	35250086127,	5,	2,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ABC DA PROGRAMAÇÃO V6",	5212665304,	48,	"2022-01-22",	95136212603,	5,	6,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("HELLO WORD EM 50 LINGUAGENS",	5492188378,	30,	"2022-01-13",	47659916266,	2,	5,	3);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ODEIO BANCO DE DADOS V1",	2990418436,	61,	"2022-01-14",	77440868731,	4,	7,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("ODEIO BANCO DE DADOS V2",	4361942761,	66,	"2022-01-25",	28145386053,	2,	1,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("A VIDA ALÉM DO BANCO DE DADOS",	9276322316,	42,	"2022-06-26",	49126484831,	3,	1,	1);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("123 RUA - LAYOFF BRASIL",	1927241582,	73,	"2022-03-17",	72051394852,	1,	5,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("BRASIL UM PAÍS DE DEV'S",	1218001174,	72,	"2022-12-18",	12070357853,	3,	4,	2);
	INSERT INTO livros(titulo_livro, isbn, preco, data_cadastro_livro, codigo_barras, id_genero, id_autor, id_editoras) VALUES("SEM PACIÊNCIA PARA NOME",	1759947864,	76,	"2022-11-19",	46632949184,	2,	8,	3);


-- CRIANDO INSERT PARA REGISTROS DE ESTOQUE:
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (100, "HARRY POTTER 1", 1);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (250, "HARRY POTTER 2", 2);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (1500, "HARRY POTTER 3", 3);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (450, "HARRY POTTER 4", 4);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (680, "HARRY POTTER 5", 5);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (1020, "HARRY POTTER 6", 6);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (5000, "HARRY POTTER 7", 7);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (890, "SENHOR DOS ANÉIS 1", 8);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (720, "SENHOR DOS ANÉIS 2", 9);
	INSERT INTO estoque (quantidade_livros, livros, id_livros) VALUES (512, "SENHOR DOS ANÉIS 3", 10);


-- CRIANDO INSERT PARA REGISTROS DE FUNÇOES:
	INSERT INTO funcoes (descricao, salario) VALUES ("Gerente", 3250.55);
	INSERT INTO funcoes (descricao, salario) VALUES ("Vendedor", 1302.00);
	INSERT INTO funcoes (descricao, salario) VALUES ("Estoquista", 1405.00);


-- CRIANDO INSERT PARA REGISTROS DE FUNCIONARIOS:
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Pedro  da silva", 123456,  1,	"2022-01-20", 1 );
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Marcos Silveira", 321654, 1, "2022-10-21", 1);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("João Silvestre", 147852, 1, "2021-01-22", 1);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Augusto Pereira", 369852, 1, "2023-01-23", 2);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Adevair Vitório", 1596327, 1, "1998-01-24", 1);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Ezequiel Barcellos", 3461987, 0, "2022-01-25", 1);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Thiago Andreão", 19555642, 1,	"2022-01-26", 1);
	INSERT INTO funcionarios (nome, matricula, status_funcionario, data_cadastro_sistema,id_funcoes) VALUES ("Junior Silva", 333214,  1, "2022-01-27", 2);


-- CRIANDO INSERT PARA REGISTROS DE TURNOS:
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Matutino", 8, 1);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Matutino", 8, 2);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Matutino", 8, 3);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Matutino", 8, 4);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Vespertino", 8, 5);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Vespertino", 8, 6);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Vespertino", 8, 7);
	INSERT INTO turnos (descricao, carga_horaria, id_funcionario) VALUES ("Vespertino", 8, 8);



-- CRIANDO INSERT PARA REGISTROS DE CLIENTES:
	INSERT INTO clientes (nome, email, cpf) VALUES ("Lucas pereira", "lucaspereira@lucaspereira.com", "67233531021");
	INSERT INTO clientes (nome, email, cpf) VALUES ("Manoel Antunes", "manoelantunes@Manelzin.com", "48266838631");
	INSERT INTO clientes (nome, email, cpf) VALUES ("Gilmar Costa", "gilmarcosta@gimar.com", "53137120713");
	INSERT INTO clientes (nome, email, cpf) VALUES ("Maria Marieta", "mariamarieta@mariamerietinha.com", "84101684804");
	INSERT INTO clientes (nome, email, cpf) VALUES ("Tâmara Assis", "tamaraasis@tamaris.com", "91367315360");


-- CRIANDO INSERT PARA REGISTROS DE FORMAS DE PAGAMENTO:
-- LEGENDA FORMAS DE PAGAMENTO (1- PIX, 2- CARTÃO DE CRÉDITO, 3- À VISTA)
	INSERT INTO formas_de_pagamento (tipo_pagamento) VALUES ("Pix");
	INSERT INTO formas_de_pagamento (tipo_pagamento) VALUES ("Cartão de Crédito");
	INSERT INTO formas_de_pagamento (tipo_pagamento) VALUES ("À vista");


-- CRIANDO INSERT PARA REGISTROS DE VENDAS:
-- LEGENDA FORMAS DE PAGAMENTO (1- PIX, 2- CARTÃO DE CRÉDITO, 3- À VISTA)
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "50", 1, 1, 1, 1);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "100", 2, 2, 2, 2);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "100", 3, 1, 3, 3);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "220", 1, 1, 4, 4);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "40", 2, 1, 5, 5);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "30", 3, 1, 3, 6);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "20", 1, 1, 5, 7);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "25", 2, 1, 5, 8);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "2", 3, 1, 4, 3);
	INSERT INTO vendas (data_venda, quantidade_livros_vendidos, id_formas_de_pagamento, id_livros, id_clientes, id_funcionario) VALUES ("2023-02-03", "87", 1, 1, 1, 1);


-- RELATORIOS DE CONSULTA DE DADOS XPTO_LIVRARIA:


-- CONSULTA DE DADOS ESTOQUE: TITULO X QUANTIDADE:
	SELECT estoque.quantidade_livros, livros.titulo_livro
	FROM estoque
	JOIN livros
	ON estoque.id_livros = livros.id;


-- CONSULTA DADOS: AUTORES X LIVROS
	SELECT livros.titulo_livro, autores.nome
	FROM livros
	JOIN autores
	ON livros.id_autor = autores.id;


--  CONSULTA DADOS: LIVROS X GENEROS
	SELECT livros.titulo_livro, generos.tipo
	FROM livros
	JOIN generos
	ON livros.id_genero = generos.id;

--  CONSULTA DADOS: LIVROS X GENEROS
	SELECT livros.titulo_livro, generos.tipo 
	FROM livros 
	JOIN generos 
	ON livros.id_autor = generos.id;
	

--  CONSULTA DADOS CLIENTES: CPF EMAIL
	SELECT cpf, email FROM clientes;


-- CONSULTA DADOS DE VENDAS POR FUNCIONARIO (DESTAQUE DO MES)
	SELECT funcionarios.nome, vendas.quantidade_livros_vendidos
	FROM vendas
	JOIN funcionarios
	ON vendas.id_funcionario = funcionarios.id ORDER BY vendas.quantidade_livros_vendidos DESC;


-- CONSULTA DADOS VENDAS: (TITULO X PRECO X CODIGO BARRAS)
	SELECT vendas.data_venda, livros.codigo_barras, livros.preco
	FROM vendas
	JOIN livros
	ON vendas.id_livros = livros.id;
 

-- CONSULTA DADOS( TITULO X PRECO X CODIGO BARRAS)
	SELECT livros.titulo_livro, livros.codigo_barras, livros.preco
	FROM livros;


-- CONSULTA DE DADOS VENDAS POR MES 
	SELECT vendas.data_venda, vendas.quantidade_livros_vendidos, livros.titulo_livro
	FROM vendas
	JOIN livros
	ON vendas.id_livros = livros.id
	WHERE data_venda BETWEEN "2023-02-01" AND "2023-02-28";