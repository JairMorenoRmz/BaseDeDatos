USE ProyectoFinal;

UPDATE Personas
	SET FechaNacimiento = '1994-10-10'
	WHERE idPersonas = '675B03D1-E97C-481D-A243-29BAAFF9789D'

UPDATE Asientos
	SET CantidadAsientos = '25'
	WHERE AsientosDisponibles = '28'

UPDATE Cajeros
	SET Sueldo = '400'
	WHERE idCajero = 'D01FEA8A-007E-4E73-AE23-8D702C4D1FC4'

UPDATE Camiones
	SET Matricula = '12345'
	WHERE idChofer = '221CD0DB-271D-424C-95F5-2E5EAD1DE6AC'

UPDATE Clientes
	SET Tipo = 'Estudiante'
	WHERE idClientes = 'D8F318F1-2675-4953-B672-B2957BA0CE05'

UPDATE Compras
	SET Precio = '60'
	WHERE FechaCompra = '2018-01-02'

UPDATE Empleados
	SET Puesto = 'Chofer'
	WHERE idEmpleados = '4D70E7A3-FC2D-49DE-9A6F-665C1AC9CE3E'

UPDATE Horarios
	SET Tiempo = '25hrs'
	WHERE HoraSalida = '8:00am'

UPDATE Precios
	SET TemporadaAlta = '40.00'
	WHERE idPrecios = 'EDFE22CC-28D7-4A9A-85A9-6FAC13225CA2'

update Asientos
set CantidadAsientos = 40
where AsientosOcupados = 10
go 
  
update Credenciales
set Residencia = 'Carretera Nacional 48,Monterrey'
where SituacionLaboral = 'Tiempo Completo'
go

update Empleados
set FechaIngreso = '10/28/2016'
where Puesto = 'Chofer'
go

update Personas
set FechaNacimiento = '04/30/1992'
where Apellidos = 'Arreazola Ovalle'
go

update Precios
set TemporadaAlta = '40'
where TemporadaBaja = '20'
go

update Rutas
set Distancia = '2.200 km'
where Destino = 'Centro, Monterrey, N.L.'
go
