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


-- Novos Planos --
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (72.57, 1, 'Plano Básico 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (92.52, 1, 'Plano Executivo 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (108.67, 1, 'Plano Básico 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (87.27, 1, 'Plano Pro 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (70.24, 1, 'Plano 5G 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (116.99, 2, 'Plano Smart 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (153.41, 2, 'Plano Controle 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (138.95, 2, 'Plano Smart 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (118.69, 2, 'Plano Família 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (74.14, 2, 'Plano Ilimitado 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (106.57, 3, 'Plano Executivo 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (148.48, 3, 'Plano Família 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (91.51, 3, 'Plano Pro 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (128.4, 3, 'Plano 5G 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (153.05, 3, 'Plano Família 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (151.01, 4, 'Plano Executivo 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (131.33, 4, 'Plano Família 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (142.83, 4, 'Plano Smart 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (99.65, 4, 'Plano Controle 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (148.01, 4, 'Plano Smart 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (85.0, 5, 'Plano Executivo 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (78.95, 5, 'Plano Básico 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (147.37, 5, 'Plano B�sico 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (80.0, 5, 'Plano Controle 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (134.05, 5, 'Plano Controle 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (113.15, 6, 'Plano Smart 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (134.75, 6, 'Plano Pro 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (135.18, 6, 'Plano 5G 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (119.55, 6, 'Plano Pro 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (124.6, 6, 'Plano 5G 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (150.18, 7, 'Plano Executivo 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (75.18, 7, 'Plano Família 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (85.7, 7, 'Plano Smart 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (130.87, 7, 'Plano Smart 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (143.44, 7, 'Plano Smart 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (94.69, 8, 'Plano Controle 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (114.88, 8, 'Plano Smart 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (71.41, 8, 'Plano Básico 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (127.89, 8, 'Plano Pro 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (75.11, 8, 'Plano Pro 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (154.06, 9, 'Plano Básico 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (126.27, 9, 'Plano Ilimitado 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (109.96, 9, 'Plano Executivo 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (87.99, 9, 'Plano Executivo 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (129.46, 9, 'Plano Smart 5');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (88.07, 10, 'Plano 5G 1');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (144.19, 10, 'Plano 5G 2');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (96.02, 10, 'Plano Ilimitado 3');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (105.01, 10, 'Plano 5G 4');
INSERT INTO Plano (valor, operadora_id, descricao) VALUES (143.48, 10, 'Plano Básico 5');

-- Novos Telefones --
INSERT INTO Telefone (numero, operadora_id) VALUES ('81944717553', 1);
INSERT INTO Telefone (numero, operadora_id) VALUES ('21923302860', 1);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10978289574', 1);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31944840501', 1);
INSERT INTO Telefone (numero, operadora_id) VALUES ('11975832949', 1);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31996513663', 2);
INSERT INTO Telefone (numero, operadora_id) VALUES ('11921875493', 2);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10917109137', 2);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71914132201', 2);
INSERT INTO Telefone (numero, operadora_id) VALUES ('61929948857', 2);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91928872335', 3);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71921152306', 3);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91981781500', 3);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31913659929', 3);
INSERT INTO Telefone (numero, operadora_id) VALUES ('51990082334', 3);
INSERT INTO Telefone (numero, operadora_id) VALUES ('81964245105', 4);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91950203507', 4);
INSERT INTO Telefone (numero, operadora_id) VALUES ('11922825182', 4);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91937834012', 4);
INSERT INTO Telefone (numero, operadora_id) VALUES ('41951364408', 4);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10963228027', 5);
INSERT INTO Telefone (numero, operadora_id) VALUES ('41978063757', 5);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71970104887', 5);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71979075446', 5);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71968603638', 5);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31954803270', 6);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71956422089', 6);
INSERT INTO Telefone (numero, operadora_id) VALUES ('61937562023', 6);
INSERT INTO Telefone (numero, operadora_id) VALUES ('81930874071', 6);
INSERT INTO Telefone (numero, operadora_id) VALUES ('41913704434', 6);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91933245243', 7);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91915172403', 7);
INSERT INTO Telefone (numero, operadora_id) VALUES ('21990687941', 7);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31996413547', 7);
INSERT INTO Telefone (numero, operadora_id) VALUES ('51922873587', 7);
INSERT INTO Telefone (numero, operadora_id) VALUES ('21915784935', 8);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10977154369', 8);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10917459729', 8);
INSERT INTO Telefone (numero, operadora_id) VALUES ('91983589676', 8);
INSERT INTO Telefone (numero, operadora_id) VALUES ('11988739519', 8);
INSERT INTO Telefone (numero, operadora_id) VALUES ('81959613656', 9);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31920471746', 9);
INSERT INTO Telefone (numero, operadora_id) VALUES ('21913303702', 9);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10919423487', 9);
INSERT INTO Telefone (numero, operadora_id) VALUES ('61942917746', 9);
INSERT INTO Telefone (numero, operadora_id) VALUES ('10923709228', 10);
INSERT INTO Telefone (numero, operadora_id) VALUES ('31935332242', 10);
INSERT INTO Telefone (numero, operadora_id) VALUES ('81919023236', 10);
INSERT INTO Telefone (numero, operadora_id) VALUES ('71975951545', 10);
INSERT INTO Telefone (numero, operadora_id) VALUES ('81938617679', 10);

-- Novos Contratos --
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (7, 1, 6, '2025-05-29', 81.94);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (4, 30, 15, '2025-09-15', 87.32);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (10, 16, 39, '2025-09-23', 79.44);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (2, 44, 16, '2025-10-15', 89.55);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (6, 57, 45, '2025-06-09', 138.3);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (1, 59, 16, '2025-02-18', 159.61);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (4, 33, 17, '2025-04-08', 121.68);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (7, 27, 12, '2025-06-07', 86.28);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (2, 42, 3, '2025-01-30', 126.63);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (3, 2, 5, '2025-10-27', 108.58);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (8, 54, 38, '2025-09-23', 131.03);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (2, 12, 11, '2025-07-12', 149.3);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (7, 49, 60, '2025-04-11', 134.92);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (1, 8, 15, '2025-09-23', 157.6);
INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final) VALUES (3, 32, 22, '2025-04-05', 158.33);

