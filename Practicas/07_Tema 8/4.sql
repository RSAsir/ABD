USE modifcompraventa;

DROP TRIGGER IF EXISTS tg_ProductoNulo;

DELIMITER //

CREATE TRIGGER tg_ProductoNulo BEFORE INSERT
ON Productos FOR EACH ROW
	BEGIN
		IF new.NombreProducto IN (select NombreProducto from productos)
		THEN
			SET new.NombreProducto=NULL;
		END IF;
	END//
    
insert into Productos(idproducto,nombreproducto) values (200,'Sirope de regaliz');
    