USE compraventa;
set @valorpedido := (select sum(preciounidad * cantidad) from detallesdepedidos where idpedido = 10248);


set @descuento := (select
						if(@valorpedio < 50, 0,
							if (@valorpedido >= 50 and @valorpedido < 200, 0.05, 0.10)));
select @valorpedido as 'SinDescuento', @descuento AS 'DescuentoAplicable', (@valorpedido-(@valorpedido * @descuento)) as 'ConDescuento';

