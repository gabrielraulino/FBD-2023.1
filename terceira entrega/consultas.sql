--busca por categoria
SELECT produto.nome FROM produtos produto
JOIN categorias categoria ON
categoria.id = produto.categoria_id
where categoria.nome like 'Alimentos';

--produto e categoria
SELECT produto.nome, categoria.nome
FROM produtos produto
JOIN categorias categoria ON
categoria.id = produto.categoria_id;
