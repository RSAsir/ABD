use compraventa;

drop view if exists vercicio10;
create view vejercicio10 as
	select year(fechapedido) as año, month(fechapedido) as mes, idproducto, sum(cantidad) as unidades
    from pedidos p join detallesdepedidos dp on p.idpedido=dp.IdPedido
    group by año, mes, IdProducto
    order by año, mes, unidades desc;
    
    drop function if exists ejercicio10;
    create function ejercicio10(paño int,pmes int)
		returns varchar(50)
        return (select nombreproducto from productos where idproducto=(select idproducto from vejercicio10 where año=paño and mes=pmes limit 1));
        
	select ejercicio10(1996,7); -- cerveza tibetana barle
    select ejercicio10(1997,3); -- raclet de queso....
    