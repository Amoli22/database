USE [master]
GO
/****** Object:  Database [staffingmaster]    Script Date: 17-07-2023 12:31:31 ******/
CREATE DATABASE [staffingmaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'staffingmaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\staffingmaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'staffingmaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\staffingmaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [staffingmaster] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [staffingmaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [staffingmaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [staffingmaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [staffingmaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [staffingmaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [staffingmaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [staffingmaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [staffingmaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [staffingmaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [staffingmaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [staffingmaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [staffingmaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [staffingmaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [staffingmaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [staffingmaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [staffingmaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [staffingmaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [staffingmaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [staffingmaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [staffingmaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [staffingmaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [staffingmaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [staffingmaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [staffingmaster] SET RECOVERY FULL 
GO
ALTER DATABASE [staffingmaster] SET  MULTI_USER 
GO
ALTER DATABASE [staffingmaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [staffingmaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [staffingmaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [staffingmaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [staffingmaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [staffingmaster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'staffingmaster', N'ON'
GO
ALTER DATABASE [staffingmaster] SET QUERY_STORE = ON
GO
ALTER DATABASE [staffingmaster] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [staffingmaster]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adm_Id] [int] NOT NULL,
	[adm_name] [varchar](100) NOT NULL,
	[adm_pass] [varchar](100) NOT NULL,
	[createddate] [date] NULL,
	[createdby] [varchar](50) NULL,
	[modifieddate] [date] NULL,
	[modifiedby] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[apply_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[emp_id] [int] NULL,
	[job_id] [int] NULL,
	[status] [int] NULL,
	[date_applied] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[apply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicationstatus]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationstatus](
	[applicationstatusid] [int] NOT NULL,
	[status] [varchar](100) NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
 CONSTRAINT [PK_applicationstatus] PRIMARY KEY CLUSTERED 
(
	[applicationstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidateapplicationstatus]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidateapplicationstatus](
	[candidateapplicationstatusid] [int] NOT NULL,
	[candidatemappingid] [int] NOT NULL,
	[applicationstatusid] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidatedetails]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidatedetails](
	[log_id] [int] NULL,
	[name] [varchar](100) NOT NULL,
	[phone] [varchar](20) NULL,
	[location] [varchar](200) NULL,
	[experience] [varchar](100) NULL,
	[skills] [varchar](100) NULL,
	[basic_edu] [varchar](100) NULL,
	[master_edu] [varchar](100) NULL,
	[other_qual] [varchar](100) NULL,
	[dob] [varchar](50) NULL,
	[Resume] [varchar](100) NULL,
	[photo] [varchar](200) NULL,
	[currentsalary] [decimal](10, 2) NULL,
	[noticeperiod] [int] NULL,
	[additionalinformation] [varchar](200) NULL,
	[email] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[action] [varchar](50) NULL,
	[cvsubmitted] [date] NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[candidateid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_candidatedetails] PRIMARY KEY CLUSTERED 
(
	[candidateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidatemapping]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidatemapping](
	[candidateid] [int] NOT NULL,
	[engagementid] [int] NOT NULL,
	[applicationstatusid] [int] NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](200) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[candidatemappingid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employer]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employer](
	[log_id] [int] NOT NULL,
	[employercompanyname] [varchar](100) NULL,
	[etype] [varchar](100) NULL,
	[industry] [varchar](100) NULL,
	[address] [varchar](200) NULL,
	[pincode] [varchar](100) NULL,
	[executive] [varchar](100) NULL,
	[phone] [varchar](100) NULL,
	[location] [varchar](200) NULL,
	[profile] [varchar](700) NULL,
	[logo] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[employerid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_employer] PRIMARY KEY CLUSTERED 
(
	[employerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employercompany]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employercompany](
	[companyid] [int] NOT NULL,
	[companyname] [varchar](100) NOT NULL,
	[employercompanyname] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employerreview]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employerreview](
	[review] [varchar](500) NOT NULL,
	[rating] [decimal](18, 0) NOT NULL,
	[overallscore] [int] NOT NULL,
	[recruiter_id] [int] NOT NULL,
	[employer_id] [int] NOT NULL,
	[date] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[employerreviewid] [int] NOT NULL,
	[Communication] [int] NULL,
	[QualityOfSubmissions] [int] NULL,
	[SpeedOfResponse] [int] NULL,
	[Professionalisanm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employerreviewid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[engagementmapping]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[engagementmapping](
	[employerid] [int] NOT NULL,
	[recruiterid] [int] NOT NULL,
	[jobid] [int] NULL,
	[engagementstatusid] [int] NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[engagementid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_engagementmapping] PRIMARY KEY CLUSTERED 
(
	[engagementid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[engagementstatus]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[engagementstatus](
	[engagementstatusid] [int] NOT NULL,
	[status] [varchar](100) NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
 CONSTRAINT [PK_engagementstatus] PRIMARY KEY CLUSTERED 
(
	[engagementstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[employerid] [int] NOT NULL,
	[title] [varchar](100) NULL,
	[jobdesc] [varchar](700) NOT NULL,
	[vacno] [int] NULL,
	[experience] [varchar](100) NULL,
	[basicpay] [varchar](100) NULL,
	[fnarea] [varchar](100) NULL,
	[location] [varchar](200) NULL,
	[industry] [varchar](200) NULL,
	[ugqual] [varchar](100) NULL,
	[pgqual] [varchar](100) NULL,
	[profile] [varchar](700) NULL,
	[postdate] [varchar](20) NOT NULL,
	[noticeperiod] [int] NULL,
	[keyskills] [nchar](200) NULL,
	[placementfee] [varchar](100) NULL,
	[vacancyreason] [varchar](100) NULL,
	[jobtype] [varchar](50) NULL,
	[benefits] [varchar](200) NULL,
	[feedbacktimescale] [varchar](200) NULL,
	[CVsubmissionclosing] [date] NULL,
	[interviewstages] [int] NULL,
	[interviewcomments] [varchar](200) NULL,
	[CVlimit] [int] NULL,
	[jobstatusid] [int] NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
	[jobid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobstatus]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobstatus](
	[jobstatusid] [int] NOT NULL,
	[status] [varchar](100) NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
 CONSTRAINT [PK_jobstatus] PRIMARY KEY CLUSTERED 
(
	[jobstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[log_id] [int] NOT NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](250) NULL,
	[usertype] [varchar](20) NOT NULL,
	[status] [int] NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offerdetails]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offerdetails](
	[designationoffered] [varchar](100) NOT NULL,
	[CTCoffered] [int] NOT NULL,
	[joiningdate] [date] NULL,
	[Lastdateofferacceptance] [date] NULL,
	[note] [varchar](500) NULL,
	[candidatemappingid] [int] NULL,
	[sendofferid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_offerdetails] PRIMARY KEY CLUSTERED 
(
	[sendofferid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recruiter]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recruiter](
	[recruitercompanyname] [varchar](200) NOT NULL,
	[recruitercompanyaddress] [varchar](500) NOT NULL,
	[recruitercompanywebsite] [varchar](300) NOT NULL,
	[recruitercompanytelephone] [varchar](50) NOT NULL,
	[recruitercompersonname] [varchar](100) NOT NULL,
	[recruitercompersonjobtitle] [varchar](50) NOT NULL,
	[recruitercompersontelephone] [varchar](50) NOT NULL,
	[recruitercompersonspecialistsector] [varchar](100) NOT NULL,
	[recruitercompersonexperience] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[createby] [varchar](200) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](200) NULL,
	[recruiterid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_recruiter] PRIMARY KEY CLUSTERED 
(
	[recruiterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduleinterview]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduleinterview](
	[candidatemappingid] [int] NULL,
	[datetime] [varchar](100) NULL,
	[mandatorydocs] [varchar](300) NULL,
	[contactpersonname] [varchar](100) NULL,
	[contactpersonmob] [int] NULL,
	[contactpersonemail] [varchar](100) NULL,
	[interviewlocation] [varchar](100) NULL,
	[description] [varchar](200) NULL,
	[scheduleinterviewid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_scheduleinterview] PRIMARY KEY CLUSTERED 
(
	[scheduleinterviewid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[selection]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[selection](
	[sel_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[emp_id] [int] NULL,
	[job_id] [int] NULL,
	[status] [int] NULL,
	[date] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [varchar](100) NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[sel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [emp_id]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [job_id]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [log_id]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [location]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [experience]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [skills]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [basic_edu]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [master_edu]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [other_qual]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [dob]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [Resume]
GO
ALTER TABLE [dbo].[candidatedetails] ADD  DEFAULT (NULL) FOR [photo]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [employercompanyname]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [etype]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [industry]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [pincode]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [executive]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [location]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [profile]
GO
ALTER TABLE [dbo].[employer] ADD  DEFAULT (NULL) FOR [logo]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__title__4BAC3F29]  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__vacno__4CA06362]  DEFAULT (NULL) FOR [vacno]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__experience__4D94879B]  DEFAULT (NULL) FOR [experience]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__basicpay__4E88ABD4]  DEFAULT (NULL) FOR [basicpay]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__fnarea__4F7CD00D]  DEFAULT (NULL) FOR [fnarea]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__location__5070F446]  DEFAULT (NULL) FOR [location]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__industry__5165187F]  DEFAULT (NULL) FOR [industry]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__ugqual__52593CB8]  DEFAULT (NULL) FOR [ugqual]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__pgqual__534D60F1]  DEFAULT (NULL) FOR [pgqual]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__profile__5441852A]  DEFAULT (NULL) FOR [profile]
GO
ALTER TABLE [dbo].[login] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[login] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[login] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[selection] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[selection] ADD  DEFAULT (NULL) FOR [emp_id]
GO
ALTER TABLE [dbo].[selection] ADD  DEFAULT (NULL) FOR [job_id]
GO
ALTER TABLE [dbo].[selection] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[candidatemapping]  WITH CHECK ADD FOREIGN KEY([applicationstatusid])
REFERENCES [dbo].[applicationstatus] ([applicationstatusid])
GO
ALTER TABLE [dbo].[engagementmapping]  WITH CHECK ADD FOREIGN KEY([engagementstatusid])
REFERENCES [dbo].[engagementstatus] ([engagementstatusid])
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD FOREIGN KEY([jobstatusid])
REFERENCES [dbo].[jobstatus] ([jobstatusid])
GO
/****** Object:  StoredProcedure [dbo].[getactivecandidates]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getactivecandidates] @employerid int
AS
SELECT candidatedetails.name,jobs.title,recruiter.recruitercompanyname,applicationstatus.status
FROM candidatemapping
INNER JOIN engagementmapping
ON candidatemapping.engagementid = engagementmapping.engagementid
INNER JOIN recruiter
ON engagementmapping.recruiterid=recruiter.recruiterid
INNER JOIN candidatedetails
ON candidatemapping.candidateid=candidatedetails.candidateid
INNER JOIN jobs
ON engagementmapping.jobid=jobs.jobid
INNER JOIN applicationstatus
ON applicationstatus.applicationstatusid=candidatemapping.applicationstatusid
WHERE jobs.jobstatusid=1 and engagementmapping.employerid = @employerid  
GO
/****** Object:  StoredProcedure [dbo].[getcandidatebyemployerid]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getcandidatebyemployerid] @employerid int
AS
SELECT candidatedetails.candidateid,candidatemapping.candidateid,candidatedetails.name,candidatedetails.location,candidatedetails.experience,candidatedetails.log_id,candidatedetails.skills,candidatedetails.basic_edu,candidatedetails.master_edu,candidatedetails.other_qual,candidatedetails.dob,candidatedetails.Resume,candidatedetails.photo
FROM candidatedetails
INNER JOIN candidatemapping
ON candidatedetails.candidateid = candidatemapping.candidateid
WHERE employerid = @employerid;


GO
/****** Object:  StoredProcedure [dbo].[getcandidatebyrecruiterid]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getcandidatebyrecruiterid] @recruiterid int
AS
SELECT candidatedetails.candidateid,engagementmapping.candidateid,candidatedetails.name,candidatedetails.location,candidatedetails.experience,candidatedetails.log_id,candidatedetails.skills,candidatedetails.basic_edu,candidatedetails.master_edu,candidatedetails.other_qual,candidatedetails.dob,candidatedetails.Resume,candidatedetails.photo
FROM candidatedetails
INNER JOIN engagementmapping
ON candidatedetails.candidateid = engagementmapping.candidateid
WHERE recruiterid = @recruiterid;
GO
/****** Object:  StoredProcedure [dbo].[getemployer]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getemployer] @employerid int
AS
SELECT * FROM jobs WHERE employerid = @employerid;
EXEC getemployerdetails @employerid = 1;
GO
/****** Object:  StoredProcedure [dbo].[getemployerdetails]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getemployerdetails] @employerid int
AS
SELECT * FROM jobs WHERE employerid = @employerid;
EXEC getemployer @employerid = 1;
GO
/****** Object:  StoredProcedure [dbo].[getengagementlist]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getengagementlist] @employerid int
AS
SELECT recruiter.recruitercompanyname,employerreview.review,jobs.title,engagementstatus.status
FROM recruiter
INNER JOIN engagementmapping
ON recruiter.recruiterid = engagementmapping.recruiterid
INNER JOIN employerreview
ON recruiter.recruiterid=employerreview.recruiter_id
INNER JOIN jobs
ON engagementmapping.jobid=jobs.jobid
INNER JOIN engagementstatus
ON engagementstatus.engagementstatusid=engagementmapping.engagementstatusid
WHERE engagementmapping.employerid = @employerid  
GO
/****** Object:  StoredProcedure [dbo].[getengagementrequest]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getengagementrequest] @employerid int
AS
SELECT recruiter.recruitercompanyname,jobs.title,engagementstatus.status,employerreview.review
FROM recruiter
INNER JOIN engagementmapping
ON recruiter.recruiterid = engagementmapping.recruiterid
INNER JOIN jobs
ON engagementmapping.jobid=jobs.jobid
INNER JOIN engagementstatus
ON engagementstatus.engagementstatusid=engagementmapping.engagementstatusid
INNER JOIN employerreview
ON recruiter.recruiterid=employerreview.recruiter_id
WHERE engagementmapping.employerid = @employerid 
GO
/****** Object:  StoredProcedure [dbo].[getjobsbyemployerid]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getjobsbyemployerid] @employerid int
AS
SELECT jobs.jobid,jobs.jobstatusid,jobs.title,jobs.placementfee
FROM jobs
WHERE employerid = @employerid and jobstatusid =1
GO
/****** Object:  StoredProcedure [dbo].[getjobsdetails]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getjobsdetails] @jobid int
AS
SELECT * FROM jobs WHERE jobid = @jobid;
EXEC getjobsdetails @jobid = 1;

GO
/****** Object:  StoredProcedure [dbo].[getrecruiter]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getrecruiter] @recruiterid int
AS
SELECT * FROM recruiter WHERE recruiterid = @recruiterid;
GO
/****** Object:  StoredProcedure [dbo].[getrecruiterbyemployerid]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getrecruiterbyemployerid] @employerid int
AS
SELECT recruiter.recruiterid,engagementmapping.recruiterid,recruiter.recruitercompanyaddress,recruiter.recruitercompanyname,recruiter.recruitercompanytelephone,recruiter.recruitercompanywebsite,recruiter.recruitercompersonexperience,recruiter.recruitercompersonjobtitle,recruiter.recruitercompersonname,recruiter.recruitercompersonspecialistsector,recruiter.recruitercompersontelephone
FROM recruiter
INNER JOIN engagementmapping
ON recruiter.recruiterid = engagementmapping.recruiterid
WHERE employerid = @employerid ;
GO
/****** Object:  StoredProcedure [dbo].[Insertpostengagementreq]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertpostengagementreq]
@employerid int,
@jobid int,
@recruiterid int
AS 
BEGIN
INSERT INTO engagementmapping(employerid,jobid,recruiterid,engagementstatusid) VALUES (@employerid,@jobid,@recruiterid,3)
END
GO
/****** Object:  StoredProcedure [dbo].[Insertpostjob]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertpostjob]
 @employerid int,
 @title varchar(200),
 @vacno int,
 @fnarea varchar(200),
 @location varchar (200),
 @vacancyreason varchar(200),
 @jobtype varchar(100),
 @noticeperiod int,
 @experience int,
 @basicpay int,
 @jobdes varchar(500),
 @benefits varchar (100),
 @keyskills varchar(100),
 @ugqual varchar(200),
 @feedbacktimescale varchar(50),
 @CVsubmissionclosing date,
 @interviewstages int,
 @interviewcomments varchar(200),
 @CVlimit int,
 @placementfee int,
 @postdate varchar
 AS
 BEGIN 
 INSERT INTO jobs (employerid,postdate,title,vacno,fnarea,location,vacancyreason,jobtype,noticeperiod,experience,basicpay,jobdesc,benefits,keyskills,ugqual,feedbacktimescale,CVsubmissionclosing,interviewstages,interviewcomments,CVlimit,placementfee) VALUES(@employerid,@postdate,@title,@vacno,@fnarea,@location,@vacancyreason,@jobtype,@noticeperiod,@experience,@basicpay,@jobdes,@benefits,@keyskills,@ugqual,@feedbacktimescale,@CVsubmissionclosing,@interviewstages,@interviewcomments,@CVlimit,@placementfee)
 END
GO
/****** Object:  StoredProcedure [dbo].[insertscheduleinterview]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertscheduleinterview]
@candidatemappingid int,
@datetime varchar(100),
@mandatorydocs varchar(200),
@contactpersonname varchar(100),
@contactpersonmob int,
@contactpersonemail varchar(100),
@interviewlocation varchar(100),
@description varchar(100)

AS 
BEGIN 
DECLARE @scheduleinterviewid int
INSERT INTO scheduleinterview (candidatemappingid,datetime,mandatorydocs,contactpersonname,contactpersonmob,contactpersonemail,interviewlocation,description ) VALUES(@candidatemappingid,@datetime,@mandatorydocs,@contactpersonname,@contactpersonmob,@contactpersonemail,@interviewlocation,@description)
SET @scheduleinterviewid = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sendoffer]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sendoffer]
@candidatemappingid int,
@designationoffered varchar(100),
@CTCoffered int,
@joiningdate date,
@Lastdateofferacceptance date,
@note varchar(100)

AS 
BEGIN 
INSERT INTO offerdetails(candidatemappingid,designationoffered,CTCoffered,joiningdate,Lastdateofferacceptance,note) VALUES(@candidatemappingid,@designationoffered,@CTCoffered,@joiningdate,@Lastdateofferacceptance,@note)
END


GO
/****** Object:  StoredProcedure [dbo].[submitcandidate]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[submitcandidate]
@name varchar(100),
@Resume varchar(100),
@noticeperiod int,
@currentsalary int,
@location varchar(100),
@applicationstatusid int,
@engagementid int
AS
BEGIN
DECLARE  @candidateid int
INSERT INTO candidatedetails(name,Resume,noticeperiod,currentsalary,location) 
VALUES(@name,@Resume,@noticeperiod,@currentsalary,@location)
SET @candidateid = SCOPE_IDENTITY();
INSERT INTO candidatemapping(candidateid,applicationstatusid,engagementid) VALUES(@candidateid,1,@engagementid)
 
END
GO
/****** Object:  StoredProcedure [dbo].[updateengagementrequest]    Script Date: 17-07-2023 12:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateengagementrequest]
@engagementid int,
@engagementstatusid int
AS
BEGIN
update engagementmapping SET engagementstatusid=@engagementstatusid
WHERE engagementid=@engagementid
END
GO
USE [master]
GO
ALTER DATABASE [staffingmaster] SET  READ_WRITE 
GO
