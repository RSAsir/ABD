USE modifcompraventa;

DROP TRIGGER IF EXISTS TG_FechaContratacion;
CREATE TRIGGER TG_FechaContratacion BEFORE INSERT
ON Empleados FOR EACH ROW 
	SET new.FechaContratación=Curdate();
    
-- Prueba

insert into empleados(idempleado) values(10);