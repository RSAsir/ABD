/* 7.- Función que acepta dos fechas y el apellido de un empleado y devuelve el
valor total de los pedidos (con descuentos y sin portes) conseguidos por el
empleado desde la fecha menor hasta la mayor, ambas inclusive. Las
fechas deben poder teclearse en cualquier orden. Si no ha conseguido
ningún pedido en dichas fechas deberá emitir el mensaje correspondiente.
Debéis utilizar la función creada en el ejercicio 1. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_siete;

DELIMITER //

CREATE FUNCTION fn_siete(ifecha1 DATE, ifecha2 DATE, iapellido VARCHAR(20))
RETURNS VARCHAR (40)
	BEGIN
		DECLARE vidapellido INT;
        DECLARE valor DECIMAL(10,2);
        DECLARE ifecha3 DATE;
        
        IF (ifecha1 > ifecha2)
        THEN
			SET ifecha1 = ifecha3;SET ifecha1 = ifecha2;SET ifecha2 = ifecha3;
		END IF;
        
        SET vidapellido = (SELECT IdEmpleado FROM empleados WHERE iapellido = apellido);
        SET valor = (SELECT sum(fn_uno(IdPedido)) 
					 FROM pedidos 
					 WHERE FechaPedido BETWEEN ifecha1 AND ifecha2 AND vidapellido = IdEmpleado);
        
		IF valor IS NULL
		THEN
			RETURN 'Ningun pedido.';
		ELSE
			RETURN valor;
		END IF;
    END//
    
DELIMITER ;
    
SELECT fn_siete('1997-01-01','1998-01-01','Davolio');-- 93148.11
SELECT fn_siete('1999-01-01','1999-01-01','Davolio'); -- No hay pedido.

/* DETALLES

	- Resolver siempre las ordenaciones primero.
    - DATE es el formato para solo fecha NO confundir con DATETIME.
    - En los RETURN si solo se devuelve texto, no es necesario indicar el SELECT.
    - Para preguntar por NULL en los IF usar IS.
    
*/