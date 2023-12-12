1-criando borracharia.db

2-criando tabelas:
CREATE TABLE Pneus (
    numero_serie INTEGER PRIMARY KEY,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    dimensoes TEXT NOT NULL,
    quantidade_estoque INTEGER NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    telefone TEXT NOT NULL,
    endereco TEXT NOT NULL
);

CREATE TABLE Servicos (
    numero_ordem INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_realizacao TEXT NOT NULL,
    valor REAL NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Pneus_Servicos (
    id_pneu INTEGER,
    numero_ordem INTEGER,
    FOREIGN KEY(id_pneu) REFERENCES Pneus(numero_serie),
    FOREIGN KEY(numero_ordem) REFERENCES Servicos(numero_ordem),
    PRIMARY KEY (id_pneu, numero_ordem)
);

CREATE TABLE Servicos_Realizados (
    id_pneu INTEGER,
    numero_ordem INTEGER,
    FOREIGN KEY(id_pneu) REFERENCES Pneus(numero_serie),
    FOREIGN KEY(numero_ordem) REFERENCES Servicos(numero_ordem),
    PRIMARY KEY (id_pneu, numero_ordem)
);

3-preenchendo tabelas:
INSERT INTO Pneus (numero_serie, marca, modelo, dimensoes, quantidade_estoque) 
VALUES 
    (1, 'Pirelli', 'PZero', '225/45 R17', 10),
    (2, 'Michelin', 'Primacy 4', '205/55 R16', 8),
    (3, 'Continental', 'ContiSportContact', '235/40 R18', 12),
    (4, 'Bridgestone', 'Turanza', '195/65 R15', 15),
    (5, 'Goodyear', 'Eagle F1 Asymmetric', '245/40 R18', 7);

-- Inserção de dados na tabela 'Clientes'
INSERT INTO Clientes (nome, cpf, telefone, endereco) 
VALUES 
    ('João Silva', '123.456.789-10', '(11) 98765-4321', 'Rua A, 123'),
    ('Maria Oliveira', '234.567.890-21', '(11) 87654-3210', 'Avenida B, 456'),
    ('Pedro Santos', '345.678.901-32', '(11) 76543-2109', 'Rua C, 789'),
    ('Ana Souza', '456.789.012-43', '(11) 65432-1098', 'Avenida D, 101'),
    ('Carla Rodrigues', '567.890.123-54', '(11) 54321-0987', 'Rua E, 202');

-- Inserção de dados na tabela 'Servicos'
INSERT INTO Servicos (id_cliente, data_realizacao, valor) 
VALUES 
    (1, '2023-01-10', 150.00),
    (2, '2023-02-15', 200.00),
    (3, '2023-03-20', 180.00),
    (4, '2023-04-25', 210.00),
    (5, '2023-05-30', 190.00);

-- Inserção de dados na tabela 'Pneus_Servicos'
INSERT INTO Pneus_Servicos (id_pneu, numero_ordem) 
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Inserção de dados na tabela 'Servicos_Realizados'
INSERT INTO Servicos_Realizados (id_pneu, numero_ordem) 
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);