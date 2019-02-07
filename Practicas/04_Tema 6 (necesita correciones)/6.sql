use compraventa;

drop view if exists valorpedidos_empleados;
create view valorpedidos_empleados as
select p.idpedido, (select nombre from empleados e where e.idempleado=p.idempleado) as empleado, fechapedido, sum(preciounidad*cantidad) as valorpedido
from pedidos p join detallesdepedidos dp on (p.idpedido=dp.idpedido)
group by idpedido;

drop function if exists diamejorpedido;
create function diamejorpedido(nombre varchar(20))
	returns date
    return (select fechapedido from valorpedidos_empleados where nombre=empleado order by valorpedido desc limit 1);

select diamejorpedido('nancy') as mejorpedido

