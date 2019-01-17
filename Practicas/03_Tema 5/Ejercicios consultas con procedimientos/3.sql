USE compraventa;
DROP PROCEDURE IF EXISTS SP_Jefe;
DELIMITER //
CREATE PROCEDURE SP_Jefe(Apellido1 VARCHAR(20), Apellido2 VARCHAR(20))

	BEGIN
		DECLARE id1, id2, jef1, jef2 INT; -- Recomendable guardar SELECT en variables para que sean mas manejables.
		SET id1 = (SELECT IdEmpleado FROM empleados WHERE Apellido = Apellido1);
        SET id2 = (SELECT IdEmpleado FROM empleados WHERE Apellido = Apellido2);
        SET jef1 = (SELECT Jefe FROM empleados WHERE Apellido = Apellido1);
        SET jef2 = (SELECT Jefe FROM empleados WHERE Apellido = Apellido2);
        
        IF id1 = jef2 THEN
			SELECT 'Apellido1 es jefe de Apellido2';
		ELSE
			IF id2 = jef1 THEN
				SELECT 'Apellido2 es jefe de Apellido1';
			ELSE
				SELECT 'No hay relacion', id1, id2,jef1,jef2;
			END IF;
		END IF;
        
    END//
    
CALL SP_Jefe('Fuller','Callahan');