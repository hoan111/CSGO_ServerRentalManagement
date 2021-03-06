USE [Assignment]
GO
/****** Object:  Trigger [trg_UpdateMatchOrder]    Script Date: 3/21/2022 8:41:20 AM ******/
DROP TRIGGER [dbo].[trg_UpdateMatchOrder]
GO
/****** Object:  Trigger [trg_RegisterMatch]    Script Date: 3/21/2022 8:41:20 AM ******/
DROP TRIGGER [dbo].[trg_RegisterMatch]
GO
/****** Object:  Trigger [trg_DeleteMatchOrder]    Script Date: 3/21/2022 8:41:20 AM ******/
DROP TRIGGER [dbo].[trg_DeleteMatchOrder]
GO
/****** Object:  Trigger [trg_UpdateMatchNum]    Script Date: 3/21/2022 8:41:20 AM ******/
DROP TRIGGER [dbo].[trg_UpdateMatchNum]
GO
ALTER TABLE [dbo].[Roles_Admin] DROP CONSTRAINT [FK_Roles_Features_Roles]
GO
ALTER TABLE [dbo].[Roles_Admin] DROP CONSTRAINT [FK_Roles_Features_Features]
GO
ALTER TABLE [dbo].[MatchOrders] DROP CONSTRAINT [FK_MatchOrders_Servers]
GO
ALTER TABLE [dbo].[MatchOrders] DROP CONSTRAINT [FK_MatchOrders_Admins]
GO
ALTER TABLE [dbo].[MatchHistory] DROP CONSTRAINT [FK_MatchHistory_MatchOrders1]
GO
ALTER TABLE [dbo].[Admins] DROP CONSTRAINT [FK_Admins_Roles1]
GO
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [DF_Servers_is_active]
GO
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [DF_Servers_date_created]
GO
ALTER TABLE [dbo].[MatchOrders] DROP CONSTRAINT [DF_MatchOrders_created_time]
GO
ALTER TABLE [dbo].[MatchHistory] DROP CONSTRAINT [DF_MatchHistory_state]
GO
ALTER TABLE [dbo].[MatchHistory] DROP CONSTRAINT [DF_MatchHistory_start_time]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Type]') AND type in (N'U'))
DROP TABLE [dbo].[Type]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND type in (N'U'))
DROP TABLE [dbo].[Servers]
GO
/****** Object:  Table [dbo].[Roles_Admin]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles_Admin]') AND type in (N'U'))
DROP TABLE [dbo].[Roles_Admin]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[MatchOrders]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchOrders]') AND type in (N'U'))
DROP TABLE [dbo].[MatchOrders]
GO
/****** Object:  Table [dbo].[MatchHistory]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchHistory]') AND type in (N'U'))
DROP TABLE [dbo].[MatchHistory]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Features]') AND type in (N'U'))
DROP TABLE [dbo].[Features]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 3/21/2022 8:41:20 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admins]') AND type in (N'U'))
DROP TABLE [dbo].[Admins]
GO
USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 3/21/2022 8:41:20 AM ******/
DROP DATABASE [Assignment]
GO
/****** Object:  Database [Assignment]    Script Date: 3/21/2022 8:41:20 AM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'E:\Appdata\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'E:\Appdata\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
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
/****** Object:  Table [dbo].[Admins]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
	[password] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
	[role] [int] NULL,
	[key] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] NOT NULL,
	[fname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchHistory]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchHistory](
	[match_id] [int] IDENTITY(1,1) NOT NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[order_id] [int] NOT NULL,
	[state] [int] NULL,
	[ct_score] [int] NULL,
	[t_score] [int] NULL,
	[ct_name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[t_name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MatchHistory] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchOrders]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchOrders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[server_id] [int] NOT NULL,
	[created_time] [datetime] NULL,
	[type] [int] NULL,
	[price] [decimal](18, 1) NULL,
	[admin_id] [int] NOT NULL,
	[status] [int] NULL,
	[facebook] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[comment] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MatchOrders_1] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Admin]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Admin](
	[fid] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Roles_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[server_id] [int] IDENTITY(1,1) NOT NULL,
	[server_ip] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[server_port] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[rcon_password] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_created] [date] NULL,
	[is_active] [bit] NULL,
	[server_password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[server_name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[server_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[type_id] [int] NOT NULL,
	[type_name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchHistory] ADD  CONSTRAINT [DF_MatchHistory_start_time]  DEFAULT (sysdatetime()) FOR [start_time]
GO
ALTER TABLE [dbo].[MatchHistory] ADD  CONSTRAINT [DF_MatchHistory_state]  DEFAULT ((1)) FOR [state]
GO
ALTER TABLE [dbo].[MatchOrders] ADD  CONSTRAINT [DF_MatchOrders_created_time]  DEFAULT (sysdatetime()) FOR [created_time]
GO
ALTER TABLE [dbo].[Servers] ADD  CONSTRAINT [DF_Servers_date_created]  DEFAULT (sysdatetime()) FOR [date_created]
GO
ALTER TABLE [dbo].[Servers] ADD  CONSTRAINT [DF_Servers_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_Roles1] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_Roles1]
GO
ALTER TABLE [dbo].[MatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_MatchHistory_MatchOrders1] FOREIGN KEY([order_id])
REFERENCES [dbo].[MatchOrders] ([order_id])
GO
ALTER TABLE [dbo].[MatchHistory] CHECK CONSTRAINT [FK_MatchHistory_MatchOrders1]
GO
ALTER TABLE [dbo].[MatchOrders]  WITH CHECK ADD  CONSTRAINT [FK_MatchOrders_Admins] FOREIGN KEY([admin_id])
REFERENCES [dbo].[Admins] ([admin_id])
GO
ALTER TABLE [dbo].[MatchOrders] CHECK CONSTRAINT [FK_MatchOrders_Admins]
GO
ALTER TABLE [dbo].[MatchOrders]  WITH CHECK ADD  CONSTRAINT [FK_MatchOrders_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([server_id])
GO
ALTER TABLE [dbo].[MatchOrders] CHECK CONSTRAINT [FK_MatchOrders_Servers]
GO
ALTER TABLE [dbo].[Roles_Admin]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Features_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[Roles_Admin] CHECK CONSTRAINT [FK_Roles_Features_Features]
GO
ALTER TABLE [dbo].[Roles_Admin]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Features_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Roles_Admin] CHECK CONSTRAINT [FK_Roles_Features_Roles]
GO
/****** Object:  Trigger [dbo].[trg_UpdateMatchNum]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateMatchNum] 
   ON  [dbo].[MatchHistory]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for trigger here
	DECLARE @type INT;
	DECLARE @num_played_game INT;
	DECLARE @orderID INT;
	DECLARE @state INT;
	DECLARE @matchID INT;

	SELECT @orderID = order_id FROM inserted
	SELECT @type = dbo.MatchOrders.[type] FROM MatchOrders WHERE MatchOrders.order_id = @orderID
	SELECT @num_played_game = COUNT(*) FROM MatchHistory WHERE MatchHistory.order_id = @orderID AND [state] = 2

	SELECT @state = inserted.[state] FROM inserted 
	SELECT @matchID = inserted.match_id FROM inserted

	--Trận đấu chưa kết thúc khi type lớn hơn số game đã chơi
	IF @type > @num_played_game 
	BEGIN
	--Update Match orders chưa kết thúc trận đấu
	UPDATE [dbo].MatchOrders
	SET [status] = 1
	WHERE MatchOrders.order_id = @orderID
	END

	--Trận đấu kết thúc khi type bằng số game đã chơi
	IF @type = @num_played_game 
	BEGIN
	--Update Match orders đã kết thúc trận đấu
	UPDATE [dbo].MatchOrders
	SET [status] = 2
	WHERE MatchOrders.order_id = @orderID
	END

	IF @state = 2 OR @state = 0
	BEGIN
	UPDATE [dbo].MatchHistory
	SET end_time = sysdatetime()
	WHERE MatchHistory.match_id = @matchID
	END
END
GO
ALTER TABLE [dbo].[MatchHistory] ENABLE TRIGGER [trg_UpdateMatchNum]
GO
/****** Object:  Trigger [dbo].[trg_DeleteMatchOrder]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trg_DeleteMatchOrder] 
   ON  [dbo].[MatchOrders]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @serverID int;

	SELECT @serverID = server_id FROM deleted WHERE order_id = (SELECT order_id from deleted)

	UPDATE [dbo].Servers
	SET is_active = 1
	WHERE server_id = @serverID


END
GO
ALTER TABLE [dbo].[MatchOrders] ENABLE TRIGGER [trg_DeleteMatchOrder]
GO
/****** Object:  Trigger [dbo].[trg_RegisterMatch]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_RegisterMatch] 
   ON  [dbo].[MatchOrders]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Update trạng thái của game server khi register trận đấu.
	UPDATE [dbo].Servers 
	SET is_active = 0
	WHERE Servers.server_id = (SELECT server_id FROM inserted)

	UPDATE [dbo].MatchOrders
	SET [status] = 1
	WHERE order_id = (SELECT order_id from inserted)
END
GO
ALTER TABLE [dbo].[MatchOrders] ENABLE TRIGGER [trg_RegisterMatch]
GO
/****** Object:  Trigger [dbo].[trg_UpdateMatchOrder]    Script Date: 3/21/2022 8:41:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trg_UpdateMatchOrder]
   ON  [dbo].[MatchOrders]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @rawServerID int
	DECLARE @updateServerID int
	DECLARE @status int

	SELECT @rawServerID = deleted.server_id FROM deleted WHERE order_id = (SELECT order_id FROM deleted)
	SELECT @updateServerID = inserted.server_id FROM inserted
	SELECT @status = inserted.[status] FROM inserted

	IF(@rawServerID != @updateServerID) AND (@status = 1)
	BEGIN
	UPDATE [dbo].Servers 
	SET is_active = 0
	WHERE server_id = @updateServerID

	UPDATE [dbo].Servers 
	SET is_active = 1
	WHERE server_id = @rawServerID
	END
    
	IF(@rawServerID = @updateServerID) AND (@status = 1)
	BEGIN
	UPDATE [dbo].Servers 
	SET is_active = 0
	WHERE server_id = @updateServerID
	END

	IF @status != 1
	BEGIN
	UPDATE [dbo].Servers 
	SET is_active = 1
	WHERE server_id = @rawServerID
	END
END
GO
ALTER TABLE [dbo].[MatchOrders] ENABLE TRIGGER [trg_UpdateMatchOrder]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
