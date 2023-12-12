1-Banco Voo criado :)

2-Criando Tabelas:
CREATE TABLE Passageiros (
    CPF TEXT PRIMARY KEY,
    Nome TEXT NOT NULL,
    DataNascimento DATE NOT NULL,
    Telefone1 TEXT,
    Telefone2 TEXT,
    Rua TEXT NOT NULL,
    Numero TEXT NOT NULL,
    CEP TEXT NOT NULL,
    Complemento TEXT,
    Bairro TEXT NOT NULL,
    Cidade TEXT NOT NULL,
    Estado TEXT NOT NULL
);

-- Criação da tabela Rotas
CREATE TABLE Rotas (
    CodigoRota TEXT PRIMARY KEY,
    Origem TEXT NOT NULL,
    Destino TEXT NOT NULL
);

-- Criação da tabela Avioes

CREATE TABLE Avioes (
    NumeroAviao TEXT PRIMARY KEY,
    Modelo TEXT NOT NULL
);

-- Criação da tabela Voos
CREATE TABLE Voos (
    NumeroVoo TEXT PRIMARY KEY,
    CodigoRota TEXT NOT NULL,
    DataPartida DATETIME NOT NULL,
    DataChegada DATETIME NOT NULL,
    NumeroAviao TEXT NOT NULL,
    FOREIGN KEY (CodigoRota) REFERENCES Rotas (CodigoRota),
    FOREIGN KEY (NumeroAviao) REFERENCES Avioes (NumeroAviao)
);

-- Criação da tabela Reservas
CREATE TABLE Reservas (
    CPF TEXT NOT NULL,
    NumeroVoo TEXT NOT NULL,
    NumeroAssento TEXT NOT NULL,
    PRIMARY KEY (CPF, NumeroVoo),
    FOREIGN KEY (CPF) REFERENCES Passageiros (CPF),
    FOREIGN KEY (NumeroVoo) REFERENCES Voos (NumeroVoo)
);

3-Preenchendo tabelas:
INSERT INTO Passageiros (CPF, Nome, DataNascimento, Telefone1, Telefone2, Rua, Numero, CEP, Complemento, Bairro, Cidade, Estado) VALUES
('123.456.789-00', 'João Silva', '1980-05-21', '11 98765-4321', '11 12345-6789', 'Rua das Flores', '100', '12345-678', 'Apto 101', 'Jardim das Árvores', 'São Paulo', 'SP'),
('987.654.321-00', 'Maria Oliveira', '1992-07-12', '21 87654-3210', NULL, 'Avenida Brasil', '250', '23456-789', 'Casa 20', 'Bairro Novo', 'Rio de Janeiro', 'RJ');

-- Inserindo dados na tabela Rotas
INSERT INTO Rotas (CodigoRota, Origem, Destino) VALUES
('ROTA01', 'São Paulo', 'Rio de Janeiro'),
('ROTA02', 'Brasília', 'Salvador');

-- Inserindo dados na tabela Avioes
INSERT INTO Avioes (NumeroAviao, Modelo) VALUES
('AV001', 'Boeing 737'),
('AV002', 'Airbus A320');

-- Inserindo dados na tabela Voos
INSERT INTO Voos (NumeroVoo, CodigoRota, DataPartida, DataChegada, NumeroAviao) VALUES
('V001', 'ROTA01', '2023-12-05 08:00', '2023-12-05 09:30', 'AV001'),
('V002', 'ROTA02', '2023-12-06 14:00', '2023-12-06 16:00', 'AV002');

-- Inserindo dados na tabela Reservas
INSERT INTO Reservas (CPF, NumeroVoo, NumeroAssento) VALUES
('123.456.789-00', 'V001', '12A'),
('987.654.321-00', 'V002', '1C');