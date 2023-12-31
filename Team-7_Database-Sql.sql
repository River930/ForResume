USE [master]
GO
/****** Object:  Database [Team-7_Database]    Script Date: 2023/10/4 上午 09:44:11 ******/
CREATE DATABASE [Team-7_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Team-7_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Team-7_Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Team-7_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Team-7_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Team-7_Database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Team-7_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Team-7_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Team-7_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Team-7_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Team-7_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Team-7_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Team-7_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Team-7_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Team-7_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Team-7_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Team-7_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Team-7_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Team-7_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Team-7_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Team-7_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Team-7_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Team-7_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Team-7_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Team-7_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Team-7_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Team-7_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Team-7_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Team-7_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Team-7_Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Team-7_Database] SET  MULTI_USER 
GO
ALTER DATABASE [Team-7_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Team-7_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Team-7_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Team-7_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Team-7_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Team-7_Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Team-7_Database', N'ON'
GO
ALTER DATABASE [Team-7_Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [Team-7_Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Team-7_Database]
GO
/****** Object:  User [sa5]    Script Date: 2023/10/4 上午 09:44:11 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Size] [nchar](10) NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoryies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [nvarchar](100) NOT NULL,
	[CouponName] [nvarchar](20) NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[DiscountValue] [decimal](5, 2) NOT NULL,
	[CouponDescription] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[UsageCount] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons_Members]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons_Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CouponId] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Coupons_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_DiscountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderCategories]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [bit] NOT NULL,
 CONSTRAINT [PK_GenderCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderCategories_Categories]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderCategories_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenderCategoryId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_GenderCategories_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[SubTotal] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[ShippingId] [int] NOT NULL,
	[CouponId] [int] NULL,
	[PaymentId] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](3) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PayMents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Premission]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NOT NULL,
	[PermissionDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Premission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenderId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[StockId] [int] NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductSize] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[ReviewTime] [datetime] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Permissions]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_Roles_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippings]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethod] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Shippings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[S] [int] NOT NULL,
	[M] [int] NOT NULL,
	[L] [int] NOT NULL,
	[XL] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Roles]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (2, 1, 5, N'S         ', 2)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (3, 1, 8, N'M         ', 3)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (4, 2, 10, N'L         ', 11)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (5, 3, 12, N'XL        ', 1)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (6, 3, 10, N'L         ', 1)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (7, 2, 15, N'M         ', 5)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (8, 2, 5, N'S         ', 1)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (9, 2, 5, N'M         ', 1)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (10, 2, 21, N'S         ', 4)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (11, 11, 29, N'S         ', 12)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (12, 2, 30, N'M         ', 4)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (13, 1, 29, N'M         ', 4)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Size], [Qty]) VALUES (14, 2, 31, N'M         ', 6)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (1, 1)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (2, 2)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (3, 3)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (4, 4)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (5, 5)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (6, 6)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (7, 7)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (8, 8)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (9, 9)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (10, 10)
INSERT [dbo].[Carts] ([Id], [MemberId]) VALUES (11, 12)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'長袖')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'短袖')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'長褲')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'短褲')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'裙子')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([Id], [CouponCode], [CouponName], [DiscountTypeId], [DiscountValue], [CouponDescription], [StartDate], [EndDate], [UsageCount], [Enabled], [Image]) VALUES (2, N'77544AZIU', N'總價打9折', 1, CAST(0.90 AS Decimal(5, 2)), N'滿1000總價打9折 ', CAST(N'2023-09-18T00:00:00.000' AS DateTime), CAST(N'2023-10-27T00:00:00.000' AS DateTime), 2, 1, N'discount10pres')
INSERT [dbo].[Coupons] ([Id], [CouponCode], [CouponName], [DiscountTypeId], [DiscountValue], [CouponDescription], [StartDate], [EndDate], [UsageCount], [Enabled], [Image]) VALUES (3, N'66888ADGZ', N'總價打8折', 1, CAST(0.80 AS Decimal(5, 2)), N'滿1000總價打8折', CAST(N'2023-09-18T00:00:00.000' AS DateTime), CAST(N'2023-09-11T00:00:00.000' AS DateTime), 5, 0, N'discount20pres')
INSERT [dbo].[Coupons] ([Id], [CouponCode], [CouponName], [DiscountTypeId], [DiscountValue], [CouponDescription], [StartDate], [EndDate], [UsageCount], [Enabled], [Image]) VALUES (4, N'6677ADFZX', N'總價折100', 2, CAST(100.00 AS Decimal(5, 2)), N'滿1000折100', CAST(N'2023-09-18T00:00:00.000' AS DateTime), CAST(N'2023-11-25T00:00:00.000' AS DateTime), 1, 1, N'discount100dollars')
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons_Members] ON 

INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (5, 2, 2, 0)
INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (6, 2, 4, 0)
INSERT [dbo].[Coupons_Members] ([Id], [MemberId], [CouponId], [Enabled]) VALUES (7, 3, 3, 1)
SET IDENTITY_INSERT [dbo].[Coupons_Members] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountType] ON 

INSERT [dbo].[DiscountType] ([Id], [Type], [DisplayOrder]) VALUES (1, N'滿1000總價打折 ', 100)
INSERT [dbo].[DiscountType] ([Id], [Type], [DisplayOrder]) VALUES (2, N'滿1000折多少錢', 200)
SET IDENTITY_INSERT [dbo].[DiscountType] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderCategories] ON 

INSERT [dbo].[GenderCategories] ([Id], [Gender]) VALUES (1, 1)
INSERT [dbo].[GenderCategories] ([Id], [Gender]) VALUES (2, 0)
SET IDENTITY_INSERT [dbo].[GenderCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderCategories_Categories] ON 

INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (1, 1, 1)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (2, 1, 2)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (3, 1, 3)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (4, 1, 4)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (5, 2, 1)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (6, 2, 2)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (7, 2, 3)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (8, 2, 4)
INSERT [dbo].[GenderCategories_Categories] ([Id], [GenderCategoryId], [CategoryId]) VALUES (12, 2, 5)
SET IDENTITY_INSERT [dbo].[GenderCategories_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (1, N'River', N'Huang', N'river@gmail.com', N'772C0CFA33D2AE7D6F5060031A92961A39159E319AFCB00ADE94F62641C362C4      ', N'river', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (2, N'Albert', N'Yang', N'albert@gmail.com', N'4DADF7740FAC963A16EB75D202B6D1A0931B7304F0EE6E0CB9F47395743C6077      ', N'albert', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (3, N'Vincent', N'Chuang', N'vincent@gmail.com', N'CD88048DAC5B63C4150703A6C9A30D70E42DD283516FB5C2F99001BFEE8F9299      ', N'vincent123', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (4, N'鮭魚', N'王', N'simon@gmail.com', N'912D860392CBE493D16756171736897F84FC00E558638712C1EFC88A293E0B46      ', N'simon321', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (5, N'Allen', N'Kuo', N'allen@gmail.com', N'F352DC12CCF57FD3B497128A16B16394B94CE7825EF3D1B853E82017D3B5ACF7      ', N'allen123', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (6, N'Kerry', N'Huang', N'kerry@gmail.com', N'C34FEC31BBF73A37D5293A0AB33267F11664CD0B9B00BE0B44D8F28F49BD73C6      ', N'Kerry081', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (7, N'Tommy', N'Chang', N'tommy@gmail.com', N'05A4D060862DEF2CFA30CDE265115B86E226768464857D112388F3BCEB7E8997      ', N'tommy333', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (8, N'博洋', N'林', N'linyang@gmail.com', N'7709F439B70655B4E2728C062D4E93A27E2E3E0FD463632D376BC6B3F2EF904A      ', N'linyang33', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (9, N'壽司', N'藏', N'kura333@gmail.com', N'B247BC26EFF91A2A347C1C8F43641F06F6BDC04DEF1EE6EF15BA99A976D82C33      ', N'kura333', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (10, N'小雞', N'張', N'chickenchicken@gmail.com', N'1B3CB7EE7CB65934CABCF5858004D4131987DB87ED392C7B2F70F185062D6845      ', N'chicken22', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (11, N'Howard', N'Larsey', N'howard65@gmail.com', N'8CA0A2C8C7F5F6CDB35E1825DFFE7F38DA8D4322145198345342E10ED2CCCDD8      ', N'howard65', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (12, N'咪咪', N'林', N'mimmy84@gmail.com', N'E13E426C8FAAC6429963462F75A0F93CCCA822A4CDD53088ECF395A9CFCACB09      ', N'mimmy84', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (13, N'小電池', N'勁量', N'battery666@gmail.com', N'CBA771BAF1D21912BAB59D51D5002C360E6B45BDB9CFFE0BACCEDBEBA78125CE      ', N'battery666', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (14, N'Ming', N'Wang', N'ming3313@gmail.com', N'8FD1FD690BEE411017612EE0650F0D649AD9DD17622B56EAA5BECF1A3B60BD7C      ', N'ming3313', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (15, N'巴巴', N'星', N'starbar11@gmail.com', N'DC4870B1CC6B194D23817963183473B78A0A39477ECFBECA1F7114BF2453E574      ', N'starbar11', 1)
INSERT [dbo].[Members] ([Id], [FirstName], [LastName], [Email], [Password], [Account], [Enable]) VALUES (16, N'River', N'Small', N'smallriver@gmail.com', N'B57A52C817F7A16DED2DD4EEA63EF6EDB5AF2908D59505BBE94910DE03F48264', N'smallriver', 1)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (1, 1, 5, N'高腰牛仔褲', 865, N'M', 2, 1730)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (3, 2, 10, N'短版針織外套', 599, N'M', 2, 1198)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (4, 2, 13, N'快乾圓領T恤', 1253, N'M', 1, 1253)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (5, 3, 8, N'綁帶A字長裙', 840, N'S', 1, 840)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (6, 4, 20, N'棉質印花短版上衣', 563, N'L', 2, 1126)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (8, 4, 21, N'純棉拉克蘭七分袖T恤', 464, N'L', 1, 464)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (9, 5, 25, N'燈芯絨九分褲', 568, N'XL', 1, 568)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (10, 5, 26, N'休閒九分褲', 694, N'XL', 1, 694)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (11, 6, 5, N'彈力打褶短褲', 865, N'S         ', 1, 865)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (12, 6, 16, N'涼感九分褲', 123, N'S         ', 2, 246)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [ProductName], [Price], [Size], [Qty], [SubTotal]) VALUES (13, 6, 15, N'白卡其短褲', 2345, N'S         ', 2, 4690)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (1, 2, N'0920777666', N'幸福村', 1, 2, 1, 1557, 3, CAST(N'2023-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (2, 2, N'0920777666', N'幸福村', 1, 2, 1, 2089, 2, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (3, 3, N'0988555321', N'悲慘村', 1, NULL, 1, 840, 3, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (4, 4, N'0955666777', N'台北', 1, NULL, 1, 1590, 2, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (5, 5, N'0955777666', N'新北', 1, 3, 1, 1162, 2, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [PhoneNumber], [Address], [ShippingId], [CouponId], [PaymentId], [Total], [StatusId], [OrderTime]) VALUES (6, 16, N'0933123123', N'小小河的家', 1, 2, 1, 5831, 3, CAST(N'2023-10-03T15:51:09.410' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Status], [DisplayOrder]) VALUES (2, N'未出貨', 10)
INSERT [dbo].[OrderStatus] ([Id], [Status], [DisplayOrder]) VALUES (3, N'運送中', 20)
INSERT [dbo].[OrderStatus] ([Id], [Status], [DisplayOrder]) VALUES (4, N'已到貨', 30)
INSERT [dbo].[OrderStatus] ([Id], [Status], [DisplayOrder]) VALUES (5, N'完成', 40)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([Id], [PaymentMethod]) VALUES (1, N'貨到付款')
INSERT [dbo].[Payments] ([Id], [PaymentMethod]) VALUES (4, N'金融卡')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Premission] ON 

INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (1, N'Get Data', N'Get all dat from database but readomly')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (2, N'Edit Data', N'Can edit data in the database  but user permission')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (4, N'Delete', N'Can Detele Data from database but user permission')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (5, N'Edit Use', N'Can edit user ')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (6, N'Create user', N'Can create user')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (7, N'Delete User', N'Can Delete user')
INSERT [dbo].[Premission] ([Id], [PermissionName], [PermissionDescription]) VALUES (8, N'Edit Order', N'CAn edit order status')
SET IDENTITY_INSERT [dbo].[Premission] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (5, 2, 1, N'彈力打褶短褲', 865, N'彈力打褶短褲.jpeg', N'這是一件彈力打褶短褲', 3, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (8, 2, 5, N'牛仔短裙', 840, N'牛仔短裙.jpeg', N'這是牛仔短裙', 4, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (10, 2, 1, N'寬短版水洗連帽外套', 599, N'寬短版水洗連帽外套.jpeg', N'這是短版針織外套', 5, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (12, 2, 5, N'風衣長洋裝', 2205, N'風衣長洋裝.jpeg', N'這是風衣長洋裝', 6, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (13, 2, 2, N'快乾棉圓領T恤', 1253, N'快乾棉圓領T恤.jpeg', N'這是快乾棉圓領T恤', 7, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (15, 2, 4, N'白卡其短褲', 2345, N'白卡其短褲.jpeg', N'這是卡其短褲', 8, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (16, 2, 3, N'涼感九分褲', 123, N'涼感九分褲.jpeg', N'這是涼感九分褲', 9, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (18, 2, 3, N'棉質鬆緊九分褲', 493, N'棉質鬆緊九分褲.jpeg', N'這是棉質鬆緊九分褲', 10, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (19, 2, 4, N'純棉蝴蝶結短褲', 4567, N'純棉蝴蝶結短褲.jpeg', N'這是純棉蝴蝶結短褲', 11, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (20, 2, 2, N'棉質印花短版上衣', 563, N'棉質印花短版上衣.jpeg', N'這是棉質印花短版上衣', 12, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (21, 1, 1, N'純棉拉克蘭七分袖T恤', 464, N'純棉拉克蘭七分袖T恤.jpeg', N'這是純棉拉克蘭七分袖T恤', 14, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (22, 1, 2, N'純棉網眼polo衫', 453, N'純棉網眼polo衫.jpeg', N'這是純棉網眼polo衫', 15, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (23, 1, 1, N'棉麻立領長袖襯衫', 456, N'棉麻立領長袖襯衫.jpeg', N'這是棉麻立領長袖襯衫', 16, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (24, 1, 2, N'磨毛柔棉寬版五分袖T恤', 749, N'磨毛柔棉寬版五分袖T恤.jpeg', N'磨毛柔棉寬版五分袖T恤這是', 17, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (25, 1, 3, N'燈芯絨九分褲', 568, N'燈芯絨九分褲.jpeg', N'這是燈芯絨九分褲', 18, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (26, 1, 3, N'休閒九分褲', 694, N'休閒九分褲.jpeg', N'休閒九分褲這是', 19, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (27, 1, 4, N'urassic World鬆緊短褲', 795, N'urassic World鬆緊短褲.jpeg', N'這是urassic World鬆緊短褲', 20, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (29, 1, 4, N'史努比系列鬆緊短褲', 1247, N'史努比系列鬆緊短褲.jpeg', N'這是史努比系列鬆緊短褲', 21, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (30, 1, 4, N'印花鬆緊短褲-', 745, N'印花鬆緊短褲-.jpeg', N'這是印花鬆緊短褲-', 22, 1)
INSERT [dbo].[Products] ([Id], [GenderId], [CategoryId], [Name], [Price], [Image], [Description], [StockId], [Enable]) VALUES (31, 1, 1, N'可口可樂刷毛圓領衫', 856, N'可口可樂刷毛圓領衫.jpeg', N'這是可口可樂刷毛圓領衫', 23, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Manager')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'Department heads')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (3, N'Staff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles_Permissions] ON 

INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (2, 1, 2)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (6, 1, 4)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (7, 1, 5)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (8, 1, 6)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (9, 1, 7)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (10, 1, 8)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (11, 2, 1)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (12, 2, 2)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (14, 2, 4)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (15, 2, 8)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (16, 3, 1)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (17, 3, 8)
INSERT [dbo].[Roles_Permissions] ([Id], [RoleId], [PermissionId]) VALUES (18, 1, 1)
SET IDENTITY_INSERT [dbo].[Roles_Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Shippings] ON 

INSERT [dbo].[Shippings] ([Id], [ShippingMethod], [Price]) VALUES (1, N'運送到府', 130)
INSERT [dbo].[Shippings] ([Id], [ShippingMethod], [Price]) VALUES (2, N'超商取貨', 70)
SET IDENTITY_INSERT [dbo].[Shippings] OFF
GO
SET IDENTITY_INSERT [dbo].[Stocks] ON 

INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (3, 5, 1, 1, 1, 23)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (4, 8, 234, 43, 3, 23)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (5, 10, 23, 23, 5, 567)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (6, 12, 675, 45, 3455, 54)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (7, 13, 45, 345, 345, 45)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (8, 15, 34, 34, 54, 54)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (9, 16, 70, 709, 45, 435)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (10, 18, 79, 87, 89, 978)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (11, 19, 8790, 890, 987, 79)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (12, 20, 1232, 2342, 234, 123)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (14, 21, 123, 2342, 123, 234)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (15, 22, 123, 7, 98, 789)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (16, 23, 234, 123, 97, 9)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (17, 24, 2345, 23, 567, 345)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (18, 25, 234, 567, 345, 567)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (19, 26, 234, 456, 456, 345)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (20, 27, 234, 456, 3456, 74)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (21, 29, 234, 456, 345, 456)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (22, 30, 234, 4567, 567, 678)
INSERT [dbo].[Stocks] ([Id], [ProductId], [S], [M], [L], [XL]) VALUES (23, 31, 457, 47, 689, 45)
SET IDENTITY_INSERT [dbo].[Stocks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Account], [Password]) VALUES (1, N'albert', N'albert', N'2CFE0370DB96F1BE50C4B9FDCC5914190F3B5EB37747CB4FBE2C8E62CEDE8E2B')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password]) VALUES (2, N'river', N'river', N'2CFE0370DB96F1BE50C4B9FDCC5914190F3B5EB37747CB4FBE2C8E62CEDE8E2B')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password]) VALUES (3, N'linyang', N'linyang', N'2CFE0370DB96F1BE50C4B9FDCC5914190F3B5EB37747CB4FBE2C8E62CEDE8E2B')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password]) VALUES (4, N'Allen', N'Allen', N'2CFE0370DB96F1BE50C4B9FDCC5914190F3B5EB37747CB4FBE2C8E62CEDE8E2B')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password]) VALUES (6, N'123', N'123', N'2CFE0370DB96F1BE50C4B9FDCC5914190F3B5EB37747CB4FBE2C8E62CEDE8E2B')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_Roles] ON 

INSERT [dbo].[Users_Roles] ([Id], [UserId], [RoleId]) VALUES (2, 2, 2)
INSERT [dbo].[Users_Roles] ([Id], [UserId], [RoleId]) VALUES (3, 3, 3)
INSERT [dbo].[Users_Roles] ([Id], [UserId], [RoleId]) VALUES (6, 1, 1)
SET IDENTITY_INSERT [dbo].[Users_Roles] OFF
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_Cart]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_Member]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupons_DiscountType] FOREIGN KEY([DiscountTypeId])
REFERENCES [dbo].[DiscountType] ([Id])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupons_DiscountType]
GO
ALTER TABLE [dbo].[Coupons_Members]  WITH CHECK ADD  CONSTRAINT [FK_Coupons_Members_Coupons] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([Id])
GO
ALTER TABLE [dbo].[Coupons_Members] CHECK CONSTRAINT [FK_Coupons_Members_Coupons]
GO
ALTER TABLE [dbo].[Coupons_Members]  WITH CHECK ADD  CONSTRAINT [FK_Coupons_Members_Members1] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Coupons_Members] CHECK CONSTRAINT [FK_Coupons_Members_Members1]
GO
ALTER TABLE [dbo].[DiscountType]  WITH CHECK ADD  CONSTRAINT [FK_DiscountType_DiscountType1] FOREIGN KEY([Id])
REFERENCES [dbo].[DiscountType] ([Id])
GO
ALTER TABLE [dbo].[DiscountType] CHECK CONSTRAINT [FK_DiscountType_DiscountType1]
GO
ALTER TABLE [dbo].[GenderCategories_Categories]  WITH CHECK ADD  CONSTRAINT [FK_GenderCategories_Categories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[GenderCategories_Categories] CHECK CONSTRAINT [FK_GenderCategories_Categories_Categories]
GO
ALTER TABLE [dbo].[GenderCategories_Categories]  WITH CHECK ADD  CONSTRAINT [FK_GenderCategories_Categories_GenderCategories] FOREIGN KEY([GenderCategoryId])
REFERENCES [dbo].[GenderCategories] ([Id])
GO
ALTER TABLE [dbo].[GenderCategories_Categories] CHECK CONSTRAINT [FK_GenderCategories_Categories_GenderCategories]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItem_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Coupons] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Coupons]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PayMents] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payments] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PayMents]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippings] FOREIGN KEY([ShippingId])
REFERENCES [dbo].[Shippings] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippings]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categoryies] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stocks] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categoryies]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_GenderCategories] FOREIGN KEY([GenderId])
REFERENCES [dbo].[GenderCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_GenderCategories]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Member]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
ALTER TABLE [dbo].[Roles_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Permissions_Premission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Premission] ([Id])
GO
ALTER TABLE [dbo].[Roles_Permissions] CHECK CONSTRAINT [FK_Roles_Permissions_Premission]
GO
ALTER TABLE [dbo].[Roles_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Roles_Permissions] CHECK CONSTRAINT [FK_Roles_Permissions_Roles]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Products]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_Users_Roles_Roles]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_Users_Roles_Users]
GO
/****** Object:  StoredProcedure [dbo].[GetSalesRank]    Script Date: 2023/10/4 上午 09:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSalesRank]
AS
SELECT C.* , G.* , P.* , Ranking.* , S.S ,M.M ,L.L , XL.XL FROM Products as P
	INNER JOIN 
	(SELECT Oi.ProductId , SUM(Oi.Qty) as TotalQty FROM OrderItems as Oi 
	Group by Oi.ProductId) as Ranking
	ON P.Id = Ranking.ProductId 
	
	FULL Outer JOIN
	(SELECT Oi.ProductId  , SUM(Oi.Qty) as S FROM OrderItems as Oi 
		WHERE  Size = 'S'
		Group by Oi.ProductId) as S
	ON S.ProductId = P.Id
	 
	FULL OUTER JOIN
	(SELECT Oi.ProductId  , SUM(Oi.Qty) as M FROM OrderItems as Oi 
		WHERE  Size = 'M'
		Group by Oi.ProductId) as M
	ON M.ProductId = P.Id

	FULL OUTER JOIN
	(SELECT Oi.ProductId  , SUM(Oi.Qty) as L FROM OrderItems as Oi 
		WHERE  Size = 'L'
		Group by Oi.ProductId) as L
	ON P.Id = L.ProductId

	FULL OUTER JOIN 
	(SELECT Oi.ProductId  , SUM(Oi.Qty) as XL FROM OrderItems as Oi 
		WHERE  Size = 'XL'
		Group by Oi.ProductId) as XL
	ON P.Id = XL.ProductId

	INNER JOIN Categories as C ON C.Id = P.CategoryId
	INNER JOIN GenderCategories as G ON G.Id = P.GenderId
	ORDER BY Ranking.TotalQty DESC
GO
USE [master]
GO
ALTER DATABASE [Team-7_Database] SET  READ_WRITE 
GO
