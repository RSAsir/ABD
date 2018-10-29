SELECT 
	UPPER(Nombre) AS Nombre, 
    UPPER(Apellido) AS Apellido, 
    DATE_FORMAT(FechaContratación, '%d-%m-%y') AS FechaContratacion
FROM
	compraventa.pedidos