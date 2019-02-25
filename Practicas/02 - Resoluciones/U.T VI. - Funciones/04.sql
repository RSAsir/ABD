/* 4.- Función que acepta un mes y un año y visualiza el nombre del mejor
vendedor en dicho mes de dicho año. Se supone que es único. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_cuatro;

DELIMITER //

CREATE FUNCTION fn_cuatro(imes INT,iaño INT)
RETURNS VARCHAR (10)
	BEGIN
		DECLARE vidempleado INT;
		SET vidempleado = (SELECT idempleado 
							FROM pedidos 
							WHERE month(Fechapedido) = imes and year(FechaPedido) = iaño 
							GROUP BY IdEmpleado ORDER BY sum(fn_uno(idpedido)) DESC LIMIT 1);
		RETURN (SELECT Nombre FROM empleados WHERE vidempleado = IdEmpleado);
    END//
    
SELECT fn_cuatro(5,1998) as MejorEmpleado;