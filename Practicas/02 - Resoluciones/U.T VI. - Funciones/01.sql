/* 1.- Función que acepte el identificador de un pedido y devuelva el valor del
pedido sin portes. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_uno;

DELIMITER //

CREATE FUNCTION fn_uno(numpe INT)
RETURNS NUMERIC(10,2)
	BEGIN
		DECLARE valpesin INT;
		SET valpesin = (SELECT SUM((PrecioUnidad * Cantidad) * (1 - Descuento)) FROM detallesdepedidos WHERE IdPedido = numpe);
		RETURN valpesin;
	END//
    
SELECT fn_uno(10248) AS 'Sin portes';

/* DETALLES

	- RETURN puede devolver una sentencia SELECT, simplificando el codigo.
	- Hay que tener en cuenta el tipo de valor que te van a devolver (Decimales).
	- Las variables locales son las que se declaran con @ y sirven para toda la sesion (las usadas con DECLARE solo tienen valor en la funcion).
*/