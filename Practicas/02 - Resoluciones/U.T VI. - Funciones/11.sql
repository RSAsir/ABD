/* 11.- Función que acepta un año y devuelve el nombre de la compañía de
envíos que más portes hizo en ese año (se supone que es única). */

USE compraventa;

DROP FUNCTION IF EXISTS fn_once;

DELIMITER //

CREATE FUNCTION fn_once(iaño INT)
RETURNS VARCHAR(40)
	BEGIN
		DECLARE vidcompaenvios INT;
        
        SET vidcompaenvios = (SELECT IdCompañíaEnvíos
						FROM pedidos 
						WHERE iaño = year(FechaPedido)
                        GROUP BY IdCompañíaEnvíos
						ORDER BY count(Portes) DESC LIMIT 1);
                        
		RETURN (SELECT NombreCompañía FROM companiasdeenvios WHERE IdCompañíaEnvíos = vidcompaenvios);
    END//

DELIMITER ;

SELECT fn_once(1996); -- federal
SELECT fn_once(1997); -- united

/* DETALLES

	- No olvidar la sentencia GROUP BY cuando se realice una ordenacion.
    - Fijarse bien en el codigo para no crear estructuras redundantes que puedan causar errores.
    - Cuando no se tienen los resultados, es buena idea ir probando las sentencias con valores predeterminados e ir fijandose en los resultados.
    
*/