USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 2/20/2022 12:00:33 AM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'E:\Appdata\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'E:\Appdata\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[admin_id] [int] NOT NULL,
	[username] [nvarchar](15) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[role] [int] NULL,
	[api_key] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] NOT NULL,
	[fname] [nvarchar](50) NULL,
	[url] [nvarchar](50) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[match_id] [int] NOT NULL,
	[server_id] [int] NOT NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[type] [int] NULL,
	[num_played_game] [int] NULL,
	[price] [int] NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Features]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Features](
	[fid] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Roles_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[server_id] [int] NOT NULL,
	[server_ip] [nvarchar](15) NOT NULL,
	[server_port] [nvarchar](6) NOT NULL,
	[rcon_password] [nvarchar](30) NULL,
	[date_created] [date] NULL,
	[is_active] [bit] NULL,
	[created_by] [int] NULL,
	[server_password] [varchar](20) NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[server_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 2/20/2022 12:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[type_id] [int] NOT NULL,
	[type_name] [nchar](10) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_Roles1] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_Roles1]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Admins1] FOREIGN KEY([created_by])
REFERENCES [dbo].[Admins] ([admin_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Admins1]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Servers1] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([server_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Servers1]
GO
ALTER TABLE [dbo].[Roles_Features]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Features_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[Roles_Features] CHECK CONSTRAINT [FK_Roles_Features_Features]
GO
ALTER TABLE [dbo].[Roles_Features]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Features_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Roles_Features] CHECK CONSTRAINT [FK_Roles_Features_Roles]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_Admins1] FOREIGN KEY([created_by])
REFERENCES [dbo].[Admins] ([admin_id])
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_Admins1]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
