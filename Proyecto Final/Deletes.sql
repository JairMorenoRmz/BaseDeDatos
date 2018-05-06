USE ProyectoFinal;

DELETE FROM Personas
Where Nombre = 'Diego'

DELETE FROM Asientos
WHERE CantidadAsientos = '20'

DELETE FROM Boletos
WHERE idViajes = 'CD3C4A29-38E6-476A-AF4D-3E0C1A5DADC6'

DELETE FROM Cajeros
WHERE idCajero = '643FC6AA-6584-4718-999C-9B5C44EBAD7A'

DELETE FROM Camiones
WHERE Matricula = '6853'

DELETE FROM Choferes
WHERE  SueldoTotal = '260'

DELETE FROM Clientes 
WHERE Tipo = 'Tercera Edad'

DELETE FROM Compras
WHERE Precio = '30'

DELETE FROM Credenciales
WHERE Residencia = 'Rosas 456 Showman,San Nicolas'

DELETE FROM Empleados
WHERE Puesto = 'Cajero'

DELETE FROM Horarios 
WHERE HoraSalida = '4:00pm'

DELETE FROM Precios
WHERE idVentas = '07D47C07-F9F1-4A7F-BEF3-0C614DE4778A'

DELETE FROM Rutas
WHERE Distancia = '1.282 km'

DELETE FROM Ventas
WHERE Total = '240.00'