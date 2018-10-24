SELECT
	NombreCompañía
FROM
	clientes
WHERE
	IdCliente NOT IN (SELECT idcliente FROM pedidos)