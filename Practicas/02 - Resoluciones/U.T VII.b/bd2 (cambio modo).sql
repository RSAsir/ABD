drop database if exists nulos_y_no_nulos;

create database nulos_y_no_nulos;
select @@sql_mode;
set sql_mode='strict_trans_tables';
use nulos_y_no_nulos;

create table nulos (
	IntNulo int,
    CharNulo char
    );
    
create table nonulos (
	IntNoNulo int not null,
    CharNoNulo char not null
    );

create table clavenulos (
	IntNulo int,
    CharNulo char,
    Primary key (intnulo,charnulo)
    );
    
drop table if exists clavenonulos;
create table clavenonulos (
	IntNoNulo int not null,
    CharNoNulo char not null,
    Primary key (intnonulo,charnonulo)
    );
    