USE [Senda]
GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boletos](
	[Id] [uniqueidentifier] NOT NULL,
	[IdViaje] [uniqueidentifier] NULL,
	[Asiento] [char](10) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Boletos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Camiones]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Camiones](
	[IdCamion] [uniqueidentifier] NOT NULL,
	[CantAsientos] [int] NULL,
	[TipoServicio] [char](10) NULL,
	[CostoAsiento] [money] NULL,
 CONSTRAINT [PK_Camiones] PRIMARY KEY CLUSTERED 
(
	[IdCamion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdClientes] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NULL,
	[Tipo] [nchar](10) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NULL,
	[Tipo] [nchar](10) NULL,
	[Telefono] [numeric](18, 0) NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lugares]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lugares](
	[IdLugar] [uniqueidentifier] NOT NULL,
	[CoordenadasGeo] [geography] NULL,
	[Estado] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
 CONSTRAINT [PK_Lugares] PRIMARY KEY CLUSTERED 
(
	[IdLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Genero] [bit] NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Puestos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Puestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[IdCliente] [uniqueidentifier] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 03/03/2018 02:24:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[IdRuta] [uniqueidentifier] NOT NULL,
	[IdChofer] [uniqueidentifier] NULL,
	[IdCamiones] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Viajes] PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Camiones]  WITH CHECK ADD  CONSTRAINT [FK_Camiones_Venta] FOREIGN KEY([IdCamion])
REFERENCES [dbo].[Venta] ([Id])
GO
ALTER TABLE [dbo].[Camiones] CHECK CONSTRAINT [FK_Camiones_Venta]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Personas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Personas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Puestos] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Puestos] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Puestos]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Boletos] FOREIGN KEY([Id])
REFERENCES [dbo].[Boletos] ([Id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Boletos]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Clientes] FOREIGN KEY([Id])
REFERENCES [dbo].[Clientes] ([IdClientes])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Clientes]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Boletos] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Boletos] ([Id])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Boletos]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Camiones] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Camiones] ([IdCamion])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Camiones]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Lugares] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Lugares]
GO
