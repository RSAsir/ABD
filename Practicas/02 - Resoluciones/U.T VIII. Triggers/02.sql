/* Ejercicio 2.
Trigger que, cada vez que se de alta un nuevo empleado, almacene en el
campo FechaContratación la fecha actual.
*/

USE modifcompraventa;

-- Creacion del trigger

DROP TRIGGER IF EXISTS tr_dos;

CREATE TRIGGER tr_dos BEFORE INSERT
ON empleados FOR EACH ROW
	SET new.FechaContratación = curdate();

-- Comprobacion
    
INSERT INTO empleados (IdEmpleado, Apellido, Nombre) VALUES (666,'Bernkastel','Grys');

SELECT * FROM empleados;

/* DETALLES

	- No olvidar el uso de new y old para establecer valores con SET.
    
*/