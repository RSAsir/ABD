SET @nombre = (SELECT Nombre FROM Empleados WHERE Apellido = "Fuller");
SELECT @nombre