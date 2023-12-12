
1 - Atv)
 Banco de Dados criados :D

///////////////////////////////////////////

2 - Atv)

* CREATE TABLE "tb_Plataformas" (
	"cod_plataforma"	INTEGER,
	"nome"	TEXT,
	"fabricante"	TEXT,
	PRIMARY KEY("cod_plataforma" AUTOINCREMENT)
);

* CREATE TABLE "tb_jogos" (
	"cod_jogo"	INTEGER,
	"cod_plataforma" INTEGER,
	"titulo"	TEXT NOT NULL,
	"genero"	TEXT NOT NULL,
	"lancamento"	TEXT NOT NULL,

	CONSTRAINT "cod_plataforma" FOREIGN KEY("cod_plataforma") REFERENCES "tb_Plataformas"("cod_plataforma"),
	PRIMARY KEY("cod_jogo" AUTOINCREMENT)
);


/////////////////////////////////////////

3 - Atv)
*	INSERT INTO tb_Plataformas (nome, fabricante)
	VALUES
    	('PlayStation 5', 'Sony'),
	('Nintendo Switch', 'Nintendo'),
	('Xbox Series S', 'Microsoft'),
	('PlayStation 3', 'Sony'),
	('Nintendo 64', 'Nintendo');


	INSERT INTO tb_jogos (cod_plataforma, titulo, genero, lancamento)
	VALUES
 *   	(1, 'Astro´s', 'Plataforma', '12 de novembro 2020'),
	(1, 'Demon´s Souls', 'RPG', '12 de novembro 2020'),
	(2, 'Pokemon Sword', 'RPG/Aventura', '15 de novembro de 2019'),
	(2, 'The legend of Zelda: Breath of the Wild', 'RPG', '03 de março de 2017'),
	(3, 'Forza Horizon 5', 'Corrida/Voo', '09 de novembro 2021'),
	(3, 'Halo Infinite', 'Aventura/Tiro primeira pessoa', '15 de novembro 2021'),
	(4, 'The Last of Us', 'Ação/Aventura', '18 de agosto de 2020'),
	(4, 'Uncharted 3: Drake´s Deception', 'Ação/Aventura', '01 de novembro de 2011'),
	(5, 'Mario 64', 'Plataforma', '15 de agosto 1984'),
	(5, 'Smash Bro', 'Plataforma', '15 de agosto 1994');


/////////////////////////////
4)

* SELECT * FROM tb_Plataformas WHERE fabricante = "Sony";
* SELECT * FROM tb_jogos WHERE genero = "Plataforma";
* SELECT
		tb_Plataformas.nome,
		tb_Plataformas.fabricante,
		tb_jogos.titulo,
		tb_jogos.lancamento,
		tb_jogos.genero
	FROM
		tb_Plataformas
	INNER JOIN
		tb_jogos ON tb_jogos.cod_plataforma = tb_Plataformas.cod_plataforma;

///////////////////////////////////
5)
	UPDATE tb_jogos
	SET lancamento = '23 de março de 2020'
	WHERE cod_jogo = 2 ;
	
	UPDATE tb_jogos
	SET lancamento = '23 de março de 2003'
	WHERE cod_jogo = 4 ;
	
	UPDATE tb_jogos
	SET lancamento = '23 de março de 2016'
	WHERE cod_jogo = 6 ;
	
	UPDATE tb_jogos
	SET lancamento = '23 de março de 2077'
	WHERE cod_jogo = 8 ;

/////////////////////////////////
6)
	DELETE FROM tb_jogos WHERE cod_jogo = 1;
	DELETE FROM tb_jogos WHERE cod_jogo = 3;
	DELETE FROM tb_jogos WHERE cod_jogo = 5;
	DELETE FROM tb_jogos WHERE cod_jogo = 7;
