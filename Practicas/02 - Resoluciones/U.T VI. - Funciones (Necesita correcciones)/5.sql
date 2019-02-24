use compraventa;

drop view if exists fecha_productos;
create view fecha_productos as
	select (select nombreproducto from productos pro where pro.idproducto=dp.idproducto) as nombre, fechapedido
	from detallesdepedidos dp join pedidos p on (p.idpedido=dp.idpedido)
    order by fechapedido desc;

drop function if exists ultima_vez;
create function ultima_vez(pnombre varchar(20))
	returns date
	return (select FechaPedido from fecha_productos where pnombre=nombre limit 1);
    
select ultima_vez('Té Dharamsala') as 'Ultima vez';