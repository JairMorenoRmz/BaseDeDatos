USE [master]
GO
/****** Object:  Database [ProyectoFinal]    Script Date: 05/05/2018 11:30:09 p. m. ******/
CREATE DATABASE [ProyectoFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.YENAI\MSSQL\DATA\ProyectoFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.YENAI\MSSQL\DATA\ProyectoFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoFinal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoFinal] SET QUERY_STORE = OFF
GO
USE [ProyectoFinal]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ProyectoFinal]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 05/05/2018 11:30:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[idAsientos] [uniqueidentifier] NOT NULL,
	[CantidadAsientos] [int] NOT NULL,
	[AsientosOcupados] [int] NOT NULL,
	[AsientosDisponibles]  AS ([CantidadAsientos]-[AsientosOcupados]),
	[PrecioAsiento] [money] NOT NULL,
 CONSTRAINT [PK_Asientos] PRIMARY KEY CLUSTERED 
(
	[idAsientos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CantidadTotalDeAsientos]    Script Date: 05/05/2018 11:30:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[CantidadTotalDeAsientos] as Select CantidadAsientos from Asientos where CantidadAsientos >= 1;
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[idPersonas] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[idPersonas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idClientes] [uniqueidentifier] NOT NULL,
	[idPersona] [uniqueidentifier] NOT NULL,
	[Tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EstudiantesRegistrados]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[EstudiantesRegistrados] as Select Nombre, Apellidos from Personas, Clientes where Clientes.tipo = 'Estudiante';
GO
/****** Object:  Table [dbo].[Camiones]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camiones](
	[idCamion] [uniqueidentifier] NOT NULL,
	[idAsientos] [uniqueidentifier] NOT NULL,
	[idChofer] [uniqueidentifier] NOT NULL,
	[Matricula] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Camiones] PRIMARY KEY CLUSTERED 
(
	[idCamion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CamionYEmpleado]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[CamionYEmpleado] as Select idChofer, Matricula from Camiones;
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[idVentas] [uniqueidentifier] NOT NULL,
	[BoletosVendidos] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Total]  AS ([Precio]*[BoletosVendidos]),
	[idCajero] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[idVentas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Datos_Venta]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Datos_Venta] as Select idVentas, BoletosVendidos, Total FROM Ventas;
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleados] [uniqueidentifier] NOT NULL,
	[idPersonas] [uniqueidentifier] NOT NULL,
	[Puesto] [nvarchar](50) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[idCredencial] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Datos_Empleado]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Datos_Empleado] AS SELECT idEmpleados, Puesto, Nombre FROM Empleados, Personas;
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[idRutas] [uniqueidentifier] NOT NULL,
	[Origen] [nvarchar](50) NOT NULL,
	[Destino] [nvarchar](50) NOT NULL,
	[Distancia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[idRutas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InfoRuta]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[InfoRuta] as Select Origen, Destino from Rutas;
GO
/****** Object:  View [dbo].[DetallesDePersonas]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[DetallesDePersonas] as Select Nombre, Total FROM Ventas, Personas;
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[idHorarios] [uniqueidentifier] NOT NULL,
	[Tiempo] [nvarchar](50) NOT NULL,
	[HoraSalida] [nvarchar](50) NOT NULL,
	[HoraLlegada] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED 
(
	[idHorarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Tiempo]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Tiempo] as Select Tiempo from Horarios;
GO
/****** Object:  View [dbo].[RutaMasLarga]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[RutaMasLarga] as Select Distancia, Tiempo from Rutas, Horarios where Tiempo >= '24 horas';
GO
/****** Object:  View [dbo].[ZonaDeAsientosPrecio]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ZonaDeAsientosPrecio] as Select AsientosDisponibles,PrecioAsiento from Asientos;
GO
/****** Object:  View [dbo].[InfoVentas]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[InfoVentas] as Select Nombre, Matricula from Camiones, Personas;
GO
/****** Object:  View [dbo].[TOP10]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[TOP10] as Select top 10 * from Personas 
GO
/****** Object:  Table [dbo].[Choferes]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choferes](
	[idChofer] [uniqueidentifier] NOT NULL,
	[idEmpleado] [uniqueidentifier] NOT NULL,
	[SueldoHoras] [money] NOT NULL,
	[Horas] [int] NOT NULL,
	[SueldoTotal]  AS ([SueldoHoras]*[Horas]),
 CONSTRAINT [PK_Choferes] PRIMARY KEY CLUSTERED 
(
	[idChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Chofer]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Chofer] as Select Nombre, Apellidos, SueldoTotal from Choferes, Personas;
GO
/****** Object:  Table [dbo].[Cajeros]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajeros](
	[idCajero] [uniqueidentifier] NOT NULL,
	[idEmpleado] [uniqueidentifier] NOT NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Cajeros] PRIMARY KEY CLUSTERED 
(
	[idCajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DatosCajeros]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[DatosCajeros] as Select Nombre, Apellidos, Sueldo from Cajeros, Personas;
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[idCompra] [uniqueidentifier] NOT NULL,
	[FechaCompra] [date] NOT NULL,
	[idCajero] [uniqueidentifier] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Compra]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Compra] as Select FechaCompra, Precio from Compras;
GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boletos](
	[idBoletos] [uniqueidentifier] NOT NULL,
	[idCliente] [uniqueidentifier] NOT NULL,
	[idViajes] [uniqueidentifier] NOT NULL,
	[idCompra] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Boletos] PRIMARY KEY CLUSTERED 
(
	[idBoletos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credenciales]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credenciales](
	[idCredencial] [uniqueidentifier] NOT NULL,
	[Residencia] [nvarchar](50) NOT NULL,
	[idPersona] [uniqueidentifier] NOT NULL,
	[SituacionLaboral] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Credenciales] PRIMARY KEY CLUSTERED 
(
	[idCredencial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precios]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precios](
	[idPrecios] [uniqueidentifier] NOT NULL,
	[TemporadaAlta] [money] NOT NULL,
	[TemporadaBaja] [money] NOT NULL,
	[idVentas] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Precios] PRIMARY KEY CLUSTERED 
(
	[idPrecios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 05/05/2018 11:30:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[idViajes] [uniqueidentifier] NOT NULL,
	[idRutas] [uniqueidentifier] NOT NULL,
	[idHorarios] [uniqueidentifier] NOT NULL,
	[idCamion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Viajes] PRIMARY KEY CLUSTERED 
(
	[idViajes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'0667826c-10a9-4197-98ca-3190bcd1c36c', 40, 10, 60.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'0f50a550-7af6-483d-b1fd-4b0384bcd14a', 35, 18, 60.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'2f0a7498-4afd-4cb9-9ef8-6887c3e61edb', 80, 45, 40.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'8225be0d-a3b2-443c-afcc-6f0beae94e1b', 30, 29, 60.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'6a5d4272-6aa8-414c-8648-8ba152c398c9', 25, 2, 27.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'f11b2be1-4afd-49f7-b436-a97beec0075e', 20, 8, 50.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'5a354352-1a77-47d7-8679-aa1c60458876', 40, 10, 50.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'e8f19148-de46-446b-9c18-b141b747f643', 40, 10, 80.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'3fb38206-684e-4ae6-8cee-b827babb00e9', 25, 8, 40.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'8577944c-05dd-4845-99c5-d492c7d8fad4', 40, 10, 80.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'c0dcbbd4-f25d-4b8c-8b98-e608ff19bab0', 40, 10, 30.0000)
INSERT [dbo].[Asientos] ([idAsientos], [CantidadAsientos], [AsientosOcupados], [PrecioAsiento]) VALUES (N'69f94f73-a01d-4dc7-bffb-f19e06a7df7e', 40, 10, 20.0000)
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'd6008903-13a3-4616-8fd5-3cc7ece24f7d', N'ad9a5744-b5fd-45ae-9eca-2ef7914744ee', N'5a61d568-9578-4a88-af79-4a71aea863e3', N'd12fcac9-0f63-4a6f-8fc5-7ac1adc4a40c')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'9f7db790-6c51-4c15-be7e-3fbcdf755296', N'a74883a1-f9e0-4218-b35c-0579a3b47428', N'616fb972-b4fa-4c5e-b6b4-032d22981f29', N'4c0d086f-3146-4f6b-ba91-12c7cc6df186')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'7f1030a8-0a93-4bff-99d9-728cdb3fbf52', N'6322de15-377a-4819-b58e-51c8bf23282a', N'70852e66-bc3e-4b2f-b459-b6a996332dca', N'43eed34c-c3df-4fca-b316-a33ad637fd8a')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'7c793f77-03a3-4814-9ade-75746e6b3413', N'b551266d-5316-4df1-a062-bdfa8ed0990a', N'd123489a-bbfe-480a-a4e5-d20dde367112', N'b7588b86-3811-4e41-b11a-ebcc5df5bf3f')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'8164fb38-0ce9-4de9-8900-835ed8c6deda', N'd8f318f1-2675-4953-b672-b2957ba0ce05', N'8323f640-947b-4bb8-8a46-c6b53bd565b8', N'4bda892b-f434-4c99-9bd6-b372c6b61e57')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'0a5475c3-579c-486f-a690-ac21729f53e8', N'c01e7fb3-61bd-42dc-aeb2-c8aabd868b34', N'9d3ec23b-e21c-4689-abbe-dd3d7532213d', N'9b02edf6-15ef-4f85-adc8-fb73c327e633')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'8439c922-a387-44e5-ba0b-dc7d3e79a2d6', N'cf224416-c1dd-41e9-853b-722369acb629', N'346f3a00-1883-4e7e-afe6-bf78c1a04db9', N'95b9f31b-7204-4d6c-a458-ae260ff8ddda')
INSERT [dbo].[Boletos] ([idBoletos], [idCliente], [idViajes], [idCompra]) VALUES (N'906738a7-9941-407e-9741-e7511b91a263', N'dbb3a412-5752-415a-a540-432df898c94d', N'66462a51-98cb-47e3-b458-63b128a2fb4a', N'7aea0c92-1234-44e4-a55e-9ed22ea7daa5')
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'207b99b5-d4e5-4f80-ac41-1e379661c833', N'39b88e33-5e34-43a8-a827-c6e765b79e51', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'd01fea8a-007e-4e73-ae23-8d702c4d1fc4', N'0f0b4441-f099-4f91-8d97-6fcea758d1a6', 400.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'643fc6aa-6584-4718-999c-9b5c44ebad7a', N'ee16bfb4-c949-43b4-a6e0-6907fa8472be', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'34c58ffc-0176-417c-a8d8-aa1a0e6ff166', N'41260eac-70dc-4a8d-af6a-3284c31cd852', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'cb6257fd-e927-4c18-992c-ad664c1eddbe', N'eee3f1ab-2001-4e66-895b-f305f010e141', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'42534fec-2bca-4313-9cdb-bace1fb9d529', N'af4a71a9-416e-4301-a3b0-58ae391746b3', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'ca950812-e30e-4ab1-ab69-c1ced42ba9db', N'12a8eb7d-fff3-4c83-ba18-6de31a2b8a27', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'57a81516-dcbb-4270-9d3f-c489e4b7e368', N'b32d139f-c23f-4e55-aa9c-98caf3704348', 0.0000)
INSERT [dbo].[Cajeros] ([idCajero], [idEmpleado], [Sueldo]) VALUES (N'0dc2e8b0-bd94-4a32-b542-d187bde605b3', N'399d9b02-60f6-4820-b59c-bc3d4869560d', 0.0000)
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'2d67225d-6fcf-43e8-aab1-145c1856eee7', N'5a354352-1a77-47d7-8679-aa1c60458876', N'f9b3defd-01f6-411a-8da0-a1485c8e51a6', N'652334')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'b174e5e4-18ff-486a-85c7-1ab79c6248f5', N'8577944c-05dd-4845-99c5-d492c7d8fad4', N'16b7a1bc-1f09-4315-aab8-f35e8b871486', N'52562')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'0e508e96-3bc4-42f6-81dc-2ca58f2a1ab9', N'3fb38206-684e-4ae6-8cee-b827babb00e9', N'8ffa8a1b-e4ee-42ce-83de-f1d6af15e6fa', N'96529')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'cbc51aa1-4514-4c88-95fd-5bf0799ef55c', N'8225be0d-a3b2-443c-afcc-6f0beae94e1b', N'cab13a0c-f0d7-463c-804e-6e51040e7cbc', N'6853')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'edd846a5-c2db-47b3-86e3-96493e2d19da', N'e8f19148-de46-446b-9c18-b141b747f643', N'7ad07067-69f7-4845-904f-bd691f57eeaf', N'685412')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'6d0bf021-2229-419f-82a5-970812723024', N'0667826c-10a9-4197-98ca-3190bcd1c36c', N'220cf9ea-91ce-4954-947d-16c62375e06e', N'17854')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'bb06d91c-207b-4bfc-ad99-a5668de856bd', N'f11b2be1-4afd-49f7-b436-a97beec0075e', N'046d4891-ac55-4528-90e3-94e5cd63787a', N'68453')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'ba72f1e8-b4a1-4fae-b0c6-a7c2597c97ef', N'2f0a7498-4afd-4cb9-9ef8-6887c3e61edb', N'221cd0db-271d-424c-95f5-2e5ead1de6ac', N'12345')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'8ca3b4ed-bb77-46ae-b68e-d823fe1920ad', N'0f50a550-7af6-483d-b1fd-4b0384bcd14a', N'7c877b17-c494-4de5-818e-1c87ff9f72cc', N'29681')
INSERT [dbo].[Camiones] ([idCamion], [idAsientos], [idChofer], [Matricula]) VALUES (N'c60ff062-2a21-48b5-8207-f325cd2e041e', N'6a5d4272-6aa8-414c-8648-8ba152c398c9', N'ad2abaaa-6d8c-40d4-b69c-87d91f779e00', N'9652558')
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'220cf9ea-91ce-4954-947d-16c62375e06e', N'8740dcd5-fe4f-4262-ac87-8236dfaf1b10', 20.0000, 13)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'7c877b17-c494-4de5-818e-1c87ff9f72cc', N'4d70e7a3-fc2d-49de-9a6f-665c1ac9ce3e', 20.0000, 15)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'221cd0db-271d-424c-95f5-2e5ead1de6ac', N'6a8f801e-5ac8-4a8e-9f27-236d5b76a10f', 20.0000, 20)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'cab13a0c-f0d7-463c-804e-6e51040e7cbc', N'8f22d104-1e9e-492f-a3c5-acad61816566', 20.0000, 17)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'ad2abaaa-6d8c-40d4-b69c-87d91f779e00', N'5e357f4e-11d4-424e-8fdb-3f20a5736e63', 20.0000, 10)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'046d4891-ac55-4528-90e3-94e5cd63787a', N'fa9fbdf4-2763-4786-8eb4-13002fe95263', 20.0000, 5)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'f9b3defd-01f6-411a-8da0-a1485c8e51a6', N'43e90c70-ec4c-4995-9a37-ec88b2b6c6f0', 20.0000, 11)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'7ad07067-69f7-4845-904f-bd691f57eeaf', N'c32df1fa-4579-4a47-a9ca-63c80813c4b1', 20.0000, 8)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'8ffa8a1b-e4ee-42ce-83de-f1d6af15e6fa', N'750f9376-d2e5-4a78-9db1-036aee6fcd60', 20.0000, 8)
INSERT [dbo].[Choferes] ([idChofer], [idEmpleado], [SueldoHoras], [Horas]) VALUES (N'16b7a1bc-1f09-4315-aab8-f35e8b871486', N'074c7b73-9840-4ae7-b5f2-fe7e360c0e6c', 20.0000, 9)
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'a74883a1-f9e0-4218-b35c-0579a3b47428', N'41446545-eb6d-428c-86e2-d645ea124658', N'Estudiante')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'f1836095-38d2-4f6b-8fc0-05ee9cd6e363', N'ef7f5090-6ae5-4e63-bda6-500dd9e9f569', N'Tercera Edad')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'ad9a5744-b5fd-45ae-9eca-2ef7914744ee', N'04b0ee0d-ef0e-4b03-984d-23e3d578f967', N'Estudiante')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'dbb3a412-5752-415a-a540-432df898c94d', N'6d1b00e5-e027-4878-a04c-d8d5c140beb2', N'Estudiante')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'6322de15-377a-4819-b58e-51c8bf23282a', N'03a158a0-aa69-4197-a5cb-f1091145afad', N'Estudiante')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'cf224416-c1dd-41e9-853b-722369acb629', N'd5728772-fe0a-49c8-a753-e052c5404f48', N'Tercera Edad')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'd8f318f1-2675-4953-b672-b2957ba0ce05', N'58f99dd2-8712-492b-ac04-e26fa0cd9677', N'Estudiante')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'b551266d-5316-4df1-a062-bdfa8ed0990a', N'd52119b3-8a14-43f3-80e8-ec327ae41a60', N'Cliente Frecuente')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'c01e7fb3-61bd-42dc-aeb2-c8aabd868b34', N'ad1c2967-5395-4040-bf35-67ffcd5550d2', N'Cliente Frecuente')
INSERT [dbo].[Clientes] ([idClientes], [idPersona], [Tipo]) VALUES (N'a26ea2fd-f200-464a-ac4a-f1a3f0c43c5b', N'8e92483e-f1a6-467c-a762-fc1e50914a8f', N'Estudiante')
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'4c0d086f-3146-4f6b-ba91-12c7cc6df186', CAST(N'2017-06-15' AS Date), N'cb6257fd-e927-4c18-992c-ad664c1eddbe', 30.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'34807855-89ab-4fc1-b71d-63b153f9b68f', CAST(N'2017-12-24' AS Date), N'42534fec-2bca-4313-9cdb-bace1fb9d529', 50.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'd12fcac9-0f63-4a6f-8fc5-7ac1adc4a40c', CAST(N'2017-08-11' AS Date), N'207b99b5-d4e5-4f80-ac41-1e379661c833', 20.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'7aea0c92-1234-44e4-a55e-9ed22ea7daa5', CAST(N'2017-10-30' AS Date), N'0dc2e8b0-bd94-4a32-b542-d187bde605b3', 20.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'43eed34c-c3df-4fca-b316-a33ad637fd8a', CAST(N'2018-03-29' AS Date), N'57a81516-dcbb-4270-9d3f-c489e4b7e368', 50.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'95b9f31b-7204-4d6c-a458-ae260ff8ddda', CAST(N'2018-03-18' AS Date), N'ca950812-e30e-4ab1-ab69-c1ced42ba9db', 40.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'4bda892b-f434-4c99-9bd6-b372c6b61e57', CAST(N'2018-01-02' AS Date), N'643fc6aa-6584-4718-999c-9b5c44ebad7a', 60.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'b7588b86-3811-4e41-b11a-ebcc5df5bf3f', CAST(N'2017-05-04' AS Date), N'34c58ffc-0176-417c-a8d8-aa1a0e6ff166', 20.0000)
INSERT [dbo].[Compras] ([idCompra], [FechaCompra], [idCajero], [Precio]) VALUES (N'9b02edf6-15ef-4f85-adc8-fb73c327e633', CAST(N'2017-12-20' AS Date), N'd01fea8a-007e-4e73-ae23-8d702c4d1fc4', 30.0000)
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'c6e08e9b-7a44-44da-9be6-0d766285918a', N'Stress 591 Tareas,San Nicolas', N'532be955-cdd0-4d24-9e01-9766e463a604', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'6b39256a-9f38-422e-8c56-0dbfff303c5a', N'Carretera Nacional 48,Monterrey', N'cd845526-dc84-4bee-ad2f-a940e862bebb', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'b67a7cd8-5b26-40b1-bc24-14a648277c08', N'Carretera Nacional 48,Monterrey', N'530614bb-cca3-40f5-a3d5-702ad55467a4', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'ff68c0c6-86d0-477c-a565-28a80c9e817b', N'Carretera Nacional 48,Monterrey', N'6acc898a-121c-4a3c-8e8f-8cb1ea13dc99', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'b5e02c61-981b-4328-b2ac-330588be1fc8', N'Tulipanes 78 Jardin de las Flores,Monterey', N'38f87543-9173-4dab-b74a-85ffca777ed2', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'c9413497-7dc8-4520-ac85-3868f5dccead', N'Microsoft 58 Tecnologia,Santa Catarina', N'675b03d1-e97c-481d-a243-29baaff9789d', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'ec9545f7-3ec7-4080-8201-48ab9bfb22b6', N'Carretera Nacional 48,Monterrey', N'a53403b4-9256-49ec-a6ff-1f1728c7ef2f', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'8b9fd65c-0265-48ae-b753-5fd2dda7ba1b', N'Carretera Nacional 48,Monterrey', N'ec2d6e44-a98b-4167-9426-638d7d2ef64f', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'13e863b3-d8dc-4246-9074-72233b76d63d', N'Dreams 5252 Paradise,San Nicolas', N'ec3fc5e0-63a9-4f1d-804d-bbebaf4719e1', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'9719e863-a37e-4a3d-8604-864150fdcc5b', N'Morado 8459 Arcoiris,Guadalupe', N'd8632c64-8c81-4320-85eb-9a217aa44345', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'a07509e8-67fc-4e4b-8a68-9545e430d54a', N'Carretera Nacional 48,Monterrey', N'df9c8533-c21d-4835-8f01-729eead645ca', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'bf4ced52-a476-4e44-b9a0-aade14f963ad', N'Carretera Nacional 48,Monterrey', N'3bd74fb3-e143-4400-a7f1-29ebb563e687', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'c9eea46d-df89-44fa-b0c1-bb9b45013d71', N'Caracoles 482 Fondo de Bikini,Santa Catarina', N'd71dfb78-8091-46bf-a0bd-a2481f39b2b0', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'0156fc6d-d49d-48aa-ac4e-c7852b410ade', N'Carretera Nacional 48,Monterrey', N'40f86606-860e-47d7-abf9-1da491a12111', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'7675203e-85e8-41cb-bb79-c7b3bfd99f8d', N'Diana Artemisa 520 Jardines Roma,Monterrey', N'2d93fb21-0dbc-44a7-9bbd-0832df6d99d0', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'e06a94f5-1a0d-4221-a1ce-dfc50d585b28', N'Carretera Nacional 48,Monterrey', N'01133163-25ef-4458-a23f-a33cc709e95f', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'943897f4-c44f-4b10-8268-fadee8e52259', N'Carretera Nacional 48,Monterrey', N'8a14727d-f3f9-4b25-9f42-246d7d495dd1', N'Medio Tiempo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'3e087aff-04a3-495d-9a1a-fc24acc0b000', N'Carretera Nacional 48,Monterrey', N'e678c08b-1cba-494f-8e6c-9b02718ba8cc', N'Tiempo Completo')
INSERT [dbo].[Credenciales] ([idCredencial], [Residencia], [idPersona], [SituacionLaboral]) VALUES (N'c4aeb505-31df-4a3a-b703-ffdf6e204899', N'Carretera Nacional 48,Monterrey', N'7c4c4c9d-bb5d-4052-a384-47710e6d6afb', N'Tiempo Completo')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'750f9376-d2e5-4a78-9db1-036aee6fcd60', N'ec2d6e44-a98b-4167-9426-638d7d2ef64f', N'Chofer', CAST(N'2016-10-28' AS Date), N'8b9fd65c-0265-48ae-b753-5fd2dda7ba1b')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'fa9fbdf4-2763-4786-8eb4-13002fe95263', N'530614bb-cca3-40f5-a3d5-702ad55467a4', N'Chofer', CAST(N'2016-10-28' AS Date), N'b67a7cd8-5b26-40b1-bc24-14a648277c08')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'6a8f801e-5ac8-4a8e-9f27-236d5b76a10f', N'6acc898a-121c-4a3c-8e8f-8cb1ea13dc99', N'Chofer', CAST(N'2016-10-28' AS Date), N'ff68c0c6-86d0-477c-a565-28a80c9e817b')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'41260eac-70dc-4a8d-af6a-3284c31cd852', N'40f86606-860e-47d7-abf9-1da491a12111', N'Cajero', CAST(N'2016-10-28' AS Date), N'0156fc6d-d49d-48aa-ac4e-c7852b410ade')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'5e357f4e-11d4-424e-8fdb-3f20a5736e63', N'd8632c64-8c81-4320-85eb-9a217aa44345', N'Chofer', CAST(N'2016-10-28' AS Date), N'9719e863-a37e-4a3d-8604-864150fdcc5b')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'af4a71a9-416e-4301-a3b0-58ae391746b3', N'df9c8533-c21d-4835-8f01-729eead645ca', N'Cajero', CAST(N'2016-10-28' AS Date), N'a07509e8-67fc-4e4b-8a68-9545e430d54a')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'c32df1fa-4579-4a47-a9ca-63c80813c4b1', N'a53403b4-9256-49ec-a6ff-1f1728c7ef2f', N'Chofer', CAST(N'2016-10-28' AS Date), N'ec9545f7-3ec7-4080-8201-48ab9bfb22b6')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'4d70e7a3-fc2d-49de-9a6f-665c1ac9ce3e', N'ec3fc5e0-63a9-4f1d-804d-bbebaf4719e1', N'Chofer', CAST(N'2016-10-28' AS Date), N'13e863b3-d8dc-4246-9074-72233b76d63d')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'ee16bfb4-c949-43b4-a6e0-6907fa8472be', N'e678c08b-1cba-494f-8e6c-9b02718ba8cc', N'Cajero', CAST(N'2016-10-28' AS Date), N'3e087aff-04a3-495d-9a1a-fc24acc0b000')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'12a8eb7d-fff3-4c83-ba18-6de31a2b8a27', N'7c4c4c9d-bb5d-4052-a384-47710e6d6afb', N'Cajero', CAST(N'2016-10-28' AS Date), N'c4aeb505-31df-4a3a-b703-ffdf6e204899')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'0f0b4441-f099-4f91-8d97-6fcea758d1a6', N'8a14727d-f3f9-4b25-9f42-246d7d495dd1', N'Cajero', CAST(N'2016-10-28' AS Date), N'943897f4-c44f-4b10-8268-fadee8e52259')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'8740dcd5-fe4f-4262-ac87-8236dfaf1b10', N'675b03d1-e97c-481d-a243-29baaff9789d', N'Chofer', CAST(N'2016-10-28' AS Date), N'c9413497-7dc8-4520-ac85-3868f5dccead')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'b32d139f-c23f-4e55-aa9c-98caf3704348', N'd71dfb78-8091-46bf-a0bd-a2481f39b2b0', N'Cajero', CAST(N'2016-10-28' AS Date), N'c9eea46d-df89-44fa-b0c1-bb9b45013d71')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'8f22d104-1e9e-492f-a3c5-acad61816566', N'532be955-cdd0-4d24-9e01-9766e463a604', N'Chofer', CAST(N'2016-10-28' AS Date), N'c6e08e9b-7a44-44da-9be6-0d766285918a')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'399d9b02-60f6-4820-b59c-bc3d4869560d', N'3bd74fb3-e143-4400-a7f1-29ebb563e687', N'Cajero', CAST(N'2016-10-28' AS Date), N'bf4ced52-a476-4e44-b9a0-aade14f963ad')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'39b88e33-5e34-43a8-a827-c6e765b79e51', N'2d93fb21-0dbc-44a7-9bbd-0832df6d99d0', N'Cajero', CAST(N'2016-10-28' AS Date), N'7675203e-85e8-41cb-bb79-c7b3bfd99f8d')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'43e90c70-ec4c-4995-9a37-ec88b2b6c6f0', N'38f87543-9173-4dab-b74a-85ffca777ed2', N'Chofer', CAST(N'2016-10-28' AS Date), N'b5e02c61-981b-4328-b2ac-330588be1fc8')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'eee3f1ab-2001-4e66-895b-f305f010e141', N'01133163-25ef-4458-a23f-a33cc709e95f', N'Cajero', CAST(N'2016-10-28' AS Date), N'e06a94f5-1a0d-4221-a1ce-dfc50d585b28')
INSERT [dbo].[Empleados] ([idEmpleados], [idPersonas], [Puesto], [FechaIngreso], [idCredencial]) VALUES (N'074c7b73-9840-4ae7-b5f2-fe7e360c0e6c', N'cd845526-dc84-4bee-ad2f-a940e862bebb', N'Chofer', CAST(N'2016-10-28' AS Date), N'6b39256a-9f38-422e-8c56-0dbfff303c5a')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'45c837d9-c64b-48c9-ae0d-02000c9ba158', N'14hrs 29min', N'4:00pm', N'6:30am')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'31adc0ae-91bb-489a-97f1-2e8decabd087', N'8hrs 3min', N'11:30am', N'7:33pm')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'e84e29ce-4417-4983-a4b6-64b4069caecd', N'13hrs 44min', N'11:20pm', N'12:04pm')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'3f329092-bd7c-478a-a3a0-81c7604b660f', N'22hrs 18min', N'12:00pm', N'10:20am')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'6d237eb4-6a31-488b-9ef3-94bfd42fd9d1', N'6hrs 47min', N'12:13am', N'6:00am')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'0f4ed04d-c441-4274-8ddc-9685194b6804', N'25hrs', N'8:00am', N'6:10pm')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'a269531f-f2b8-4568-9d18-a47f1008f056', N'5hrs 20min', N'2:20pm', N'7:40pm')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'cea46005-c593-4722-8022-ac2eccf20410', N'12hrs 31min', N'5:20am', N'6:00pm')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'b55eb839-5033-4006-8809-c7acffcefc34', N'2hrs 36min', N'9:45am', N'10:20am')
INSERT [dbo].[Horarios] ([idHorarios], [Tiempo], [HoraSalida], [HoraLlegada]) VALUES (N'820f4b56-c93d-4d60-8e8e-d3315dec8412', N'25hrs', N'9:15am', N'10:15am')
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'2d93fb21-0dbc-44a7-9bbd-0832df6d99d0', N'Diego', N'Castillo Casas', CAST(N'1991-10-15' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'40f86606-860e-47d7-abf9-1da491a12111', N'Daniel', N'Gonzalez Cantú', CAST(N'1994-10-10' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'a53403b4-9256-49ec-a6ff-1f1728c7ef2f', N'Riardo', N'Treviño Chapa', CAST(N'1945-03-29' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'04b0ee0d-ef0e-4b03-984d-23e3d578f967', N'Jorge', N'Martinez Suarez', CAST(N'2000-06-07' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'8a14727d-f3f9-4b25-9f42-246d7d495dd1', N'Diego', N'Barraza Contreras', CAST(N'1998-04-11' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'675b03d1-e97c-481d-a243-29baaff9789d', N'Eduardo Osvaldo', N'Gonzalez Lino', CAST(N'1994-10-10' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'3bd74fb3-e143-4400-a7f1-29ebb563e687', N'Sofía', N'Perez Gonzalez', CAST(N'1995-04-08' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'7c4c4c9d-bb5d-4052-a384-47710e6d6afb', N'Jonathan', N'Escandon Montes', CAST(N'1947-05-17' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'ef7f5090-6ae5-4e63-bda6-500dd9e9f569', N'Gilberto', N'Solis Contreras', CAST(N'2010-02-18' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'ec2d6e44-a98b-4167-9426-638d7d2ef64f', N'Arely', N'Hernandez Jimenes', CAST(N'1998-04-05' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'ad1c2967-5395-4040-bf35-67ffcd5550d2', N'José', N'Alfredo Jimenez', CAST(N'2001-04-09' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'530614bb-cca3-40f5-a3d5-702ad55467a4', N'Sofia Alejandra', N'Moreo Chapa', CAST(N'1968-10-25' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'df9c8533-c21d-4835-8f01-729eead645ca', N'Griselda', N'Orozco Beltrán', CAST(N'1996-02-04' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'38f87543-9173-4dab-b74a-85ffca777ed2', N'Diana Valeria', N'Loera Gallegos', CAST(N'1997-05-18' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'6acc898a-121c-4a3c-8e8f-8cb1ea13dc99', N'Alan Cesar', N'Martinez Rivera', CAST(N'1993-04-30' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'532be955-cdd0-4d24-9e01-9766e463a604', N'Fernanda', N'Vazquez Cantu', CAST(N'1981-08-14' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'd8632c64-8c81-4320-85eb-9a217aa44345', N'Monica Leticia', N'Grimaldo Cazarez', CAST(N'1978-10-18' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'e678c08b-1cba-494f-8e6c-9b02718ba8cc', N'José', N'Madero Vizcaíno', CAST(N'1989-02-09' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'd71dfb78-8091-46bf-a0bd-a2481f39b2b0', N'Erika', N'Mata Mata', CAST(N'1998-12-29' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'01133163-25ef-4458-a23f-a33cc709e95f', N'Andrea Vanessa', N'Almaráz Peñuela', CAST(N'1956-10-01' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'cd845526-dc84-4bee-ad2f-a940e862bebb', N'Fabiola', N'Arreazola Ovalle', CAST(N'1992-04-30' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'3db62f7c-0c7c-44b5-bb0f-b0cbec808da7', N'Arturo', N'Arredondo Treviño', CAST(N'1980-04-27' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'ec3fc5e0-63a9-4f1d-804d-bbebaf4719e1', N'Cesar Humberto', N'Treviño Garza', CAST(N'1953-04-01' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'41446545-eb6d-428c-86e2-d645ea124658', N'Carlos', N'Valdés Soto', CAST(N'1992-04-30' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'6d1b00e5-e027-4878-a04c-d8d5c140beb2', N'Jaime', N'Sanchez Lopez', CAST(N'2008-09-02' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'd5728772-fe0a-49c8-a753-e052c5404f48', N'Miguel', N'Leal Lozano', CAST(N'1986-12-14' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'58f99dd2-8712-492b-ac04-e26fa0cd9677', N'Cecilia', N'Prado Aguilar', CAST(N'1975-03-10' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'd52119b3-8a14-43f3-80e8-ec327ae41a60', N'Eduardo', N'Cueto Salazar', CAST(N'1998-05-04' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'03a158a0-aa69-4197-a5cb-f1091145afad', N'Tania Sofia', N'Rodriguez Garza', CAST(N'1955-06-25' AS Date))
INSERT [dbo].[Personas] ([idPersonas], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (N'8e92483e-f1a6-467c-a762-fc1e50914a8f', N'Jorge', N'Vazquez Leal', CAST(N'2005-07-22' AS Date))
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'6e71bf0e-d6af-4304-9ccb-0ecb4614a18d', 40.0000, 20.0000, N'cc669062-ab2a-4ddd-90be-8cdb18a14260')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'9d407b1e-ae8b-4614-9dd3-2ddade4246d3', 40.0000, 20.0000, N'd60debfb-8c20-439e-a930-9fc46cbd8a67')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'680d4356-6227-4382-9fec-2fb314b59f58', 40.0000, 20.0000, N'55b5b1e6-5cb7-4278-9243-d74e439e00b3')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'edfe22cc-28d7-4a9a-85a9-6fac13225ca2', 40.0000, 20.0000, N'49fffe0d-3dc0-46b0-8441-8451d70bba63')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'd523d39b-26b4-4af2-b481-9c08c907ca03', 40.0000, 20.0000, N'f0074f93-9d29-4ec4-98ee-107cc8319f71')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'fb606611-962c-4684-aac9-d7e7532e8e5d', 40.0000, 20.0000, N'c38d1c9b-2bc3-4d2a-a8f9-b4c757f9f68d')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'd7b3cf40-3e27-4dfb-980a-d9d5e8d8d009', 40.0000, 20.0000, N'70ce6784-1a93-438c-b712-489db851f205')
INSERT [dbo].[Precios] ([idPrecios], [TemporadaAlta], [TemporadaBaja], [idVentas]) VALUES (N'e5546b92-35df-4509-a246-e36412a3aded', 40.0000, 20.0000, N'82cf0131-b38b-469c-bff0-a7d33e5baf48')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'ac0079b8-a631-43a6-b378-12fbbc805618', N'Centro, Monterrey, N.L.', N'Jalpan de Serra, Querétaro', N'657 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'692b2a53-ac76-4e15-9adf-2b6d9af47f01', N'Centro, Monterrey, N.L.', N'Centro, Mérida, Yucatan', N'2.200 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'c3a0ef6e-62d4-41b9-baff-2bfd1ac78fe2', N'Acapulco, Guerrero', N'Gómez Farías, Saltillo, Coah', N'1.218 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'cd74fe49-4aa8-49f7-84b1-38ab5a36708f', N'Centro, Monterrey, N.L.', N'Acapulco, Guerrero', N'1.282 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'b6ea7d60-2f12-4de0-9abc-573438a133c7', N'Centro, Monterrey, N.L.', N'Gral. Zaragoza, Tamaulipas', N'422 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'6248f1ac-b35a-4f68-a62e-574b6e77dc4a', N'Centro, Monterrey, N.L.', N'Pátzcuaro, Michoacán', N'881 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'0423dd83-963d-4dbb-b717-6d1e2d0bd7d3', N'Centro, Monterrey, N.L.', N'Baja California, Tijuana', N'2.361 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'50432ced-5991-45d9-a038-7a18abd1774a', N'Centro, Monterrey, N.L.', N'Valle Dorado, Manzanillo, Colima', N'1.100 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'ca059efb-6805-4952-9e18-863ca6e2a29a', N'Reynosa, Tamaulipas', N'Centro, Monterrey, N.L.', N'2.200 km')
INSERT [dbo].[Rutas] ([idRutas], [Origen], [Destino], [Distancia]) VALUES (N'81bc8248-8e9c-475e-a125-ea10a9357197', N'Durango, Durango', N'Centro, Monterrey, N.L.', N'2.200 km')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'07d47c07-f9f1-4a7f-bef3-0c614de4778a', 10, 20.0000, N'ca950812-e30e-4ab1-ab69-c1ced42ba9db')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'f0074f93-9d29-4ec4-98ee-107cc8319f71', 8, 30.0000, N'0dc2e8b0-bd94-4a32-b542-d187bde605b3')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'70ce6784-1a93-438c-b712-489db851f205', 18, 50.0000, N'd01fea8a-007e-4e73-ae23-8d702c4d1fc4')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'49fffe0d-3dc0-46b0-8441-8451d70bba63', 18, 30.0000, N'207b99b5-d4e5-4f80-ac41-1e379661c833')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'cc669062-ab2a-4ddd-90be-8cdb18a14260', 18, 50.0000, N'cb6257fd-e927-4c18-992c-ad664c1eddbe')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'd60debfb-8c20-439e-a930-9fc46cbd8a67', 45, 20.0000, N'643fc6aa-6584-4718-999c-9b5c44ebad7a')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'82cf0131-b38b-469c-bff0-a7d33e5baf48', 10, 20.0000, N'57a81516-dcbb-4270-9d3f-c489e4b7e368')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'c38d1c9b-2bc3-4d2a-a8f9-b4c757f9f68d', 2, 40.0000, N'34c58ffc-0176-417c-a8d8-aa1a0e6ff166')
INSERT [dbo].[Ventas] ([idVentas], [BoletosVendidos], [Precio], [idCajero]) VALUES (N'55b5b1e6-5cb7-4278-9243-d74e439e00b3', 8, 35.0000, N'42534fec-2bca-4313-9cdb-bace1fb9d529')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'616fb972-b4fa-4c5e-b6b4-032d22981f29', N'6248f1ac-b35a-4f68-a62e-574b6e77dc4a', N'0f4ed04d-c441-4274-8ddc-9685194b6804', N'6d0bf021-2229-419f-82a5-970812723024')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'cd3c4a29-38e6-476a-af4d-3e0c1a5dadc6', N'cd74fe49-4aa8-49f7-84b1-38ab5a36708f', N'45c837d9-c64b-48c9-ae0d-02000c9ba158', N'cbc51aa1-4514-4c88-95fd-5bf0799ef55c')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'5a61d568-9578-4a88-af79-4a71aea863e3', N'ac0079b8-a631-43a6-b378-12fbbc805618', N'31adc0ae-91bb-489a-97f1-2e8decabd087', N'2d67225d-6fcf-43e8-aab1-145c1856eee7')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'66462a51-98cb-47e3-b458-63b128a2fb4a', N'50432ced-5991-45d9-a038-7a18abd1774a', N'cea46005-c593-4722-8022-ac2eccf20410', N'ba72f1e8-b4a1-4fae-b0c6-a7c2597c97ef')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'70852e66-bc3e-4b2f-b459-b6a996332dca', N'c3a0ef6e-62d4-41b9-baff-2bfd1ac78fe2', N'e84e29ce-4417-4983-a4b6-64b4069caecd', N'0e508e96-3bc4-42f6-81dc-2ca58f2a1ab9')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'346f3a00-1883-4e7e-afe6-bf78c1a04db9', N'81bc8248-8e9c-475e-a125-ea10a9357197', N'6d237eb4-6a31-488b-9ef3-94bfd42fd9d1', N'c60ff062-2a21-48b5-8207-f325cd2e041e')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'8323f640-947b-4bb8-8a46-c6b53bd565b8', N'692b2a53-ac76-4e15-9adf-2b6d9af47f01', N'820f4b56-c93d-4d60-8e8e-d3315dec8412', N'b174e5e4-18ff-486a-85c7-1ab79c6248f5')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'd123489a-bbfe-480a-a4e5-d20dde367112', N'0423dd83-963d-4dbb-b717-6d1e2d0bd7d3', N'3f329092-bd7c-478a-a3a0-81c7604b660f', N'bb06d91c-207b-4bfc-ad99-a5668de856bd')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'9d3ec23b-e21c-4689-abbe-dd3d7532213d', N'b6ea7d60-2f12-4de0-9abc-573438a133c7', N'a269531f-f2b8-4568-9d18-a47f1008f056', N'edd846a5-c2db-47b3-86e3-96493e2d19da')
INSERT [dbo].[Viajes] ([idViajes], [idRutas], [idHorarios], [idCamion]) VALUES (N'4aefa84b-092b-4081-a6a1-f6c09842a667', N'ca059efb-6805-4952-9e18-863ca6e2a29a', N'b55eb839-5033-4006-8809-c7acffcefc34', N'8ca3b4ed-bb77-46ae-b68e-d823fe1920ad')
ALTER TABLE [dbo].[Boletos]  WITH CHECK ADD  CONSTRAINT [FK_Boletos_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idClientes])
GO
ALTER TABLE [dbo].[Boletos] CHECK CONSTRAINT [FK_Boletos_Clientes]
GO
ALTER TABLE [dbo].[Boletos]  WITH CHECK ADD  CONSTRAINT [FK_Boletos_Compras] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compras] ([idCompra])
GO
ALTER TABLE [dbo].[Boletos] CHECK CONSTRAINT [FK_Boletos_Compras]
GO
ALTER TABLE [dbo].[Boletos]  WITH CHECK ADD  CONSTRAINT [FK_Boletos_Viajes] FOREIGN KEY([idViajes])
REFERENCES [dbo].[Viajes] ([idViajes])
GO
ALTER TABLE [dbo].[Boletos] CHECK CONSTRAINT [FK_Boletos_Viajes]
GO
ALTER TABLE [dbo].[Cajeros]  WITH CHECK ADD  CONSTRAINT [FK_Cajeros_Empleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleados])
GO
ALTER TABLE [dbo].[Cajeros] CHECK CONSTRAINT [FK_Cajeros_Empleados]
GO
ALTER TABLE [dbo].[Camiones]  WITH CHECK ADD  CONSTRAINT [FK_Camiones_Asientos] FOREIGN KEY([idAsientos])
REFERENCES [dbo].[Asientos] ([idAsientos])
GO
ALTER TABLE [dbo].[Camiones] CHECK CONSTRAINT [FK_Camiones_Asientos]
GO
ALTER TABLE [dbo].[Camiones]  WITH CHECK ADD  CONSTRAINT [FK_Camiones_Choferes1] FOREIGN KEY([idChofer])
REFERENCES [dbo].[Choferes] ([idChofer])
GO
ALTER TABLE [dbo].[Camiones] CHECK CONSTRAINT [FK_Camiones_Choferes1]
GO
ALTER TABLE [dbo].[Choferes]  WITH CHECK ADD  CONSTRAINT [FK_Choferes_Empleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleados])
GO
ALTER TABLE [dbo].[Choferes] CHECK CONSTRAINT [FK_Choferes_Empleados]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Personas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Personas] ([idPersonas])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Personas]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Cajeros] FOREIGN KEY([idCajero])
REFERENCES [dbo].[Cajeros] ([idCajero])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Cajeros]
GO
ALTER TABLE [dbo].[Credenciales]  WITH CHECK ADD  CONSTRAINT [FK_Credenciales_Personas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Personas] ([idPersonas])
GO
ALTER TABLE [dbo].[Credenciales] CHECK CONSTRAINT [FK_Credenciales_Personas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Credenciales] FOREIGN KEY([idCredencial])
REFERENCES [dbo].[Credenciales] ([idCredencial])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Credenciales]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Personas] FOREIGN KEY([idPersonas])
REFERENCES [dbo].[Personas] ([idPersonas])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Personas]
GO
ALTER TABLE [dbo].[Precios]  WITH CHECK ADD  CONSTRAINT [FK_Precios_Ventas] FOREIGN KEY([idVentas])
REFERENCES [dbo].[Ventas] ([idVentas])
GO
ALTER TABLE [dbo].[Precios] CHECK CONSTRAINT [FK_Precios_Ventas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Cajeros] FOREIGN KEY([idCajero])
REFERENCES [dbo].[Cajeros] ([idCajero])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Cajeros]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Camiones] FOREIGN KEY([idCamion])
REFERENCES [dbo].[Camiones] ([idCamion])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Camiones]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Horarios] FOREIGN KEY([idHorarios])
REFERENCES [dbo].[Horarios] ([idHorarios])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Horarios]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Rutas] FOREIGN KEY([idRutas])
REFERENCES [dbo].[Rutas] ([idRutas])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Rutas]
GO
/****** Object:  StoredProcedure [dbo].[ChoferyPersona]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ChoferyPersona]
as
begin
	set nocount on
	Select * from Chofer
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[Datos_de_Cajeros]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Datos_de_Cajeros]
as
begin
	set nocount on
	Select * from DatosCajeros
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[Datos_Empleados]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Datos_Empleados]
as
begin
	set nocount on
	Select * from Datos_Empleado
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[Datos_Ventas]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Datos_Ventas]
as
begin
	set nocount on
	Select * from Datos_Venta
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[DatosCompraS]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DatosCompraS]
as
begin
	set nocount on
	Select * from Compra
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[DetallePersonas]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DetallePersonas]
as
begin
	set nocount on
	Select * from DetallesDePersonas
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[DetallesTiempo]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DetallesTiempo]
as
begin
	set nocount on
	Select * from Tiempo
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[EstudiantesRegistradoss]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[EstudiantesRegistradoss]
as
begin
	set nocount on
	Select * from EstudiantesRegistrados
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[InfoRutas]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InfoRutas]
as
begin
	set nocount on
	Select * from InfoRuta
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[InfosVentas]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InfosVentas]
as
begin
	set nocount on
	Select * from InfoVentas
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[RutasMasLargas]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[RutasMasLargas]
as
begin
	set nocount on
	Select * from RutaMasLarga
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[TOPN10]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[TOPN10] 
as
begin
	set nocount on
	Select * from TOP10
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[VCanToDeAs]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[VCanToDeAs]
as
begin 
	set nocount on
	Select * from CantidadTotalDeAsientos
	set nocount off

end
GO
/****** Object:  StoredProcedure [dbo].[VCaYEm]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[VCaYEm]
as
begin
	set nocount on 
	Select * from CamionYEmpleado
	set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[ZonaAsientos]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ZonaAsientos]
as
begin
	set nocount on
	Select * from ZonaDeAsientosPrecio
	set nocount off
end
GO
/****** Object:  Trigger [dbo].[ZonaPrecio]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[ZonaPrecio]
on [dbo].[Asientos] after insert,delete,update
as
set nocount on 
	Select PrecioAsiento, CantidadAsientos from Asientos
GO
ALTER TABLE [dbo].[Asientos] ENABLE TRIGGER [ZonaPrecio]
GO
/****** Object:  Trigger [dbo].[InfoBoletos]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[InfoBoletos]
on [dbo].[Boletos] after insert,delete,update
as
set nocount on 
	Select idCompra from Boletos
GO
ALTER TABLE [dbo].[Boletos] ENABLE TRIGGER [InfoBoletos]
GO
/****** Object:  Trigger [dbo].[DisponibleTipoA]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[DisponibleTipoA]
on [dbo].[Camiones] after update
as
set nocount on 
	Select * from Camiones where Matricula = '6853'
GO
ALTER TABLE [dbo].[Camiones] ENABLE TRIGGER [DisponibleTipoA]
GO
/****** Object:  Trigger [dbo].[EstudianteModficable]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create trigger [dbo].[EstudianteModficable]
on [dbo].[Clientes] after insert, delete, update
as
set nocount on 
	Select * from Clientes where tipo = 'Estudiante'
GO
ALTER TABLE [dbo].[Clientes] ENABLE TRIGGER [EstudianteModficable]
GO
/****** Object:  Trigger [dbo].[Chofi]    Script Date: 05/05/2018 11:30:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Chofi]
on [dbo].[Empleados] instead of insert
as
set nocount on
	Select * from Empleados where Puesto = 'Chofer'
GO
ALTER TABLE [dbo].[Empleados] ENABLE TRIGGER [Chofi]
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinal] SET  READ_WRITE 
GO
