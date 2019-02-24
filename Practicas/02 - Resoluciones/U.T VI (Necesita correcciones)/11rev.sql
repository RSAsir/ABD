use compraventa;

drop function if exists ejercicio11;
create function ejercicio11(paño int)
	returns varchar(40)
    return(select nombrecompañía from companiasdeenvios where IdCompañíaEnvíos=(
			select IdCompañíaEnvíos from pedidos where year(fechapedido)=paño
            group by IdCompañíaEnvíos
            order by count(*) desc limit 1));
            
            
select ejercicio11(1996); -- federal
select ejercicio11(1997); -- united