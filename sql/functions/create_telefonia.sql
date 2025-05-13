-- Tabela de Operadoras
CREATE TABLE Operadora (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

-- Tabela de Clientes
CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    rg VARCHAR(20),
    sexo CHAR(1),
    uf CHAR(2)
);

-- Tabela de Telefones
CREATE TABLE Telefone (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(15) UNIQUE NOT NULL,
    operadora_id INTEGER NOT NULL REFERENCES Operadora(id) ON DELETE CASCADE
);

-- Tabela de Planos
CREATE TABLE Plano (
    id SERIAL PRIMARY KEY,
    valor NUMERIC(10,2) NOT NULL,
    operadora_id INTEGER NOT NULL REFERENCES Operadora(id) ON DELETE CASCADE,
    descricao VARCHAR(100) NOT NULL
);

-- Tabela de Contratos
CREATE TABLE Contrato (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES Cliente(id) ON DELETE CASCADE,
    telefone_id INTEGER NOT NULL REFERENCES Telefone(id) ON DELETE CASCADE,
    plano_id INTEGER NOT NULL REFERENCES Plano(id) ON DELETE CASCADE,
    data_contrato DATE NOT NULL DEFAULT CURRENT_DATE,
    valor_final NUMERIC(10,2) NOT NULL
);






-- Povoamento da Tabela Operadora
INSERT INTO Operadora (nome, cnpj) VALUES
('Vivo', '12345678000199'),
('Claro', '23456789000199'),
('Oi', '34567890000199'),
('Tim', '45678901000199'),
('Nextel', '56789012000199'),
('Algar', '67890123000199'),
('Sercomtel', '78901234000199'),
('Sky', '89012345000199'),
('Embratel', '90123456000199'),
('Tim', '12345067890199');

-- Povoamento da Tabela Cliente
INSERT INTO Cliente (cpf, nome, rg, sexo, uf) VALUES
('12345678901', 'Ana Silva', '1234567', 'F', 'SP'),
('23456789012', 'Carlos Souza', '2345678', 'M', 'RJ'),
('34567890123', 'Mariana Costa', '3456789', 'F', 'MG'),
('45678901234', 'Ricardo Pereira', '4567890', 'M', 'PR'),
('56789012345', 'Fernanda Lima', '5678901', 'F', 'BA'),
('67890123456', 'Eduardo Silva', '6789012', 'M', 'RS'),
('78901234567', 'Júlia Almeida', '7890123', 'F', 'PE'),
('89012345678', 'Renato Oliveira', '8901234', 'M', 'SC'),
('90123456789', 'Sofia Martins', '9012345', 'F', 'CE'),
('11223344556', 'Lucas Santos', '1122334', 'M', 'GO');

-- Povoamento da Tabela Telefone
INSERT INTO Telefone (numero, operadora_id) VALUES
('11987654321', 1),
('21987654321', 2),
('31987654321', 3),
('41987654321', 4),
('51987654321', 5),
('61987654321', 6),
('71987654321', 7),
('81987654321', 8),
('91987654321', 9),
('10987654321', 10);

-- Povoamento da Tabela Plano
INSERT INTO Plano (valor, operadora_id, descricao) VALUES
(99.90, 1, 'Plano Básico'),
(129.90, 2, 'Plano Ilimitado'),
(89.90, 3, 'Plano Família'),
(159.90, 4, 'Plano Executivo'),
(79.90, 5, 'Plano Controle'),
(109.90, 6, 'Plano Completo'),
(129.90, 7, 'Plano Pre-Pago'),
(99.90, 8, 'Plano Smart'),
(119.90, 9, 'Plano 5G'),
(139.90, 10, 'Plano Corporativo');

-- Povoamento da Tabela Contrato
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES
(1, 1, 1, '2025-01-01', 99.90),
(2, 2, 2, '2025-02-01', 129.90),
(3, 3, 3, '2025-03-01', 89.90),
(4, 4, 4, '2025-04-01', 159.90),
(5, 5, 5, '2025-05-01', 79.90),
(6, 6, 6, '2025-06-01', 109.90),
(7, 7, 7, '2025-07-01', 129.90),
(8, 8, 8, '2025-08-01', 99.90),
(9, 9, 9, '2025-09-01', 119.90),
(10, 10, 10, '2025-10-01', 139.90);


