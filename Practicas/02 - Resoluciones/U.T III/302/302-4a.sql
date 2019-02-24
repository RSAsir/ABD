SELECT
	nombrecompañía
FROM
	compraventa.clientes c
WHERE NOT EXISTS
	(SELECT * FROM pedidos p WHERE p.IdCliente = c.idcliente)