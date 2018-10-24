SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE
	nombreproducto LIKE 'a%' OR nombreproducto LIKE 'b%'
ORDER BY
	nombreproducto;
    
    
-- Version en negativo
SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE 
	nombreproducto NOT LIKE 'a%' AND nombreproducto NOT LIKE 'b%'
ORDER BY
	nombreproducto
