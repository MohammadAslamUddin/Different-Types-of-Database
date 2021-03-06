USE [master]
GO
/****** Object:  Database [CampusADBMS]    Script Date: 5/30/2020 5:57:42 AM ******/
CREATE DATABASE [CampusADBMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampusADBMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CampusADBMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CampusADBMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CampusADBMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CampusADBMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CampusADBMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CampusADBMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CampusADBMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CampusADBMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CampusADBMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CampusADBMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CampusADBMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CampusADBMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CampusADBMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CampusADBMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CampusADBMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CampusADBMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CampusADBMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CampusADBMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CampusADBMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CampusADBMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CampusADBMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CampusADBMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CampusADBMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CampusADBMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CampusADBMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CampusADBMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CampusADBMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CampusADBMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CampusADBMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CampusADBMS] SET  MULTI_USER 
GO
ALTER DATABASE [CampusADBMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CampusADBMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CampusADBMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CampusADBMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CampusADBMS]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/30/2020 5:57:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RollNo] [int] NOT NULL,
	[Registration] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[BatchNo] [int] NULL,
	[DeparmentName] [varchar](50) NOT NULL,
	[CGPA] [float] NULL,
	[Salary] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 5/30/2020 5:57:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table2]    Script Date: 5/30/2020 5:57:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CGPA] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
 CONSTRAINT [PK_Table2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (1, 17010101, 651, N'Fatema Tuz Zohora', N'01864754367', N'fatematuzzohora10@gmail.com', 29, N'CSE', 4, 50000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (2, 17010103, 653, N'Tanmoy Dhar', N'01852737069', N'tanmoy685@gmail.com', 29, N'CSE', 3.75, 40000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (3, 17010104, 654, N'Mohammad Shahinul Islam', N'01994449224', N'sravonrokon99@gmail.com', 29, N'CSE', 3.5, 45000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (4, 17010105, 655, N'Md. Arfat Ali', N'01820075695', N'aliarfaat272@gmail.com', 29, N'CSE', 4, 46000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (5, 17010106, 656, N'Srabani Banik', N'01516131722', N'srabonibanik42@gmail.com', 29, N'CSE', 3.75, 55000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (6, 17010107, 657, N'Anjan Nandy', N'01775198716', N'anjannandy2@gmail.com', 29, N'CSE', 3.5, 52500.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (7, 17010108, 658, N'Mizanur Rahman', N'01521400584', N'mizanurrahman1729@gmail.com', 29, N'CSE', 3.5, 200000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (8, 17010110, 660, N'Piku Das', N'01864492676', N'pikudasustc@gmail.com', 29, N'CSE', 3.75, 100000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (9, 17010111, 661, N'Israt Sharmin', N'01863347777', N'isratsharmin2323@gmail.com', 29, N'CSE', 4, 120000.0000)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentName], [CGPA], [Salary]) VALUES (10, 17010112, 662, N'Iftakhar Uddin Ifty', N'01400410908', N'eftykharmahmud04@gmail.com', 29, N'CSE', 3.75, 124000.0000)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Table1] ON 

INSERT [dbo].[Table1] ([Id], [Name]) VALUES (1, N'Rubi')
INSERT [dbo].[Table1] ([Id], [Name]) VALUES (2, N'Rupom')
INSERT [dbo].[Table1] ([Id], [Name]) VALUES (3, N'Jibon')
INSERT [dbo].[Table1] ([Id], [Name]) VALUES (4, N'Sofi')
INSERT [dbo].[Table1] ([Id], [Name]) VALUES (5, N'Rakib')
INSERT [dbo].[Table1] ([Id], [Name]) VALUES (6, N'Niloy')
SET IDENTITY_INSERT [dbo].[Table1] OFF
SET IDENTITY_INSERT [dbo].[Table2] ON 

INSERT [dbo].[Table2] ([Id], [Name], [CGPA], [Address]) VALUES (1, N'Rahim', N'3.7', N'Sylhet')
INSERT [dbo].[Table2] ([Id], [Name], [CGPA], [Address]) VALUES (2, N'karim', N'3.5', N'Bashkhali')
INSERT [dbo].[Table2] ([Id], [Name], [CGPA], [Address]) VALUES (3, N'Rofik', N'4', N'Rongpur')
INSERT [dbo].[Table2] ([Id], [Name], [CGPA], [Address]) VALUES (4, N'Shofik', N'3.45', N'Lokkipur')
INSERT [dbo].[Table2] ([Id], [Name], [CGPA], [Address]) VALUES (5, N'Joy', N'4', N'Gumdondi')
SET IDENTITY_INSERT [dbo].[Table2] OFF
USE [master]
GO
ALTER DATABASE [CampusADBMS] SET  READ_WRITE 
GO
