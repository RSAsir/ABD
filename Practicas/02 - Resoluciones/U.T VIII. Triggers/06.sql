/* Ejercicio 6.- Trigger que, al dar de alta un detalle de pedido haga lo siguiente:

	a) Disminuya las unidades en existencia del producto en la cantidad pedida.
		Si la cantidad pedida es mayor que las existencias deberá cambiar el valor de
		la cantidad por las existencias y dejar éstas a 0.
		(ej, Si las existencias de un producto son 20 y la cantidad pedida 30, deberá
		dejar las existencias a 0 y almacenar un 20 en la cantidad pedida.)
        
	b) Almacene el precio unitario del producto en el precio unitario de la fila
		insertada.
        
	c) Si Preciounidad * Cantidad es mayor o igual a 500, almacene el valor 0.10
		en Descuento; si es menor que 500 pero mayor o igual a 100, el 0.05 y si
		es menor que 100 el 0. */
        
USE modifcompraventa;

DROP TRIGGER IF EXISTS tr_seis;

DELIMITER //

CREATE TRIGGER tr_seis BEFORE INSERT
ON detallesdepedidos FOR EACH ROW
	BEGIN
    
		-- a)
			DECLARE UdExistencia INT;
			SET UdExistencia = (SELECT UnidadesEnExistencia FROM productos WHERE new.IdProducto = IdProducto);
        
			IF UdExistencia - new.Cantidad > 0
			THEN
				UPDATE productos
                SET UnidadesEnExistencia = UnidadesEnExistencia - new.Cantidad
                WHERE IdProducto = new.IdProducto;
			ELSE
				SET new.Cantidad = UdExistencia;
				UPDATE productos
                SET UnidadesEnExistencia = 0
                WHERE IdProducto = new.IdProducto;
			END IF;
            
		-- b)
			SET new.PrecioUnidad = (SELECT PrecioUnidad FROM productos WHERE IdProducto = new.IdProducto);
         
         -- c)
			IF new.PrecioUnidad * new.Cantidad >= 500
            THEN
				SET new.Descuento = 0.10;
			ELSEIF new.PrecioUnidad * new.Cantidad < 500 AND PrecioUnidad >= 100
            THEN
				SET new.Descuento = 0.05;
			ELSEIF new.PrecioUnidad * new.Cantidad < 100
            THEN
				SET new.Descuento = 0;
			END IF;
    END//
    
DELIMITER ;

/* DETALLES
	
    - Las variables siempre hacen todo mas facil.
    - Cuidado con el momento de disparo del trigger.
    - No olvidar colocar el "new.".
    
*/
