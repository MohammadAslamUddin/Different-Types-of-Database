USE [master]
GO
/****** Object:  Database [ManagementDB]    Script Date: 5/30/2020 6:01:20 AM ******/
CREATE DATABASE [ManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [ManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ManagementDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CompanyId] [int] NULL,
	[CategoryId] [int] NULL,
	[ReorderLabel] [int] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetAllItems]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllItems] AS SELECT 
I.Name, I.ReorderLabel, I.AvailableQuantity, I.CategoryId, I.CompanyId,
Ca.Name AS CategoryName, 
Co.Name AS CompanyName 
FROM Item AS I INNER JOIN Category AS Ca 
ON I.CategoryId = Ca.Id INNER JOIN Company AS Co 
ON I.CompanyId = Co.Id
WHERE AvailableQuantity != 0;
GO
/****** Object:  View [dbo].[GetReport]    Script Date: 5/30/2020 6:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetReport]
AS
SELECT        dbo.Item.Name AS ItemName, dbo.Company.Name AS CompanyName, dbo.StockOut.Quantity, dbo.StockOut.Date
FROM            dbo.StockOut INNER JOIN
                         dbo.Item ON dbo.Item.Id = dbo.StockOut.ItemId INNER JOIN
                         dbo.Company ON dbo.Company.Id = dbo.Item.CompanyId
WHERE        (dbo.StockOut.Type = 'SELL')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (26, N'Computer')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (28, N'Cycle')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (27, N'Laptop')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (25, N'Mobile')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (29, N'MotorCycle')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (23, N'Apple')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (27, N'Bajaj')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (29, N'BMW')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (25, N'Core')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (19, N'DELL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (31, N'Hawai')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (28, N'Hero')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (20, N'HP')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (21, N'Lenovo')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (32, N'MI')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (30, N'Samsung')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (22, N'Toushiba')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (24, N'Veloce')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (26, N'Yamaha')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (14, N'Maya 2019', 23, 26, 14, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (15, N'Project 3.0', 25, 28, 10, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (16, N'Pavilion 14 touch Screen', 20, 27, 7, 60)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (17, N'Note 7', 32, 25, 10, 60)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (18, N'S 1000 RR', 29, 29, 5, 31)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (19, N'R 1250 GS', 29, 29, 7, 17)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (20, N'602', 24, 28, 5, 18)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (21, N'Project 2.0', 25, 28, 10, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLabel], [AvailableQuantity]) VALUES (22, N'Dell 2560', 19, 27, 3, 4)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (1, 14, 14, CAST(0xEB3F0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (2, 18, 5, CAST(0xEB3F0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (3, 16, 10, CAST(0xEB3F0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (4, 19, 8, CAST(0xEB3F0B00 AS Date), N'DAMAGE')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (5, 22, 5, CAST(0xEB3F0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (6, 20, 7, CAST(0xEB3F0B00 AS Date), N'DAMAGE')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (1002, 14, 15, CAST(0xDC400B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (1003, 15, 12, CAST(0xDC400B00 AS Date), N'SELL')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Category]    Script Date: 5/30/2020 6:01:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Category] ON [dbo].[Category]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 5/30/2020 6:01:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Company]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
USE [master]
GO
ALTER DATABASE [ManagementDB] SET  READ_WRITE 
GO
