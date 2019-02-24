use compraventa;
drop view if exists vw_valorpedido_cliente;
create view vw_valorpedido_cliente
as
	select (select idcliente from pedidos where idpedido = dp.idpedido) as 'IdCliente',(select year(fechapedido) from pedidos where idpedido = dp.idpedido) as 'Ano', (select sum((PrecioUnidad * Cantidad) * (1 - Descuento))) as 'valorpedido'
	from detallesdepedidos dp
	group by idpedido;
    
drop view if exists vw_valorpedido_anos;
create view vw_valorpedido_anos
as
select (Select NombreCompañía from Clientes where idcliente = vc.idcliente) as cliente,sum(ValorPedido) as valorpedido, ano
from vw_valorpedido_cliente vc
group by IdCliente
order by sum(ValorPedido) desc;
    
drop function if exists f_MejorCliente;
create function f_MejorCliente(anoo int)
	returns varchar(40)
    return (select cliente
	from vw_valorpedido_anos
    where Ano = anoo
    order by valorpedido desc
    );
    
select f_MejorCliente(1998) as 'Nombre';
    