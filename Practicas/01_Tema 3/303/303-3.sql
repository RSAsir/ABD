SELECT 
	IdPedido,
    DATEDIFF(FechaEntrega, FechaEnvío) AS 'Dias transcurridos'
FROM
	compraventa.pedidos