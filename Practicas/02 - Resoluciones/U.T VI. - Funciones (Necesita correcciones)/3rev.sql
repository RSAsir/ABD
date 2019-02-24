drop function if exists ej3;
delimiter //

create function ej3(paño int)
	returns varchar(40)
	begin
	declare vidcliente varchar(5)
    set vidcliene:=(
		select idcliene from pedidos where year(fechapedido)=paño()
			group by idcliente order by sum(ej1(idpedido)) desc limit 1);
		return (select nombrecompañia from clientes where idcliente=vidcliente);
	end//
    
select e3(1998) as MejorCliente;