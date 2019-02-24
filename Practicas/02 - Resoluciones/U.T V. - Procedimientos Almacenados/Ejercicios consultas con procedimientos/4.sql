USE compraventa;
DROP PROCEDURE IF EXISTS sp_valortotalpedido;

CREATE PROCEDURE sp_valortotalpedido(id INT)
	SELECT Idpedido, Sum((preciounidad * cantidad)) AS 'Sin descuento', 
    Sum(((preciounidad * cantidad)) * (1-Descuento)) AS 'Con descuento' -- Para calcular el descuento obviando el 0, restamos el valor de la tabla descuento a 1.
    FROM detallesdepedidos
    WHERE IdPedido = id;
    
CALL sp_valortotalpedido(10250);
