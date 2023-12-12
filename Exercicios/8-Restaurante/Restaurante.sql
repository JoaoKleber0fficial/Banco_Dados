1) restaurante.db Criado :)

2)	
	Tabela Produtos:
	CREATE TABLE "tb_Produtos" (	
	"produtos_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"tipo"	TEXT,
	"preco"	REAL,
	"descricao" TEXT,
	PRIMARY KEY("produtos_id" AUTOINCREMENT)
);	

	Tabela Mesas:
	CREATE TABLE "tb_Mesa" (	
	"mesa_id"	INTEGER,
	"numero"	INTEGER NOT NULL,
	"capacidade"	INTEGER,
	PRIMARY KEY("mesa_id" AUTOINCREMENT)
);	
	
	Tabela Pedidos:
	CREATE TABLE "tb_Pedidos" (
	"pedido_id"	INTEGER,
	"mesa_id"	INTEGER,
	"produtos_id"	INTEGER,
	"quantidade"	INTEGER,
	"total"	REAL,
	CONSTRAINT "mesa_id" FOREIGN KEY("mesa_id") REFERENCES "tb_Mesa"("mesa_id"),
	CONSTRAINT "produtos_id" FOREIGN KEY("produtos_id") REFERENCES "tb_Produtos"("produtos_id"),
	PRIMARY KEY("pedido_id" AUTOINCREMENT)
);

3)
	Tabela Produtos:
	INSERT INTO tb_Produtos (nome, tipo, preco, descricao)
	VALUES
    		('Pizza', 'Prato principal', '$10 a $20', 'calabresa, cogumelos, pimentões, azeitonas.'),
    		('Sushi', 'Prato principal', '$15 a $30', '3 a 5 sushis'),
    		('Hamburguer', 'Prato principal', '$8 a $15', 'pão, alface, tomate, cebola, queijo, ketchup e maionese.'),
    		('Lasanha', 'Prato principal', '$10 a $20', 'camadas de molho de carne ou molho à bolonhesa, queijo ricota ou mussarela e molho bechame'),
    		('Chocolate quente', 'Bebida quente', '$3 a $6', 'coberto com chantilly ou raspas de chocolate'),
    		('Salada Cesar', 'Salada', '$8 a $15', 'ingredientes como azeite de oliva, limão, mostarda, alho e anchovas'),
    		('Mojito', 'Coquetel (bebida alcoólica)', '$8 a $12', 'rum branco, água com gás, hortelã fresca, açúcar e suco de limão'),
    		('Tiramisu', 'Sobremesa', '$5 a $10', 'camadas de biscoitos de champanhe (ladyfingers) embebidos em café e creme de mascarpone');
	
	Tabela Mesas
	INSERT INTO tb_Mesa (numero, capacidade)
	VALUES
    		(1, 4),
    		(2, 6),
    		(3, 2),
    		(4, 8),
    		(5, 5),
    		(6, 3),
    		(7, 7),
    		(8, 10);

4)	
	Tabela Pedidos:
	INSERT INTO tb_Pedidos (mesa_id, produtos_id, quantidade, pdt_Total)
	VALUES
    		(8, 6, 15, 120),
    		(7, 5, 12, 60),
    		(3, 2, 54, 810),
    		(4, 1, 13, 260),
    		(6, 7, 32, 384),
    		(5, 8, 2, 20),
    		(2, 3, 6, 96),
    		(1, 4, 4, 40);

5)
	Recuperando informações Tabela Produtos:
	SELECT * FROM tb_Produtos WHERE tipo = "Prato Principal"
	SELECT nome, tipo, preco FROM tb_produtos

6)
	Recurando informações Tabela Mesas:
	SELECT * FROM tb_Mesa WHERE numero = 5
	SELECT * FROM tb_Mesa WHERE capacidade >= 6
	SELECT * FROM tb_Mesa

7)
	Utilizando INNER JOIN:
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_Mesa.numero,
	tb_Mesa.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.pdt_Total
FROM
	tb_pedidos
JOIN
	tb_produtos ON tb_pedidos.produtos_id = tb_produtos.produtos_id
JOIN
	tb_Mesa ON tb_pedidos.mesa_id = tb_Mesa.mesa_id;

8)
	Consultando numero aleatorio:
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_Mesa.numero,
	tb_Mesa.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.pdt_Total
FROM
	tb_pedidos
JOIN
	tb_produtos ON tb_pedidos.produtos_id = tb_produtos.produtos_id
JOIN
	tb_Mesa ON tb_pedidos.mesa_id = tb_Mesa.mesa_id
WHERE
	tb_pedidos.pdt_Total = 20;

9)
	Consultando produtos acima de 20:
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_Mesa.numero,
	tb_Mesa.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.pdt_Total
FROM
	tb_pedidos
JOIN
	tb_produtos ON tb_pedidos.produtos_id = tb_produtos.produtos_id
JOIN
	tb_Mesa ON tb_pedidos.mesa_id = tb_Mesa.mesa_id
WHERE
	tb_pedidos.pdt_Total >= 20;

10)
UPDATE 	tb_Mesa
SET capacidade = 6
WHERE tb_Mesa.mesa_id == 5;

UPDATE tb_Mesa
SET capacidade = 6
WHERE tb_Mesa.mesa_id = 12;

UPDATE tb_Mesa
SET capacidade = 6
WHERE tb_Mesa.mesa_id = 2;

UPDATE tb_Mesa
SET capacidade = 6
WHERE tb_Mesa.mesa_id = 8;

UPDATE tb_Mesa
SET capacidade = 6
WHERE tb_Mesa.mesa_id = 10;

11)	
UPDATE tb_Produtos
SET preco = 1.99
WHERE produtos_id = 15.00;

UPDATE tb_Produtos
SET preco = 11.99
WHERE produtos_id = 8.00;

UPDATE tb_Produtos
SET preco = 13.99
WHERE produtos_id = 3.00;

UPDATE tb_Produtos
SET preco = 6.99
WHERE produtos_id = 10.00;

UPDATE tb_Produtos
SET preco = 2.99
WHERE produtos_id = 13.00;

12)
DELETE FROM tb_pedidos
WHERE pedido_id = 5;

DELETE FROM tb_pedidos
WHERE pedido_id = 8;

DELETE FROM tb_pedidos
WHERE pedido_id = 12;

DELETE FROM tb_pedidos
WHERE pedido_id = 3;

DELETE FROM tb_pedidos
WHERE pedido_id = 7;

