/* Ejercicio 4.- Crear un trigger asociado a la tabla PRODUCTOS para evitar que haya dos productos con el  mismo nombre.
Para ello, si al dar de alta un producto su nombre coincide con otro ya existente deberá poner ese campo a null. */

USE modifcompraventa;

-- Creacion del trigger

DROP TRIGGER IF EXISTS tr_cuatro;

DELIMITER //

CREATE TRIGGER tr_cuatro BEFORE INSERT
ON productos FOR EACH ROW
	BEGIN
		IF new.NombreProducto = (SELECT NombreProducto FROM productos WHERE NombreProducto = new.NombreProducto)
		THEN
			SET New.NombreProducto = NULL;
		END IF;
	END//
    
DELIMITER ;

-- Comprobacion

DELETE FROM productos WHERE IdProducto = 80;    
    
INSERT INTO productos (IdProducto, NombreProducto)
VALUES (80, 'Té Dharamsala');

SELECT * FROM productos WHERE IdProducto = 80;
    
/* DETALLES

	- En el IF no se puede utilizar old.NombreProducto porque no existe ese valor como tal.

*/