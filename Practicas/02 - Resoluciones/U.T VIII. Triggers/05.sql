/* Ejercicio 5.- Trigger que impida que se pueda dar de alta a un empleado sin asignarle como jefe a alguno de los empleados que ya son jefes.
hay que tener en cuenta que en MySQL no es posible deshacer una acción desde un trigger, por lo que habrá que buscar algún "truco". */

USE compraventa;

-- Creacion del trigger

DROP TRIGGER IF EXISTS tr_cinco;

DELIMITER //

CREATE TRIGGER tr_cinco BEFORE INSERT
ON empleados FOR EACH ROW
	BEGIN
		IF new.Jefe NOT IN(5,2)
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'El empleado elegido como jefe no es jefe';
		END IF;
    END//
    
DELIMITER ;    
    
-- Comprobacion 
 
DELETE FROM empleados WHERE IdEmpleado BETWEEN 700 AND 702;    
    
INSERT INTO empleados (IdEmpleado, Jefe)
VALUES (700, 5);

SELECT * FROM empleados WHERE IdEmpleado = 700;

INSERT INTO empleados (IdEmpleado, Jefe)
VALUES (701, 2);

SELECT * FROM empleados WHERE IdEmpleado = 701;

INSERT INTO empleados (IdEmpleado, Jefe)
VALUES (702, 7);

SELECT * FROM empleados WHERE IdEmpleado = 702;

/* DETALLES

	- Este ejercicio es muy importante porque es el unico donde aparecen errores personalizados.
    - Recordar que en el momento en el que se de un error, todo lo que venga luego no se ejecuta.

*/