--inserindo elementos na tabela vendas, vendas_tabela e pagamento
--cada venda tem o valor total dos preços dos produtos vezes a quantidade
--como nesse caso ainda não existe aplicação, o cálculo será feito manualmente
--cada venda precisa da inserção do pagamento, no contexto atual o pagamento será inserido primeiro que a venda
SELECT nome, preco FROM PRODUTOS

SELECT * FROM pagamento
SELECT * FROM vendas
SELECT * FROM vendas_produtos


INSERT INTO pagamento (tipo)
VALUES('Cartão de Crédito')



INSERT INTO vendas (subtotal, pagamento_id)
VALUES 
(25.88, 1)

INSERT INTO vendas_produtos (produto_id, venda_id, quantidade, subtotal)
VALUES
(1,1,2,17.9),
(6,1,2,7.98)

DROP TRIGGER atualizar_quantidade_produto ON vendas_produtos