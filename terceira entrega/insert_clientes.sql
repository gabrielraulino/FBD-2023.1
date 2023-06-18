inserindo clientes e seus endereços e telefones
SELECT * FROM CLIENTES

INSERT INTO clientes (nome, cpf)
VALUES 
('Jose Silva', '584.731.660-78'),
('Francisco Teixeira', '820.434.400-71'),
('Paulo Pinho', '882.616.430-42'),
('Joana Larissa', '220.474.950-83'),
('Lucas Silva', '693.583.240-31'),
('Guilherme Girão', '038.417.260-11'),
('Maria Ferreira', '777.707.320-69'),
('Joselia Mafra','661.845.490-57'),
('Jeneudo Farias', '694.928.970-75'),
('Manoel Gomes', '694.928.970-75');
SELECT * FROM clientes;

SELECT * FROM enderecos

--inserindo os enderecos dos clientes
INSERT INTO enderecos(cep, bairro, rua, numero, complemento, cliente_id)
VALUES
('63900-002', 'Centro', 'Rua Florencio Lopes', 410, 'Casa', 1),
('63900-013', 'Centro', 'Rua Campina', 620, 'Casa', 2)
('63900-017', 'Centro', 'Rua Estudante Antonio Brito', 800, 'Casa',3),
('63900-037', 'Centro', 'ravessa Aristides Goncalves da Silva', 1230, 'casa', 4),
('63900-045', 'Centro', 'Rua Frazão Cravo', 1945, 'casa', 5),
('63900-350', 'Herval', 'Rua do Sossego', 336, 'apto 402',6),
('63900-405', 'Sao Joao', 'Rua B', 1513, 'casa', 7),
('63900-415', 'Sao Joao', 'Rua C', 1428, 'casa', 8),
('63901-080', 'Planalto Renascer', 'Rua Clarinda Moreira de Queiroz', 2203, 'casa', 9),
('63902-145', ' Planalto Universitario', 'Travessa Pedro Cabral de Oliveira', 700, 'casa', 10);

--inserindo telefones dos clientes

INSERT INTO telefones (ddd, numero, cliente_id)
VALUES
(88, 25841381, 1),
(85, 21578825, 2),
(88, 31431627, 3),
(85, 34542375, 4),
(85, 25901388, 5),
(88, 33210081, 6),
(88, 27574262, 7),
(85, 34325243, 8),
(88, 25446798, 9),
(85, 33782657, 10);