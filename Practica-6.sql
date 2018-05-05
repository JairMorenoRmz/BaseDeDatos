USE EjerciciosBdD;

SELECT Nombre, ApellidoP, FechaIngreso, Puesto, SueldoTotal FROM Persona INNER JOIN Empleado ON Persona.ID=Empleado.idPersona;
SELECT Empleado.ID, Puesto, NoCamion FROM Empleado INNER JOIN Camion ON Empleado.ID=Camion.idEmpleado;
SELECT * FROM Credencial INNER JOIN Persona ON Credencial.idPersona=Persona.ID;

SELECT * FROM Camion LEFT JOIN Rutas ON Camion.idRutas=Rutas.ID;
SELECT * FROM Rutas LEFT JOIN Camion ON Rutas.ID=Camion.idRutas; 
SELECT Ingresos, idCliente, idCredencial FROM Venta LEFT JOIN Cliente ON Venta.idCliente=Cliente.ID;

SELECT Nombre, ApellidoP, ApellidoS, Direccion, idCredencial FROM Persona CROSS JOIN Cliente WHERE Persona.ID=Cliente.idPersona;
SELECT NoCamion, Matricula, CiudadDestino, FechaLlegada FROM Camion CROSS JOIN Rutas WHERE Rutas.ID=Camion.idRutas;
SELECT NoCamion, Puesto FROM Camion CROSS JOIN Empleado WHERE Camion.idEmpleado=Empleado.ID;
SELECT Nombre, Puesto FROM Persona CROSS JOIN Empleado WHERE Persona.ID=Empleado.idPersona;

SELECT PrecioBoleto, BoletosVendidos, Ingresos, (SELECT SUM(Ingresos) FROM Venta) AS TotalIngresos FROM Venta;

WITH Asignacion AS (SELECT idPersona, SueldoHora FROM Empleado WHERE Puesto='Chofer') SELECT NoCamion, Matricula, idRutas FROM Camion;

SELECT * INTO Matricula FROM Camion;
SELECT * FROM Matricula;