use nulos_y_no_nulos;

insert Nulos values(1,'a');
select * from Nulos; 


insert Nulos values(2,NULL);
/* insert Nulos(IntNulo) values(2)*/
select * from Nulos;


insert Nulos values(NULL,'b');
/*insert Nulos(CharNulo) values('b');*/
select * from Nulos;


insert Nulos values(NULL,NULL);
/* insert Nulos values();*/
select * from Nulos;


insert Nulos values(NULL,NULL);
/* insert Nulos values();*/
select * from Nulos;