SET @Numero=5;
SELECT
	NombreProducto, PrecioUnidad
FROM
	compraventa.Productos
WHERE
	PrecioUnidad < @Numero;