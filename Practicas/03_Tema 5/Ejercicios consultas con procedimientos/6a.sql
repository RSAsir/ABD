-- Base de datos a usar y comprovacion de existencia
USE compraventa;
DROP VIEW IF EXISTS VW_Productos;


CREATE VIEW VW_Productos AS
	SELECT NombreCategoría, nombreproducto, PrecioUnidad
    FROM productos p JOIN categorias c ON (p.idcategoría = c.idcategoría)
	ORDER BY nombrecategoría, PrecioUnidad DESC;

DROP PROCEDURE IF EXISTS SP_ProductoMasCaro;

-- Procedimiento
DELIMITER //
CREATE PROCEDURE SP_ProductoMasCaro (Categoria VARCHAR(20))
	BEGIN
		-- IF (Categoria NOT IN(Nombrecategoría from categorías))
		IF EXISTS(SELECT * FROM VW_Productos WHERE NombreCategoría = Categoria) THEN
			SELECT NombreProducto AS Producto FROM VW_Productos WHERE NombreCategoría = Categoria LIMIT 1;
		ELSE
			SELECT 'La categoria no existe' AS Producto;
		END IF;
	END//
		
    
    
    
-- Llamada
CALL SP_ProductoMasCaro('Carnes');
CALL SP_ProductoMasCaro('Cares');