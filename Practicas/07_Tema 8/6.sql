USE modifcompraventa;

DROP TRIGGER IF EXISTS tg_modificacion_detalle_pedido;

DELIMITER //

CREATE TRIGGER tg_modificacion_detalle_pedido BEFORE INSERT
ON DetallesDePedidos FOR EACH ROW
	BEGIN
		-- Guardamos unidades en existencia en una variable
        DECLARE udexistencia INT;
		SET udexistencia = (SELECT unidadesenexistencia FROM productos where new.idproducto = idproducto);
    
		-- Apartado a
		IF new.cantidad > udexistencia
			THEN
				BEGIN
					SET new.cantidad = udexistencia;
					UPDATE productos set unidadesenexistencia = 0  where new.idproducto = idproducto;
				END;
			ELSE
				UPDATE productos set unidadesenexistencia = udexistencia - new.cantidad;
		END IF;
        
        -- Apartado b
        SET new.preciounidad = (SELECT preciounidad FROM productos where new.idproducto = idproducto);
        
        -- Apartado c
        IF new.preciounidad * new.cantidad >= 500
			THEN
				SET new.descuento = 0.10;
		ELSEIF new.preciounidad * new.cantidad < 500 and new.preciounidad * new.cantidad > 100
			THEN
				SET new.descuento = 0.05;
		ELSEIF new.preciounidad * new.cantidad < 100
			THEN
				SET new.descuento = 0;
		END IF;
	END//
    
    DELIMITER ;
    
    
    