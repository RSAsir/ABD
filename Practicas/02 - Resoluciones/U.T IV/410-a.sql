DROP VIEW IF EXISTS VW_Condimentos;
CREATE VIEW VW_Condimentos(Nombre, Precio)
AS
	SELECT
		NombreProducto, PrecioUnidad
	FROM
		Productos
	WHERE
		Idcategoría = (SELECT IdCategoría FROM Categorias WHERE NombreCategoría = 'Condimentos');
