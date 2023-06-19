/* BodegaFacil_Logico3.0: */

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
    nome VARCHAR(20),
    descricao VARCHAR(100)
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