USE modifcompraventa;

DROP TRIGGER IF EXISTS tg_AltaPedido

DELIMITER //

CREATE TRIGGER tg_AltaPedido BEFORE INSERT
ON Pedidos FOR EACH ROW
	BEGIN
		SET new.Destinatario=(SELECT nombrecompañía from clientes where idcliente=new.idcliente);
        SET new.DirecciónDestinatario=(SELECT Dirección from clientes where idcliente=new.idcliente);
        SET new.CiudadDestinatario=(SELECT Ciudad from clientes where idcliente=new.idcliente);
        SET new.RegiónDestinatario=(SELECT Región from clientes where idcliente=new.idcliente);
        SET new.CodPostalDestinatario=(SELECT CódPostal from clientes where idcliente=new.idcliente);
        SET new.PaísDestinatario=(SELECT País from clientes where idcliente=new.idcliente);
	END//
    
-- LA REGION ES NULL
insert into pedidos(idcliente,idempleado) values('ALFKI',3);