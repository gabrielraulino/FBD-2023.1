
CREATE TABLE caixa (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15),
    senha VARCHAR(15)
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL,
    descricao VARCHAR(100),
    quantidade INTEGER,
    tipo_unidade CHAR,
    codigo INTEGER,
    categoria_id SERIAL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(15),
    descricao VARCHAR(20)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    valor DECIMAL,
    data_hora TIMESTAMP,
    caixa_id SERIAL,
    pagamento_id SERIAL
);

CREATE TYPE tipos_pagamento as ENUM('Cartão de Crédito', 'Dinheiro', 'Cartão de Débito', 'Pix');
CREATE TABLE tipos_pagamentos (
    tipo tipos_pagamento,
    pagamento_id SERIAL PRIMARY KEY
);

CREATE TABLE fiados (
    pagamento_id SERIAL PRIMARY KEY,
    cliente_id SERIAL,
    tipo_pagamento_id SERIAL
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    cpf VARCHAR(15),
    dt_cadastro DATE,
    UNIQUE (cpf);
);

CREATE TABLE enderecos (
    id SERIAL PRIMARY KEY,
    cep VARCHAR(15),
    bairro VARCHAR(50),
    rua VARCHAR(50),
    numero INTEGER,
    complemento VARCHAR(20),
    cliente_id SERIAL
);

CREATE TABLE telefones (
    id SERIAL PRIMARY KEY,
    cod_pais INTEGER,
    ddd INTEGER,
    numero INTEGER,
    cliente_id SERIAL
);

CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    criado_em TIMESTAMP,
    atualizado_em TIMESTAMP,
    subtotal DECIMAL
);

CREATE TABLE vendas_produtos (
    produto_id SERIAL,
    venda_id SERIAL,
    criado_em TIMESTAMP,
    atualizado_em TIMESTAMP,
    qtd INTEGER,
    subtotal DECIMAL
);
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_2
    FOREIGN KEY (categoria_id)
    REFERENCES categoria (id)
    ON DELETE CASCADE;
 
ALTER TABLE venda ADD CONSTRAINT FK_venda_2
    FOREIGN KEY (caixa_id)
    REFERENCES caixa (id)
    ON DELETE CASCADE;
 
ALTER TABLE venda ADD CONSTRAINT FK_venda_3
    FOREIGN KEY (pagamento_id)
    REFERENCES pagamento (id)
    ON DELETE RESTRICT;
 
ALTER TABLE tipo_pagamento ADD CONSTRAINT FK_tipo_pagamento_2
    FOREIGN KEY (pagamento_id)
    REFERENCES pagamento (id)
    ON DELETE CASCADE;
 
ALTER TABLE fiado ADD CONSTRAINT FK_fiado_2
    FOREIGN KEY (pagamento_id)
    REFERENCES pagamento (id)
    ON DELETE CASCADE;
 
ALTER TABLE fiado ADD CONSTRAINT FK_fiado_3
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    ON DELETE CASCADE;
 
ALTER TABLE fiado ADD CONSTRAINT FK_fiado_4
    FOREIGN KEY (tipo_pagamento_id)
    REFERENCES tipo_pagamento (pagamento_id)
    ON DELETE RESTRICT;
 
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_2
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    ON DELETE RESTRICT;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_2
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    ON DELETE RESTRICT;
 
ALTER TABLE venda_produto ADD CONSTRAINT FK_venda_produto_1
    FOREIGN KEY (produto_id)
    REFERENCES produto (id)
    ON DELETE RESTRICT;
 
ALTER TABLE venda_produto ADD CONSTRAINT FK_venda_produto_2
    FOREIGN KEY (venda_id)
    REFERENCES venda (id)
    ON DELETE SET NULL;