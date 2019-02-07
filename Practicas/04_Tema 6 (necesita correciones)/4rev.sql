drop function if exists ej4;
delimiter //
create function ej4(pmes int,paño int)
	returns varchar(10)
    begin
    declare vidempleado int;
    set vidempleado:=(
		select idempleado from pedidos
			where month(fechapedido)=pmes and year(fechapedido)=paño
            group by idempleado order by sum(ej1(idpedido)) desc limit 1);
		return (select nombre from empleados where idempleado=vidempleado);
	end//
    
delimiter ;

select ej4(5,1998) as MejorEmpleado;
select ej4(8,1997) as MejorEmpleado;