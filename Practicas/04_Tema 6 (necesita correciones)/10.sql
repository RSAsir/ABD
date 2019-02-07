use compraventa;

drop view if exists cantidadporfecha;
create view cantidadporfecha as
	select (select nombreproducto from productos p where p.idproducto=dp.idproducto) as nombre, sum(cantidad) as cantidad, (select fechapedido from pedidos pe where dp.idpedido=pe.idpedido) as fecha, year((select fechapedido from pedidos pe where dp.idpedido=pe.idpedido)) as año, month((select fechapedido from pedidos pe where dp.idpedido=pe.idpedido)) as mes
	from detallesdepedidos dp
	group by año,mes, nombre
    order by año,mes, cantidad desc;
 
drop function if exists producto_estrella;
create function producto_estrella(pmes int, paño int)
	returns varchar(40)
    return (select Nombre from cantidadporfecha where pmes=mes and paño=año limit 1);
    
select producto_estrella(3,1997) as 'producto estrella';