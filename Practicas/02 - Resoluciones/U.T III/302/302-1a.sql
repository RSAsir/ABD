SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE
	nombreproducto < 'c'
ORDER BY
	nombreproducto;
    
-- Version en negativo
SELECT
	nombreproducto, preciounidad
FROM
	compraventa.productos
WHERE NOT
	nombreproducto < 'c'
ORDER BY
	nombreproducto