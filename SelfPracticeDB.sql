USE [master]
GO
/****** Object:  Database [SelfPracticeDB]    Script Date: 5/30/2020 6:04:10 AM ******/
CREATE DATABASE [SelfPracticeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SelfPracticeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SelfPracticeDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SelfPracticeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SelfPracticeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SelfPracticeDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SelfPracticeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SelfPracticeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SelfPracticeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SelfPracticeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SelfPracticeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SelfPracticeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SelfPracticeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SelfPracticeDB] SET  MULTI_USER 
GO
ALTER DATABASE [SelfPracticeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SelfPracticeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SelfPracticeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SelfPracticeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SelfPracticeDB]
GO
/****** Object:  Table [dbo].[DepartmentNet]    Script Date: 5/30/2020 6:04:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentNet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_DepartmentNet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/30/2020 6:04:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
	[BloodGroup] [varchar](5) NOT NULL,
	[Address] [text] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentNet]    Script Date: 5/30/2020 6:04:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentNet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[BloodGroup] [nvarchar](50) NOT NULL,
	[Address] [text] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_StudentNet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetStudentDataWithDepartmentName]    Script Date: 5/30/2020 6:04:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[GetStudentDataWithDepartmentName]
AS
SELECT StudentNet.id StuId, 
StudentNet.Name StuName, 
StudentNet.Email, 
StudentNet.BloodGroup, 
StudentNet.PhoneNo,
StudentNet.Address, 
DepartmentNet.Id DepId,
DepartmentNet.Code,
DepartmentNet.Name DeptName FROM StudentNet 
INNER JOIN DepartmentNet
ON StudentNet.DepartmentId = DepartmentNet.Id



GO
SET IDENTITY_INSERT [dbo].[DepartmentNet] ON 

INSERT [dbo].[DepartmentNet] ([Id], [Name], [Code]) VALUES (1, N'Computer Science', N'CSE')
INSERT [dbo].[DepartmentNet] ([Id], [Name], [Code]) VALUES (2, N'Electronics', N'EEE')
INSERT [dbo].[DepartmentNet] ([Id], [Name], [Code]) VALUES (3, N'Telecommunication', N'ETE')
SET IDENTITY_INSERT [dbo].[DepartmentNet] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [Name], [PhoneNo], [BloodGroup], [Address]) VALUES (1, N'Aslam', CAST(1825317029 AS Numeric(18, 0)), N'O+', N'Boalkhali')
INSERT [dbo].[Student] ([id], [Name], [PhoneNo], [BloodGroup], [Address]) VALUES (2, N'Gish Uddin', CAST(1815954590 AS Numeric(18, 0)), N'B+', N'Bohoddarpara')
INSERT [dbo].[Student] ([id], [Name], [PhoneNo], [BloodGroup], [Address]) VALUES (3, N'Pervin Akther', CAST(1830366790 AS Numeric(18, 0)), N'A+', N'Boalkhali')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentNet] ON 

INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (2, N'Dabit', CAST(192 AS Numeric(18, 0)), N'aslamuddin014@gmail.com', N'B+', N'Bangladesh', 3)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (4, N'Boss', CAST(10101 AS Numeric(18, 0)), N'oin@gmail.com ', N'B+', N'Chowdhury Para', 2)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (8, N'Don', CAST(1817737378 AS Numeric(18, 0)), N'oout@gmail.com', N'B-', N'Israil', 2)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (11, N'Rohan', CAST(19287364 AS Numeric(18, 0)), N'rohan@gmail.com', N'B+', N'Bashkhali', 1)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (12, N'Bablu', CAST(19283745 AS Numeric(18, 0)), N'bab@gamil.com', N'A-', N'Borishal', 2)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (13, N'Rubel', CAST(19284 AS Numeric(18, 0)), N'rub@gmail.com', N'A-', N'Khulna', 2)
INSERT [dbo].[StudentNet] ([id], [Name], [PhoneNo], [Email], [BloodGroup], [Address], [DepartmentId]) VALUES (14, N'Rafi', CAST(192832745 AS Numeric(18, 0)), N'rafi@gamil.com', N'B-', N'Moimonshing', 3)
SET IDENTITY_INSERT [dbo].[StudentNet] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StudentNet]    Script Date: 5/30/2020 6:04:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentNet] ON [dbo].[StudentNet]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SelfPracticeDB] SET  READ_WRITE 
GO
