CREATE DATABASE letscode_filmes;

CREATE TABLE letscode_genero (
	id_genero int not null,
	nome varchar (40) not null,
	PRIMARY KEY (id_genero)
);

CREATE TABLE letscode_filme (
	id_filme int not null,
	nome varchar(40) not null,
	nota int null,
	diretor varchar(20) not null,
	bilheteria decimal(9,2) null,
	classificacao int null,
	id_genero int not null,
	FOREIGN KEY (id_genero)
		REFERENCES letscode_genero (id_genero),
	PRIMARY KEY (id_filme)
);

CREATE TABLE letscode_ator (
	id_ator int not null,
	nome varchar (40) not null,
	sexo char(1) null,
	data_nascimento date not null,
	PRIMARY KEY (id_ator)
);

CREATE TABLE letscode_participacao (
	id_participacao int not null,
	id_filme int not null,
	id_ator int not null,
	FOREIGN KEY (id_filme)
		REFERENCES letscode_filme (id_filme),
	FOREIGN KEY (id_ator)
		REFERENCES letscode_ator (id_ator),
	PRIMARY KEY (id_participacao)
);