use nulos_y_no_nulos;

-- LA DIFERENCIA CON 03 ES QUE AQUI DA warnings
-- mysql siempre intentara meter un valor en los campos no especificados
-- a diferencia del estandar.
insert clavenonuloss values(1,'a');
select * from clavenonulos; 


insert clavenonulos values(2,NULL); -- estandar
insert clavenonulos(IntnoNulo) values(2); -- mysql
select * from clavenonulos;


insert clavenonulos values(NULL,'b');
insert clavenonulos(CharnoNulo) values('b');
select * from clavenonulos;


insert clavenonulos values(NULL,NULL);
insert clavenonulos values();
select * from clavenonulos;
