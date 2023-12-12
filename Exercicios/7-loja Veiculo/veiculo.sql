1 - Banco criado :)

2 - 
	Cliente:
	CREATE TABLE "tb_cliente" (
	"cliente_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"cnh"	TEXT,
	"telefone"	TEXT,
	PRIMARY KEY("client id" AUTOINCREMENT)
);

	Veiculo:
	CREATE TABLE "tb_veiculo" (
	"veiculo_id"	INTEGER,
	"modelo"	TEXT NOT NULL,
	"ano"	TEXT NOT NULL,
	"placa"	TEXT NOT NULL,
	"disponibilidade"	TEXT NOT NULL,
	PRIMARY KEY("veiculo_id" AUTOINCREMENT)
);

	Aluguel:
	CREATE TABLE "tb_aluguel" (
	"aluguel_id"	INTEGER,
	"cliente_id"	INTEGER,
	"veiculo_id"	INTEGER,
	"data_inicio"	TEXT,
	"data_fim"	TEXT,
	CONSTRAINT "cliente_id" FOREIGN KEY("cliente_id") REFERENCES "tb_cliente"("cliente_id"),
	CONSTRAINT "veiculo_id" FOREIGN KEY("veiculo_id") REFERENCES "tb_veiculo"("veiculo_id"),
	PRIMARY KEY("aluguel_id" AUTOINCREMENT)
);

3-
	Cliente:
	INSERT INTO tb_cliente (nome, cnh, telefone)
	VALUES
    		('Marcelin', '12345678901', '11 99325-3568'),
    		('Nuneco', '10987654321', '11 99315-3568'),
    		('Matias', '01234567890', '11 99334-5683'),
    		('John', '09876543210', '11 99351-8535'),
    		('Luizona', '87654321098', '11 99724-1347'),
    		('Kaycola', '89012345678', '11 99425-3474'),
    		('Cuazin', '76543210987', '11 99524-5754'),
    		('Murilon', '78901234567', '11 99575-5235'),
    		('Balbas', '65432109876', '11 99392-5213'),
    		('Rafafael', '678901234567', '11 99273-5353');

	Veiculo:
	INSERT INTO tb_veiculo (modelo, ano, placa, disponibilidade)
	VALUES
    		('Fiat Uno', '2015', 'ABC-1234', 'disponivel'),
    		('Volkswagen Gol', '2018', 'DFG-4567', 'disponivel'),
    		('Ford Ka', '2019', 'HIJ-7890', 'disponivel'),
    		('Chevrolet Onix', '2020', 'KLM-0123', 'alugado'),
    		('Honda Civic', '2017', 'NOP-3456', 'disponivel'),
    		('Toyota Corolla', '2021', 'QRS-6789', 'alugado'),
    		('Hyundai HB20', '2022', 'TUV-9012', 'disponivel'),
    		('Renault Sandero', '2016', 'WXY-2345', 'disponivel'),
    		('Nissan Versa', '2020', 'ZAB-5678', 'disponivel'),
    		('Peugeot 208', '2018', 'CDE-8901', 'alugado');

4-
	Aluguel:
	INSERT INTO tb_aluguel (cliente_id, veiculo_id, data_inicio, data_fim)
	VALUES
    		(1, 3, '2023-08-08', '2023-08-15'),
    		(3, 5, '2023-07-25', '2023-08-05'),
    		(5, 7, '2023-08-01', '2023-08-08'),
    		(2, 2, '2023-07-20', '2023-07-30'),
    		(8, 4, '2023-07-15', '2023-07-22'),
    		(6, 1, '2023-08-05', '2023-08-12'),
    		(4, 8, '2023-07-10', '2023-07-17'),
    		(7, 9, '2023-07-28', '2023-08-11'),
    		(10, 6, '2023-08-02', '2023-08-09'),
    		(9, 10, '2023-07-18', '2023-07-25');

5-
	1 - SELECT * FROM tb_cliente WHERE telefone = '11 99325-3568';
	2 - SELECT * FROM tb_cliente WHERE cnh = '09876543210';
	3 - SELECT nome, cnh FROM tb_cliente;

6-
	1 - SELECT * FROM tb_veiculo WHERE ano = '2018';
	2 - SELECT * FROM tb_veiculo WHERE veiculo_id = '2';
	3 - SELECT * FROM tb_veiculo WHERE disponibilidade = 'disponivel';

7-
	SELECT
		tb_cliente.nome,
		tb_cliente.cnh,
		tb_veiculo.modelo,
		tb_veiculo.placa,
		tb_veiculo.disponibilidade,
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim
	FROM
		tb_aluguel
	INNER JOIN
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id;
8-
	SELECT
		tb_cliente.nome,
		tb_cliente.cnh,
		tb_veiculo.modelo,
		tb_veiculo.placa,
		tb_veiculo.disponibilidade,
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim
	FROM
		tb_aluguel
	INNER JOIN
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id WHERE tb_veiculo.disponibilidade = 'disponivel';
9-
	SELECT
		tb_cliente.nome,
		tb_cliente.cnh,
		tb_veiculo.modelo,
		tb_veiculo.placa,
		tb_veiculo.disponibilidade,
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim
	FROM
		tb_aluguel
	INNER JOIN
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id WHERE tb_veiculo.disponibilidade = 'disponivel';
10-
	TB_CLIENTES:
	UPDATE 	tb_cliente
	SET 	cnh = 21513523
	WHERE 	tb_cliente.cliente_id == 5;

	UPDATE tb_cliente
	SET cnh = 21513523
	WHERE tb_cliente.cliente_id = 7;

	UPDATE tb_cliente
	SET cnh = 21513523
	WHERE tb_cliente.cliente_id = 2;

	UPDATE tb_cliente
	SET cnh = 21513523
	WHERE tb_cliente.cliente_id = 8;

	UPDATE tb_cliente
	SET cnh = 21513523
	WHERE tb_cliente.cliente_id = 10;	
11-
	TB_VEICULO:
	UPDATE 	tb_veiculo
	SET ano = 2023
	WHERE tb_veiculo.veiculo_id == 5;
	UPDATE tb_veiculo
	SET ano = 2023
	WHERE tb_veiculo.veiculo_id = 7;

	UPDATE tb_veiculo
	SET ano = 2023
	WHERE tb_veiculo.veiculo_id = 2;
	
	UPDATE tb_veiculo
	SET ano = 2023
	WHERE tb_veiculo.veiculo_id = 8;

	UPDATE tb_veiculo
	SET ano = 2023
	WHERE tb_veiculo.veiculo_id = 10;
12-
	TB_ALUGUEL:
	DELETE FROM tb_aluguel
	WHERE aluguel_id = 5;

	DELETE FROM tb_aluguel
	WHERE aluguel_id = 8;

	DELETE FROM tb_aluguel
	WHERE aluguel_id = 12;

	DELETE FROM tb_aluguel
	WHERE aluguel_id = 3;

	DELETE FROM tb_aluguel
	WHERE aluguel_id = 7;