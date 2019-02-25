/* 3.- Función que acepta un año y devuelve el nombre del mejor cliente. El mejor
cliente es el que ha realizado pedidos por un mayor valor en dicho año. Se
supone que es único. */
USE compraventa;

DROP FUNCTION IF EXISTS fn_tres;

DELIMITER //

CREATE FUNCTION fn_tres(paño INT)
	RETURNS VARCHAR(40)
	BEGIN
		DECLARE vidcliente VARCHAR(5);
		SET vidcliente=(
			SELECT IdCliente FROM pedidos WHERE year(fechapedido)=paño
			GROUP BY idcliente ORDER BY sum(fn_uno(idpedido)) DESC LIMIT 1);
		RETURN (SELECT nombrecompañía FROM clientes WHERE idcliente=vidcliente);
	END//
    
SELECT fn_tres(1998) AS MejorCliente;