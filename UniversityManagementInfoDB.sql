USE [master]
GO
/****** Object:  Database [UniversityManagementInfoDB]    Script Date: 5/30/2020 6:07:42 AM ******/
CREATE DATABASE [UniversityManagementInfoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'universitymanagement_elegant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\universitymanagement_elegant.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'universitymanagement_elegant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\universitymanagement_elegant_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementInfoDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementInfoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementInfoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementInfoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementInfoDB]
GO
/****** Object:  Table [dbo].[ClassRoomAssign]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoomAssign](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[day_id] [int] NOT NULL,
	[from_time] [time](7) NOT NULL,
	[to_time] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassRoomAssign] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_code] [varchar](50) NOT NULL,
	[course_name] [varchar](100) NOT NULL,
	[course_credit] [decimal](18, 2) NOT NULL,
	[course_description] [varchar](100) NULL,
	[department_id] [int] NOT NULL,
	[semester_id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignStudent]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignStudent](
	[courseassignstudent_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[courseassignstudentdate] [date] NOT NULL,
 CONSTRAINT [PK_CourseAssignStudent] PRIMARY KEY CLUSTERED 
(
	[courseassignstudent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignTeacher]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignTeacher](
	[courseassignteacher_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignTeacher] PRIMARY KEY CLUSTERED 
(
	[courseassignteacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[day_id] [int] IDENTITY(1,1) NOT NULL,
	[day_name] [varchar](15) NOT NULL,
	[day_shortform] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[day_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](200) NOT NULL,
	[department_code] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[designation_id] [int] IDENTITY(1,1) NOT NULL,
	[designation_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[designation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade_name] [varchar](8) NOT NULL,
	[grade_point] [float] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_no] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[semester_id] [int] IDENTITY(1,1) NOT NULL,
	[semester_name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_regno] [varchar](50) NOT NULL,
	[student_name] [varchar](50) NOT NULL,
	[student_email] [varchar](50) NOT NULL,
	[student_contact] [varchar](50) NOT NULL,
	[student_joindate] [date] NOT NULL,
	[student_address] [varchar](50) NULL,
	[department_id] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_name] [varchar](50) NOT NULL,
	[teacher_address] [varchar](50) NULL,
	[teacher_email] [varchar](50) NOT NULL,
	[teacher_contact] [varchar](50) NOT NULL,
	[teacher_designation] [int] NOT NULL,
	[department_id] [int] NOT NULL,
	[teacher_totalcredit] [int] NOT NULL,
	[teacher_remaincredit] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseStaticsView]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseStaticsView]
AS
SELECT        dbo.Course.course_code, dbo.Course.course_name, dbo.Department.department_id, dbo.Semester.semester_name, dbo.CourseAssignTeacher.teacher_id, dbo.Teacher.teacher_name
FROM            dbo.Course INNER JOIN
                         dbo.Department ON dbo.Course.department_id = dbo.Department.department_id INNER JOIN
                         dbo.Semester ON dbo.Course.semester_id = dbo.Semester.semester_id LEFT OUTER JOIN
                         dbo.CourseAssignTeacher ON dbo.Course.course_id = dbo.CourseAssignTeacher.course_id LEFT OUTER JOIN
                         dbo.Teacher ON dbo.CourseAssignTeacher.teacher_id = dbo.Teacher.teacher_id


GO
/****** Object:  View [dbo].[ShowRoomAllocation]    Script Date: 5/30/2020 6:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShowRoomAllocation] as
SELECT D.department_id, R.room_no, C.course_code, C.course_name, D.department_name, dbo.Day.day_shortform, CONVERT(varchar(15), CA.from_time, 100) AS from_time, CONVERT(varchar(15), CA.to_time, 100) AS to_time
FROM     dbo.Department AS D INNER JOIN
                  dbo.Course AS C ON C.department_id = D.department_id LEFT OUTER JOIN
                  dbo.ClassRoomAssign AS CA ON C.course_id = CA.course_id LEFT OUTER JOIN
                  dbo.Day ON CA.day_id = dbo.Day.day_id LEFT OUTER JOIN
                  dbo.Room AS R ON R.room_id = CA.room_id

GO
SET IDENTITY_INSERT [dbo].[ClassRoomAssign] ON 

INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1011, 18, 1016, 1, 5, CAST(0x070048F9F66C0000 AS Time), CAST(0x07001882BA7D0000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1012, 19, 1013, 3, 2, CAST(0x070058A5C8C00000 AS Time), CAST(0x070048F9F66C0000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1013, 19, 1018, 3, 2, CAST(0x0700F0E066B80000 AS Time), CAST(0x070058A5C8C00000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1014, 20, 1014, 5, 3, CAST(0x0700F0E066B80000 AS Time), CAST(0x0700E03495640000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1015, 20, 1019, 4, 4, CAST(0x07001417C6680000 AS Time), CAST(0x07007CDB27710000 AS Time))
SET IDENTITY_INSERT [dbo].[ClassRoomAssign] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1013, N'CSE111', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'This is compulsory for the Computer Science background student', 19, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1014, N'PHY111', N'Physics', CAST(3.00 AS Decimal(18, 2)), N'This course is for Engineering student', 20, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1015, N'CSE113', N'Structured programming Language', CAST(3.00 AS Decimal(18, 2)), N'CSE', 21, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1016, N'CSE121', N'Discrete Mathematics', CAST(3.00 AS Decimal(18, 2)), N'', 18, 2)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1017, N'CSE124', N'Data Structure', CAST(3.00 AS Decimal(18, 2)), N'', 22, 2)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1018, N'CSE211', N'Algorithm', CAST(2.50 AS Decimal(18, 2)), N'', 19, 3)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1019, N'CSE214', N'Digital Logic Design', CAST(3.00 AS Decimal(18, 2)), N'', 20, 3)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1020, N'EE241', N'Economics & Socialogy', CAST(3.00 AS Decimal(18, 2)), N'', 23, 4)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1021, N'EEE242', N'AutoCat', CAST(3.00 AS Decimal(18, 2)), N'', 20, 4)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1022, N'EEE221', N'Business Studies', CAST(2.50 AS Decimal(18, 2)), N'', 20, 4)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1023, N'EEE121', N'Program Handelling', CAST(3.00 AS Decimal(18, 2)), N'', 20, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] ON 

INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1018, 18, 1013, CAST(0x0D400B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1019, 18, 1018, CAST(0x0C400B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] ON 

INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1024, 19, 10, 1013)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1025, 20, 12, 1019)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1026, 20, 15, 1014)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1027, 21, 11, 1015)
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (1, N'Saturday', N'Sat')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (2, N'Sunday', N'Sun')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (3, N'Monday', N'Mon')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (4, N'Tuesday', N'Tue')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (5, N'Wednesday', N'Wed')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (6, N'Thursday', N'Thu')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (18, N'Architecture', N'Arc')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (19, N'Computer Science & Engineering', N'CSE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (20, N'Electronic & Electrical Engineering', N'EEE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (21, N'Computer Science', N'CS')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (22, N'Software Engineering', N'SE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (23, N'Economics & Social Science', N'ESS')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (24, N'Bachelor of Business Studies', N'BBA')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (4, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (1, N'A+', 4)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (2, N'A', 3.75)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (3, N'A-', 3.5)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (4, N'B+', 3.25)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (5, N'B', 3)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (6, N'B-', 2.75)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (7, N'C+', 2.5)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (8, N'C', 2.25)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (9, N'D', 2)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (10, N'F', 0)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (1, N'101')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (2, N'102')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (3, N'201')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (4, N'202')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (5, N'301')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (6, N'302')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (16, N'CS-2019-001', N'Nusrat Jahan Jui', N'jui@gmail.com', N'119919191919', CAST(0x0D400B00 AS Date), N'Chawakbazar, chittagong', 21)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (17, N'CSE-2019-001', N'Mahi Banik', N'www.mahi@gmail.com', N'1234567819', CAST(0x0C400B00 AS Date), N'Chittagong Bangaldesh', 19)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (18, N'CSE-2019-002', N'Mohammad Aslam Uddin', N'aslam@gmail.com', N'0101010101101', CAST(0x0C400B00 AS Date), N'Bangladesh', 19)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (19, N'CS-2019-002', N'Mizanur Rahman', N'mizan@gmail.com', N'1111000101010', CAST(0x0D400B00 AS Date), N'2no gate, Chittagong', 21)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (20, N'CSE-2019-003', N'Habibul Islam', N'habib@hotmail.com', N'0191817161514', CAST(0x0D400B00 AS Date), N'Bangladesh', 19)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (21, N'CSE-2019-004', N'Piku Das', N'piku@gmail.com', N'1029384756', CAST(0x0D400B00 AS Date), N'Bangladesh', 19)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([result_id], [student_id], [course_id], [grade_id]) VALUES (1007, 16, 1015, 2)
INSERT [dbo].[StudentResult] ([result_id], [student_id], [course_id], [grade_id]) VALUES (1008, 18, 1018, 2)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (10, N'Sukanto Paul', N'Love lane, Chittagong, Bangladesh', N'sukanto@gmail.com', N'01888000111', 1, 19, 20, 17)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (11, N'Kazi Nurul Alam Siddique', N'Tiger Pass, Chittagong', N'knalam@gmail.com', N'01010919191', 4, 21, 20, 17)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (12, N'Sarwar Chowdhury', N'Kapasgola, Chawakbazar, Chittagong, Bangladesh', N'sarwar@gmail.com', N'010101010101', 2, 20, 20, 17)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (13, N'Fatema-tuj-zohora', N'Kotwali, Chittagong, Bangladesh', N'ftzohora@email.com', N'11010101001', 1, 23, 20, 20)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (14, N'Wahidul Islam', N'GEC, Chittagong, Bangladesh', N'wahid@hotmail.com', N'11000011010', 1, 20, 10, 10)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (15, N'Sahedul Islam', N'Bohoddarhat, Chittagong, Bangladesh', N'sahed@gmail.com', N'01311987867', 2, 20, 20, 17)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (16, N'Sharmin Akther', N'Kotwali, Chittagong Bangladesh', N'sharmin@gmail.com', N'11010010010000', 1, 19, 20, 20)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (17, N'Habibul Islam', N'Khulsi, chittagong Bangladesh', N'habib@gmail.com', N'01891917171', 3, 23, 10, 10)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (18, N'Bubli', N'Bangladesh', N'bubli@gmail.com', N'10920389181', 1, 19, 20, 20)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[51] 2[21] 3) )"
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 119
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Semester"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 102
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseAssignTeacher"
            Begin Extent = 
               Top = 102
               Left = 488
               Bottom = 232
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 120
               Left = 264
               Bottom = 250
               Right = 459
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
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementInfoDB] SET  READ_WRITE 
GO
