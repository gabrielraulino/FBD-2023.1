
CREATE TABLE caixa (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE ,
    senha VARCHAR(20)
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY ,
    nome VARCHAR(50) ,
    preco DECIMAL ,
    descricao VARCHAR(100),
    quantidade INTEGER ,
    tipo_unidade CHAR(2) ,
    UPC VARCHAR(15),
    categoria_id SERIAL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    subtotal DECIMAL,
    caixa_id SERIAL ,
    pagamento_id SERIAL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE fiados (
    cliente_id SERIAL,
    pagamento_id SERIAL
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(15) UNIQUE ,
    dt_cadastro DATE
);

CREATE TABLE enderecos (
    id SERIAL PRIMARY KEY,
    cep VARCHAR(15),
    bairro VARCHAR(50),
    rua VARCHAR(50),
    numero INTEGER,
    complemento VARCHAR(50),
    cliente_id SERIAL
);

CREATE TABLE telefones (
    id SERIAL PRIMARY KEY,
    ddd CHAR(2),
    numero VARCHAR(11),
    cliente_id SERIAL
);

CREATE TABLE pagamento (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(20),
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vendas_produtos (
    produto_id SERIAL ,
    venda_id SERIAL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    subtotal DECIMAL,
    quantidade INTEGER
);
 
ALTER TABLE produtos ADD CONSTRAINT FK_produtos_categorias
    FOREIGN KEY (categoria_id)
    REFERENCES categorias (id)
    ON DELETE CASCADE;
 
ALTER TABLE vendas ADD CONSTRAINT FK_vendas_caixa
    FOREIGN KEY (caixa_id)
    REFERENCES caixa (id)
    ON DELETE CASCADE;
 
ALTER TABLE vendas ADD CONSTRAINT FK_vendas_pagamento
    FOREIGN KEY (pagamento_id)
    REFERENCES pagamento (id)
    ON DELETE RESTRICT;
 
ALTER TABLE fiados ADD CONSTRAINT FK_fiados_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES clientes (id)
    ON DELETE CASCADE;
 
ALTER TABLE fiados ADD CONSTRAINT FK_fiados_pagamento
    FOREIGN KEY (pagamento_id)
    REFERENCES pagamento (id);
 
ALTER TABLE enderecos ADD CONSTRAINT FK_enderecos_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES clientes (id)
    ON DELETE RESTRICT;
 
ALTER TABLE telefones ADD CONSTRAINT FK_telefones_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES clientes (id)
    ON DELETE RESTRICT;
 
ALTER TABLE vendas_produtos ADD CONSTRAINT FK_produtos
    FOREIGN KEY (produto_id)
    REFERENCES produtos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE vendas_produtos ADD CONSTRAINT FK_vendas
    FOREIGN KEY (venda_id)
    REFERENCES vendas (id)
    ON DELETE SET NULL;


INSERT INTO caixa (username, senha)
VALUES
('admin', 'admin123');   

INSERT INTO categorias (nome)
VALUES
	('Alimentos'),
	('Carnes'),
	('Bebidas'),
	('Hortifrut'),
	('Limpeza'),
	('Padaria'),
	('Papelaria'),
	('Utilidades'),
	('Temperos'),
	('Pets');


INSERT INTO produtos (nome, preco, descricao, quantidade, tipo_unidade, categoria_id) 
VALUES 
('Leite em Po Betania Integral 200g', 8.95, 'Alergicos: Contem leite, lactose', 10 ,'UN', 1),
('Pasteis Crocantes Uchoa 200g', 6.38, 'Pasteis industrializados de massa fina', 12,'UN', 1),
('Amido de Milo Maizena 200g', 4.38, 'Ótimo para receitas e mingau', 10 ,'UN', 1),
('Maionese Quero Sache 200g', 3.28, 'A Maionese Quero Sachê vem na medida certa para fazer suas receitas em casa.', 10 , 'UN', 1),
('Geleia de Mocoto Predilecta 180G Natural', 5.99, 'Geleia de Mocotó Natural Predilecta Vidro 180g', 5 ,'UN', 1),
('Arroz Branco 101 1Kg', 3.99, 'Subtipo: polido tipo 1', 10 ,'Un', 1),
('Pao integral Visconti 400g', 11.99, 'Pão integral de alta qualidade, rico em proteínas e fibras', 10, 'UN', 6 ),
('Pao de Forma Renopan 500g', 8.78, 'Pão de forma Renopan 500g UN', 10, 'UN', 6),
('Bolacha Acebolada Nobre 250g', 4.58, 'Bolacha Acebolada Nobre 250g', 10, 'UN', 6),
('Caldo de Galinha Maggi Tablete 57g', 1.68, 'Caldo de Galinha MAGGI. Contém glúten', 20, 'UN', 9),
('Vassoura Mazzaferro lindona', 12.10, 'Vassoura Mazzaferro Lindona Unidade', 5, 'UN', 8),
('Frango ao Molho Pedigree Sache 100g', 3.35, 'Alimento para Cães Filhotes Frango ao Molho Pedigree Sachê 100g', 10, 'UN', 10),
('Caderno Universitario 10 Materias', 16.65 , 'Caderno Universitário 10 Matérias Zip Preto 160 Folhas Tilibra', 8, 'UN', 7),
('Tangerina Kg', 8.87, 'Tangerina Kg', 10, 'KG', 4),
('Agua Sanitaria Dragao', 1.99, 'Produto com múltiplas funcionalidades.', 10, 'UN', 5),
('Cerveja Budweiser Lata 350ml', 4.57,'Cerveja Budweiser Lata 350ml', 15, 'UN', 3),
('Carne Moida Intermediaria Kg', 26.47, 'Carne Moída Intermediária kg', 10, 'KG', 2),
('Caneta BIC Azul', 1.0,'Caneta de precisão', 10,'UN', 7);


--inserindo clientes e seus endereços e telefones

INSERT INTO clientes (nome, cpf, dt_cadastro)
VALUES 
('Jose Silva', '584.731.660-78', now()),
('Francisco Teixeira', '820.434.400-71', now()),
('Paulo Pinho', '882.616.430-42', now()),
('Joana Larissa', '220.474.950-83', now()),
('Lucas Silva', '693.583.240-31', now()),
('Guilherme Girão', '038.417.260-11', now()),
('Maria Ferreira', '777.707.320-69', now()),
('Joselia Mafra','661.845.490-57', now()),
('Jeneudo Farias', '694.928.970-75', now()),
('Manoel Gomes', '818.354.600-54', now());

--inserindo os enderecos dos clientes
INSERT INTO enderecos(cep, bairro, rua, numero, complemento, cliente_id)
VALUES
('63900-002', 'Centro', 'Rua Florencio Lopes', 410, 'Casa', 1),
('63900-013', 'Centro', 'Rua Campina', 620, 'Casa', 2),
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
('88', '25841381', 1),
('88', '31431627', 3),
('85', '21578825', 2), 
('85', '34542375', 4),
('85', '25901388', 5),
('88', '33210081', 6),
('88', '27574262', 7),
('85', '34325243', 8),
('88', '25446798', 9),
('85', '33782657', 10);

--inserindo vendas

INSERT INTO pagamento (tipo)
VALUES 
('Cartão de Crédito');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES 
(25.88, (SELECT id FROM PAGAMENTO ORDER BY id DESC LIMIT 1), 1);

INSERT INTO vendas_produtos (produto_id, venda_id, quantidade, subtotal)
VALUES
(1,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1),2,17.9),
(6,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1),2,7.98);
--

