USE ProyectoFinal;

Create Procedure VCaYEm
as
begin
	set nocount on 
	Select * from CamionYEmpleado
	set nocount off
end

Create Procedure VCanToDeAs
as
begin 
	set nocount on
	Select * from CantidadTotalDeAsientos
	set nocount off

end

Create Procedure Datos_Empleados
as
begin
	set nocount on
	Select * from Datos_Empleado
	set nocount off
end

Create Procedure Datos_Ventas
as
begin
	set nocount on
	Select * from Datos_Venta
	set nocount off
end

Create Procedure DetallePersonas
as
begin
	set nocount on
	Select * from DetallesDePersonas
	set nocount off
end

Create Procedure EstudiantesRegistradoss
as
begin
	set nocount on
	Select * from EstudiantesRegistrados
	set nocount off
end

Create Procedure ChoferyPersona
as
begin
	set nocount on
	Select * from Chofer
	set nocount off
end

Create Procedure InfoRutas
as
begin
	set nocount on
	Select * from InfoRuta
	set nocount off
end

Create Procedure InfosVentas
as
begin
	set nocount on
	Select * from InfoVentas
	set nocount off
end

Create Procedure RutasMasLargas
as
begin
	set nocount on
	Select * from RutaMasLarga
	set nocount off
end

Create Procedure TOPN10 
as
begin
	set nocount on
	Select * from TOP10
	set nocount off
end

Create Procedure ZonaAsientos
as
begin
	set nocount on
	Select * from ZonaDeAsientosPrecio
	set nocount off
end

Create Procedure DatosCompraS
as
begin
	set nocount on
	Select * from Compra
	set nocount off
end

Create Procedure DetallesTiempo
as
begin
	set nocount on
	Select * from Tiempo
	set nocount off
end

Create Procedure Datos_de_Cajeros
as
begin
	set nocount on
	Select * from DatosCajeros
	set nocount off
end

