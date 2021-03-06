USE [master]
GO
/****** Object:  Database [Stock_Management]    Script Date: 5/30/2020 6:06:03 AM ******/
CREATE DATABASE [Stock_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stock_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Stock_Management.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Stock_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Stock_Management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Stock_Management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stock_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stock_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stock_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stock_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stock_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stock_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stock_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stock_Management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Stock_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stock_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stock_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stock_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stock_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stock_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stock_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stock_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stock_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stock_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stock_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stock_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stock_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stock_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stock_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stock_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stock_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Stock_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Stock_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stock_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stock_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stock_Management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Stock_Management]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2020 6:06:03 AM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 5/30/2020 6:06:03 AM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 5/30/2020 6:06:03 AM ******/
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
	[ReorderLavel] [int] NULL,
	[AvailableQuentity] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 5/30/2020 6:06:03 AM ******/
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
/****** Object:  View [dbo].[GetAllItems]    Script Date: 5/30/2020 6:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllItems]
AS

SELECT 
I.Name, 
I.ReorderLavel, 
I.AvailableQuentity, 
I.CategoryId,
I.CompanyId,
Ca.Name AS CategoryName, 
Co.Name AS CompanyName 
FROM 
Item AS I 
INNER JOIN 
Category AS Ca 
ON I.CategoryId = Ca.Id 
INNER JOIN Company AS Co 
ON I.CompanyId = Co.Id
WHERE AvailableQuentity != 0


GO
/****** Object:  View [dbo].[GetReport]    Script Date: 5/30/2020 6:06:03 AM ******/
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

INSERT [dbo].[Category] ([Id], [Name]) VALUES (12, N'Phones')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (13, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (14, N'Keyboard')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (17, N'Stationary')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (18, N'Softwares')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (20, N'Pen Drives')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (21, N'Computers')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (9, N'Apple')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (10, N'A4Tech')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (11, N'MI')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (12, N'Walton')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (13, N'Google')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (14, N'MicroSoft')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (15, N'HTC')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (16, N'Maximus')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (17, N'MicroMax')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (8, N'Iphone X', 9, 12, 2, 2)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (9, N'Note 5 Pro', 11, 12, 5, 30)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (10, N'Waltor Z', 12, 12, 2, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (11, N'Ipod', 9, 13, 10, 9)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (12, N'I phone 6s', 9, 12, 5, 6)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (13, N'i phone 7', 9, 12, 2, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (14, N'I Phone 20', 9, 12, 2, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (15, N'MI S2', 9, 12, 2, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (16, N'Makon', 10, 14, 5, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (17, N'Windows 10', 14, 18, 2, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (18, N'32GB Perdrive', 10, 20, 5, 53)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (19, N'64GB Pendrive', 10, 20, 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (20, N'MI A2', 11, 12, 5, 80)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLavel], [AvailableQuentity]) VALUES (21, N'OO1', 11, 12, 100, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (1, 8, 5, CAST(0x903E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (2, 9, 5, CAST(0x903E0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (3, 9, 5, CAST(0x903E0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (4, 12, 5, CAST(0x903E0B00 AS Date), N'DAMAGE')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (5, 11, 5, CAST(0x8E3E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (6, 11, 2, CAST(0x903E0B00 AS Date), N'DAMAGE')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (7, 11, 2, CAST(0x903E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (8, 11, 2, CAST(0x903E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (9, 12, 5, CAST(0x8F3E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (10, 17, 5, CAST(0x953E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (11, 9, 5, CAST(0xA43E0B00 AS Date), N'DAMAGE')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (12, 18, 10, CAST(0xA43E0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (13, 18, 20, CAST(0xA43E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (14, 20, 10, CAST(0xA43E0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (15, 9, 10, CAST(0xA43E0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (16, 9, 5, CAST(0xA43E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (17, 18, 10, CAST(0xA43E0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (18, 20, 10, CAST(0xE93F0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (19, 8, 3, CAST(0xEA3F0B00 AS Date), N'SELL')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (20, 17, 2, CAST(0xEA3F0B00 AS Date), N'LOST')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [Type]) VALUES (21, 18, 7, CAST(0xEB3F0B00 AS Date), N'DAMAGE')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Item__737584F68C541733]    Script Date: 5/30/2020 6:06:03 AM ******/
ALTER TABLE [dbo].[Item] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Items_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Items_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Items_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -31
         Left = 0
      End
      Begin Tables = 
         Begin Table = "StockOut"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetReport'
GO
USE [master]
GO
ALTER DATABASE [Stock_Management] SET  READ_WRITE 
GO
