-- Base de datos a usar y comprovacion de existencia
USE Compraventa;
DROP PROCEDURE IF EXISTS SP_NombreProductosSegunPrecio;

-- Procedimiento
CREATE PROCEDURE SP_NombreProductosSegunPrecio (Precio Decimal(14,2)) -- Es importante usar el tipo de datos de la columna original, esto puede verse desde la pestaña de tablas.
	SELECT NombreProducto, PrecioUnidad FROM Productos WHERE PrecioUnidad < Precio;
   
-- Llamada
CALL SP_NombreProductosSegunPrecio(5.2)