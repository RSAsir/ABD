SELECT
	*
FROM
	Productos
IGNORE INDEX(idx_idcat)
WHERE
	IdCategoría= 
		(SELECT IdCategoría FROM Categorias WHERE NombreCategoría='Carnes');