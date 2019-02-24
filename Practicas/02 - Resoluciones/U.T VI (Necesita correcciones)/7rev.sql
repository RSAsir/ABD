drop funcion if exists ej7;
delimiter //
create function ej7(pfecha1 date, pfecha2 date papellido varchar(20))
	returns varchar(30)
    begin
    declare vaux date;
    declare vidempleado int; declare valor decimal(8,2);
    if(pfecha1>pfecha2)
    then
    begin
    set vaux:=pfecha1; set fecha1:=pfecha2;set pfecha2:=vaux;
    end;
    end if;
    set vidempleado=(select idempleado from empleados where apellido=papellido);
    set valor:=(select sum(ej1(idpedido)) from pedidos
				whee idempleado=vidempleado and fechapedido between pfecha1 and pfecha2);
	if(valor is null)
    then return 'Ningun pedido';
    else return valor;
    end if;
end//

delimiter ;

select ej7('1997-01-01','1998-01-01','Davolio'); -- 93148.11
select ej7('1999-01-01','1999-01-01','Davolio'); -- Ningun pedido
