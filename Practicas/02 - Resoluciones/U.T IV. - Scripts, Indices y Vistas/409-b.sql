SELECT
	*
FROM
	Productos
USE INDEX (idx_idprov)
WHERE
	IdProveedor<>
		(SELECT IdProveedor FROM Proveedores WHERE NombreCompañía='Exotic Liquids');