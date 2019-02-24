use compraventa;
drop function if exists fecha_actual;
create function fecha_actual(fecha date)
	returns varchar(10)
    return concat(day(fecha), '/',month(fecha),'/',year(fecha));

select fecha_actual('1997-01-01') as fecha;