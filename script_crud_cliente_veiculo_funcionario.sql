-- Derick Locatelli
-- CRUD para seguintes entidades: 
-- cliente (id, nome, email, telefone)
-- veiculo (id, placa, ano, marca, id_cliente)
-- funcionario (id, nome, funcao, salario, matricula, status_funcionario)
-- Professor: @profadevairvitorio  



-- Criar uma base de dados;
CREATE DATABASE empresa_localiza;

-- Conectar na base dados;
USE empresa_localiza;

-- Criar as tabelas e adicionar o id automático

-- clientes
CREATE TABLE clientes(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(12)
);


-- veiculos
CREATE TABLE veiculos(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	placa VARCHAR(8) NOT NULL,
	ano INTEGER NOT NULL,
	marca VARCHAR(30),
	id_cliente INTEGER NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);


-- funcionarios
CREATE TABLE funcionarios(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	funcao VARCHAR(8) NOT NULL,
	salario DOUBLE NOT NULL,
	matricula INTEGER,
	status_funcionario INTEGER NOT NULL
);


-- Inserir dados na base de dados usando o comando INSERT
-- MODELO DE INSERT
-- INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);

-- Clientes : Total 3
	INSERT INTO clientes (nome, email, telefone) VALUES ("Joãozinho", "joao@uol.com", "27999885586");
	INSERT INTO clientes (nome, email, telefone) VALUES ("Adevair", "adevair@mysql.com.br", "2799997965");
	INSERT INTO clientes (nome, email, telefone) VALUES ("Odeio Bando de dados da silva", "mysql@mysql.com.br", "27999969965");


-- Veículos : Total 3
	INSERT INTO veiculos (placa, ano, marca, id_cliente) VALUES ("OKP-5558", 2022, "Gol", 1);
	INSERT INTO veiculos (placa, ano, marca, id_cliente) VALUES ("JKL-5569", 2022, "Honda", 2);
	INSERT INTO veiculos (placa, ano, marca, id_cliente) VALUES ("ADE-1234", 2022, "Gol", 3);


-- Funcionários : Total 2
	INSERT INTO funcionarios (nome, funcao, salario, matricula, status_funcionario) VALUES ("Cleitinho", "Gerente", 5050.50, 12345, 1);
	INSERT INTO funcionarios (nome, funcao, salario, matricula, status_funcionario) VALUES ("Manuelzinho", "Vendedor", 1325.54, 12522, 0);


-- Criar Consultas Usando o comando SELECT
-- Clientes
-- . Todos os campos de todos os clientes:
	SELECT * FROM clientes;


-- email do cliente com id = 2:
	SELECT email FROM clientes WHERE id=2;


--  Todos os nomes dos clientes:
	SELECT nome FROM clientes;


-- Todos os emails e telefones dos clientes:
	SELECT email,telefone FROM clientes;


-- Extra: Lista telefônica
	SELECT nome,telefone FROM clientes;


-- Veículos
-- Todos os campos de todos os veículos:
	SELECT * FROM veiculos;


-- Placa do veículo de id = 3:
	SELECT placa FROM veiculos WHERE id = 3;


-- Todas as placas dos veículos:
	SELECT placa FROM veiculos;


-- Todos os veículos do cliente com id=1:
	SELECT * FROM veiculos WHERE id_cliente = 1;


-- Funcionários
-- Todos os funcionários:
	SELECT * FROM funcionarios;


-- Todos os funcionários ativos:
	SELECT * FROM funcionarios WHERE status_funcionario = 1;


-- Matricula de todos os funcionários:
	SELECT matricula FROM funcionarios;


-- Função e salário de todos os funcionários:
	SELECT funcao, salario FROM funcionarios;


-- Extra: Função, salário e status de todos os funcionários ativos:
	SELECT funcao, salario, status_funcionario FROM funcionarios WHERE status_funcionario = 1;


-- Atualizar os registro existentes usando o comando UPDATE
-- Clientes
-- Atualize o nome do cliente de id = 6 para “Cliente Atualizado de Oliveira”
	UPDATE clientes SET nome = "Cliente Atualizado de Oliveira" WHERE id = 6;


-- Veículos
-- Atualize o ano do veículo do cliente de id = 6 para 1997:
	UPDATE veiculos SET ano = 1997 WHERE id_cliente = 6;


-- Deletar alguns registros usando o Comando DELETE
-- Veículos
-- Apagar o veículo de id = 2;
	DELETE FROM veiculos WHERE id = 2;


-- Apagar todos os veículos do cliente com id = 1;
	DELETE FROM veiculos WHERE id_cliente = 1;


-- Apagar todos os veículos:
	DELETE FROM veiculos WHERE TRUE;


-- Clientes
-- Apagar o cliente de id = 1:
	DELETE FROM clientes WHERE id=1 ;


-- Apagar todos os clientes com nome = “Adevair”:
	DELETE FROM clientes WHERE nome = "Adevair";


--  Apagar todos os clientes:
	DELETE FROM clientes WHERE TRUE;


-- Funcionários
-- Apague o funcionário de id = 1:
	DELETE FROM funcionarios WHERE id = 1;


-- Apague todos os funcionários inativos:
	DELETE FROM funcionarios WHERE status_funcionario = 0;