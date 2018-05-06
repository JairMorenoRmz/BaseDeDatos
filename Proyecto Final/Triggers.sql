USE ProyectoFinal;

create trigger Chofi
on Empleados instead of insert
as
set nocount on
	Select * from Empleados where Puesto = 'Chofer'
go

Create trigger EstudianteModficable
on Clientes after insert, delete, update
as
set nocount on 
	Select * from Clientes where tipo = 'Estudiante'
go

Create trigger DisponibleTipoA
on Camiones after update
as
set nocount on 
	Select * from Camiones where Matricula = '6853'
go

Create trigger ZonaPrecio
on Asientos after insert,delete,update
as
set nocount on 
	Select PrecioAsiento, CantidadAsientos from Asientos
go

Create trigger InfoBoletos
on Boletos after insert,delete,update
as
set nocount on 
	Select idCompra from Boletos
go
