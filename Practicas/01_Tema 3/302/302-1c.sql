SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE
	nombreproducto BETWEEN 'a' AND 'c'
ORDER BY
	nombreproducto
    
    
-- Version en negativo
SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE
	nombreproducto NOT BETWEEN 'a' AND 'c'
ORDER BY
	nombreproducto