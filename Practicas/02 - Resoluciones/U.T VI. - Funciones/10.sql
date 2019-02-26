/* 10.- Función que acepta un mes y un año y devuelve el nombre del producto
“estrella”, es decir, aquél producto del que se pidieron más unidades en dicho
mes de dicho año. Se supone que el producto estrella es único. Considerar
como fecha FechaPedido. */

USE compraventa;

DROP VIEW IF EXISTS vw_fn_diez;

CREATE VIEW vw_fn_diez AS
	SELECT IdProducto, sum(Cantidad) AS 'Cantidad', month(FechaPedido) AS 'Mes', year(FechaPedido) AS 'Año'
    FROM detallesdepedidos dp JOIN pedidos p ON (dp.IdPedido = p.Idpedido)
    GROUP BY IdProducto, Mes, Año
    ORDER BY Año, Mes, Cantidad DESC;
    
SELECT * FROM vw_fn_diez;

DROP FUNCTION IF EXISTS fn_diez;

DELIMITER //

CREATE FUNCTION fn_diez(iaño INT, imes INT)
RETURNS VARCHAR (40)
	BEGIN
		DECLARE vidproducto INT;
        
        SET vidproducto = (SELECT IdProducto FROM vw_fn_diez WHERE iaño = Año AND imes = Mes LIMIT 1);
        RETURN (SELECT NombreProducto FROM productos WHERE IdProducto = vidproducto);
        
    END//
    
DELIMITER ;

SELECT fn_diez(1996,7); -- cerveza tibetana barle
SELECT fn_diez(1997,3); -- raclet de queso....

/* DETALLES

	- No confundir el tipo de datos de entrada.
    - Por algun motivo el SET falla al hacer un una SELECT de una vista (la resolucion del ejercico es correcta).
    
*/

