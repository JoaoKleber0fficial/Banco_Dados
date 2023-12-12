1-banco criado chamado hotel.db

2- desenvolvendo comandos para criar tabela SQL:

CREATE TABLE tb_hospede (
    hospede_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    documento TEXT,
    telefone TEXT
);

CREATE TABLE tb_quarto (
    quarto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    preco_diaria REAL NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE tb_reserva (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hospede_id INTEGER NOT NULL,
    quarto_id INTEGER NOT NULL,
    data_entrada TEXT NOT NULL,
    data_saida TEXT NOT NULL,
    FOREIGN KEY(hospede_id) REFERENCES tb_hospede(hospede_id),
    FOREIGN KEY(quarto_id) REFERENCES tb_quarto(quarto_id)
);

3-criando 8 registro no tb_hospede e tb_quarto:

INSERT INTO tb_hospede (nome, documento, telefone) 
VALUES 
    ('João Silva', '123456789', '(11) 98765-4321'),
    ('Maria Oliveira', '987654321', '(11) 12345-6789'),
    ('Pedro Santos', '456789123', '(11) 23456-7890'),
    ('Ana Souza', '789123456', '(11) 34567-8901'),
    ('Carla Rodrigues', '234567891', '(11) 45678-9012'),
    ('Marcos Pereira', '678912345', '(11) 56789-0123'),
    ('Julia Fernandes', '345678912', '(11) 67890-1234'),
    ('Fernando Costa', '891234567', '(11) 78901-2345');

INSERT INTO tb_quarto (tipo, preco_diaria, status) 
VALUES 
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'disponível'),
    ('Suíte Luxo', 250.00, 'disponível'),
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'ocupado'),
    ('Suíte Luxo', 250.00, 'manutenção'),
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'ocupado');

4-criando 8 reservas no SQL:

INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida) 
VALUES 
    (1, 1, '2023-01-10', '2023-01-15'),
    (2, 2, '2023-02-20', '2023-02-25'),
    (3, 3, '2023-03-15', '2023-03-20'),
    (4, 4, '2023-04-05', '2023-04-10'),
    (5, 5, '2023-05-12', '2023-05-17'),
    (6, 6, '2023-06-22', '2023-06-27'),
    (7, 7, '2023-07-18', '2023-07-23'),
    (8, 8, '2023-08-10', '2023-08-15');

5-
Realize uma consulta procurando o hospede pelo documento (qualquer registro), exibindo
todos os campos: SELECT * FROM tb_hospede WHERE documento = '123456789';

Realize uma consulta procurando o hospede pelo id (qualquer registro), exibindo os
campos: Nome, Documento e Telefone: SELECT nome, documento, telefone FROM tb_hospede WHERE hospede_id = 1;

6-
Realize uma consulta procurando quartos por tipo (qualquer registro), exibindo todos os
campos: SELECT * FROM tb_quarto WHERE tipo = 'Simples';

Realize uma consulta procurando quartos onde o preço da diária é maior que X (determine
um valor para X): SELECT * FROM tb_quarto WHERE preco_diaria > 150.00;

Realize uma consulta e faça a contagem de quartos que possuem vaga, ou seja, o Status do
quarto deve estar como disponível:SELECT COUNT(*) AS total_quartos_disponiveis FROM tb_quarto WHERE status = 'disponível';

7-Utilizando INNER JOIN:

SELECT 
    r.reserva_id, 
    r.data_entrada, 
    r.data_saida, 
    h.nome, 
    h.documento, 
    q.tipo, 
    q.preco_diaria, 
    q.status
FROM 
    tb_reserva AS r
INNER JOIN 
    tb_hospede AS h ON r.hospede_id = h.hospede_id
INNER JOIN 
    tb_quarto AS q ON r.quarto_id = q.quarto_id;

8-

SELECT 
    r.reserva_id, 
    r.data_entrada, 
    r.data_saida, 
    h.nome, 
    h.documento, 
    q.tipo, 
    q.preco_diaria, 
    q.status
FROM 
    tb_reserva AS r
INNER JOIN 
    tb_hospede AS h ON r.hospede_id = h.hospede_id
INNER JOIN 
    tb_quarto AS q ON r.quarto_id = q.quarto_id
WHERE 
    q.status = 'ocupado';

9-Utilize comandos SQL para fazer alterações em 5 registros a sua escolha, Tabela Hospede:

UPDATE tb_hospede
SET telefone = '(11) 9999-9999'
WHERE hospede_id = 1;

UPDATE tb_hospede
SET documento = '987654321'
WHERE hospede_id = 2;

UPDATE tb_hospede
SET nome = 'José Pereira'
WHERE hospede_id = 3;

UPDATE tb_hospede
SET telefone = '(11) 8888-8888'
WHERE hospede_id = 4;

UPDATE tb_hospede
SET documento = '543215432'
WHERE hospede_id = 5;

10-Utilize comandos SQL para fazer alterações em 5 registros a sua escolha, Tabela Quarto:

UPDATE tb_quarto
SET status = 'ocupado'
WHERE quarto_id = 1;

UPDATE tb_quarto
SET preco_diaria = 180.00
WHERE quarto_id = 2;

UPDATE tb_quarto
SET tipo = 'Suíte Luxo'
WHERE quarto_id = 3;

UPDATE tb_quarto
SET status = 'manutenção'
WHERE quarto_id = 4;

UPDATE tb_quarto
SET preco_diaria = 120.00
WHERE quarto_id = 5;

11-Utilize comandos SQL para fazer exclusões em 5 registros a sua escolha da tabela “Tabela Reserva”:

DELETE FROM tb_reserva
WHERE reserva_id = 1;

DELETE FROM tb_reserva
WHERE reserva_id = 2;

DELETE FROM tb_reserva
WHERE reserva_id = 3;

DELETE FROM tb_reserva
WHERE reserva_id = 4;

DELETE FROM tb_reserva
WHERE reserva_id = 5;

