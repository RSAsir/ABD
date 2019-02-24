use compraventa;
    drop procedure if exists cuatrobis;
delimiter //
create procedure cuatrobis (out pdescrip varchar(50),pnomprod varchar(50))
begin
declare idcat int;
set idcat=(select idcategoría from productos where nombreproducto=pnomprod);
set pdescrip=(select Descripción from categorias where idcategoría=idcat);
end//
delimiter ;
call cuatro(@descrip,'Té Dharamsala');
select @descrip;

select idcat