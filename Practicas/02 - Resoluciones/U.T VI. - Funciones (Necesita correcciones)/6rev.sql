drop function if exists ej6;
delimiter //
create function ej6(pnombre varchar(10))
	returns date
    begin
    declare vidempleado int;
    set vidempleado=(select idempleado from empleados where nombre=pnombre);
    return(select fechapedido from pedidos
		where idempleado=vidempleado group by fechapedido
        order by sum(ej1(idpedido)) desc limit 1);
        
	end//
    
delimiter ;
select ej6('nancy');