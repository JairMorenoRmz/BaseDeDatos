USE ProyectoFinal;

Create view CantidadTotalDeAsientos as Select CantidadAsientos from Asientos where CantidadAsientos >= 1;

Create view EstudiantesRegistrados as Select Nombre, Apellidos from Personas, Clientes where Clientes.tipo = 'Estudiante';

Create view CamionYEmpleado as Select idChofer, Matricula from Camiones;

CREATE VIEW Datos_Venta as Select idVentas, BoletosVendidos, Total FROM Ventas;

CREATE VIEW Datos_Empleado AS SELECT idEmpleados, Puesto, Nombre FROM Empleados, Personas;

Create View InfoRuta as Select Origen, Destino from Rutas;

Create view DetallesDePersonas as Select Nombre, Total FROM Ventas, Personas;

Create view Tiempo as Select Tiempo from Horarios;

Create view RutaMasLarga as Select Distancia, Tiempo from Rutas, Horarios where Tiempo >= '24 horas';

Create view ZonaDeAsientosPrecio as Select AsientosDisponibles,PrecioAsiento from Asientos;

Create view InfoVentas as Select Nombre, Matricula from Camiones, Personas;

Create view TOP10 as Select top 10 * from Personas 

Create view Chofer as Select Nombre, Apellidos, SueldoTotal from Choferes, Personas;

Create view DatosCajeros as Select Nombre, Apellidos, Sueldo from Cajeros, Personas;

Create view Compra as Select FechaCompra, Precio from Compras;