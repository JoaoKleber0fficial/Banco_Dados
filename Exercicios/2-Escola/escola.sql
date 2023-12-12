1-criando escola.db

2-criando tabelas:
CREATE TABLE Alunos (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    rg TEXT NOT NULL,
    data_nascimento TEXT NOT NULL,
    endereco TEXT NOT NULL
);

CREATE TABLE Cursos (
    id_curso INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_curso TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL
);

CREATE TABLE Professores (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_professor TEXT NOT NULL,
    especialidade TEXT NOT NULL,
    contato TEXT NOT NULL
);

CREATE TABLE Matriculas (
    id_matricula INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    numero_matricula TEXT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY(id_curso) REFERENCES Cursos(id_curso),
    UNIQUE (id_aluno, id_curso) -- Garante que um aluno não se matricule duas vezes no mesmo curso
);

CREATE TABLE Notas (
    id_nota INTEGER PRIMARY KEY AUTOINCREMENT,
    id_matricula INTEGER NOT NULL,
    N1 REAL,
    N2 REAL,
    N3 REAL,
    N4 REAL,
    FOREIGN KEY(id_matricula) REFERENCES Matriculas(id_matricula)
);

3-preenchendo a tabela:
-- Inserção de dados na tabela 'Alunos'
INSERT INTO Alunos (nome, cpf, rg, data_nascimento, endereco) 
VALUES 
    ('João Silva', '123.456.789-10', '987654321', '2000-05-10', 'Rua A, 123'),
    ('Maria Oliveira', '234.567.890-21', '876543210', '1999-08-15', 'Avenida B, 456'),
    ('Pedro Santos', '345.678.901-32', '765432109', '2001-02-20', 'Rua C, 789'),
    ('Ana Souza', '456.789.012-43', '654321098', '2002-11-25', 'Avenida D, 101'),
    ('Carla Rodrigues', '567.890.123-54', '543210987', '1998-07-30', 'Rua E, 202');

-- Inserção de dados na tabela 'Cursos'
INSERT INTO Cursos (nome_curso, carga_horaria) 
VALUES 
    ('Informática', 80),
    ('Inglês', 60),
    ('Administração', 90),
    ('Matemática', 75),
    ('Artes', 45);

-- Inserção de dados na tabela 'Professores'
INSERT INTO Professores (nome_professor, especialidade, contato) 
VALUES 
    ('Carlos Oliveira', 'Programação', '(11) 1234-5678'),
    ('Mariana Costa', 'Inglês Avançado', '(11) 9876-5432'),
    ('José Silva', 'Gestão de Negócios', '(11) 5555-1234'),
    ('Fernanda Santos', 'Matemática Aplicada', '(11) 7777-8888'),
    ('André Souza', 'Arte Moderna', '(11) 9999-0000');

-- Inserção de dados na tabela 'Matriculas'
INSERT INTO Matriculas (id_aluno, id_curso, numero_matricula) 
VALUES 
    (1, 1, 'INF2023001'),
    (2, 2, 'ING2023001'),
    (3, 3, 'ADM2023001'),
    (4, 4, 'MAT2023001'),
    (5, 5, 'ART2023001');

-- Inserção de dados na tabela 'Notas'
INSERT INTO Notas (id_matricula, N1, N2, N3, N4) 
VALUES 
    (1, 8.5, 7.2, 9.0, 6.8),
    (2, 9.0, 8.5, 7.5, 9.5),
    (3, 7.0, 8.0, 7.5, 6.5),
    (4, 6.5, 7.0, 8.0, 7.8),
    (5, 8.0, 8.5, 9.0, 7.2);