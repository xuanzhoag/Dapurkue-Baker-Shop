USE [master]
GO
/****** Object:  Database [Project]    Script Date: 7/21/2021 6:09:15 PM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[imgName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](25) NOT NULL,
	[cphone] [nvarchar](25) NULL,
	[cAddress] [nvarchar](50) NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[mobile] [int] NOT NULL,
	[address] [nvarchar](50) NULL,
	[totalPrice] [money] NOT NULL,
	[status] [int] NOT NULL,
	[dateCreate] [datetime] NULL,
	[cusID] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[OrderId] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/21/2021 6:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[imgName] [varchar](50) NOT NULL,
	[description] [nvarchar](1000) NOT NULL,
	[categoryId] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [user], [password], [role]) VALUES (1, N'hoang', N'123456a', N'guess')
INSERT [dbo].[Account] ([ID], [user], [password], [role]) VALUES (2025, N'hieu', N'123456a', N'admin')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'1', N'hoang', 1, N'123', 1)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'2', N'Cheese Poof', 30000, N'images/Brownies/2.jpg', 1)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'3', N'hoang', 1, N'123', 1)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'4', N'hoang', 1, N'123', 1)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'1', N'Cream Brownies', 20000, N'images/Brownies/1.jpg', 1)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'1', N'Cream Brownies', 20000, N'images/Brownies/1.jpg', 2)
INSERT [dbo].[Cart] ([ID], [name], [price], [imgName], [Quantity]) VALUES (N'2', N'Cheese Poof', 30000, N'images/Brownies/2.jpg', 2)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [status]) VALUES (1, N'Brownies', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (2, N'Cheesecakes', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (3, N'Cupcakes', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (5, N'Tiramisu', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (1, N'hai', N'123zz', N'hai 16', N'hai', N'123nha1', 1)
INSERT [dbo].[Customer] ([id], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (2, N'hieu', N'123', N'123', N'123aaass', N'123aaa1', 1)
INSERT [dbo].[Customer] ([id], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (3, N'hung', N'123456', N'phuc1212', N'phuc1212', N'123', 0)
INSERT [dbo].[Customer] ([id], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (7, N'hoang', N'0833515589', N'11 a ', N'hoang', N'123456a', 1)
INSERT [dbo].[Customer] ([id], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (1022, N'Hoàng &#272;inh', NULL, NULL, N'hoangdx123', N'11111a', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (1, N'hoang', 1234, N'123', 121.1000, 1, NULL, 1)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (2, N'hieu', 122211, N'1111', 1231.0000, 1, NULL, 1)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (4, N'123', 123, N'123', 123.0000, 1, NULL, 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (5, N'2', 2, N'2', 2.0000, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (101, N'a', 111123, N'123', 2.0000, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (104, N'hoang', 833515589, NULL, 130000.0000, 1, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (105, N'hoang', 833515589, NULL, 50000.0000, 1, CAST(N'2021-06-30T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (106, N'hoang', 833515589, NULL, 50000.0000, 1, CAST(N'2021-06-30T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (107, N'hoang', 833515589, NULL, 50000.0000, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (108, N'hoang', 833515589, NULL, 50000.0000, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (109, N'hoang', 833515589, NULL, 50000.0000, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (110, N'hoang', 833515589, NULL, 200.0000, 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (111, N'hoang', 833515589, NULL, 200.0000, 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (112, N'hoang', 833515589, N'123', 400.0000, 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (113, N'hoang', 833515589, N'Hai Phong', 400.0000, 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (114, N'hoanghunter', 833515589, N'11 a ', 300.0000, 1, CAST(N'2021-07-17T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (115, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-17T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (116, N'hoang', 833515589, N'11 a ', 100.0000, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (117, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (118, N'hoang', 833515583, N'hai phong ', 600.0000, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (119, N'hoang', 833515589, N'11 a ', 400.0000, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (120, N'hoang', 833515589, N'11 a ', 700.0000, 1, CAST(N'2021-07-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (121, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (122, N'hoang', 833515589, N'11 a ', 400.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (123, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (124, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (125, N'hoang', 833515589, N'11 a ', 600.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (126, N'hoang', 833515589, N'11 a ', 460.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (127, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (128, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (129, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (130, N'hoang', 833515589, N'11 a ', 100.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (131, N'hoang', 833515589, N'11 a ', 300.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (132, N'hoang', 833515589, N'11 a ', 200.0000, 1, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (133, N'hoang', 833515589, N'11 a ', 1000.0000, 1, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[order] ([id], [name], [mobile], [address], [totalPrice], [status], [dateCreate], [cusID]) VALUES (134, N'hoang', 833515589, N'11 a ', 300.0000, 1, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 7)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1, 1, 1, 20.0000, 2.0000, 10)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (7, 1, 2, 6.0000, 2.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (10, 1, 3, 3.0000, 1.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (12, 1, 4, 600.0000, 50.0000, 12)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (13, 1, 5, 20.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (14, 1, 6, 6.0000, 2.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (15, 2, 7, 60000.0000, 20000.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (16, 1, 8, 20.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (19, 1, 9, 6.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (20, 1, 10, 20.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1029, 104, 11, 6.0000, 2.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1042, 105, 12, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1043, 105, 13, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1044, 106, 14, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1045, 106, 15, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1046, 107, 16, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1047, 107, 17, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1048, 108, 18, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1049, 108, 19, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1050, 109, 20, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1051, 109, 21, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1052, 110, 1, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1053, 110, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1054, 111, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1055, 111, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1056, 112, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1057, 112, 4, 50.0000, 50.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1058, 112, 8, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1059, 112, 7, 20000.0000, 20000.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1060, 113, 2, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1061, 113, 1, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1062, 113, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1064, 114, 2, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (1065, 114, 1, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2063, 115, 1, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2064, 116, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2065, 117, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2066, 117, 1, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2067, 118, 1, 6.0000, 2.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2068, 118, 2, 6.0000, 2.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2069, 119, 2, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2070, 119, 3, 2.0000, 1.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2072, 116, 22, 10000.0000, 10000.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2073, 105, 23, 100.0000, 100.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2074, 104, 24, 1000.0000, 1000.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2076, 105, 25, 12000.0000, 12000.0000, 10)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2077, 106, 26, 200.0000, 200.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2078, 107, 27, 20001.0000, 20001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2079, 107, 28, 20012.0000, 20012.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2081, 104, 29, 2001.0000, 2001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2082, 105, 30, 2001.0000, 2001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2083, 114, 31, 2001.0000, 2001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2084, 113, 32, 2001.0000, 2001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2085, 113, 33, 2001.0000, 2001.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2086, 120, 1, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2087, 120, 4, 100.0000, 50.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2088, 120, 3, 3.0000, 1.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2093, 121, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2094, 121, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2108, 122, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2109, 122, 4, 50.0000, 50.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2110, 122, 8, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2111, 122, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2112, 123, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2113, 123, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2114, 124, 2, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2115, 125, 1, 12.0000, 2.0000, 6)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2116, 126, 2, 4.0000, 2.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2117, 126, 3, 2.0000, 1.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2118, 126, 16, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2119, 127, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2120, 127, 4, 50.0000, 50.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2121, 128, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2122, 128, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2123, 129, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2124, 129, 4, 50.0000, 50.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2125, 130, 7, 20000.0000, 20000.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2126, 131, 3, 3.0000, 1.0000, 3)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2134, 132, 3, 1.0000, 1.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2135, 132, 4, 50.0000, 50.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2136, 133, 26, 1000.0000, 200.0000, 5)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2137, 133, 1, 12.0000, 2.0000, 6)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2138, 134, 2, 2.0000, 2.0000, 1)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2139, 134, 3, 2.0000, 1.0000, 2)
INSERT [dbo].[OrderDetail] ([id], [OrderId], [ProductID], [Total], [Price], [quantity]) VALUES (2140, 123, 1, 2000.0000, 1.0000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (1, N'Glazed Chocolate', 100, 45, N'Glazed Chocolate.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (2, N'Double Chocolate Brownies', 100, 23, N'Double Chocolate Brownies.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (3, N'Sweet Brownies', 100, 32, N'Sweet Brownies.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (4, N'4th of July', 100, 57, N'4th of July.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (5, N'Ice Cream SandWiches', 100, 52, N'Brownie Ice Cream SandWiches.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (6, N'Chocolate  Birthday Cake', 100, 56, N'Chocolate Brownie Layered Birthday Cake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (7, N'Mini Brownie Layer Cakes', 100, 47, N'Mini Brownie Layer Cakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (8, N'Peanut Butter Swirl Brownies', 100, 45, N'Peanut Butter Swirl Brownies.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (9, N'decadent-brownies', 100, 54, N'decadent-brownies.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 1, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (10, N'Blue Cheesecake', 60, 50, N'Blue Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (11, N'Blueberry Cheesecake', 60, 50, N'Blueberry Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (12, N'Blueberry Swirl Cheesecake', 60, 49, N'Blueberry Swirl Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (13, N'Classic Vanilla Cheesecake', 60, 50, N'Classic Vanilla Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (14, N'Blueberry CheeseCake Oát', 60, 50, N'No Bake Blueberry CheeseCake With Oát Recipe.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (15, N'BlueBerry Vegan Cheesecake', 60, 50, N'No Bake BlueBerry Vegan Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (16, N'Southern Living Cheesecake', 60, 49, N'Southern Living Cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (17, N'chocolate & berry cheesecake', 60, 50, N'White chocolate & berry cheesecake.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (18, N'Best Birthday Cupcakes', 30, 50, N'Best Birthday Cupcakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (19, N'Cactus Heart Topper', 30, 50, N'Cactus Heart Topper.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (20, N'Cupcakes Adelaide', 30, 50, N'Cupcakes Adelaide.png', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (21, N'Mother''s Day Cake Ideas', 30, 50, N'Mother''s Day Cake Ideas.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (22, N'SweetHeart Chocolate', 30, 50, N'SweetHeart Chocolate Cupcakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (23, N'Marry Berry Cupcakes', 30, 50, N'Marry Berry Cupcakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (24, N'Paleo Chocolate Cupcakes', 30, 50, N'Paleo Chocolate Cupcakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (25, N'Chocolate cupcakes', 30, 50, N'Chocolate cupcakes.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (26, N'Classic Tiramisu', 80, 45, N'Classic Tiramisu.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (27, N'Cup of Tiramisu', 80, 50, N'Cup of Tiramisu.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (28, N'Mary Berry''s Piccoli Tiramisu', 80, 50, N'Mary Berry''s Piccoli Tiramisu.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (29, N'Royalty Tiramisu 25', 80, 50, N'Royalty Tiramisu 25.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (30, N'Royalty Tiramisu', 80, 50, N'Royalty Tiramisu.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (31, N'Traditional Italian Dessert', 80, 50, N'Traditional Italian Dessert.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (32, N'Italian Tiramisu', 80, 50, N'Italian Tiramisu.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum, nisl enim aliquam risus, id convallis mauris turpis iaculis felis. Etiam sollucitudin augue et turpis. Vivamus rutrum metus.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [imgName], [description], [categoryId], [status]) VALUES (33, N'Mascarpone Tiramisu', 60, 50, N'Mascarpone Tiramisu.jpg', N'', 5, 1)
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_Customer] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[order] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
