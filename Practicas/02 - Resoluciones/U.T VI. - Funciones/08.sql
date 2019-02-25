/* 8.- Función que acepta una fecha en formato MySQL y la devuelve en formato
dd/mm/aaaa. */

DROP FUNCTION IF EXISTS fn_ocho;

CREATE FUNCTION fn_ocho(ifecha DATE)
RETURNS VARCHAR(10)
	RETURN (SELECT date_format(ifecha,'%d/%c/%Y'));
    -- RETURN concat(day(ifecha), '/',month(ifecha),'/',year(ifecha));

SELECT fn_ocho('1993/12/13') AS Fecha;

/* DETALLES
	
	- Si usamos DATE en el RETURNS dara error, ya que lo que devolvemos no cumple las reglas
    del tipo de dato.
    
*/