/* Ejercicio 1.
Crear una tabla llamada CambioPrecios con los siguientes campos:

			NombreProducto varchar(50)
			PrecioAnterior decimal(14,4)
			PrecioActual decimal(14,4)
    
	Crear un trigger que, cada vez que se modifique el precio de un
producto, inserte una fila en CambioPrecios con los datos correspondientes al
producto modificado.
	El trigger no debe hacer nada cuando se modifique cualquier otro campo
de la tabla Productos.

*/

USE modifcompraventa;

-- Creacion de la tabla

DROP TABLE IF EXISTS cambioprecios;

CREATE TABLE cambioprecios (
	NombreProducto VARCHAR(50),
    PrecioAnterior DECIMAL(14,4),
    PrecioActual DECIMAL(14,4));
    
-- Creacion del trigger
    
DROP TRIGGER IF EXISTS tr_uno;

DELIMITER //

CREATE TRIGGER tr_uno AFTER UPDATE
ON productos FOR EACH ROW
	BEGIN
		IF new.PrecioUnidad != old.PrecioUnidad
		THEN
			INSERT INTO cambioprecios VALUES (old.NombreProducto, old.PrecioUnidad, new.PrecioUnidad);
        END IF;
    END//
	
DELIMITER ;

-- Comprobacion
    
UPDATE productos
SET preciounidad=preciounidad*1.1
WHERE idproducto<=5;

SELECT * FROM cambioprecios;

/* DETALLES

	- Recordar el uso de IF para controlar el momento concreto en el que activa el disparador.
    - Los valores a insertar siempre necesitan llevar old o new.
    
*/
