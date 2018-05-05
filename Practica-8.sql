USE [master]
GO
/****** Object:  Database [EjerciciosBdD]    Script Date: 06/04/2018 08:32:13 p. m. ******/
CREATE DATABASE [EjerciciosBdD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EjerciciosBdD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JairMoreno\MSSQL\DATA\EjerciciosBdD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EjerciciosBdD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JairMoreno\MSSQL\DATA\EjerciciosBdD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PracticasLBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EjerciciosBdD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EjerciciosBdD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET ARITHABORT OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EjerciciosBdD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EjerciciosBdD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EjerciciosBdD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EjerciciosBdD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EjerciciosBdD] SET  MULTI_USER 
GO
ALTER DATABASE EjerciciosBdD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EjerciciosBdD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EjerciciosBdD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EjerciciosBdD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EjerciciosBdD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EjerciciosBdD] SET QUERY_STORE = OFF
GO
USE [EjerciciosBdD]
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
USE [EjerciciosBdD]
GO
/****** Object:  UserDefinedFunction [dbo].[IVA]    Script Date: 06/04/2018 08:32:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IVA] (@Ingresos money) returns money as
	begin declare @Total money set @Total=@Ingresos + (@Ingresos*0.16) return @Total end;
GO
/****** Object:  UserDefinedFunction [dbo].[PersonaEmpleado]    Script Date: 06/04/2018 08:32:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[PersonaEmpleado] (@Puesto nvarchar(50))
	returns @Personas table
		(Nombre nvarchar(50), ApellidoP nvarchar(50), ApellidoS nvarchar(50)) 
	AS
	begin 
		INSERT @Personas SELECT Nombre, ApellidoP, ApellidoS FROM Empleado inner join Persona on Persona.ID=Empleado.idPersona WHERE Puesto=@Puesto 
		return
	end;
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 02/05/2018 08:32:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[ID] [uniqueidentifier] NOT NULL,
	[NoCamion] [int] NOT NULL,
	[idEmpleado] [uniqueidentifier] NOT NULL,
	[Modelo] [ntext] NOT NULL,
	[idRutas] [uniqueidentifier] NOT NULL,
	[Matricula] [int] NOT NULL,
	[Asientos] [int] NOT NULL,
	[AsientosOcupados] [int] NOT NULL,
	[AsientosDisponibles]  AS ([Asientos]-[AsientosOcupados]),
 CONSTRAINT [NumeroCamion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAsientos]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAsientos] AS SELECT Asientos, AsientosDisponibles, AsientosOcupados FROM Camion;
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [uniqueidentifier] NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[Puesto] [nvarchar](50) NOT NULL,
	[HorasSemanales] [int] NOT NULL,
	[SueldoHora] [money] NOT NULL,
	[SueldoTotal]  AS ([HorasSemanales]*[SueldoHora]),
	[idPersona] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwEmpleados]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwEmpleados] AS SELECT idPersona, Puesto, SueldoTotal FROM Empleado;
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[ID] [uniqueidentifier] NOT NULL,
	[CiudadOrigen] [ntext] NOT NULL,
	[CiudadDestino] [ntext] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[FechaLlegada] [datetime] NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwRutas]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRutas] AS SELECT CiudadOrigen, CiudadDestino FROM Rutas;
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID] [uniqueidentifier] NOT NULL,
	[PrecioBoleto] [money] NOT NULL,
	[idCliente] [uniqueidentifier] NOT NULL,
	[BoletosVendidos] [int] NOT NULL,
	[Ingresos]  AS ([PrecioBoleto]*[BoletosVendidos]),
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwVentas]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVentas] AS SELECT Ingresos FROM Venta;
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[ApellidoP] [nvarchar](50) NOT NULL,
	[ApellidoS] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [geography] NULL,
 CONSTRAINT [Nombre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPersonas]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonas] AS SELECT Nombre, ID FROM Persona;
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [uniqueidentifier] NOT NULL,
	[idPersona] [uniqueidentifier] NOT NULL,
	[idCredencial] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credencial]    Script Date: 02/05/2018 08:32:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credencial](
	[idPersona] [uniqueidentifier] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Foto] [image] NOT NULL,
	[Tipo] [ntext] NOT NULL,
 CONSTRAINT [PK_Credencial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Camion] ([ID], [NoCamion], [idEmpleado], [Modelo], [idRutas], [Matricula], [Asientos], [AsientosOcupados]) VALUES (N'6052cbb7-d3c3-46a5-b9f3-05c2e1f36d71', 698, N'b6cf69a9-ad15-4a37-aebd-f9461310ecfc', N'Turístico', N'9b7b99ed-1cad-454b-8bfd-7c90380b05aa', 681023, 65, 23)
INSERT [dbo].[Camion] ([ID], [NoCamion], [idEmpleado], [Modelo], [idRutas], [Matricula], [Asientos], [AsientosOcupados]) VALUES (N'c6067b98-b2dc-45f7-95e4-1ecfb1475f5b', 156, N'951c8284-21ba-40fd-84f6-082b0a7ae4f2', N'Turístico', N'b3ff3a43-1bc3-49c0-8e58-3fbed33079df', 533411, 65, 18)
INSERT [dbo].[Camion] ([ID], [NoCamion], [idEmpleado], [Modelo], [idRutas], [Matricula], [Asientos], [AsientosOcupados]) VALUES (N'ac34ed4d-774a-41d8-99e8-38abbf3ce28d', 169, N'dec4a6bf-bc63-4e6d-90e5-e6e03e321e6e', N'Familiar', N'7d211d24-ef78-4112-8aab-e3fd583be53c', 8563, 15, 2)
INSERT [dbo].[Camion] ([ID], [NoCamion], [idEmpleado], [Modelo], [idRutas], [Matricula], [Asientos], [AsientosOcupados]) VALUES (N'fde57e66-52ef-4b1c-98b4-46d134ec6d1e', 664, N'a8d62e2f-dea9-4c65-9bc3-da631b1ae33f', N'Familiar', N'b3753a65-5da1-40fb-aeb1-c05c2b149436', 634102, 15, 15)
INSERT [dbo].[Camion] ([ID], [NoCamion], [idEmpleado], [Modelo], [idRutas], [Matricula], [Asientos], [AsientosOcupados]) VALUES (N'6a61455a-0c7c-451f-afdb-c7764cd1e502', 965, N'88ea5db5-b863-47d7-b46e-a505ba3d0fbd', N'Normal', N'd313d40a-c333-4e60-beb5-9c939e669739', 58412, 40, 31)
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'3cc11be9-d296-4bf8-9718-47839d697954', N'1c760246-47bb-4798-a86b-a3162e3ebbbf', N'fea1cb7f-7a25-4d44-bcc4-1957e917051d')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'8c7f090f-6b86-4259-aa7a-53e21ea75f1e', N'11bf99ff-dd86-4d85-8903-01f23354bd30', N'd621abce-5df1-44d1-8802-37b72fe65ec3')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'81c371c0-114a-412d-b057-6021a81b46c5', N'feb5b820-924f-461c-af91-5957788ac5f7', N'6a9f77ce-77e7-4027-a723-0116030ee1a9')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'c8b5bc55-d605-45b7-8f41-63a5f334db6d', N'8e606853-3bcd-4adb-9971-b8d32af37ed6', N'75488981-2e96-4491-bb68-cca44b2ab3f3')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'8790e013-7023-4a71-b3de-65e8c4fed2e9', N'f809f71a-a644-413b-93c3-582a1ded58b2', N'e07f6b23-4cf8-4c91-bb20-1ab3d0b84fb7')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'0f637ed5-c9c1-4aa8-b60b-72aa765408e8', N'b63279ad-9d88-47b9-9b92-e6a3195464f9', N'7b771215-a122-42d8-882e-cd64655aea03')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'aaff36d9-9f7f-4535-a201-8ca885055ae7', N'6a7d6fc8-c66f-42d5-8fea-c3762e92570b', N'c9ac30bb-c928-4666-a997-1f29e0edcbe9')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'65deecd9-544d-41f8-9adb-c14df7690018', N'f659b784-4f79-4705-88eb-f0fe5363dc25', N'924ade71-da29-493d-87b9-ee5ee5140310')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'c73f7972-e8d0-437a-acf2-d7fcbb310834', N'6d81a774-2158-425c-997a-497c909efff3', N'96993e63-be96-433f-9ade-a01fd94020ba')
INSERT [dbo].[Cliente] ([ID], [idPersona], [idCredencial]) VALUES (N'47d79916-2d8d-4ddd-818c-ebca028af6e1', N'68e50c01-0eca-427c-85e1-9aacbf3b6144', N'2b66ce7d-bb67-4bfa-96e1-1bf9c02ab419')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'feb5b820-924f-461c-af91-5957788ac5f7', N'6a9f77ce-77e7-4027-a723-0116030ee1a9', 0x696D67312E6A7067, N'Adulto')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'1c760246-47bb-4798-a86b-a3162e3ebbbf', N'fea1cb7f-7a25-4d44-bcc4-1957e917051d', 0x666F746F2E6A7067, N'Adulto')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'f809f71a-a644-413b-93c3-582a1ded58b2', N'e07f6b23-4cf8-4c91-bb20-1ab3d0b84fb7', 0x666F746F2E6A7067, N'Estudiante')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'68e50c01-0eca-427c-85e1-9aacbf3b6144', N'2b66ce7d-bb67-4bfa-96e1-1bf9c02ab419', 0x696D67342E6A7067, N'Estudiante')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'6a7d6fc8-c66f-42d5-8fea-c3762e92570b', N'c9ac30bb-c928-4666-a997-1f29e0edcbe9', 0x666F746F2E6A7067, N'TerceraEdad')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'11bf99ff-dd86-4d85-8903-01f23354bd30', N'd621abce-5df1-44d1-8802-37b72fe65ec3', 0x666F746F2E6A7067, N'Adulto')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'6d81a774-2158-425c-997a-497c909efff3', N'96993e63-be96-433f-9ade-a01fd94020ba', 0x666F746F2E6A7067, N'Estudiante')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'8e606853-3bcd-4adb-9971-b8d32af37ed6', N'75488981-2e96-4491-bb68-cca44b2ab3f3', 0x696D672E6A7067, N'Adulto')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'b63279ad-9d88-47b9-9b92-e6a3195464f9', N'7b771215-a122-42d8-882e-cd64655aea03', 0x696D67332E6A7067, N'Adulto')
INSERT [dbo].[Credencial] ([idPersona], [ID], [Foto], [Tipo]) VALUES (N'f659b784-4f79-4705-88eb-f0fe5363dc25', N'924ade71-da29-493d-87b9-ee5ee5140310', 0x696D67322E6A7067, N'TerceraEdad')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'951c8284-21ba-40fd-84f6-082b0a7ae4f2', CAST(N'2017-11-08' AS Date), N'Aseo', 40, 35.0000, N'2a603610-7901-4739-8fef-2df6141f1307')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'a8e4de19-9251-4e0e-8319-3e0d163523ca', CAST(N'2017-12-05' AS Date), N'Chofer', 48, 30.0000, N'85fcfe38-19ee-4589-ae91-da2d3dbbf60b')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'ca7a0095-f82b-4dfa-8340-4c54dc2af99e', CAST(N'2017-11-10' AS Date), N'Chofer', 40, 40.0000, N'950612a3-e1a4-4f7d-8d03-44cbab53e2ba')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'94b0547b-726a-48f0-a33c-507d85a0d749', CAST(N'2017-12-05' AS Date), N'Chofer', 42, 23.0000, N'054bd2bf-2786-478a-9f61-4773cf71cd27')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'79565ae3-f722-4324-8af9-9772198692d1', CAST(N'2017-12-04' AS Date), N'Gerente', 48, 35.0000, N'0520b875-469d-4bf3-9602-e08daff68efd')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'88ea5db5-b863-47d7-b46e-a505ba3d0fbd', CAST(N'2017-11-11' AS Date), N'Cajero', 48, 22.0000, N'b6c05d76-82bf-4af1-a44c-3718c6f95680')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'14438f11-0bc8-4708-8766-bc2728e7a110', CAST(N'2017-12-04' AS Date), N'Cajero', 20, 20.0000, N'123c47f4-ac20-4779-b48e-5a387db6b0f0')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'a8d62e2f-dea9-4c65-9bc3-da631b1ae33f', CAST(N'2017-11-10' AS Date), N'Chofer', 20, 20.0000, N'35121d60-e435-426c-85aa-b9879a1b9b35')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'dec4a6bf-bc63-4e6d-90e5-e6e03e321e6e', CAST(N'2017-11-10' AS Date), N'Mecánico', 20, 50.0000, N'4ee33695-7661-475c-877e-953f8057391b')
INSERT [dbo].[Empleado] ([ID], [FechaIngreso], [Puesto], [HorasSemanales], [SueldoHora], [idPersona]) VALUES (N'b6cf69a9-ad15-4a37-aebd-f9461310ecfc', CAST(N'2017-12-05' AS Date), N'Chofer', 30, 23.0000, N'2b4af291-0ae3-4c93-be59-e985c192fb84')
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'11bf99ff-dd86-4d85-8903-01f23354bd30', N'Angel', N'de Leon', N'Salazar', CAST(N'1990-12-23' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'4e84ad25-3b75-4305-8c5e-0b7bf0ff96a0', N'Diego', N'Martinez', N'Lopez', CAST(N'1991-08-26' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'52e78651-1326-4cf6-977d-2424da778936', N'Margarita', N'Garza', N'Casas', CAST(N'1984-12-28' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'36da8a8e-2d64-4e1e-9000-2be95d452188', N'José', N'Madero', N'Vizcaíno', CAST(N'1981-09-17' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'2a603610-7901-4739-8fef-2df6141f1307', N'Jaime Humberto', N'Beltrán', N'Alvarado', CAST(N'1968-06-17' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'b6c05d76-82bf-4af1-a44c-3718c6f95680', N'Juanes', N'de la Garza', N'Garza', CAST(N'1992-04-15' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'950612a3-e1a4-4f7d-8d03-44cbab53e2ba', N'Alexis Iram', N'Maldonado', N'Lopez', CAST(N'1996-07-07' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'054bd2bf-2786-478a-9f61-4773cf71cd27', N'Maricela', N'Galarza', N'Cruz', CAST(N'1998-08-02' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'6d81a774-2158-425c-997a-497c909efff3', N'Mónica', N'Romero', N'Sanchez', CAST(N'1985-07-03' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'b1d16868-95ca-4e25-ac92-4d495f8b2744', N'Valeria', N'Dolores', N'Valdez', CAST(N'2005-11-10' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'f809f71a-a644-413b-93c3-582a1ded58b2', N'Roberto', N'Loreto', N'Macias', CAST(N'1998-09-30' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'feb5b820-924f-461c-af91-5957788ac5f7', N'Alessandra', N'Milan', N'Noyola', CAST(N'1986-02-22' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'123c47f4-ac20-4779-b48e-5a387db6b0f0', N'Eduardo', N'Cortéz', N'Cabello', CAST(N'1951-10-14' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'58418ed9-0b3e-4201-a17e-7b3e8e052a03', N'Alexia Sofia', N'Díaz', N'Manta', CAST(N'2010-01-23' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'0af457b1-e3a1-419c-b3ae-80496b3376e9', N'Diego Antonio', N'Barraza', N'Cantu', CAST(N'1980-03-27' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'3d851e11-877b-4315-bf88-8ea4fa426036', N'Leticia', N'Montez', N'Gutierrez', CAST(N'1996-07-13' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'4ee33695-7661-475c-877e-953f8057391b', N'Ricardo', N'Treviño', N'Arteaga', CAST(N'1978-10-02' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'68e50c01-0eca-427c-85e1-9aacbf3b6144', N'Angela', N'Saldaña', N'Medina', CAST(N'1994-11-02' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'1c760246-47bb-4798-a86b-a3162e3ebbbf', N'Josefa Dolores', N'Martinez', N'Lara', CAST(N'1995-09-15' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'41be2f4e-60e7-4c8f-8fb6-ac6129f07f5a', N'Rodrigo', N'Orozco', N'García', CAST(N'1994-08-14' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'8e606853-3bcd-4adb-9971-b8d32af37ed6', N'Mabel', N'Garza', N'Guevara', CAST(N'1996-09-30' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'617de673-cdf0-4c69-b8d5-b908c2cb11a0', N'Gonzalo', N'Montez', N'Lopez', CAST(N'2001-10-26' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'35121d60-e435-426c-85aa-b9879a1b9b35', N'Isaí', N'Jimenez', N'Madero', CAST(N'1965-01-31' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'6a7d6fc8-c66f-42d5-8fea-c3762e92570b', N'Yoselin', N'Ramirez', N'Casillas', CAST(N'1952-07-30' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'c804ada4-e9dd-472f-a5b0-c970cd6678e2', N'Marcos', N'Romero', N'Salas', CAST(N'1992-10-30' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'85fcfe38-19ee-4589-ae91-da2d3dbbf60b', N'José Gerardo', N'Plata', N'Zamarripa', CAST(N'1970-11-24' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'0520b875-469d-4bf3-9602-e08daff68efd', N'Raul', N'Aguirre', N'Aguilar', CAST(N'1961-06-01' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'b63279ad-9d88-47b9-9b92-e6a3195464f9', N'Valeria', N'Valdes', N'Briseño', CAST(N'1987-04-18' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'2b4af291-0ae3-4c93-be59-e985c192fb84', N'Daniela Alberta', N'Alanis', N'Escobedo', CAST(N'1978-02-25' AS Date), NULL)
INSERT [dbo].[Persona] ([ID], [Nombre], [ApellidoP], [ApellidoS], [FechaNacimiento], [Direccion]) VALUES (N'f659b784-4f79-4705-88eb-f0fe5363dc25', N'Sergio', N'Cavazos', N'Lugo', CAST(N'1964-03-15' AS Date), NULL)
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'b3ff3a43-1bc3-49c0-8e58-3fbed33079df', N'Monterrey', N'Queretaro', CAST(N'2018-10-24T00:21:00.000' AS DateTime), CAST(N'2018-08-15T00:00:20.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'7e915f9f-089b-412c-bb64-562ff2c41849', N'Yucatan', N'Monterrey', CAST(N'2018-10-27T00:16:40.000' AS DateTime), CAST(N'2018-10-28T00:09:00.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'8a99a04c-bb46-49a1-806e-5d364fc8afb9', N'Mazatlan', N'Toluca', CAST(N'2018-07-16T00:14:05.000' AS DateTime), CAST(N'2018-07-16T00:17:45.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'9b7b99ed-1cad-454b-8bfd-7c90380b05aa', N'Monterrey', N'Juarez', CAST(N'2018-09-12T00:18:30.000' AS DateTime), CAST(N'2018-09-12T00:20:10.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'21efdfc3-f5ef-4bbd-a7a0-8b4e21865525', N'Santiago', N'Toluca', CAST(N'2018-03-24T00:20:30.000' AS DateTime), CAST(N'2018-03-25T00:12:15.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'd313d40a-c333-4e60-beb5-9c939e669739', N'Real de Catorce', N'Santiago', CAST(N'2018-04-27T00:17:45.000' AS DateTime), CAST(N'2018-07-27T00:20:15.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'f2612393-97d8-43c3-807f-adf9fc78f657', N'Monterrey', N'Saltillo', CAST(N'2018-04-04T00:19:45.000' AS DateTime), CAST(N'2018-04-04T00:21:45.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'b3753a65-5da1-40fb-aeb1-c05c2b149436', N'Monterrey', N'Cancun', CAST(N'2018-03-19T00:06:40.000' AS DateTime), CAST(N'2018-03-19T00:21:45.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'7d211d24-ef78-4112-8aab-e3fd583be53c', N'Matacanes', N'Monterrey', CAST(N'2018-03-31T00:07:30.000' AS DateTime), CAST(N'2018-03-31T00:10:15.000' AS DateTime))
INSERT [dbo].[Rutas] ([ID], [CiudadOrigen], [CiudadDestino], [FechaSalida], [FechaLlegada]) VALUES (N'd37c6a74-75d0-4a28-b7b1-fb0999ed65be', N'Montemorelos', N'Santiago', CAST(N'2018-01-02T00:08:10.000' AS DateTime), CAST(N'2018-01-02T00:13:50.000' AS DateTime))
INSERT [dbo].[Venta] ([ID], [PrecioBoleto], [idCliente], [BoletosVendidos]) VALUES (N'baea5dca-68a6-46d6-bdce-2361aba4fd1c', 80.0000, N'0f637ed5-c9c1-4aa8-b60b-72aa765408e8', 1)
INSERT [dbo].[Venta] ([ID], [PrecioBoleto], [idCliente], [BoletosVendidos]) VALUES (N'fd839823-f5d2-4a2c-b17e-251ca1c7991b', 50.0000, N'81c371c0-114a-412d-b057-6021a81b46c5', 3)
INSERT [dbo].[Venta] ([ID], [PrecioBoleto], [idCliente], [BoletosVendidos]) VALUES (N'f281c26a-9861-480f-82e9-aaf0de5d43cf', 60.0000, N'8c7f090f-6b86-4259-aa7a-53e21ea75f1e', 1)
INSERT [dbo].[Venta] ([ID], [PrecioBoleto], [idCliente], [BoletosVendidos]) VALUES (N'7c92a1a7-f56e-4115-862e-c1eaf0ce1a98', 80.0000, N'c8b5bc55-d605-45b7-8f41-63a5f334db6d', 1)
INSERT [dbo].[Venta] ([ID], [PrecioBoleto], [idCliente], [BoletosVendidos]) VALUES (N'1865323b-c4ac-47d2-bf9d-f3e5bc3002d8', 80.0000, N'c73f7972-e8d0-437a-acf2-d7fcbb310834', 1)
/****** Object:  Index [ApellidoP]    Script Date: 02/05/2018 08:32:16 p. m. ******/
CREATE NONCLUSTERED INDEX [ApellidoP] ON [dbo].[Persona]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ApellidoS]    Script Date: 02/05/2018 08:32:16 p. m. ******/
CREATE NONCLUSTERED INDEX [ApellidoS] ON [dbo].[Persona]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Empleado1] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Empleado1]
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Rutas] FOREIGN KEY([idRutas])
REFERENCES [dbo].[Rutas] ([ID])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Rutas]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Credencial] FOREIGN KEY([idCredencial])
REFERENCES [dbo].[Credencial] ([ID])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Credencial]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Persona1] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Persona1]
GO
ALTER TABLE [dbo].[Credencial]  WITH CHECK ADD  CONSTRAINT [FK_Credencial_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Credencial] CHECK CONSTRAINT [FK_Credencial_Persona]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Persona1] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Persona1]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[BuscarAsientos]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarAsientos] @IdRuta uniqueidentifier AS SELECT NoCamion, AsientosDisponibles FROM Camion WHERE idRutas=@IdRuta;
GO
/****** Object:  StoredProcedure [dbo].[BuscarEmpleados]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarEmpleados] @Puesto nvarchar(50) AS SELECT * FROM Empleado WHERE Puesto=@Puesto;
GO
/****** Object:  StoredProcedure [dbo].[BuscarIngresos]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarIngresos] @Precio money AS SELECT * FROM Venta WHERE PrecioBoleto=@Precio;
GO
/****** Object:  StoredProcedure [dbo].[BuscarPersonas]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPersonas] @Nombre nvarchar(50) AS SELECT * FROM Persona WHERE Nombre=@Nombre;
GO
/****** Object:  StoredProcedure [dbo].[BuscarRutas]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarRutas] @ID uniqueidentifier AS SELECT * FROM Rutas WHERE ID=@ID;
GO
/****** Object:  Trigger [dbo].[trCamion]    Script Date: 02/05/2018 08:32:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trCamion] on [dbo].[Camion] AFTER UPDATE AS begin insert into Camion (AsientosOcupados) VALUES (0) end;
GO
ALTER TABLE [dbo].[Camion] ENABLE TRIGGER [trCamion]
GO
/****** Object:  Trigger [dbo].[trPersona]    Script Date: 02/05/2018 08:32:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trPersona] ON [dbo].[Persona] INSTEAD OF INSERT AS begin insert into Persona (Nombre, ApellidoP, ApellidoS) VALUES ('','','') end;
GO
ALTER TABLE [dbo].[Persona] ENABLE TRIGGER [trPersona]
GO
USE [master]
GO
ALTER DATABASE [EjerciciosBdD] SET  READ_WRITE 
GO