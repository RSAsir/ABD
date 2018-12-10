SET @comercial= 'Agente de ventas', @marketing='Asistente de marketing';

SELECT
	NombreCompañía,
	(SELECT CASE (SELECT CargoContacto) 
		WHEN @comercial THEN 'Comercial' 
		WHEN @marketing THEN 'Asistente comercial'
		ELSE (SELECT CargoContacto)
		END) AS NuevoCargoContacto,
	CargoContacto AS AntiguoCargoContacto
FROM
	Clientes;
    
    
    
    
SELECT
	NombreCompañía,
	CASE cargocontacto
		WHEN @comercial THEN 'Comercial' 
		WHEN @marketing THEN 'Asistente comercial'
		ELSE CargoContacto
		END AS NuevoCargoContacto,
	CargoContacto AS AntiguoCargoContacto
FROM
	Clientes;

