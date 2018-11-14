SET @valortotal=
(select sum(PrecioUnidad*Cantidad) from DETALLESDEPEDIDOS WHERE IDPEDIDO = 10248);

select @valortotal;


SET @descuento = (SELECT CASE
	WHEN @valortotal < 50 THEN 0
    WHEN @valortotal >= 50 OR 200 THEN 0.05
    WHEN @valortotal > 200 THEN  0.10
END);

select @descuento;

SELECT
	@Valortotal



