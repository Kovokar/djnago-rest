INSERT INTO TITULO (NOME_TITULO, DESC_TITULO) VALUES
('O Senhor dos Anéis', 'Fantasia épica'),
('1984', 'Distopia totalitária'),
('A Revolução dos Bichos', 'Fábula política'),
('Dom Quixote', 'Romance clássico'),
('Harry Potter e a Pedra Filosofal', 'Fantasia juvenil');

INSERT INTO LIVRO (COD_TITULO, VALOR_LIVRO, QTD_ESTOQUE) VALUES
(1, 100, 50),
(2, 50, 30),
(3, 40, 20),
(4, 80, 15),
(5, 90, 25);

INSERT INTO FORNECEDOR (NOME_FORNECEDOR, FONE_FORNECEDOR) VALUES
('Editora A', '1234-5678'),
('Editora B', '2345-6789'),
('Editora C', '3456-7890'),
('Editora D', '4567-8901'),
('Editora E', '5678-9012');

INSERT INTO PEDIDO (COD_FORNECEDOR, HORA_PEDIDO, DATA_PEDIDO, VALOR_TOTAL_PEDIDO) VALUES
(1, '10:30:00', '2025-04-01', 500),
(2, '11:00:00', '2025-04-02', 300),
(3, '14:45:00', '2025-04-03', 200),
(4, '09:15:00', '2025-04-04', 400),
(5, '16:00:00', '2025-04-05', 600);

INSERT INTO ITEM_PEDIDO (COD_PEDIDO, COD_LIVRO) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);
















-- 1. Populando a tabela TITULO
INSERT INTO TITULO (NOME_TITULO, DESC_TITULO) VALUES
('Matemática Básica', 'Livro introdutório de matemática'),
('Física Clássica', 'Física para ensino médio'),
('Química Orgânica', 'Livro sobre compostos orgânicos'),
('História Geral', 'História mundial'),
('Geografia Física', 'Estudo das formações naturais'),
('Programação em Python', 'Introdução à linguagem Python'),
('Banco de Dados', 'Modelagem e SQL'),
('Engenharia de Software', 'Princípios e práticas'),
('Redação para ENEM', 'Dicas de escrita'),
('Literatura Brasileira', 'Autores clássicos'),
('Biologia Celular', 'Estudo das células'),
('Filosofia Moderna', 'Pensadores contemporâneos'),
('Economia', 'Princípios básicos'),
('Estatística Aplicada', 'Estatística com exemplos'),
('Cálculo I', 'Introdução ao cálculo diferencial'),
('Administração', 'Fundamentos da administração'),
('Direito Constitucional', 'Constituição brasileira'),
('Psicologia Geral', 'Introdução à psicologia'),
('Sociologia', 'Estudo das sociedades'),
('Marketing Digital', 'Estratégias online');

-- 2. Populando a tabela LIVRO
INSERT INTO LIVRO (COD_TITULO, VALOR_LIVRO, QTD_ESTOQUE) VALUES
(1, 50, 10),
(2, 60, 5),
(3, 70, 8),
(4, 55, 12),
(5, 40, 20),
(6, 80, 7),
(7, 90, 6),
(8, 85, 9),
(9, 30, 11),
(10, 45, 4),
(11, 65, 3),
(12, 75, 2),
(13, 100, 10),
(14, 55, 6),
(15, 60, 5),
(16, 50, 8),
(17, 95, 4),
(18, 85, 6),
(19, 40, 10),
(20, 70, 9);

-- 3. Populando a tabela FORNECEDOR
INSERT INTO FORNECEDOR (NOME_FORNECEDOR, FONE_FORNECEDOR) VALUES
('Fornecedor A', '1111-1111'),
('Fornecedor B', '2222-2222'),
('Fornecedor C', '3333-3333'),
('Fornecedor D', '4444-4444'),
('Fornecedor E', '5555-5555'),
('Fornecedor F', '6666-6666'),
('Fornecedor G', '7777-7777'),
('Fornecedor H', '8888-8888'),
('Fornecedor I', '9999-9999'),
('Fornecedor J', '1010-1010');

-- 4. Populando a tabela PEDIDO
INSERT INTO PEDIDO (COD_FORNECEDOR, HORA_PEDIDO, DATA_PEDIDO, VALOR_TOTAL_PEDIDO) VALUES
(1, '09:00', '2024-05-01', 150),
(2, '10:30', '2024-05-02', 200),
(3, '11:15', '2024-05-03', 180),
(4, '14:00', '2024-05-04', 210),
(5, '08:45', '2024-05-05', 170),
(6, '15:30', '2024-05-06', 160),
(7, '12:00', '2024-05-07', 190),
(8, '13:20', '2024-05-08', 220),
(9, '16:40', '2024-05-09', 230),
(10, '09:50', '2024-05-10', 240),
(1, '10:10', '2024-05-11', 250),
(2, '11:00', '2024-05-12', 260),
(3, '14:10', '2024-05-13', 270),
(4, '15:00', '2024-05-14', 280),
(5, '16:30', '2024-05-15', 290);

-- 5. Populando a tabela ITEM_PEDIDO
INSERT INTO ITEM_PEDIDO (COD_PEDIDO, COD_LIVRO) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);
