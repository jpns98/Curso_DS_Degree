CREATE DATABASE letscode;
--		TABELA CLIENTE
CREATE TABLE cliente (
	cod_cli int not null,
	nome_cli varchar(40) not null,
	endereco varchar(40) null,
	cidade varchar(20) null,
	cep char(8) null,
	uf char(2) null
);

ALTER TABLE cliente ADD PRIMARY KEY (cod_cli);

INSERT INTO cliente VALUES 
	(1,'João','rua 1','cidade 1','11123456','SP'),
	(2, 'Maria','rua 2','cidade 2','22123456','RJ'),
	(3, 'Marcelo','rua 2','cidade 2','22123456','RJ'),
	(4, 'Lciana','rua 5','cidade 5','55123456','AP'),
	(5, 'Gabriel','rua 1','cidade 1','11123456','SP');

SELECT * FROM cliente

-- Exemplo de como alterar o tipo de uma coluna
-- ALTER TABLE cliente ALTER COLUMN cep TYPE char(10)

--		TABELA VENDEDOR
CREATE TABLE vendedor (
	cod_vend int not null,
	nome_vend varchar(40) not null,
	sal_fixo numeric(9,2) not null,
	faixa_comiss numeric(9,2) not null
);
ALTER TABLE vendedor ADD PRIMARY KEY (cod_vend);

INSERT INTO vendedor VALUES
	(1,'Pedro',1900.11,15),
	(2,'José',2000.21,20),
	(3,'Ana',2100,21),
	(4,'Beatriz',1875,19),
	(5,'Paulo',1950,25);
	
SELECT * FROM vendedor	


--		TABELA PEDIDO
CREATE TABLE pedido(
	num_ped int not null,
	prazo_entr time not null,
	cod_cli int not null,
	cod_vend int not null
);
ALTER TABLE pedido ADD PRIMARY KEY (num_ped);

ALTER TABLE pedido ADD FOREIGN KEY (cod_cli)
	REFERENCES cliente(cod_cli);

ALTER TABLE pedido ADD FOREIGN KEY (cod_vend)
	REFERENCES vendedor(cod_vend);

INSERT INTO pedido VALUES
	(1,'01:02:12',2,1),
	(2,'00:30:32',5,4),
	(3,'00:27:45',3,1),
	(4,'00:22:32',4,5),
	(5,'00:41:39',1,4);

SELECT * FROM pedido


--		TABELA ITEM_PEDIDO
CREATE TABLE item_pedido(
	num_ped int not null,
	cod_prod int not null,
	qtd_ped int not null
);
ALTER TABLE item_pedido ADD FOREIGN KEY (num_ped)
	REFERENCES pedido(num_ped);
	
ALTER TABLE item_pedido ADD FOREIGN KEY (cod_prod)
 REFERENCES produto(cod_prod);
 
 INSERT INTO item_pedido VALUES
 	(1,3,2),
	(1,2,1),
	(2,4,1),
	(3,3,1),
	(4,2,1),
	(4,5,2),
	(5,1,2);

SELECT * FROM item_pedido


--		TABELA PRODUTO
CREATE TABLE produto (
	cod_prod int not null,
	unid_produto int not null,
	desc_prod varchar(40) null,
	val_unid numeric(5,2) not null
);
inse

ALTER TABLE produto ADD PRIMARY KEY (cod_prod);

INSERT INTO produto VALUES
	(1,32,'produto 1',13.90),
	(2,12,'produto 2',15.99),
	(3,10,'produto 3',16.99),
	(4,12,'produto 4',19.50),
	(5,24,'produto 5',23.50);

SELECT * FROM produto