INSERT INTO pagamento (tipo)
VALUES 
('Cartão de Débito');

INSERT INTO vendas(subtotal, pagamento_id, caixa_id)
VALUES
(19.7, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO vendas_produtos(produto_id, venda_id, quantidade, subtotal)
VALUES
(3, (SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 3, 13.14),
(4, (SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 2, 5.46);

--
INSERT INTO pagamento (tipo)
VALUES ('Dinheiro');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES
(12.10, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO vendas_produtos(produto_id, venda_id, quantidade, subtotal)
VALUES
(11, (SELECT id from vendas ORDER by id desc LIMIT 1), 1, 12.10);

--
INSERT INTO pagamento (tipo)
VALUES ('Dinheiro');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES 
(8.95, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);


INSERT INTO vendas_produtos (produto_id, venda_id, quantidade, subtotal)
VALUES
(1,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1),1,8.95);

--

INSERT INTO pagamento (tipo)
VALUES ('Fiado');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES 
(31.7, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO fiados (cliente_id, pagamento_id)
VALUES (3, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1));

INSERT INTO vendas_produtos (produto_id, venda_id, quantidade, subtotal)
VALUES
(2,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 3, 6.38),
(6,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 2, 3.99),
(9,(SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 1, 4.58);

--

INSERT INTO pagamento (tipo)
VALUES ('Fiado');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES 
(3, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO fiados (cliente_id, pagamento_id)
VALUES (10, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1));

INSERT INTO vendas_produtos (produto_id, venda_id, quantidade, subtotal)
VALUES
((SELECT id FROM produtos WHERE nome = 'Caneta BIC Azul'),(SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 3, 3);

--
INSERT INTO pagamento (tipo)
VALUES 
('Cartão de Débito');

INSERT INTO vendas(subtotal, pagamento_id, caixa_id)
VALUES
(19.7, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO vendas_produtos(produto_id, venda_id, quantidade, subtotal)
VALUES
(3, (SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 3, 13.14),
(4, (SELECT id FROM vendas ORDER BY id DESC LIMIT 1), 2, 5.46);
--

INSERT INTO pagamento (tipo)
VALUES ('Dinheiro');

INSERT INTO vendas (subtotal, pagamento_id, caixa_id)
VALUES
(12.10, (SELECT id FROM pagamento ORDER BY id DESC LIMIT 1), 1);

INSERT INTO vendas_produtos(produto_id, venda_id, quantidade, subtotal)
VALUES
(11, (SELECT id from vendas ORDER by id desc LIMIT 1), 1, 12.10);

--consultas

--quantidade de produtos cadastrados
SELECT COUNT(id) AS total_produtos
FROM produtos

--unidades de cada produto, nome e categoria
SELECT categoria.nome, produto.nome, produto.quantidade 
FROM produtos produto
JOIN categorias categoria ON categoria.id = produto.categoria_id
ORDER BY categoria.nome  


-- cliente e o valor que está devendo
SELECT cliente.nome AS cliente, SUM(venda.subtotal) AS valor_total
FROM fiados fiado
JOIN clientes cliente ON fiado.cliente_id = cliente.id
JOIN vendas venda ON fiado.pagamento_id = venda.pagamento_id
GROUP BY cliente.nome;

--faturamento total
SELECT SUM(venda.subtotal) AS faturamento
FROM vendas venda
JOIN pagamento pagamento ON pagamento.id = venda.pagamento_id 
WHERE pagamento.tipo NOT LIKE 'Fiado'

--produto com mais vendas
SELECT produto.nome AS produto, COUNT(vendas_produto.venda_id) AS total_vendas
FROM produtos produto
JOIN vendas_produtos vendas_produto ON produto.id = vendas_produto.produto_id
GROUP BY produto.id, produto.nome
ORDER BY total_vendas DESC
LIMIT 1;
