DROP VIEW IF EXISTS VW_Condimentos;
CREATE VIEW VW_Condimentos(Nombre, Precio)
AS
	SELECT
		NombreProducto, PrecioUnidad
	FROM
		Productos p JOIN Categorias c ON (p.IdCategoría = c.IdCategoría)
	WHERE
		NombreCategoría='Condimentos'
        