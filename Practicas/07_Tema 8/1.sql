USE modifcompraventa;

-- DROP TABLE IF EXISTS CambioPrecios;
CREATE TABLE CambioPrecios (
	NombreProducto VARCHAR(50),
    PrecioAnterior DECIMAL(14,4),
    PrecioActual DECIMAL(14,4)
);

DROP TRIGGER IF EXISTS TG_CambioPrecios;

DELIMITER //

CREATE TRIGGER TG_CambioPrecios AFTER UPDATE 
ON Productos FOR EACH ROW 
	BEGIN
		IF new.preciounidad<>old.preciounidad
			THEN
			INSERT INTO CambioPrecios
			VALUES(new.nombreproducto,old.preciounidad,new.preciounidad);
		END IF;
	END//

-- Comprobacion        
DELIMITER ;

UPDATE Productos
SET preciounidad=preciounidad*1.1
WHERE idproducto<=5;

