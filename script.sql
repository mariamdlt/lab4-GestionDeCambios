USE [master]
GO
/****** Object:  Database [Pedidos]    Script Date: 05/06/2019 10:47:44 ******/
CREATE DATABASE [Pedidos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pedidos1', FILENAME = N'D:\Data\pedidos1.mdf' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 10%), 
 FILEGROUP [Secundario] 
( NAME = N'pedidos2', FILENAME = N'D:\Data\pedidos2.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'pedidos1_log', FILENAME = N'D:\Log\pedidos1log.ldf' , SIZE = 2048KB , MAXSIZE = 8192KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Pedidos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pedidos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pedidos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pedidos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pedidos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pedidos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pedidos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pedidos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pedidos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pedidos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pedidos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pedidos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pedidos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pedidos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pedidos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pedidos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pedidos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pedidos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pedidos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pedidos] SET  MULTI_USER 
GO
ALTER DATABASE [Pedidos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pedidos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pedidos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pedidos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pedidos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pedidos] SET QUERY_STORE = OFF
GO
USE [Pedidos]
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
USE [Pedidos]
GO
/****** Object:  Schema [catalogo]    Script Date: 05/06/2019 10:47:45 ******/
CREATE SCHEMA [catalogo]
GO
/****** Object:  Schema [movimiento]    Script Date: 05/06/2019 10:47:45 ******/
CREATE SCHEMA [movimiento]
GO
/****** Object:  Table [catalogo].[Ciudad]    Script Date: 05/06/2019 10:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Ciudad](
	[codciu] [char](3) NOT NULL,
	[nombre] [varchar](40) NULL,
 CONSTRAINT [pk_Ciudad] PRIMARY KEY CLUSTERED 
(
	[codciu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Cliente]    Script Date: 05/06/2019 10:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Cliente](
	[codcli] [char](3) NOT NULL,
	[codciu] [char](3) NOT NULL,
	[garante] [char](3) NOT NULL,
	[direnvio] [varchar](80) NULL,
	[credito] [numeric](7, 2) NULL,
	[descuento] [numeric](5, 2) NULL,
 CONSTRAINT [pk_Cliente] PRIMARY KEY CLUSTERED 
(
	[codcli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[DEUDOR]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[DEUDOR](
	[codCli] [char](3) NULL,
	[codigoGarante] [char](3) NULL,
	[limiteCredito] [numeric](7, 2) NULL,
	[saldoDeudor] [numeric](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [catalogo].[Producto]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Producto](
	[codpro] [char](3) NOT NULL,
	[nomprod] [varchar](40) NULL,
	[preunit] [numeric](7, 2) NULL,
	[stock] [smallint] NULL,
 CONSTRAINT [pk_Producto] PRIMARY KEY CLUSTERED 
(
	[codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Proveedor]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Proveedor](
	[codprov] [char](3) NOT NULL,
	[nomprov] [varchar](40) NULL,
 CONSTRAINT [pk_Proveedor] PRIMARY KEY CLUSTERED 
(
	[codprov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Telprov]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Telprov](
	[numtelf] [char](10) NOT NULL,
	[codprov] [char](3) NOT NULL,
 CONSTRAINT [pk_Telprov] PRIMARY KEY CLUSTERED 
(
	[numtelf] ASC,
	[codprov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [dbo].[Cabecera_Detalle]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabecera_Detalle](
	[codped] [char](3) NULL,
	[fecha] [datetime] NULL,
	[montototal] [numeric](10, 2) NULL,
	[codcli] [char](3) NULL,
	[numlinea] [tinyint] NULL,
	[preciou] [numeric](7, 2) NULL,
	[cantidad] [smallint] NULL,
	[codpro] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[CabezeraP]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[CabezeraP](
	[codped] [char](3) NOT NULL,
	[fecha] [datetime] NULL,
	[montototal] [numeric](10, 2) NULL,
	[codcli] [char](3) NOT NULL,
	[TipoPed] [char](7) NULL,
 CONSTRAINT [pk_CabezeraP] PRIMARY KEY CLUSTERED 
(
	[codped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[DetalleP]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[DetalleP](
	[numlinea] [tinyint] NOT NULL,
	[preciou] [numeric](7, 2) NULL,
	[cantidad] [smallint] NULL,
	[codped] [char](3) NOT NULL,
	[codpro] [char](3) NOT NULL,
 CONSTRAINT [pk_DetalleP] PRIMARY KEY CLUSTERED 
(
	[numlinea] ASC,
	[codped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[PAGOS]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[PAGOS](
	[codCli] [char](3) NOT NULL,
	[fechaPago] [date] NULL,
	[valorPago] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[Provee]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[Provee](
	[codprov] [char](3) NOT NULL,
	[codpro] [char](3) NOT NULL,
	[cantidad] [smallint] NULL,
 CONSTRAINT [pk_Provee] PRIMARY KEY CLUSTERED 
(
	[codprov] ASC,
	[codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [debetener] FOREIGN KEY([garante])
REFERENCES [catalogo].[Cliente] ([codcli])
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [debetener]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Ubicado] FOREIGN KEY([codciu])
REFERENCES [catalogo].[Ciudad] ([codciu])
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [Ubicado]
GO
ALTER TABLE [catalogo].[Telprov]  WITH CHECK ADD  CONSTRAINT [disponede] FOREIGN KEY([codprov])
REFERENCES [catalogo].[Proveedor] ([codprov])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [catalogo].[Telprov] CHECK CONSTRAINT [disponede]
GO
ALTER TABLE [movimiento].[CabezeraP]  WITH CHECK ADD  CONSTRAINT [Solicita] FOREIGN KEY([codcli])
REFERENCES [catalogo].[Cliente] ([codcli])
GO
ALTER TABLE [movimiento].[CabezeraP] CHECK CONSTRAINT [Solicita]
GO
ALTER TABLE [movimiento].[DetalleP]  WITH CHECK ADD  CONSTRAINT [perteneceproducto] FOREIGN KEY([codpro])
REFERENCES [catalogo].[Producto] ([codpro])
GO
ALTER TABLE [movimiento].[DetalleP] CHECK CONSTRAINT [perteneceproducto]
GO
ALTER TABLE [movimiento].[DetalleP]  WITH CHECK ADD  CONSTRAINT [tienedetalle] FOREIGN KEY([codped])
REFERENCES [movimiento].[CabezeraP] ([codped])
GO
ALTER TABLE [movimiento].[DetalleP] CHECK CONSTRAINT [tienedetalle]
GO
ALTER TABLE [movimiento].[Provee]  WITH CHECK ADD  CONSTRAINT [ProveeProducto] FOREIGN KEY([codpro])
REFERENCES [catalogo].[Producto] ([codpro])
GO
ALTER TABLE [movimiento].[Provee] CHECK CONSTRAINT [ProveeProducto]
GO
ALTER TABLE [movimiento].[Provee]  WITH CHECK ADD  CONSTRAINT [ProveeProveedor] FOREIGN KEY([codprov])
REFERENCES [catalogo].[Proveedor] ([codprov])
GO
ALTER TABLE [movimiento].[Provee] CHECK CONSTRAINT [ProveeProveedor]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_credito] CHECK  (([credito]<=(2000)))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [CK_credito]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Ck_descuento] CHECK  (([descuento]<=(100) AND [descuento]>=(0)))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [Ck_descuento]
GO
/****** Object:  Trigger [movimiento].[triggerCabeceraP]    Script Date: 05/06/2019 10:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger
[movimiento].[triggerCabeceraP]
on [movimiento].[CabezeraP]
after update, delete as
declare @codped Char(3);
declare @fecha Datetime;
declare @montototal
Numeric(10,2);
declare @codcli Char(3);
if exists(select * from
deleted) and exists(select *
from inserted)
begin
select @codped= codped,
@fecha = fecha, @montototal =
montototal,
@codcli = codcli from
inserted;
update Cabecera_Detalle set
fecha = @fecha,
montototal=@montototal,
codcli = @codcli where codped
= @codped;
end
else
begin
select @codped= codped from
deleted;
delete from Cabecera_Detalle
where codped=@codped;
end
GO
ALTER TABLE [movimiento].[CabezeraP] ENABLE TRIGGER [triggerCabeceraP]
GO
/****** Object:  Trigger [movimiento].[triggerDetalleP]    Script Date: 05/06/2019 10:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger
[movimiento].[triggerDetalleP]
on [movimiento].[DetalleP]
after insert, update, delete
as
declare @numlinea Tinyint;
declare @preciou
Numeric(7,2);
declare @cantidad Smallint;
declare @codped Char(3);
declare @codpro Char(3);
declare @fecha Datetime;
declare @montototal
Numeric(10,2);
declare @codcli Char(3);
if exists(select * from
inserted) and not
exists(select * from deleted)
begin
select @numlinea= numlinea,
@preciou = preciou,
@cantidad=cantidad,
@codped = codped, @codpro =
codpro from inserted;
select @codped= codped,
@fecha = fecha, @montototal =
montototal,
@codcli = codcli from
CabezeraP where codped =
@codped;
insert into
Cabecera_Detalle(codped,fecha
,montototal,codcli,numlinea,preciou,cantidad, codpro)
values
(@codped,@fecha,@montototal,@codcli,@numlinea,@preciou,@cantidad,@codpro);
end
if exists(select * from
inserted) and exists(select *
from deleted)
begin /* update the
tablaUnion after */
select @numlinea= numlinea,
@preciou = preciou,
@cantidad=cantidad,
@codped = codped, @codpro =
codpro from inserted;
update Cabecera_Detalle set
preciou=@preciou, cantidad =
@cantidad,
codpro = @codpro where
numlinea = @numlinea and
codped = @codped;
end
GO
ALTER TABLE [movimiento].[DetalleP] ENABLE TRIGGER [triggerDetalleP]
GO
/****** Object:  DdlTrigger [ddlt_PrevenirDDLDropTable]    Script Date: 05/06/2019 10:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [ddlt_PrevenirDDLDropTable]
ON DATABASE FOR DROP_TABLE
AS
RAISERROR ('DROP TABLE SIN AUTORIZACION', 10, 1);
ROLLBACK;
GO
DISABLE TRIGGER [ddlt_PrevenirDDLDropTable] ON DATABASE
GO
/****** Object:  DdlTrigger [TR_BorrarTablas]    Script Date: 05/06/2019 10:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [TR_BorrarTablas]
 ON DATABASE FOR DROP_TABLE
 AS
 BEGIN
 RAISERROR ('No está permitido borrar tablas!', 16, 1)
 ROLLBACK TRANSACTION
 END
GO
DISABLE TRIGGER [TR_BorrarTablas] ON DATABASE
GO
ENABLE TRIGGER [ddlt_PrevenirDDLDropTable] ON DATABASE
GO
ENABLE TRIGGER [TR_BorrarTablas] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [Pedidos] SET  READ_WRITE 
GO
