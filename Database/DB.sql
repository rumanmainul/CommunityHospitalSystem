USE [master]
GO
/****** Object:  Database [ComunityMedicineSystemDB]    Script Date: 2/11/2015 7:57:26 AM ******/
CREATE DATABASE [ComunityMedicineSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComunityMedicineSystemDB', FILENAME = N'E:\ftfl c#\Web\full\ComunityMedicineSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ComunityMedicineSystemDB_log', FILENAME = N'E:\ftfl c#\Web\full\ComunityMedicineSystemDB_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComunityMedicineSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ComunityMedicineSystemDB]
GO
/****** Object:  Table [dbo].[tbl_centers]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_centers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[district_id] [int] NOT NULL,
	[thana_id] [int] NOT NULL,
	[code] [varchar](250) NULL,
	[password] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_diseases]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_diseases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[treatement_procedure] [varchar](300) NOT NULL,
	[prefered_medicine] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_districts]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[population] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_doctors]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[degree] [varchar](100) NOT NULL,
	[specialization] [varchar](100) NOT NULL,
	[center_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_medicines]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_medicines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[mg_mL] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_medicines_of_centers]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_medicines_of_centers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[center_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_patients]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[voter_id] [bigint] NOT NULL,
	[district_id] [int] NOT NULL,
	[thana_id] [int] NOT NULL,
 CONSTRAINT [PK__tbl_pati__3213E83F205778E3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_service_taken]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_service_taken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[observation] [varchar](350) NULL,
	[service_date] [date] NULL,
	[doctor_id] [int] NULL,
	[center_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_thanas]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_thanas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[district_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_treatments]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_treatments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[disease_id] [int] NULL,
	[medicine_id] [int] NULL,
	[dose] [varchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[dose_rules] [varchar](50) NULL,
	[note] [varchar](200) NULL,
	[service_taken_id] [int] NOT NULL,
 CONSTRAINT [PK__tbl_trea__3213E83F16E268C0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_summary]    Script Date: 2/11/2015 7:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----select count(service_taken_id) from tbl_treatments where disease_id = 1

CREATE VIEW [dbo].[view_summary] as
select tbl_service_taken.id,tbl_districts.name, tbl_districts.population, tbl_treatments.disease_id,tbl_service_taken.service_date 
from tbl_treatments join tbl_service_taken on tbl_treatments.service_taken_id = tbl_service_taken.id
join tbl_centers on tbl_service_taken.center_id = tbl_centers.id join tbl_districts
on tbl_centers.district_id = tbl_districts.id
--select * from view_summary
--select name, COUNT(id) as total, ((COUNT(id)*100)/population) as percentage
--from view_summary group by name, population
GO
SET IDENTITY_INSERT [dbo].[tbl_centers] ON 

INSERT [dbo].[tbl_centers] ([id], [name], [district_id], [thana_id], [code], [password]) VALUES (1, N'Sabuj Chata Bakerganj', 2, 9, N'588', N'pcbc2chbhpb')
INSERT [dbo].[tbl_centers] ([id], [name], [district_id], [thana_id], [code], [password]) VALUES (2, N'Nil Chata', 4, 24, N'598', N'rxnrj5djpo3')
SET IDENTITY_INSERT [dbo].[tbl_centers] OFF
SET IDENTITY_INSERT [dbo].[tbl_diseases] ON 

INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (1, N'Remetic Fever', N'Fever feel in night', N'Blood test', N'Parachetmol, Napa')
INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (2, N'Diabetis', N'Diabetis', N'Blood test', N'Parachetmol, Rentidin')
INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (3, N'Headece', N'dsp', N't1', N'p1, p2')
INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (4, N'Hartattack', N'dsp', N't2', N'p3, p4')
INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (5, N'Hapani', N'dsp', N't4', N'p5p6')
INSERT [dbo].[tbl_diseases] ([id], [name], [description], [treatement_procedure], [prefered_medicine]) VALUES (6, N'Jimani', N'dsp', N't6', N'p5p8')
SET IDENTITY_INSERT [dbo].[tbl_diseases] OFF
SET IDENTITY_INSERT [dbo].[tbl_districts] ON 

INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (1, N'Barguna', 903780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (2, N'Barisal', 70)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (3, N'Bhola', 8920109)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (4, N'Jhalokati', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (5, N'Patuakhali', 1523780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (6, N'Pirojpur', 1568780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (7, N'Bandarban', 300000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (8, N'Brahmanbaria', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (9, N'Chandpur', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (10, N'Chittagong', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (11, N'Comilla', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (12, N'Cox''s Bazar', 903780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (13, N'Feni', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (14, N'Khagrachhari', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (15, N'Lakshmipur', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (16, N'Noakhali', 1123780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (17, N'Rangamati', 1598780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (18, N'Dhaka', 903780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (19, N'Faridpur', 903780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (20, N'Gazipur', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (21, N'Gopalganj', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (22, N'Jamalpur', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (23, N'Kishoreganj', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (24, N'Madaripur', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (25, N'Manikganj', 9563780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (26, N'Munshiganj', 9563780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (27, N'Mymensingh', 9463780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (28, N'Narayanganj', 9063780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (29, N'Netrokona', 1163780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (30, N'Rajbari', 1563780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (31, N'Shariatpur', 4178780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (32, N'Sherpur', 4598780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (33, N'Tangail', 8571780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (34, N'Narsingdi', 9063780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (35, N'Bagerhat', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (36, N'Chuadanga', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (37, N'Jessore', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (38, N'Jhenaida', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (39, N'Khulna', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (40, N'Kushtia', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (41, N'Magura', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (42, N'Meherpur', 9233780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (43, N'Narail', 9063780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (44, N'Satkhira', 1558780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (45, N'Bogra', 98329939)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (46, N'Joypurhat', 5000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (47, N'Naogaon', 9263780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (48, N'Natore', 1163780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (49, N'Nawabganj', 1163780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (50, N'Pabna', 1133780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (51, N'Rajshahi', 1563780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (52, N'Sirajganj', 4578780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (53, N'Dinajpur', 903780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (54, N'Gaibandha', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (55, N'Kurigram', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (56, N'Lalmonirhat', 6000890)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (57, N'Nilphamari', 1153780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (58, N'Panchagarh', 1513780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (59, N'Rangpur', 1578780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (60, N'Thakurgaon', 9518780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (61, N'Habiganj', 200000)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (62, N'Moulvibazar', 9863780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (63, N'Sunamganj', 4778780)
INSERT [dbo].[tbl_districts] ([id], [name], [population]) VALUES (64, N'Sylhet', 4578180)
SET IDENTITY_INSERT [dbo].[tbl_districts] OFF
SET IDENTITY_INSERT [dbo].[tbl_doctors] ON 

INSERT [dbo].[tbl_doctors] ([id], [name], [degree], [specialization], [center_id]) VALUES (4, N'Aminul', N'MBBS', N'Diabetis Spechilized', 1)
INSERT [dbo].[tbl_doctors] ([id], [name], [degree], [specialization], [center_id]) VALUES (5, N'Asif Latif', N'MBBS', N'Diabetis Spechilized', 2)
SET IDENTITY_INSERT [dbo].[tbl_doctors] OFF
SET IDENTITY_INSERT [dbo].[tbl_medicines] ON 

INSERT [dbo].[tbl_medicines] ([id], [name], [mg_mL]) VALUES (1, N'Renedin', N'50MG')
INSERT [dbo].[tbl_medicines] ([id], [name], [mg_mL]) VALUES (2, N'Paracetamol', N'500MG')
INSERT [dbo].[tbl_medicines] ([id], [name], [mg_mL]) VALUES (3, N'Napa', N'500ML')
SET IDENTITY_INSERT [dbo].[tbl_medicines] OFF
SET IDENTITY_INSERT [dbo].[tbl_medicines_of_centers] ON 

INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (1, 1, 1, 2)
INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (2, 1, 2, -25)
INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (3, 1, 3, 10)
INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (4, 2, 2, 2)
INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (5, 2, 3, 278)
INSERT [dbo].[tbl_medicines_of_centers] ([id], [center_id], [medicine_id], [quantity]) VALUES (6, 2, 1, 300)
SET IDENTITY_INSERT [dbo].[tbl_medicines_of_centers] OFF
SET IDENTITY_INSERT [dbo].[tbl_patients] ON 

INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (1, 5644309456813, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (3, 5644309456813, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (4, 5644309456813, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (5, 9509623450915, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (6, 1098789543218, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (7, 5644309456813, 2, 9)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (8, 5644309456813, 4, 24)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (9, 5644309456813, 4, 24)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (10, 5644309456813, 4, 24)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (11, 5644309456813, 4, 24)
INSERT [dbo].[tbl_patients] ([id], [voter_id], [district_id], [thana_id]) VALUES (12, 9509623450915, 4, 24)
SET IDENTITY_INSERT [dbo].[tbl_patients] OFF
SET IDENTITY_INSERT [dbo].[tbl_service_taken] ON 

INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (1, 1, N'Blood test', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (2, 3, N'Fever Increate', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (3, 4, N'Fever Increate', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (4, 5, N'ob1', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (5, 6, N'ob1', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (6, 7, N'ob1', CAST(0x52390B00 AS Date), 4, 1)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (7, 8, N'dasd', CAST(0x52390B00 AS Date), 5, 2)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (8, 9, N'dasd', CAST(0x52390B00 AS Date), 5, 2)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (9, 10, N'dasd', CAST(0x52390B00 AS Date), 5, 2)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (10, 11, N'dasd', CAST(0x52390B00 AS Date), 5, 2)
INSERT [dbo].[tbl_service_taken] ([id], [patient_id], [observation], [service_date], [doctor_id], [center_id]) VALUES (11, 12, N'dasd', CAST(0x52390B00 AS Date), 5, 2)
SET IDENTITY_INSERT [dbo].[tbl_service_taken] OFF
SET IDENTITY_INSERT [dbo].[tbl_thanas] ON 

INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (1, N'Amtali', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (2, N'Bamna', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (3, N'Barguna Sadar', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (4, N'Betagi', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (5, N'Patharghata', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (6, N'Taltoli', 1)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (7, N'Agailjhara', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (8, N'Babuganj', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (9, N'Bakerganj', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (10, N'Banaripara', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (11, N'Gaurnadi', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (12, N'Hizla', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (13, N'Barisal Sadar', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (14, N'Mehendiganj', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (15, N'Muladi', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (16, N'Wazirpur', 2)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (17, N'Bhola Sadar', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (18, N'Burhanuddin', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (19, N'Char Fasson', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (20, N'Daulatkhan', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (21, N'Lalmohan', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (22, N'Manpura', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (23, N'Tazumuddin', 3)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (24, N'Jhalokati Sadar', 4)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (25, N'Kathalia', 4)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (26, N'Nalchity', 4)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (27, N'Rajapur', 4)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (28, N'Bauphal', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (29, N'Dashmina', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (30, N'Galachipa', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (31, N'Kalapara', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (32, N'Mirzaganj', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (33, N'Patuakhali Sadar', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (34, N'Rangabali', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (35, N'Dumki', 5)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (36, N'Bhandaria', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (37, N'Kawkhali', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (38, N'Mathbaria', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (39, N'Nazirpur', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (40, N'Pirojpur Sadar', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (41, N'Nesarabad', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (42, N'Zianagor', 6)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (43, N'Ali Kadam', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (44, N'Bandarban Sadar', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (45, N'Lama', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (46, N'Naikhongchhari', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (47, N'Rowangchhari', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (48, N'Ruma', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (49, N'Thanchi', 7)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (50, N'Akhaura', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (51, N'Bancharampur', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (52, N'Brahmanbaria Sadar', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (53, N'Kasba', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (54, N'Nabinagar', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (55, N'Nasirnagar', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (56, N'Sarail', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (57, N'Ashuganj', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (58, N'Bijoynagar', 8)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (59, N'Chandpur Sadar', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (60, N'Faridganj', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (61, N'Haimchar', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (62, N'Haziganj', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (63, N'Kachua', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (64, N'Matlab Dakshin', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (65, N'Matlab Uttar', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (66, N'Shahrasti', 9)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (67, N'Anwara', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (68, N'Banshkhali', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (69, N'Boalkhali', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (70, N'Chandanaish', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (71, N'Fatikchhari', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (72, N'Hathazari', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (73, N'Lohagara', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (74, N'Mirsharai', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (75, N'Patiya', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (76, N'Rangunia', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (77, N'Raozan', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (78, N'Sandwip', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (79, N'Satkania', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (80, N'Sitakunda', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (81, N'Bandor Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (82, N'Chandgaon Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (83, N'Double Mooring Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (84, N'Kotwali Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (85, N'Pahartali Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (86, N'Panchlaish Thana', 10)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (87, N'Barura', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (88, N'Brahmanpara', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (89, N'Burichang', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (90, N'Chandina', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (91, N'Chauddagram', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (92, N'Daudkandi', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (93, N'Debidwar', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (94, N'Homna', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (95, N'Laksam', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (96, N'Muradnagar', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (97, N'Nangalkot', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (98, N'Comilla Adarsha Sadar', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (99, N'Meghna', 11)
GO
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (100, N'Titas', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (101, N'Monohargonj', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (102, N'Comilla Sadar Dakshin', 11)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (103, N'Chakaria', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (104, N'Cox''s Bazar Sadar', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (105, N'Kutubdia', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (106, N'Maheshkhali', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (107, N'Ramu', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (108, N'Teknaf', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (109, N'Ukhia', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (110, N'Pekua', 12)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (111, N'Chhagalnaiya', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (112, N'Daganbhuiyan', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (113, N'Feni Sadar', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (114, N'Parshuram', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (115, N'Sonagazi', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (116, N'Fulgazi', 13)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (117, N'Dighinala', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (118, N'Khagrachhari', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (119, N'Lakshmichhari', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (120, N'Mahalchhari', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (121, N'Manikchhari', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (122, N'Matiranga', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (123, N'Panchhari', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (124, N'Ramgarh', 14)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (125, N'Lakshmipur Sadar', 15)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (126, N'Raipur', 15)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (127, N'Ramganj', 15)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (128, N'Ramgati', 15)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (129, N'Kamalnagar', 15)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (130, N'Begumganj', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (131, N'Noakhali Sadar', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (132, N'Chatkhil ', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (133, N'Companiganj', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (134, N'Hatiya', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (135, N'Senbagh', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (136, N'Sonaimuri', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (137, N'Subarnachar', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (138, N'Kabirhat', 16)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (139, N'Bagaichhari', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (140, N'Barkal', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (142, N'Belaichhari', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (143, N'Kaptai', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (144, N'Juraichhari', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (145, N'Langadu', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (146, N'Naniyachar', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (147, N'Rajasthali', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (148, N'Rangamati Sadar', 17)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (149, N'Dhamrai', 18)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (150, N'Dohar', 18)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (151, N'Keraniganj', 18)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (152, N'Nawabganj', 18)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (153, N'Savar', 18)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (154, N'Alfadanga', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (155, N'Bhanga', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (156, N'Boalmari', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (157, N'Charbhadrasan', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (158, N'Faridpur Sadar', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (159, N'Madhukhali', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (160, N'Nagarkanda', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (161, N'Sadarpur', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (162, N'Saltha', 19)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (163, N'Gazipur Sadar', 20)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (164, N'Kaliakair', 20)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (165, N'Kaliganj', 20)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (166, N'Kapasia', 20)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (167, N'Sreepur', 20)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (168, N'Gopalganj Sadar', 21)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (169, N'Kashiani', 21)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (170, N'Kotalipara', 21)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (171, N'Muksudpur', 21)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (172, N'Tungipara', 21)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (173, N'Baksiganj', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (174, N'Dewanganj', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (175, N'Islampur', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (176, N'Jamalpur Sadar', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (177, N'Madarganj', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (178, N'Melandaha', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (179, N'Sarishabari', 22)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (180, N'Astagram', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (181, N'Bajitpur', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (182, N'Bhairab', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (183, N'Hossainpur', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (184, N'Itna', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (185, N'Karimganj', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (186, N'Katiadi', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (187, N'Kishoreganj Sadar', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (188, N'Kuliarchar', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (189, N'Mithamain', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (190, N'Nikli', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (191, N'Pakundia', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (192, N'Tarail', 23)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (193, N'Rajoir', 24)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (194, N'Madaripur Sadar', 24)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (195, N'Kalkini', 24)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (196, N'Shibchar', 24)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (197, N'Daulatpur', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (198, N'Ghior', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (199, N'Harirampur', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (200, N'Manikgonj Sadar', 25)
GO
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (201, N'Saturia', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (202, N'Shivalaya', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (203, N'Singair', 25)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (204, N'Gazaria', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (205, N'Lohajang', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (206, N'Munshiganj Sadar', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (207, N'Sirajdikhan', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (208, N'Sreenagar', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (209, N'Tongibari', 26)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (210, N'Bhaluka', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (211, N'Dhobaura', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (212, N'Fulbaria', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (213, N'Gaffargaon', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (214, N'Gauripur', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (215, N'Haluaghat', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (216, N'Ishwarganj', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (217, N'Mymensingh Sadar', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (218, N'Muktagachha', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (219, N'Nandail', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (220, N'Phulpur', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (221, N'Trishal', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (222, N'Tara Khanda', 27)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (223, N'Araihazar', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (224, N'Bandar', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (225, N'Narayanganj Sadar', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (226, N'Rupganj', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (227, N'Sonargaon', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (228, N'Fatullah', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (229, N'Siddhirganj', 28)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (230, N'Atpara', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (231, N'Barhatta', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (232, N'Durgapur', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (233, N'Khaliajuri', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (234, N'Kalmakanda', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (235, N'Kendua', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (236, N'Madan', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (237, N'Mohanganj', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (238, N'Netrokona Sadar', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (239, N'Purbadhala', 29)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (240, N'Baliakandi', 30)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (241, N'Goalandaghat', 30)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (242, N'Pangsha', 30)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (243, N'Rajbari Sadar', 30)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (244, N'Kalukhali', 30)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (245, N'Bhedarganj', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (246, N'Damudya', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (247, N'Gosairhat', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (248, N'Naria', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (249, N'Shariatpur Sadar', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (250, N'Zanjira', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (251, N'Shakhipur', 31)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (252, N'Jhenaigati', 32)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (253, N'Nakla', 32)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (254, N'Nalitabari', 32)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (255, N'Sherpur Sadar', 32)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (256, N'Sreebardi', 32)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (257, N'Gopalpur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (258, N'Basail', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (259, N'Bhuapur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (260, N'Delduar', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (261, N'Ghatail', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (262, N'Kalihati', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (263, N'Madhupur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (264, N'Mirzapur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (265, N'Nagarpur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (266, N'Sakhipur', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (267, N'Dhanbari', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (268, N'Tangail Sadar', 33)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (269, N'Narsingdi Sadar', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (270, N'Belabo', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (271, N'Monohardi', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (272, N'Palash', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (273, N'Raipura', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (274, N'Shibpur', 34)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (275, N'Bagerhat Sadar', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (276, N'Chitalmari', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (277, N'Fakirhat', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (279, N'Mollahat', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (280, N'Mongla', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (281, N'Morrelganj', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (282, N'Rampal', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (283, N'Sarankhola', 35)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (284, N'Alamdanga', 36)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (285, N'Chuadanga Sadar', 36)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (286, N'Damurhuda', 36)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (287, N'Jibannagar', 36)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (288, N'Abhaynagar', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (289, N'Bagherpara', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (290, N'Chaugachha', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (291, N'Jhikargachha', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (292, N'Keshabpur', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (293, N'Jessore Sadar', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (294, N'Manirampur', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (295, N'Sharsha', 37)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (296, N'Harinakunda', 38)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (297, N'Jhenaidah Sadar', 38)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (299, N'Kotchandpur', 38)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (300, N'Maheshpur', 38)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (301, N'Shailkupa', 38)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (302, N'Batiaghata', 39)
GO
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (303, N'Dacope', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (304, N'Dumuria', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (305, N'Dighalia', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (306, N'Koyra', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (307, N'Paikgachha', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (308, N'Phultala', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (309, N'Rupsha', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (310, N'Terokhada', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (311, N'Daulatpur Thana', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (312, N'Khalishpur Thana', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (313, N'Khan Jahan Ali Thana', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (315, N'Sonadanga Thana', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (316, N'Harintana Thana', 39)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (317, N'Bheramara', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (319, N'Khoksa', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (320, N'Kumarkhali', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (321, N'Kushtia Sadar', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (322, N'Mirpur', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (323, N'Shekhpara', 40)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (324, N'Magura Sadar', 41)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (325, N'Mohammadpur', 41)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (326, N'Shalikha', 41)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (328, N'Gangni', 42)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (329, N'Meherpur Sadar', 42)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (330, N'Mujibnagar', 42)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (331, N'Kalia', 43)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (333, N'Narail Sadar', 43)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (334, N'Naragati Thana', 43)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (335, N'Assasuni', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (336, N'Debhata', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (337, N'Kalaroa', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (339, N'Satkhira Sadar', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (340, N'Shyamnagar', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (341, N'Tala', 44)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (342, N'Adamdighi', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (343, N'Bogra Sadar', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (344, N'Dhunat', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (345, N'Dhupchanchia', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (346, N'Gabtali', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (347, N'Kahaloo', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (348, N'Nandigram', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (349, N'Sariakandi', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (350, N'Shajahanpur', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (351, N'Sherpur', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (352, N'Shibganj', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (353, N'Sonatola', 45)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (354, N'Akkelpur', 46)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (355, N'Joypurhat Sadar', 46)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (356, N'Kalai', 46)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (357, N'Khetlal', 46)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (358, N'Panchbibi', 46)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (359, N'Atrai', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (360, N'Badalgachhi', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (361, N'Manda', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (362, N'Dhamoirhat', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (363, N' Mohadevpur', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (364, N'Naogaon Sadar', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (365, N'Niamatpur', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (366, N'Patnitala', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (367, N'Porsha', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (368, N'Raninagar', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (369, N'Sapahar', 47)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (370, N'Bagatipara', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (371, N'Baraigram', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (372, N'Gurudaspur', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (373, N'Lalpur', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (374, N'Natore Sadar', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (375, N'Singra', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (376, N'Naldanga', 48)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (377, N'Bholahat', 49)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (378, N'Gomastapur', 49)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (379, N'Nachole', 49)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (380, N'Nawabganj Sadar', 49)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (382, N'Ataikula', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (383, N'Atgharia', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (384, N'Bera', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (385, N'Bhangura', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (386, N'Chatmohar', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (387, N'Faridpur', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (388, N'Ishwardi', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (389, N'Pabna Sadar', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (390, N'Santhia', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (391, N'Sujanagar', 50)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (392, N'Bagha', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (393, N'Bagmara', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (394, N'Charghat', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (396, N'Godagari', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (397, N'Mohanpur', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (398, N'Paba', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (399, N'Puthia', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (400, N'Tanore', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (401, N'Boalia Thana', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (402, N'Matihar Thana', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (403, N'Rajpara Thana', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (404, N'Shah Mokdum Thana', 51)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (405, N'Belkuchi', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (406, N'Chauhali', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (407, N'Kamarkhanda', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (408, N'Kazipur', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (409, N'Raiganj', 52)
GO
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (410, N'Shahjadpur', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (411, N'Sirajganj Sadar', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (412, N'Tarash', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (413, N'Ullahpara', 52)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (414, N'Birampur', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (415, N'Birganj', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (416, N'Biral', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (417, N'Bochaganj', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (418, N'Chirirbandar', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (419, N'Phulbari', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (420, N'Ghoraghat', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (421, N'Hakimpur', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (422, N'Kaharole', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (423, N'Khansama', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (424, N'Dinajpur Sadar', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (426, N'Parbatipur', 53)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (427, N'Phulchhari', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (428, N'Gaibandha Sadar', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (429, N'Gobindaganj', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (430, N'Palashbari', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (431, N'Sadullapur', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (432, N'Sughatta', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (433, N'Sundarganj', 54)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (434, N'Bhurungamari', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (435, N'Char Rajibpur', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (436, N'Chilmari', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (438, N'Kurigram Sadar', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (439, N'Nageshwari', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (440, N'Rajarhat', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (441, N'Raomari', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (442, N'Ulipur', 55)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (443, N'Aditmari', 56)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (444, N'Hatibandha', 56)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (446, N'Lalmonirhat Sadar', 56)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (447, N'Patgram', 56)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (448, N'Dimla', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (449, N'Domar', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (450, N'Jaldhaka', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (451, N'Kishoreganj', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (452, N'Nilphamari Sadar', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (453, N'Saidpur', 57)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (454, N'Atwari', 58)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (455, N'Boda', 58)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (456, N'Debiganj', 58)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (457, N'Panchagarh Sadar', 58)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (458, N'Tetulia', 58)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (459, N'Badarganj', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (460, N'Gangachhara', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (461, N'Kaunia', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (462, N'Rangpur Sadar', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (463, N'Mithapukur', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (464, N'Pirgachha', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (465, N'Pirganj', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (466, N'Taraganj', 59)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (467, N'Baliadangi', 60)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (468, N'Haripur', 60)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (470, N'Ranisankail', 60)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (471, N'Thakurgaon Sadar', 60)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (472, N'Ajmiriganj', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (473, N'Bahubal', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (474, N'Baniyachong', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (475, N'Chunarughat', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (476, N'Habiganj Sadar', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (477, N'Lakhai', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (478, N'Madhabpur', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (479, N'Nabiganj', 61)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (480, N'Barlekha', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (481, N'Kamalganj', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (482, N'Kulaura', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (483, N'Moulvibazar Sadar', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (484, N'Rajnagar', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (485, N'Sreemangal', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (486, N'Juri', 62)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (487, N'Bishwamvarpur', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (488, N'Chhatak', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (489, N'Derai', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (490, N'Dharampasha', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (491, N'Dowarabazar', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (492, N'Jagannathpur', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (493, N'Jamalganj', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (494, N'Sullah', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (495, N'Sunamganj Sadar', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (496, N'Tahirpur', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (497, N'South Sunamganj', 63)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (498, N'Balaganj', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (499, N'Beanibazar', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (500, N'Bishwanath', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (501, N'Companigonj', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (502, N'Fenchuganj', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (503, N'Golapganj', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (504, N'Gowainghat', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (505, N'Jaintiapur', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (506, N'Kanaighat', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (507, N'Sylhet Sadar', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (508, N'Zakiganj', 64)
INSERT [dbo].[tbl_thanas] ([id], [name], [district_id]) VALUES (509, N'South Shurma', 64)
SET IDENTITY_INSERT [dbo].[tbl_thanas] OFF
SET IDENTITY_INSERT [dbo].[tbl_treatments] ON 

INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (1, 1, 1, N'1+1+1', 8, N'Before Meal', N'blood test', 1)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (2, 1, 1, N'1+1+1+1', 8, N'After Meal', N'blood test', 2)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (3, 2, 2, N'1+0+1', 3, N'After Meal', N'blood test', 3)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (4, 1, 2, N'1+1+1+1', 8, N'Before Meal', N'blood test', 4)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (5, 1, 2, N'1+1+1+1', 8, N'Before Meal', N'blood test', 4)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (6, 1, 2, N'1+0+1', 8, N'Before Meal', N'blood test', 5)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (7, 1, 2, N'0+1+1', 8, N'After Meal', N'blood test', 6)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (8, 4, 2, N'1+1+1', 8, N'After Meal', N'blood test', 7)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (9, 4, 3, N'0+1+1', 3, N'After Meal', N'blood test', 8)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (10, 1, 3, N'1+0+1', 3, N'After Meal', N'blood test', 9)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (11, 1, 3, N'1+1+1', 8, N'After Meal', N'blood test', 10)
INSERT [dbo].[tbl_treatments] ([id], [disease_id], [medicine_id], [dose], [quantity], [dose_rules], [note], [service_taken_id]) VALUES (12, 1, 3, N'0+1+1', 8, N'After Meal', N'blood test', 11)
SET IDENTITY_INSERT [dbo].[tbl_treatments] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_dise__72E12F1BD2239EBA]    Script Date: 2/11/2015 7:57:26 AM ******/
ALTER TABLE [dbo].[tbl_diseases] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_dist__72E12F1B681836B5]    Script Date: 2/11/2015 7:57:26 AM ******/
ALTER TABLE [dbo].[tbl_districts] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_than__72E12F1BEB69DAC7]    Script Date: 2/11/2015 7:57:26 AM ******/
ALTER TABLE [dbo].[tbl_thanas] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_centers]  WITH CHECK ADD  CONSTRAINT [FK__tbl_cente__distr__1A14E395] FOREIGN KEY([district_id])
REFERENCES [dbo].[tbl_districts] ([id])
GO
ALTER TABLE [dbo].[tbl_centers] CHECK CONSTRAINT [FK__tbl_cente__distr__1A14E395]
GO
ALTER TABLE [dbo].[tbl_centers]  WITH CHECK ADD  CONSTRAINT [FK__tbl_cente__thana__1B0907CE] FOREIGN KEY([thana_id])
REFERENCES [dbo].[tbl_thanas] ([id])
GO
ALTER TABLE [dbo].[tbl_centers] CHECK CONSTRAINT [FK__tbl_cente__thana__1B0907CE]
GO
ALTER TABLE [dbo].[tbl_doctors]  WITH CHECK ADD  CONSTRAINT [FK__tbl_docto__cente__1DE57479] FOREIGN KEY([center_id])
REFERENCES [dbo].[tbl_centers] ([id])
GO
ALTER TABLE [dbo].[tbl_doctors] CHECK CONSTRAINT [FK__tbl_docto__cente__1DE57479]
GO
ALTER TABLE [dbo].[tbl_medicines_of_centers]  WITH CHECK ADD  CONSTRAINT [FK__tbl_medic__cente__22AA2996] FOREIGN KEY([center_id])
REFERENCES [dbo].[tbl_centers] ([id])
GO
ALTER TABLE [dbo].[tbl_medicines_of_centers] CHECK CONSTRAINT [FK__tbl_medic__cente__22AA2996]
GO
ALTER TABLE [dbo].[tbl_medicines_of_centers]  WITH CHECK ADD FOREIGN KEY([medicine_id])
REFERENCES [dbo].[tbl_medicines] ([id])
GO
ALTER TABLE [dbo].[tbl_patients]  WITH CHECK ADD  CONSTRAINT [FK_tbl_patients_tbl_districts] FOREIGN KEY([district_id])
REFERENCES [dbo].[tbl_districts] ([id])
GO
ALTER TABLE [dbo].[tbl_patients] CHECK CONSTRAINT [FK_tbl_patients_tbl_districts]
GO
ALTER TABLE [dbo].[tbl_patients]  WITH CHECK ADD  CONSTRAINT [FK_tbl_patients_tbl_thanas] FOREIGN KEY([thana_id])
REFERENCES [dbo].[tbl_thanas] ([id])
GO
ALTER TABLE [dbo].[tbl_patients] CHECK CONSTRAINT [FK_tbl_patients_tbl_thanas]
GO
ALTER TABLE [dbo].[tbl_service_taken]  WITH CHECK ADD  CONSTRAINT [FK_tbl_service_taken_tbl_centers] FOREIGN KEY([center_id])
REFERENCES [dbo].[tbl_centers] ([id])
GO
ALTER TABLE [dbo].[tbl_service_taken] CHECK CONSTRAINT [FK_tbl_service_taken_tbl_centers]
GO
ALTER TABLE [dbo].[tbl_service_taken]  WITH CHECK ADD  CONSTRAINT [FK_tbl_service_taken_tbl_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[tbl_doctors] ([id])
GO
ALTER TABLE [dbo].[tbl_service_taken] CHECK CONSTRAINT [FK_tbl_service_taken_tbl_doctors]
GO
ALTER TABLE [dbo].[tbl_service_taken]  WITH CHECK ADD  CONSTRAINT [FK_tbl_service_taken_tbl_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[tbl_patients] ([id])
GO
ALTER TABLE [dbo].[tbl_service_taken] CHECK CONSTRAINT [FK_tbl_service_taken_tbl_patients]
GO
ALTER TABLE [dbo].[tbl_thanas]  WITH CHECK ADD FOREIGN KEY([district_id])
REFERENCES [dbo].[tbl_districts] ([id])
GO
ALTER TABLE [dbo].[tbl_treatments]  WITH CHECK ADD  CONSTRAINT [FK__tbl_treat__disea__45F365D3] FOREIGN KEY([disease_id])
REFERENCES [dbo].[tbl_diseases] ([id])
GO
ALTER TABLE [dbo].[tbl_treatments] CHECK CONSTRAINT [FK__tbl_treat__disea__45F365D3]
GO
ALTER TABLE [dbo].[tbl_treatments]  WITH CHECK ADD  CONSTRAINT [FK__tbl_treat__medic__46E78A0C] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[tbl_medicines] ([id])
GO
ALTER TABLE [dbo].[tbl_treatments] CHECK CONSTRAINT [FK__tbl_treat__medic__46E78A0C]
GO
ALTER TABLE [dbo].[tbl_treatments]  WITH CHECK ADD  CONSTRAINT [FK__tbl_treat__servi__48CFD27E] FOREIGN KEY([service_taken_id])
REFERENCES [dbo].[tbl_service_taken] ([id])
GO
ALTER TABLE [dbo].[tbl_treatments] CHECK CONSTRAINT [FK__tbl_treat__servi__48CFD27E]
GO
USE [master]
GO
ALTER DATABASE [ComunityMedicineSystemDB] SET  READ_WRITE 
GO
