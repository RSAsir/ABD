select * from pedidos;
select * from detallesdepedidos;
select p.idpedido, idproducto, preciounidad, cantidad,(select nombre from empleados e where e.idempleado=p.idempleado) as Nombre, year(FechaPedido), month(fechapedido)
from detallesdepedidos dp join pedidos p on (p.idpedido=dp.idpedido)
