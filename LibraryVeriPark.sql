USE [master]
GO
/****** Object:  Database [LibraryVeripark]    Script Date: 22-10-2021 05:35:45 ******/
CREATE DATABASE [LibraryVeripark]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryVeripark', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LibraryVeripark.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryVeripark_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LibraryVeripark_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryVeripark] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryVeripark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryVeripark] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryVeripark] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryVeripark] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryVeripark] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryVeripark] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryVeripark] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryVeripark] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryVeripark] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryVeripark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryVeripark] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryVeripark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryVeripark] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryVeripark] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryVeripark] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryVeripark] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryVeripark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryVeripark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryVeripark] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryVeripark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryVeripark] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryVeripark] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryVeripark] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryVeripark] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryVeripark] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryVeripark] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryVeripark] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryVeripark] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryVeripark] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LibraryVeripark] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LibraryVeripark]
GO
/****** Object:  Table [dbo].[BookAssign]    Script Date: 22-10-2021 05:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookAssign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[assignid]  AS ('AS'+right('000'+CONVERT([varchar](3),[id],(0)),(6))),
	[personid] [nvarchar](50) NULL,
	[bookid] [nvarchar](50) NULL,
	[assigneddate] [nvarchar](50) NULL,
	[returndate] [nvarchar](50) NULL,
	[penality] [nvarchar](50) NULL,
	[statusid] [nchar](10) NULL,
	[updatestatusdate] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookRecord]    Script Date: 22-10-2021 05:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [nvarchar](50) NOT NULL,
	[bookname] [nvarchar](250) NULL,
	[bookISBN] [nvarchar](250) NULL,
	[bookpubname] [nvarchar](50) NULL,
	[bookpubyear] [nvarchar](50) NULL,
	[bookprice] [nvarchar](50) NULL,
	[bookquantity] [int] NULL,
	[recorddate] [nvarchar](50) NULL,
 CONSTRAINT [PK_BookRecord] PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 22-10-2021 05:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personid] [nvarchar](50) NOT NULL,
	[personname] [nvarchar](50) NULL,
	[nationalid] [nvarchar](50) NULL,
	[mobilenumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[personid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[statusdetails]    Script Date: 22-10-2021 05:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusid] [nchar](10) NOT NULL,
	[statusname] [nvarchar](50) NULL,
 CONSTRAINT [PK_statusdetails] PRIMARY KEY CLUSTERED 
(
	[statusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BookAssign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_BookRecord] FOREIGN KEY([bookid])
REFERENCES [dbo].[BookRecord] ([bookid])
GO
ALTER TABLE [dbo].[BookAssign] CHECK CONSTRAINT [FK_Assign_BookRecord]
GO
ALTER TABLE [dbo].[BookAssign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Person] FOREIGN KEY([personid])
REFERENCES [dbo].[Person] ([personid])
GO
ALTER TABLE [dbo].[BookAssign] CHECK CONSTRAINT [FK_Assign_Person]
GO
USE [master]
GO
ALTER DATABASE [LibraryVeripark] SET  READ_WRITE 
GO
