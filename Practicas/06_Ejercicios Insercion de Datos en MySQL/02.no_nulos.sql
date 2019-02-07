use nulos_y_no_nulos;

insert NoNulos values(1,'a');
select * from NoNulos; 


insert NoNulos values(2,NULL); -- estandar
insert NoNulos(IntnoNulo) values(2); -- mysql
select * from NoNulos;


insert NoNulos values(NULL,'b');
insert NoNulos(CharnoNulo) values('b');
select * from NoNulos;


insert NoNulos values(NULL,NULL);
insert NoNulos values();
select * from NoNulos;
