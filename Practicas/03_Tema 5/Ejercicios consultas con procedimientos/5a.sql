-- Base de datos a usar y comprovacion de existencia
USE compraventa;
DROP VIEW IF EXISTS VW_Productos;


CREATE VIEW VW_Productos AS
	SELECT nombrecategoría, nombreproducto, preciounidad
    FROM productos p JOIN categorias c ON (p.idcategoría = c.idcategoría)
	ORDER BY nombrecategoría, precioUnidad DESC;
    
DROP PROCEDURE IF EXISTS SP_ProductoMasCaro;

-- Procedimiento
CREATE PROCEDURE SP_ProductoMasCaro (categoria VARCHAR(20))
	SELECT nombreproducto FROM VW_Productos WHERE nombrecategoría = categoria LIMIT 1;
    
-- Llamada
CALL SP_ProductoMasCaro('Carnes');