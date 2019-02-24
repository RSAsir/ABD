USE compraventa;
set @valorpedido := (select sum(preciounidad * cantidad) from detallesdepedidos where idpedido = 10248);


set @descuento := (select 
	case
		when @valorpedido > 200 then 0.10
        when @valorpedido < 200 and @valorpedido >= 50 then 0.05
        when @valorpedido < 50 then 0 
	end);
select @valorpedido as 'SinDescuento', @descuento AS 'DescuentoAplicable', (@valorpedido-(@valorpedido * @descuento)) as 'ConDescuento';

