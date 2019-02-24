use compraventa;

drop view if exists vw_portesaño;
create view vw_portesaño as
	select (select nombrecompañía from companiasdeenvios ce where ce.IdCompañíaEnvíos=dp.IdCompañíaEnvíos) as nombre, count(portes) as portes, year(fechapedido) as año
    from pedidos dp
    group by año, nombre
    order by año, portes desc;
    
drop function if exists portesaño;
create function portesaño(paño int)
	returns varchar(40)
    return (select Nombre from vw_portesaño where paño=año limit 1);
    
select portesaño(1997) as 'compañia estrella'; -- united
select portesaño(1996) as 'compañia estrella'; -- federal