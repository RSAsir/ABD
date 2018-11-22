-- Base de datos a usar y comprovacion de existencia
USE Compraventa;
DROP PROCEDURE IF EXISTS SP_ProductosCategoria;

-- Procedimiento
CREATE PROCEDURE SP_ProductosCategoria (Categoria VARCHAR(20))
	SELECT NombreProducto FROM Productos WHERE IdCategoría = (SELECT IdCategoría FROM Categorias WHERE NombreCategoría = Categoria);
    
-- Llamada
CALL SP_ProductosCategoria('Carnes');