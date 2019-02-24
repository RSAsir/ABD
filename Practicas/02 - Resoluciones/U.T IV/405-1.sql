SET @comercial= 'Agente de ventas', @marketing='Asistente de marketing';

SELECT
	NombreCompañía,
	if(cargocontacto=@comercial,'Comercial', if(cargocontacto = @marketing,'Asistente Comercial',cargocontacto)) AS NuevoCargoContacto,
	CargoContacto AS AntiguoCargoContacto
FROM
	clientes;

