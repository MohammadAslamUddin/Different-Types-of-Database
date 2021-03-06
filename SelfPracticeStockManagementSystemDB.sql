USE [master]
GO
/****** Object:  Database [SelfPracticeStockManagementSystemDB]    Script Date: 5/30/2020 6:05:29 AM ******/
CREATE DATABASE [SelfPracticeStockManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SelfPracticeStockManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SelfPracticeStockManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SelfPracticeStockManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SelfPracticeStockManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SelfPracticeStockManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SelfPracticeStockManagementSystemDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2020 6:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/30/2020 6:05:30 AM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 5/30/2020 6:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[Name] [varchar](50) NULL,
	[ReorderLevel] [int] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 5/30/2020 6:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Type] [text] NULL,
	[Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Chipz')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Cold Drinks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Rice')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Chocolate')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Accar')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'IceCreams')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Cadbery')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Pran Up')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Cocola')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1002, N'Rices')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1003, N'Chicken')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1004, N'Chess')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1005, N'Chickens')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1006, N'Cold Drink')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'Pran')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'Raja')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'BDFoods')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Unilivar')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'BD')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [AvailableQuantity]) VALUES (1, 1, 2, N'Potato Chips', 14, 20)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [AvailableQuantity]) VALUES (2, 4, 3, N'kismis', 15, 19)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [AvailableQuantity]) VALUES (3, 2, 1, N'khirmix', 14, 35)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [AvailableQuantity]) VALUES (4, 1, 2, N'CokoCoko', 15, 37)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [AvailableQuantity]) VALUES (5, 3, 5, N'Half Boiled', 0, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Item]    Script Date: 5/30/2020 6:05:30 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Item] ON [dbo].[Item]
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
USE [master]
GO
ALTER DATABASE [SelfPracticeStockManagementSystemDB] SET  READ_WRITE 
GO
