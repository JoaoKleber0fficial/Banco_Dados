1-floricultura.db

2-criando tabelas:
CREATE TABLE flor (
    codigo INTEGER PRIMARY KEY,
    nome_cientifico TEXT NOT NULL,
    nome_popular TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE estoque_flores (
    codigo INTEGER PRIMARY KEY,
    quantidade INTEGER NOT NULL,
    cores_disponiveis TEXT NOT NULL,
    FOREIGN KEY(codigo) REFERENCES flor(codigo)
);

CREATE TABLE clientes (
    nome TEXT NOT NULL,
    CPF TEXT PRIMARY KEY,
    telefone TEXT NOT NULL,
    endereco_entrega TEXT NOT NULL
);

CREATE TABLE pedidos (
    numero_pedido INTEGER PRIMARY KEY,
    data_de_realizacao TEXT NOT NULL,
    valor_total REAL NOT NULL
);

3-preenchendo tabela:
-- Inserção de dados na tabela 'flor'
INSERT INTO flor (codigo, nome_cientifico, nome_popular, preco) 
VALUES 
    (1, 'Rosa gallica', 'Rosa Vermelha', 12.99),
    (2, 'Lilium candidum', 'Lírio Branco', 9.99),
    (3, 'Tulipa gesneriana', 'Tulipa Vermelha', 8.49),
    (4, 'Dianthus caryophyllus', 'Cravo Vermelho', 6.99),
    (5, 'Gypsophila paniculata', 'Gipsofila Branca', 5.99);

-- Inserção de dados na tabela 'estoque_flores'
INSERT INTO estoque_flores (codigo, quantidade, cores_disponiveis) 
VALUES 
    (1, 50, 'Vermelho, Branco, Rosa, Amarelo'),
    (2, 40, 'Branco'),
    (3, 60, 'Vermelho, Amarelo'),
    (4, 35, 'Vermelho'),
    (5, 80, 'Branco');

-- Inserção de dados na tabela 'clientes'
INSERT INTO clientes (nome, CPF, telefone, endereco_entrega) 
VALUES 
    ('Maria Silva', '123.456.789-10', '(11) 98765-4321', 'Rua das Flores, 123'),
    ('João Oliveira', '987.654.321-10', '(11) 12345-6789', 'Avenida dos Lírios, 456'),
    ('Ana Souza', '456.789.123-10', '(11) 55555-5555', 'Praça das Tulipas, 789'),
    ('Pedro Santos', '789.123.456-10', '(11) 33333-3333', 'Alameda das Rosas, 789'),
    ('Carla Rodrigues', '321.654.987-10', '(11) 99999-9999', 'Travessa das Gipsofilas, 10');

-- Inserção de dados na tabela 'pedidos'
INSERT INTO pedidos (numero_pedido, data_de_realizacao, valor_total) 
VALUES 
    (1, '2023-01-15', 45.95),
    (2, '2023-02-20', 31.47),
    (3, '2023-03-10', 57.45),
    (4, '2023-04-05', 27.93),
    (5, '2023-05-12', 47.92);