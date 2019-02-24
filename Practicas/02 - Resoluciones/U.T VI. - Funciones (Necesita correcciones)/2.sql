use compraventa;
drop function if exists f_ValorPedido_ConPortes;

create function f_ValorPedido_ConPortes(id int)
	returns numeric(10,2)
    return (select f_ValorPedido(id) + Portes from pedidos where IdPedido = id);
    
select f_ValorPedido_ConPortes(10248) as 'Valor pedido';
    