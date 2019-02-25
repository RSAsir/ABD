/* Ejercicio 3.
Trigger que, cada vez que se de de alta un nuevo pedido, almacene en los
campos correspondientes al destinatario los datos del cliente que efectúa el
pedido.
*/

USE modifcompraventa;

-- Creacion del trigger

DROP TRIGGER IF EXISTS tr_tres;

DELIMITER //

CREATE TRIGGER tr_tres BEFORE INSERT 
ON pedidos FOR EACH ROW
	BEGIN
		SET new.Destinatario = (SELECT NombreCompañía FROM clientes WHERE IdCliente = new.idcliente);
		SET new.DirecciónDestinatario = (SELECT Dirección FROM clientes WHERE IdCliente = new.idcliente);
		SET new.CiudadDestinatario = (SELECT Ciudad FROM clientes WHERE IdCliente = new.idcliente);
		SET new.RegiónDestinatario = (SELECT Región FROM clientes WHERE IdCliente = new.idcliente);
		SET new.CodPostalDestinatario = (SELECT CódPostal FROM clientes WHERE IdCliente = new.idcliente);
		SET new.PaísDestinatario = (SELECT País FROM clientes WHERE IdCliente = new.idcliente);
    END //
    
DELIMITER ;

-- Comprobacion

DELETE FROM pedidos WHERE IdPedido = 66666;
    
INSERT INTO pedidos (Idpedido,IdCliente) 
VALUES (66666, 'ALFKI');

SELECT * FROM pedidos WHERE IdPedido = 66666;

/* DETALLES

	- Actualizar un valor "new." solo se puede hacer usando BEFORE.

*/