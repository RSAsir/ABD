/* 5.- Función que acepta el nombre de un producto y devuelve la fecha en que
fue pedido por última vez. */

USE compraventa;

DROP FUNCTION IF EXISTS fn_cinco;

DELIMITER //

CREATE FUNCTION fn_cinco(inombre VARCHAR (20))
RETURNS DATETIME
	BEGIN
		DECLARE vidproducto INT;
        SET vidproducto = (SELECT IdProducto FROM productos WHERE inombre = NombreProducto);
        
        RETURN (SELECT FechaPedido 
				FROM pedidos p JOIN detallesdepedidos dp ON (dp.IdPedido = p.IdPedido) 
				WHERE IdProducto = vidproducto 
				ORDER BY FechaPedido DESC LIMIT 1);
    END//
    
SELECT fn_cinco('Té Dharamsala') AS 'Ultima vez';