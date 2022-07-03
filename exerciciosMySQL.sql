-- EXERCÍCIO 1;

SELECT *
FROM item_ordem_compra
WHERE quantidade > 10;

-- *********************************************************************************
-- EXERCÍCIO 2

SELECT *
FROM item_ordem_compra
WHERE ioc.quantidade < 50;

-- *********************************************************************************
-- EXERCÍCIO 1 + EXERCÍCIO 2

SELECT *
FROM item_ordem_compra
WHERE quantidade > 10
AND valor < 50;

-- *********************************************************************************
-- EXERCÍCIO 3

SELECT ioc.idOrdemCompra, ioc.idMaterial, ioc.valor, ioc.quantidade, m.nome, f.nome
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as o
WHERE ioc.quantidade > 100
AND ioc.valor < 50
AND m.id = ioc.idMaterial
AND f.id = o.idFornecedor;

-- *********************************************************************************
-- EXERCÍCIO 4

SELECT ioc.idOrdemCompra, m.nome, f.nome, ioc.valor*ioc.quantidade as subTotal
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as oc
WHERE m.id = ioc.idMaterial
AND oc.id = ioc.idOrdemCompra
AND f.id = oc.idFornecedor
ORDER BY ioc.idOrdemCompra;

-- *********************************************************************************
-- EXERCÍCIO 5

SELECT oc.id as idOrdemCompra, f.nome as nomeFornecedor, SUM(quantidade*valor) as totalCompra
FROM item_ordem_compra as ioc, ordem_compra as oc, fornecedor as f
WHERE oc.id = ioc.idOrdemCompra
AND f.id = oc.idFornecedor
GROUP BY idOrdemCompra;

-- *********************************************************************************
-- EXERCÍCIO 6

SELECT f.nome, oc.data, SUM(valor*quantidade) as total
FROM ordem_compra as oc, item_ordem_compra as ioc, fornecedor as f
WHERE f.id = oc.idFornecedor
AND oc.id = ioc.idOrdemCompra
and oc.data BETWEEN '2022-05-15' AND '2022-05-20'
GROUP BY ioc.idOrdemCompra;