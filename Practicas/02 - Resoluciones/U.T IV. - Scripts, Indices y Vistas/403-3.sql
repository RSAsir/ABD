SET @cantidad = 10, @descuento = 0.15;
SELECT
	(SELECT NombreProducto FROM Productos p WHERE p.IdProducto = d.Idproducto) AS NombreProducto, Cantidad, Descuento
FROM
	DetallesDePedidos d
WHERE
	Cantidad > @cantidad AND Descuento > @descuento;