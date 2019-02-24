use compraventa;
drop function if exists f_ValorPedido;

create function f_ValorPedido(id int)
	returns numeric(10,2)
    return (select sum((PrecioUnidad * Cantidad) * (1 - Descuento)) from detallesdepedidos where IdPedido = id);
    
select f_ValorPedido(10248) as 'Valor pedido';
    