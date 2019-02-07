drop database if exists articulos;
create database articulos;

use articulos;

create table muebles (
	ref int,
    articulo varchar(20),
    unid int,
    primary key(ref));
    
/* 
insert muebles values(12,'mesa',10);
insert muebles values(25,'silla',15);
insert muebles values(26,'mesa',null);
insert muebles values(29,'mesa',3);
insert muebles values(34,'silla',12);
insert muebles values(37,'sillon',null);
insert muebles values(39,null,10);
insert muebles values(42,null,20);
*/

-- select * from muebles;

select articulo,count(unid),sum(unid),avg(unid) from  -- CUENTA EL NUMERO DE MUEBLES CON VALOR NOT NULL EN UNIDADES, LA SUMA DE LAS UNIDADES Y EL PROMEDIO PARA LOS ARTICULOS 39 Y 42
Muebles where ref in(39,42) group by articulo;

select articulo,count(unid),sum(unid),avg(unid) from  -- CUENTA EL NUMERO DE MUEBLES CON VALOR NOT NULL EN UNIDADES, LA SUMA DE LAS UNIDADES Y EL PROMEDIO
Muebles group by articulo;

select count(unid),max(unid),min(unid) from muebles; -- TODOS LOS QUE TIENEN UNIDADES, EL MAXIMO NUMERO Y EL MINIMO DE UNIDADES

select count(unid),max(unid),min(unid) from muebles  -- MISMO PARA LOS ARTICULOS 26 Y 37
where ref in(26,37);