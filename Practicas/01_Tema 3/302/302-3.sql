select
	idpedido, idproducto
from
	compraventa.detallesdepedidos
where
	idproducto IN (1, 3, 8, 14, 19,34, 49)