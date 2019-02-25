-- 2.- Idem el valor con portes. Debéis utilizar la función creada en el ejercicio 1.

USE compraventa;

DROP FUNCTION IF EXISTS fn_dos;

DELIMITER //

CREATE FUNCTION fn_dos(numpe INT)
RETURNS NUMERIC(10,2)
	BEGIN
		DECLARE portes INT;
		SET portes = (SELECT Portes FROM pedidos WHERE IdPedido = numpe);
		-- SET @valpecon = (SELECT SUM(@portes + fn_uno(numpe)));
		RETURN (SELECT SUM(@portes + fn_uno(numpe)));
	END//
    
SELECT fn_dos(10248) AS 'Con portes';