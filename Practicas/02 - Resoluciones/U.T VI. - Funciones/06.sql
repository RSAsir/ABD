/* 6.- Función que acepta el nombre de un vendedor y devuelve la fecha del día
en que consiguió pedidos por un mayor valor. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_seis;

DELIMITER //

CREATE FUNCTION fn_seis(iname VARCHAR (10))
RETURNS DATETIME
	BEGIN
		DECLARE vidempleado INT;
        SET vidempleado = (SELECT IdEmpleado FROM empleados WHERE Nombre = iname);
        
        RETURN (SELECT FechaPedido
				FROM pedidos
				WHERE IdEmpleado = vidempleado
                GROUP BY FechaPedido -- No es necesario añadir el IdEmpleado porque ya se a filtrado en la WHERE
                ORDER BY sum(fn_uno(idpedido)) DESC
                LIMIT 1);
    END//
    
SELECT fn_seis('Nancy') AS 'Mayor valor';

/* DETALLES

	- Siempre es buena idea sacar una variable del valor que nos va a servir para movernos entre tablas.
    - No olvidar el DESC
*/