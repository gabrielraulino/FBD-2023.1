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