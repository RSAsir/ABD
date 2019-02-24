SELECT
	idpedido, FechaEnvío
FROM
	compraventa.pedidos
WHERE
	fechaenvío IS NULL;
    

-- Version en negativo
SELECT
	idpedido, FechaEnvío
FROM
	compraventa.pedidos
WHERE
	fechaenvío IS NOT NULL;