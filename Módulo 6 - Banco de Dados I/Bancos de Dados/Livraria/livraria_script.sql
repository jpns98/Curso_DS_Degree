CREATE DATABASE letscode_livraria;

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente SERIAL PRIMARY KEY,
	endereco VARCHAR NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR UNIQUE NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS  editora (
	id_editora SERIAL PRIMARY KEY,
	nome_editora VARCHAR NOT NULL,
	nome_contato VARCHAR(40) NOT NULL,
	email VARCHAR NOT NULL,
	telefone1 VARCHAR(11) NOT NULL,
	telefone2 VARCHAR(11) NULL
);


CREATE TABLE IF NOT EXISTS  autor(
	id_autor SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL,
	ano_nascimento DATE NULL,
	sexo CHAR(1) NULL,
	nacionalidade VARCHAR NULL
);

CREATE TABLE IF NOT EXISTS  livro(
	id_livro SERIAL PRIMARY KEY,
	id_editora INTEGER NOT NULL,
	titulo VARCHAR NOT NULL,
	isbn VARCHAR(17) NOT NULL,
	ano_publicacao DATE NULL,
	categoria VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS  participacao(
	id_participacao SERIAL PRIMARY KEY,
	id_livro INTEGER NOT NULL,
	id_autor INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS  item_estoque(
	id_item_estoque SERIAL PRIMARY KEY,
	id_livro INTEGER NOT NULL,
	data_chegada DATE NOT NULL,
	edicao INTEGER NOT NULL,
	idioma VARCHAR(20) NOT NULL,
	n_paginas INTEGER NOT NULL,
	valor NUMERIC(9,2) NOT NULL,
	disponivel BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS compra (
	id_compra SERIAL PRIMARY KEY,
	id_cliente INTEGER NOT NULL,
	id_item_estoque INTEGER NOT NULL,
	valor_pago NUMERIC(9,2) NOT NULL,
	data_compra DATE NOT NULL
);