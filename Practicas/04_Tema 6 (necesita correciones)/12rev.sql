use compraventa;

drop function if exists ejercicio12;
create function ejercicio12(pnombre varchar(40))
	returns decimal(8,2)
    return( select avg(datediff(FechaEntrega,FechaEnvío)) from pedidos where IdCompañíaEnvíos=(
			select IdCompañíaEnvíos from companiasdeenvios where FechaEnvío is not null and nombrecompañía=pnombre));
            
            select ejercicio12('speedy express'); -- 19.48
			select ejercicio12('united package'); -- 18.77
			select ejercicio12('federal shipping'); -- 19.96