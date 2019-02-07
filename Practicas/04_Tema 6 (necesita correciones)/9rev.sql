use compraventa;

drop function if exists ej9;
delimiter //
create function ej9(pnomcat varchar(15), pnomprov varchar(50))
	returns int
	
    begin
		declare vidcat, vidprov int;
        
        set vidcat:=(select idcategoría from categorias where nombrecategoría=pnomcat);
        set vidprov:=(select idproveedor from proveedores where nombrecompañía=pnomprov);
        return(select count(*) from productos where idproveedor=vidprov and idcategoría=vidcat);
	end//

delimiter ;
			select ej9('Bebidas', 'Exotic Liquids'); -- 2