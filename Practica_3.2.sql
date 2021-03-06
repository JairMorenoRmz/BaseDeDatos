USE [SENDA]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[IdAsientos] [uniqueidentifier] NOT NULL,
	[IdCamiones] [uniqueidentifier] NULL,
	[Num_Asientos] [int] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Asientos] PRIMARY KEY CLUSTERED 
(
	[IdAsientos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boletos](
	[IdBoleto] [uniqueidentifier] NOT NULL,
	[IdViaje] [uniqueidentifier] NULL,
	[Asiento] [char](10) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Boletos] PRIMARY KEY CLUSTERED 
(
	[IdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Camiones]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Camiones](
	[IdCamion] [uniqueidentifier] NOT NULL,
	[IdChofer] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[Choferes]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choferes](
	[IdChofer] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[IdDireccion] [uniqueidentifier] NULL,
	[Licencia] [text] NULL,
 CONSTRAINT [PK_Choferes] PRIMARY KEY CLUSTERED 
(
	[IdChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdClientes] [uniqueidentifier] NULL,
	[IdViaje] [uniqueidentifier] NULL,
	[Asiento] [char](10) NULL,
	[Precio] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle Venta]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalle Venta](
	[IdVenta] [uniqueidentifier] NOT NULL,
	[IdBoleto] [uniqueidentifier] NULL,
	[Precio] [money] NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Detalle Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [uniqueidentifier] NOT NULL,
	[codigoPostal] [numeric](18, 0) NULL,
	[Calle] [text] NULL,
	[Provincia] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[TipoDeVia] [text] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdDireccion] [uniqueidentifier] NULL,
	[IdPersona] [uniqueidentifier] NULL,
	[IdChofer] [uniqueidentifier] NULL,
	[Telefono] [numeric](18, 0) NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lugares]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lugares](
	[IdLugar] [uniqueidentifier] NOT NULL,
	[CoordenadaGeo] [geography] NULL,
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
/****** Object:  Table [dbo].[Personas]    Script Date: 17/03/2018 01:42:56 a. m. ******/
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
	[Genero] [char](10) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rutas](
	[IdRuta] [uniqueidentifier] NOT NULL,
	[Ordinario] [varchar](50) NULL,
	[Destino] [varchar](50) NULL,
	[Distancia] [text] NULL,
	[Tiempo] [date] NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 17/03/2018 01:42:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[IdCliente] [uniqueidentifier] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 17/03/2018 01:42:56 a. m. ******/
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
ALTER TABLE [dbo].[Boletos]  WITH CHECK ADD  CONSTRAINT [FK_Boletos_Detalle Venta] FOREIGN KEY([IdBoleto])
REFERENCES [dbo].[Detalle Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Boletos] CHECK CONSTRAINT [FK_Boletos_Detalle Venta]
GO
ALTER TABLE [dbo].[Boletos]  WITH CHECK ADD  CONSTRAINT [FK_Boletos_Viajes] FOREIGN KEY([IdBoleto])
REFERENCES [dbo].[Viajes] ([IdRuta])
GO
ALTER TABLE [dbo].[Boletos] CHECK CONSTRAINT [FK_Boletos_Viajes]
GO
ALTER TABLE [dbo].[Camiones]  WITH CHECK ADD  CONSTRAINT [FK_Camiones_Asientos] FOREIGN KEY([IdCamion])
REFERENCES [dbo].[Asientos] ([IdAsientos])
GO
ALTER TABLE [dbo].[Camiones] CHECK CONSTRAINT [FK_Camiones_Asientos]
GO
ALTER TABLE [dbo].[Camiones]  WITH CHECK ADD  CONSTRAINT [FK_Camiones_Venta] FOREIGN KEY([IdCamion])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Camiones] CHECK CONSTRAINT [FK_Camiones_Venta]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Boletos] FOREIGN KEY([IdClientes])
REFERENCES [dbo].[Boletos] ([IdBoleto])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Boletos]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Personas] FOREIGN KEY([IdClientes])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Personas]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Choferes] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Choferes] ([IdChofer])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Choferes]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Personas] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Personas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Choferes] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Choferes] ([IdChofer])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Choferes]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Personas] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Personas]
GO
ALTER TABLE [dbo].[Lugares]  WITH CHECK ADD  CONSTRAINT [FK_Lugares_Rutas] FOREIGN KEY([IdLugar])
REFERENCES [dbo].[Rutas] ([IdRuta])
GO
ALTER TABLE [dbo].[Lugares] CHECK CONSTRAINT [FK_Lugares_Rutas]
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Viajes] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Viajes] ([IdRuta])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Viajes]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Detalle Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Detalle Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Detalle Venta]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Camiones] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Camiones] ([IdCamion])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Camiones]
GO
