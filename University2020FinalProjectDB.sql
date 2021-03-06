USE [master]
GO
/****** Object:  Database [University2020FinalProjectDB]    Script Date: 5/30/2020 6:07:11 AM ******/
CREATE DATABASE [University2020FinalProjectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University2020FinalProjectDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University2020FinalProjectDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University2020FinalProjectDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University2020FinalProjectDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University2020FinalProjectDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University2020FinalProjectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University2020FinalProjectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [University2020FinalProjectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University2020FinalProjectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University2020FinalProjectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University2020FinalProjectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University2020FinalProjectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University2020FinalProjectDB] SET  MULTI_USER 
GO
ALTER DATABASE [University2020FinalProjectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University2020FinalProjectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University2020FinalProjectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University2020FinalProjectDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [University2020FinalProjectDB]
GO
/****** Object:  Table [dbo].[AssignCourseToDepartment]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignCourseToDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[SemesterId] [int] NULL,
	[CourseId] [int] NULL,
	[CourseCredit] [numeric](18, 2) NULL,
 CONSTRAINT [PK_AssignCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NULL,
	[CourseName] [varchar](100) NULL,
 CONSTRAINT [PK_CourseTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NULL,
	[DepartmentName] [varchar](100) NULL,
 CONSTRAINT [PK_DepartmentTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[FirstPaperNumber] [float] NULL,
	[SecondPaperNumber] [float] NULL,
	[ClassTest1] [float] NULL,
	[ClassTest2] [float] NULL,
	[ClassTest3] [float] NULL,
	[ClassAttendence] [float] NULL,
 CONSTRAINT [PK_ResultTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RollNo] [int] NULL,
	[Registration] [int] NULL,
	[Name] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [nvarchar](50) NULL,
	[BatchNo] [int] NULL,
	[DeparmentNo] [int] NULL,
 CONSTRAINT [PK_StudentTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[FirstSemesterCourses]    Script Date: 5/30/2020 6:07:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FirstSemesterCourses]
AS
SELECT        C.CourseName, C.CourseCode, d.DepartmentCode
FROM            dbo.AssignCourseToDepartment AS ACTD INNER JOIN
                         dbo.Course AS C ON C.Id = ACTD.CourseId INNER JOIN
                         dbo.Department AS d ON ACTD.DepartmentId = d.Id
WHERE        (ACTD.SemesterId = 1)

GO
SET IDENTITY_INSERT [dbo].[AssignCourseToDepartment] ON 

INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (1, 1, 1, 1, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (2, 1, 1, 2, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (3, 1, 1, 3, CAST(1.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (4, 1, 1, 4, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (5, 1, 1, 5, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (6, 1, 1, 6, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (7, 1, 1, 7, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (8, 1, 1, 8, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (9, 1, 2, 9, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (10, 1, 2, 10, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (11, 1, 2, 11, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (12, 1, 2, 12, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (13, 1, 2, 13, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (14, 1, 2, 14, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (15, 1, 2, 15, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (16, 1, 2, 16, CAST(1.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (17, 1, 2, 17, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (18, 1, 3, 18, CAST(1.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (19, 1, 3, 19, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (20, 1, 3, 20, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (21, 1, 3, 21, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (22, 1, 3, 22, CAST(1.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (23, 1, 3, 23, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (24, 1, 3, 24, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (25, 1, 3, 25, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (26, 1, 4, 26, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (27, 1, 4, 27, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (28, 1, 4, 28, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (29, 1, 4, 29, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (30, 1, 4, 30, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (31, 1, 4, 31, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (32, 1, 4, 32, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (33, 1, 4, 33, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (34, 1, 4, 34, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (35, 1, 5, 35, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (36, 1, 5, 36, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (37, 1, 5, 37, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (38, 1, 5, 38, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (39, 1, 5, 39, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (40, 1, 5, 40, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (41, 1, 5, 41, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (42, 1, 6, 42, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (43, 1, 6, 43, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (44, 1, 6, 44, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (45, 1, 6, 45, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (46, 1, 6, 46, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (47, 1, 6, 47, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (48, 1, 6, 48, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (49, 1, 6, 49, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (50, 1, 6, 50, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (51, 1, 7, 51, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (52, 1, 7, 52, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (53, 1, 7, 53, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (54, 1, 7, 54, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (55, 1, 7, 55, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (56, 1, 7, 56, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (57, 1, 7, 57, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (58, 1, 7, 58, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (59, 1, 7, 59, CAST(1.50 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (60, 1, 8, 60, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (61, 1, 8, 61, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (62, 1, 8, 62, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (63, 1, 8, 63, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (64, 1, 8, 65, CAST(3.00 AS Numeric(18, 2)))
INSERT [dbo].[AssignCourseToDepartment] ([Id], [DepartmentId], [SemesterId], [CourseId], [CourseCredit]) VALUES (65, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AssignCourseToDepartment] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (1, N'CSE111', N'Computer Fundamentals')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (2, N'PHY111', N'Physics')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (3, N'PHY112', N'Physics Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (4, N'CSE113', N'Structured Programming Language')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (5, N'CSE114', N'Structured Programming Language Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (6, N'MATH115', N'Differential Calculus and Integral Calculus')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (7, N'ENG119', N'English')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (8, N'HSS1', N'GED Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (9, N'CSE121', N'Discrete Mathematics')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (10, N'CSE123', N'Object Oriented Programming Language')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (11, N'CSE124', N'Object Oriented Programming Language Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (12, N'EEE123', N'Introduction to Electrical Engineering')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (13, N'EEE124', N'Introduction to Electrical Engineering Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (14, N'MATH125', N'Ordinary and Partial Differential Equestions')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (15, N'CHEM127', N'Chemistry')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (16, N'CHEM128', N'Chemistry Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (17, N'HSS2', N'GED Courses')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (18, N'ENG210', N'Developing English Skill Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (19, N'CSE211', N'Data Structure')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (20, N'CSE212', N'Data Structure Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (21, N'EEE213', N'Elctronic Device and Circuits')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (22, N'EEE214', N'Electronic Device and Circuits Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (23, N'ME215', N'Basic Mechanical Engineering')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (24, N'MATH217', N'Co-ordiante Geometry and Vector Analysis')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (25, N'ECO3', N'GED Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (26, N'CSE221', N'Algorithm')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (27, N'CSE222', N'Algorithm Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (28, N'CSE223', N'Database Management System')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (29, N'CSE224', N'Database Management System Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (30, N'CSE225', N'Digital Logic Design')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (31, N'CSE226', N'Digital Logic Design Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (32, N'CSE227', N'Theory of Computing')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (33, N'MATH229', N'Linear Algebra and Complex Variable')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (34, N'ACT4', N'GED Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (35, N'CSE311', N'Numerical Analysis')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (36, N'CSE312', N'Numerical Analysis Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (37, N'CSE313', N'Data Communication')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (38, N'CSE41', N'Elective 1')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (39, N'CSE42', N'Elective 1 Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (40, N'CSE317', N'Computing Architecture')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (41, N'MATH 319', N'Statistics and Probability')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (42, N'CSE321', N'Compiler Design')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (43, N'CSE322', N'Compiler Design Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (44, N'CSE323', N'Artificial Inteligence and Expert System')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (45, N'CSE324', N'Artificial Inteligence and Expert System Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (46, N'CSE325', N'Computer Networks')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (47, N'CSE326', N'Computer Networks Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (48, N'CSE327', N'Operating System')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (49, N'CSE328', N'Operating System Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (50, N'BUS6', N'GED Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (51, N'CSE400', N'Project and Thesis')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (52, N'CSE410', N'System Analysis and Design Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (53, N'EEE61', N'Advance Core Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (54, N'CSE62', N'Advance Core Course')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (55, N'CSE63', N'Advance Core Course Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (56, N'EEE64', N'Elective 1')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (57, N'EEE65', N'Elective 1 Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (58, N'CSE66', N'Elective 2')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (59, N'CSE67', N'Elective 2 Lab')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (60, N'CSE420', N'Project and Thesis')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (61, N'CSE421', N'Communication Engineering')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (62, N'CSE81', N'Elective 2')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (63, N'CSE82', N'Elective 2')
INSERT [dbo].[Course] ([Id], [CourseCode], [CourseName]) VALUES (65, N'CSE83', N'Elective 2')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [DepartmentCode], [DepartmentName]) VALUES (2, N'EEE', N'Electrical and Electronics Engineering')
INSERT [dbo].[Department] ([Id], [DepartmentCode], [DepartmentName]) VALUES (3, N'ECE', N'Electronics and Communication Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (1, 17010101, 651, N'Fatema Tuz Zohora', N'01864754367', N'fatematuzzohora10@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (2, 17010103, 653, N'Tanmoy Dhar', N'01852737069', N'tanmoy685@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (3, 17010104, 654, N'Mohammad Shahinul Islam', N'01994449224', N'sravonrokon99@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (4, 17010105, 655, N'Md. Arfat Ali', N'01820075695', N'aliarfaat272@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (5, 17010106, 656, N'Srabani Banik', N'01516131722', N'srabonibanik42@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (6, 17010107, 657, N'Anjan Nandy', N'01775198716', N'anjannandy2@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (7, 17010108, 658, N'Mizanur Rahman', N'01521400584', N'mizanurrahman1729@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (8, 17010110, 660, N'Piku Das', N'01864492676', N'pikudasustc@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (9, 17010111, 661, N'Israt Sharmin', N'01863347777', N'isratsharmin2323@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (10, 17010112, 662, N'Iftakhar Uddin Ifty', N'01400410908', N'eftykharmahmud04@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (12, 17010113, 663, N'Sushmita Dey', N'01712899412', N'sushmitadey015@gmail.com', 29, 1)
INSERT [dbo].[Student] ([Id], [RollNo], [Registration], [Name], [Phone], [Email], [BatchNo], [DeparmentNo]) VALUES (13, 17010114, 664, N'Mehenaz Taherin', N'01866332207', N'mehenz2207@gmail.com', 29, 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Index [IX_StudentTable]    Script Date: 5/30/2020 6:07:12 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentTable] ON [dbo].[Student]
(
	[Registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignCourseToDepartment]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AssignCourseToDepartment] CHECK CONSTRAINT [FK_AssignCourse_Course]
GO
ALTER TABLE [dbo].[AssignCourseToDepartment]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourse_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AssignCourseToDepartment] CHECK CONSTRAINT [FK_AssignCourse_Department]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_ResultTable_StudentTable] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_ResultTable_StudentTable]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_DepartmentTable] FOREIGN KEY([DeparmentNo])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_StudentTable_DepartmentTable]
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ACTD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 638
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FirstSemesterCourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FirstSemesterCourses'
GO
USE [master]
GO
ALTER DATABASE [University2020FinalProjectDB] SET  READ_WRITE 
GO
