USE [master]
GO
/****** Object:  Database [University_InformationDB]    Script Date: 5/30/2020 6:06:39 AM ******/
CREATE DATABASE [University_InformationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University_Information', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University_Information.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_Information_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University_Information_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University_InformationDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University_InformationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University_InformationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University_InformationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University_InformationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University_InformationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University_InformationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [University_InformationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University_InformationDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [University_InformationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University_InformationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University_InformationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University_InformationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University_InformationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University_InformationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University_InformationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University_InformationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University_InformationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University_InformationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University_InformationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University_InformationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University_InformationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University_InformationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University_InformationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University_InformationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University_InformationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University_InformationDB] SET  MULTI_USER 
GO
ALTER DATABASE [University_InformationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University_InformationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University_InformationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University_InformationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [University_InformationDB]
GO
/****** Object:  Table [dbo].[ClassRoomAllocate]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoomAllocate](
	[ClassRoomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[ToTime] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassRoomAllocate] PRIMARY KEY CLUSTERED 
(
	[ClassRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[CourseCredit] [decimal](18, 2) NOT NULL,
	[CourseDescription] [varchar](300) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignStudent]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignStudent](
	[CourseAssignStudentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseAssignStudentDate] [date] NOT NULL,
 CONSTRAINT [PK_CourseAssignStudent] PRIMARY KEY CLUSTERED 
(
	[CourseAssignStudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignTeacher]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignTeacher](
	[CourseAssignTeacherId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignTeacher] PRIMARY KEY CLUSTERED 
(
	[CourseAssignTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
	[DayShortForm] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
	[DepartmentCode] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] NOT NULL,
	[DesignationName] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](3) NOT NULL,
	[GradePoint] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](100) NOT NULL,
	[StudentEmail] [varchar](50) NOT NULL,
	[StudentContactNo] [varchar](50) NOT NULL,
	[StudentAddress] [varchar](500) NULL,
	[DepartmentId] [int] NOT NULL,
	[StudentJoinDate] [date] NOT NULL,
	[StudentRegNo] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ResultId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/30/2020 6:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](100) NOT NULL,
	[TeacherAddress] [varchar](500) NOT NULL,
	[TeacherEmail] [varchar](50) NOT NULL,
	[TeacherContactNo] [varchar](50) NOT NULL,
	[TeacherDesignation] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherTotalCredit] [decimal](18, 2) NOT NULL,
	[TeacherRemainCredit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (1, N'Saturday', N'Sat')
INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (2, N'Sunday', N'Sun')
INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (3, N'Monday', N'Mon')
INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (4, N'Tuesday', N'Tue')
INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (5, N'Wednesday', N'Wed')
INSERT [dbo].[Day] ([DayId], [DayName], [DayShortForm]) VALUES (6, N'Thursday', N'Thu')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName], [DepartmentCode]) VALUES (1, N'Computer Science and Engineering', N'CSE')
INSERT [dbo].[Department] ([Id], [DepartmentName], [DepartmentCode]) VALUES (2, N'Electronics and Elrctrical Engineering', N'EEE')
INSERT [dbo].[Department] ([Id], [DepartmentName], [DepartmentCode]) VALUES (3, N'Electrical and Communication Engineering', N'ECE')
INSERT [dbo].[Department] ([Id], [DepartmentName], [DepartmentCode]) VALUES (5, N'Software Engineering', N'SE')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (1, N'A+', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (2, N'A', CAST(3.75 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (3, N'A-', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (4, N'B+', CAST(3.25 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (5, N'B', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (6, N'B-', CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (7, N'C+', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (8, N'C', CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (9, N'D', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Grade] ([GradeId], [GradeName], [GradePoint]) VALUES (10, N'F', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course] ON [dbo].[Course]
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course_1] ON [dbo].[Course]
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Day]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Day] ON [dbo].[Day]
(
	[DayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_1] ON [dbo].[Department]
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[StudentRegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student_1]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_1] ON [dbo].[Student]
(
	[StudentEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher]    Script Date: 5/30/2020 6:06:40 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Teacher] ON [dbo].[Teacher]
(
	[TeacherEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassRoomAllocate]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocate_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[ClassRoomAllocate] CHECK CONSTRAINT [FK_ClassRoomAllocate_Day]
GO
ALTER TABLE [dbo].[ClassRoomAllocate]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocate_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[ClassRoomAllocate] CHECK CONSTRAINT [FK_ClassRoomAllocate_Department]
GO
ALTER TABLE [dbo].[ClassRoomAllocate]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocate_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ClassRoomAllocate] CHECK CONSTRAINT [FK_ClassRoomAllocate_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([SemesterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssignStudent]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignStudent_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CourseAssignStudent] CHECK CONSTRAINT [FK_CourseAssignStudent_Course]
GO
ALTER TABLE [dbo].[CourseAssignStudent]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignStudent_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[CourseAssignStudent] CHECK CONSTRAINT [FK_CourseAssignStudent_Student]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Course]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Department]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Grade]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([TeacherDesignation])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
USE [master]
GO
ALTER DATABASE [University_InformationDB] SET  READ_WRITE 
GO
