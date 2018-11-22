use compraventa;
    drop procedure if exists cuatro;
delimiter //
create procedure cuatro (out pdescrip varchar(50),pnomprod varchar(50))
begin
set @idcat=(select idcategoría from productos where nombreproducto=pnomprod);
set pdescrip=(select Descripción from categorias where idcategoría=@idcat);
end//
delimiter ;
call cuatro(@descrip,'Té Dharamsala');
select @descrip;

select @idcat