USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 5/30/2020 5:59:17 AM ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/30/2020 5:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/30/2020 5:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[BloodGroup] [varchar](3) NULL,
	[Address] [varchar](500) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (1, N'Computer Science & Engeineering', N'CSE')
INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (2, N'Electrical & Enginerring', N'EEE')
INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (3, N'Electrical and Telecommunication Engineering', N'ECE')
INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (4, N'Business & Statistics', N'BS')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (1, N'Aslam Uddin', N'aslamuddin0@gmail.com', N'01825317029', N'O+', N'East Gomdandi, Boalkhali, Chittagong, Bangladesh', 1)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (2, N'Hasan Uddin', N'hasanuddin@gmail.com', N'01817737378', N'B+', N'KM Monjil,East Gomdandi, Boalkhali, Chittagong, Bangladesh', 3)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (3, N'Angshu Dutta', N'angshudutta@gmail.com', N'01876867181', N'A+', N'New Chandgao, Chittagong, Bangladesh', 4)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (4, N'Mizanur Rahman', N'mizan@gmail.com', N'01513203040', N'B+', N'2no gate, Chittagong, Bangladesh', 2)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (3003, N'Monir', N'monir@gmail.com', N'01199334456', N'B-', N'Out of the city', 2)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (3004, N'Sushmita', N'sush@gamil.com', N'01283984028', N'AB+', N'ctg', 1)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (3005, N'Pushpita', N'pushpita@gamil.com', N'01283984028', N'O-', N'Pathor gata,ctg', 4)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (3006, N'Sraboni', N'sra@gmail.com', N'01010101010', N'B-', N'Noakhali, ctg', 3)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (4005, N'Eifa', N'eifa@gmail.com', N'0191919191', N'AB+', N'Bangladesh', 1)
INSERT [dbo].[Employees] ([ID], [Name], [Email], [ContactNo], [BloodGroup], [Address], [DepartmentId]) VALUES (4006, N'rakib', N'rak@gmail.com', N'01292837402', N'O-', N'dhaka', 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employee]    Script Date: 5/30/2020 5:59:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employee] ON [dbo].[Employees]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Department]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDB] SET  READ_WRITE 
GO
