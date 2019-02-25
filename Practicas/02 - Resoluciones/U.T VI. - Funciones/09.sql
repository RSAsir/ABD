/* 9.- Función que recibe el nombre de una categoría y el de un proveedor
(NombreCompañía) y devuelve cuántos productos distintos de la categoría son
provistos por el proveedor. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_nueve;

DELIMITER //

CREATE FUNCTION fn_nueve(inomca VARCHAR(20), inomco VARCHAR(40))
RETURNS INT
	BEGIN
		DECLARE vidcategoria, vidpro INT;
        
        SET vidcategoria = (SELECT IdCategoría FROM categorias WHERE NombreCategoría = inomca);
        SET vidpro = (SELECT IdProveedor FROM proveedores WHERE inomco = NombreCompañía);
        
        RETURN (SELECT count(*) FROM productos WHERE vidcategoria = IdCategoría AND vidpro = IdProveedor);
        
    END //

-- Comprobacion

SELECT fn_nueve('Bebidas', 'Exotic Liquids'); -- 2

/* DETALLES

	- Tener mucho cuidado con los nombres de las variables confusos, vidpro puede interpretarse como IdProducto
	y dar lugar a errores mas adelante.
    
    - Si las variables a declarar comparten el mismo tipo de dato pueden declararse juntas.
    
*/