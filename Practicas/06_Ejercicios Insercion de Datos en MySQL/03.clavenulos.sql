use nulos_y_no_nulos;

insert clavenulos values(1,'a');
select * from clavenulos; 


insert clavenulos values(2,NULL); -- estandar
insert clavenulos(IntNulo) values(2); -- mysql
select * from clavenulos;


insert clavenulos values(NULL,'b');
insert clavenulos(CharNulo) values('b');
select * from clavenulos;


insert clavenulos values(NULL,NULL);
insert clavenulos values();
select * from clavenulos;

insert clavenulos values();
select * from clavenulos;
