/* Ejercicio 8.- Trigger que, si se pretende dar de alta a un producto con un id de
proveedor no existente, de previamente de alta a dicho proveedor (con el id
indicado y el resto de campos a null). */

USE modifcompraventa;

DROP TRIGGER IF EXISTS tr_ocho;

DELIMITER //

CREATE TRIGGER tr_ocho BEFORE INSERT
ON productos FOR EACH ROW
	BEGIN
		IF new.IdProveedor NOT IN (SELECT IdProveedor FROM proveedores)
        THEN
			INSERT INTO proveedores (IdProveedor) VALUES (new.IdProveedor);
		END IF;
    END//
	
DELIMITER ;

INSERT INTO productos (IdProducto, NombreProducto, IdProveedor)
VALUES (666, 'Meguka', 613);
