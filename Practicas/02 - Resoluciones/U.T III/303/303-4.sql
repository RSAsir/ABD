SELECT
	LEFT(NombreProducto, 15),
    ROUND(PrecioUnidad, 2)
FROM
	compraventa.productos