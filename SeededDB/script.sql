USE [master]
GO
/****** Object:  Database [WekalaDB]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE DATABASE [WekalaDB] ON  PRIMARY 
( NAME = N'WekalaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WekalaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WekalaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WekalaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WekalaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WekalaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WekalaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WekalaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WekalaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WekalaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WekalaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WekalaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WekalaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WekalaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WekalaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WekalaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WekalaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WekalaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WekalaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WekalaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WekalaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WekalaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WekalaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WekalaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WekalaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WekalaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WekalaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WekalaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WekalaDB] SET  MULTI_USER 
GO
ALTER DATABASE [WekalaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WekalaDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WekalaDB', N'ON'
GO
USE [WekalaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[UserType] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DeliveryTime] [datetime2](7) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Pro_Img] [nvarchar](450) NOT NULL,
	[Pro_Id] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Pro_Id] ASC,
	[Pro_Img] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Product_Name] [nvarchar](max) NULL,
	[Product_Price] [nvarchar](max) NULL,
	[Product_Quantity] [nvarchar](max) NULL,
	[Product_Image] [nvarchar](max) NULL,
	[Order_Id] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[ShipTo_Name] [nvarchar](max) NULL,
	[ShipTo_Street] [nvarchar](max) NULL,
	[ShipTo_City] [nvarchar](max) NULL,
	[ShipTo_Country] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[User_Id] [nvarchar](450) NULL,
	[DeliveryMethod_Id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Brand_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Store_Id] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewPrice] [decimal](18, 2) NOT NULL,
	[PromotionalText] [nvarchar](max) NULL,
	[Product_Id] [int] NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Rev_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Id] [int] NOT NULL,
	[Pro_Review] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Rev_Id] ASC,
	[Pro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 3/30/2023 10:50:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Supplier_Id] [nvarchar](450) NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230214192453_intial', N'6.0.14')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Street], [City], [Country], [UserType], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'AG', N'Unkown', N'Unkown', N'St.705', N'Cairo', N'Egypt', N'Supplier', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Street], [City], [Country], [UserType], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'AH', N'Unkown', N'Unkown', N'St.300', N'Mansoura', N'Egypt', N'Supplier', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Street], [City], [Country], [UserType], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'AK', N'Unkown', N'Unkwon', N'St.400', N'Alexandria', N'Egypt', N'Supplier', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Street], [City], [Country], [UserType], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'AM', N'Unkown', N'Unkwon', N'St.550', N'Cairo', N'Egypt', N'Supplier', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (1, N'Generic', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (2, N'Cottonil', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (3, N'Print Online', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (4, N'Dice', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (5, N'Embrator', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (6, N'Carina', N'All')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (8, N'Silvy', N'All')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Tops ', N'(shirts, blouses, t-shirts, etc.)')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Bottoms ', N'(pants, shorts, skirts, etc.)')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Outerwear ', N'(jackets, coats, etc.)')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (4, N'Activeware ', N'(athletic clothing, workout clothes, etc.)')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (7, N'Sleepwear ', N'(pajamas, nightgowns, etc.)')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (8, N'Footwear ', N'(shoes, boots, sandals, etc.)')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([Id], [Name], [Description], [DeliveryTime], [Cost]) VALUES (1, N'fast', N'12H', CAST(N'2004-01-02T00:00:00.0000000' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't1.jpg', 9)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't2.jpg', 10)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't3.jpg', 11)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't4.jpg', 12)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't5.jpg', 13)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't6.jpg', 14)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't7.jpg', 16)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't8.jpg', 17)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't9.jpg', 18)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't10.jpg', 19)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't11.jpg', 20)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't12.jpg', 21)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't13.jpg', 22)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't14.jpg', 23)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't15.jpg', 24)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't16.jpg', 25)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't17.jpg', 26)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't18.jpg', 27)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't19.jpg', 28)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't20.jpg', 29)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N't21.jpg', 30)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b1.jpg', 31)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b2.jpg', 32)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b3.jpg', 35)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b4.jpg', 36)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b5.jpg', 37)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b6.jpg', 38)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b7.jpg', 39)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b8.jpg', 40)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b9.jpg', 41)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b10.jpg', 42)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b11.jpg', 43)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b12.jpg', 44)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b13.jpg', 45)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b14.jpg', 46)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b15.jpg', 47)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b16.jpg', 48)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b17.jpg', 49)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b18.jpg', 50)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b19.jpg', 51)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b20.jpg', 52)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'b21.jpg', 53)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o1.jpg', 54)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o2.jpg', 55)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o3.jpg', 56)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o4.jpg', 57)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o5.jpg', 58)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o6.jpg', 59)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o7.jpg', 60)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o8.jpg', 61)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o9.jpg', 62)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o10.jpg', 63)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o11.jpg', 64)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o12.jpg', 65)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o13.jpg', 66)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o14.jpg', 67)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o15.jpg', 68)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o16.jpg', 69)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o17.jpg', 70)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o18.jpg', 71)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o19.jpg', 72)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o20.jpg', 73)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'o21.jpg', 74)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a1.jpg', 75)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a2.jpg', 76)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a3.jpg', 78)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a4.jpg', 79)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a5.jpg', 80)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a6.jpg', 81)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a7.jpg', 82)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a8.jpg', 83)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a9.jpg', 84)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a10.jpg', 85)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a11.jpg', 86)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a12.jpg', 87)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a13.jpg', 88)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a14.jpg', 89)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a15.jpg', 90)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a16.jpg', 91)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a17.jpg', 92)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a18.jpg', 93)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a19.jpg', 94)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a20.jpg', 95)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'a21.jpg', 96)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's1.jpg', 100)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's2.jpg', 101)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's3.jpg', 102)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's4.jpg', 103)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's5.jpg', 104)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's6.jpg', 105)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's7.jpg', 106)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's8.jpg', 107)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's9.jpg', 108)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's10.jpg', 109)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's11.jpg', 110)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's12.jpg', 111)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's13.jpg', 112)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's14.jpg', 113)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's15.jpg', 114)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's16.jpg', 115)
GO
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's17.jpg', 116)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's18.jpg', 117)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's19.jpg', 118)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's20.jpg', 119)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N's21.jpg', 120)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f1.jpg', 121)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f2.jpg', 122)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f3.jpg', 123)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f4.jpg', 124)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f5.jpg', 125)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f6.jpg', 126)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f7.jpg', 127)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f8.jpg', 128)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f9.jpg', 129)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f10.jpg', 130)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f11.jpg', 131)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f12.jpg', 132)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f13.jpg', 133)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f14.jpg', 134)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f15.jpg', 135)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f16.jpg', 136)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f17.jpg', 137)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f18.jpg', 138)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f19.jpg', 139)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f20.jpg', 140)
INSERT [dbo].[Images] ([Pro_Img], [Pro_Id]) VALUES (N'f21.jpg', 141)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (9, N'Short Sleeve T-Shirt For Man', N'Size: M', CAST(129.00 AS Decimal(18, 2)), 8, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (10, N'Casual T-Shirts Round-Neck -For Men', N'Size: L
', CAST(125.00 AS Decimal(18, 2)), 2, 2, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (11, N'Halter Neck Hoodie & Sweatshirt For Men', N'Size: M', CAST(300.00 AS Decimal(18, 2)), 4, 3, 1, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (12, N'V-Neck Short-Sleeve Solid Undershirt for Men, Set of 3', N'Size: XXL
', CAST(372.00 AS Decimal(18, 2)), 6, 4, 1, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (13, N'Pack Of 3 Lycra Tank Top For Men - Multi Color', N'Size: M', CAST(270.00 AS Decimal(18, 2)), 5, 5, 1, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (14, N'Full Sleeve T-Shirt For Man', N'Size: M', CAST(139.00 AS Decimal(18, 2)), 1, 6, 1, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (16, N'Cotton T-Shirt For Men', N'Size: L
', CAST(129.00 AS Decimal(18, 2)), 3, 8, 1, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (17, N'Under Shirts Full Sleeve - For Men', N'Size: S', CAST(145.00 AS Decimal(18, 2)), 9, 2, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (18, N'Long Sleeve Cotton T-Shirt For Men', N'Size: M', CAST(139.00 AS Decimal(18, 2)), 7, 3, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (19, N'Sleeveless-shirt For Men', N'Size: M', CAST(140.00 AS Decimal(18, 2)), 8, 4, 1, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (20, N'TANK TOP SHOOTS FOR MEN 3 PIECE', N'Size: L
', CAST(270.00 AS Decimal(18, 2)), 2, 5, 1, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (21, N'Full Sleeve T-Shirt For Man', N'Size: M', CAST(139.00 AS Decimal(18, 2)), 4, 6, 1, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (22, N'Short Sleeve Round Neck T-Shirt For Men', N'Size: M', CAST(129.00 AS Decimal(18, 2)), 6, 8, 1, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (23, N'Cotton Round Neck Short Sleeves T-Shirt For Men', N'Size: M', CAST(129.00 AS Decimal(18, 2)), 5, 1, 1, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (24, N'Long Sleeve Cotton T-Shirt For Men', N'Size: L
', CAST(139.00 AS Decimal(18, 2)), 9, 3, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (25, N'Round-Neck Short Sleeve Solid Undershirt for Men', N'Size: S', CAST(134.00 AS Decimal(18, 2)), 3, 4, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (26, N'(O)-Neck T-Shirts - For Men', N'Size: L
', CAST(224.00 AS Decimal(18, 2)), 1, 5, 1, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (27, N'Short Sleeve Round Neck T-Shirt For Men', N'Size: M', CAST(129.00 AS Decimal(18, 2)), 7, 6, 1, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (28, N'Short Sleeve Round Neck T-Shirt For Men', N'Size: M', CAST(129.00 AS Decimal(18, 2)), 8, 8, 1, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (29, N'Short Sleeve Round Neck T-Shirt For Men', N'Size: XXL
', CAST(129.00 AS Decimal(18, 2)), 2, 1, 1, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (30, N'Set Of (3) O-Neck T-Shirts - Black Gray', N'Size: M', CAST(299.00 AS Decimal(18, 2)), 4, 2, 1, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (31, N'Thermal Bottoms For Men 4 pcs', N'Size: M', CAST(950.00 AS Decimal(18, 2)), 6, 4, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (32, N'Men''s Jeans', N'Size: XXL
', CAST(349.00 AS Decimal(18, 2)), 5, 5, 2, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (35, N'mens 501 93 Straight Fit Jeans', N'Size: M', CAST(329.00 AS Decimal(18, 2)), 9, 6, 2, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (36, N'mens W17PTCA12 Pants', N'Size: L
', CAST(299.00 AS Decimal(18, 2)), 3, 8, 2, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (37, N'mens Straight Fit Solid Cotton Jeans Casual Pants', N'Size: S', CAST(349.00 AS Decimal(18, 2)), 1, 1, 2, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (38, N'mens Cotton Fly Zipper Button Plain Jeans Casual Pants', N'Size: S', CAST(349.00 AS Decimal(18, 2)), 7, 2, 2, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (39, N'mens Slim Fit Dark Navy', N'Size: L
', CAST(399.00 AS Decimal(18, 2)), 8, 3, 2, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (40, N'mens Basic', N'Size: M', CAST(370.00 AS Decimal(18, 2)), 2, 5, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (41, N'aMens Basic Five Pocket Jeans Jeans', N'Size: L
', CAST(399.00 AS Decimal(18, 2)), 4, 6, 2, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (42, N'Mens Slim Fit Vintage Denim Pants', N'Size: XXL
', CAST(499.00 AS Decimal(18, 2)), 6, 8, 2, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (43, N'Mens Slim Fit Denim Pants', N'Size: M', CAST(499.00 AS Decimal(18, 2)), 5, 1, 2, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (44, N'Mens Slim Fit Tapered Denim Pants ', N'Size: M', CAST(499.00 AS Decimal(18, 2)), 9, 2, 2, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (45, N'Mens Dockland Slim Fit 5-Pocket Jeans ', N'Size: M', CAST(499.00 AS Decimal(18, 2)), 3, 3, 2, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (46, N'Mens U2497AZ Pants', N'Size: S', CAST(444.00 AS Decimal(18, 2)), 1, 4, 2, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (47, N'Mens Modern Fit Denim Pants With Slim Leg', N'Size: S', CAST(429.00 AS Decimal(18, 2)), 7, 6, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (48, N'mens Jeans', N'Size: L
', CAST(433.00 AS Decimal(18, 2)), 8, 8, 2, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (49, N'mens Jeans', N'Size: L
', CAST(469.00 AS Decimal(18, 2)), 2, 1, 2, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (50, N'mens BLR_MB_WT SHRTS 5PKT', N'Size: L
', CAST(379.00 AS Decimal(18, 2)), 6, 2, 2, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (51, N'a501® Original Fit Jeans for Men', N'Size: XXL
', CAST(454.00 AS Decimal(18, 2)), 4, 3, 2, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (52, N'a501® Original Fit Jeans for Men', N'Size: L
', CAST(429.00 AS Decimal(18, 2)), 5, 4, 2, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (53, N'Men 502™ Taper Jeans', N'Size: M', CAST(429.00 AS Decimal(18, 2)), 9, 5, 2, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (54, N'mens Band Neck Heather', N'Size: M', CAST(229.00 AS Decimal(18, 2)), 3, 8, 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (55, N'mens Internal Fur Hooded Zipped Jacket', N'Size: L
', CAST(249.00 AS Decimal(18, 2)), 1, 1, 3, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (56, N'mens Internal Fur Hooded Zipped Jacket', N'Size: L
', CAST(249.00 AS Decimal(18, 2)), 7, 2, 3, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (57, N'Mens Long Sleeves Zipper Jacket With Hoodie', N'Size: S', CAST(259.00 AS Decimal(18, 2)), 8, 3, 3, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (58, N'Mens Long Sleeves Zipper Jacket With Hoodie', N'Size: L
', CAST(259.00 AS Decimal(18, 2)), 2, 4, 3, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (59, N'Mens Long Sleeves Zipper Jacket With Hoodie', N'Size: M', CAST(259.00 AS Decimal(18, 2)), 4, 5, 3, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (60, N'mens Fashionable Zipper Jacket - Dark Grey Jacket', N'Size: XXL
', CAST(270.00 AS Decimal(18, 2)), 6, 6, 3, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (61, N'Unisex 32W22W3204 Fleece Vest', N'Size: S', CAST(299.00 AS Decimal(18, 2)), 5, 1, 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (62, N'Side Pockets Front Zip Elastic Cuffs Jacket for Men', N'Size: S', CAST(299.00 AS Decimal(18, 2)), 9, 2, 3, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (63, N'Mens Fancy Hooded Sweat Jacket ', N'Size: S', CAST(299.00 AS Decimal(18, 2)), 3, 3, 3, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (64, N'mens Ravin Sportive Camouflage Zipper Hoodie', N'Size: XXL
', CAST(300.00 AS Decimal(18, 2)), 1, 4, 3, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (65, N'Mens Hooded Neck Sleeveless Grey Quilted Vest', N'Size: XXL
', CAST(317.00 AS Decimal(18, 2)), 7, 5, 3, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (66, N'Mens Hero Basic Milton Printed, Cotton Lightweight Jacket', N'Size: M', CAST(330.00 AS Decimal(18, 2)), 8, 6, 3, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (67, N'Mens Hero Basic Milton Printed, Cotton Lightweight Jacket', N'Size: M', CAST(330.00 AS Decimal(18, 2)), 2, 8, 3, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (68, N'mens Self Pattern Hooded Jacket - Grey Jacket', N'Size: M', CAST(349.00 AS Decimal(18, 2)), 4, 2, 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (69, N'mens Tri-Tone Hooded Jacket - Dark Camel, Olive Green', N'Size: M', CAST(349.00 AS Decimal(18, 2)), 6, 3, 3, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (70, N'Mens Mens Capotene Lining Jacket With Zipper Jacket', N'Size: M', CAST(385.00 AS Decimal(18, 2)), 5, 4, 3, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (71, N'mens Zipper Casual Lightweight Jacket', N'Size: S', CAST(399.00 AS Decimal(18, 2)), 9, 5, 3, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (72, N'Mens Plaid Patterned Jacket With Chest Pockets', N'Size: L
', CAST(399.00 AS Decimal(18, 2)), 3, 6, 3, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (73, N'mens Adjustable Hooded Neck Wool Coat - Navy Blue Jacket', N'Size: L
', CAST(499.00 AS Decimal(18, 2)), 1, 8, 3, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (74, N'Mens Fancy Long Sleeve Hooded Overshirt ', N'Size: M', CAST(600.00 AS Decimal(18, 2)), 7, 1, 3, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (75, N'Mens 8114-grey SweatPant', N'Size: M', CAST(147.00 AS Decimal(18, 2)), 8, 3, 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (76, N'Mens 8138-black SweatPant', N'Size: XXL
', CAST(147.00 AS Decimal(18, 2)), 2, 4, 4, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (78, N'mens Fleece Hooded Neck Zipped Sweatshirt', N'Size: XXL
', CAST(149.00 AS Decimal(18, 2)), 4, 5, 4, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (79, N'Mens Detailed Casual Sweatpants With Printed Side', N'Size: M', CAST(159.00 AS Decimal(18, 2)), 6, 6, 4, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (80, N'Mens Mens Printed INK Hoodie With Front Pockets HOODIE', N'Size: XXL
', CAST(181.00 AS Decimal(18, 2)), 5, 8, 4, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (81, N'Mens Mens V-Neck Stripped Sweatshirt SweatShirt', N'Size: L
', CAST(189.00 AS Decimal(18, 2)), 9, 1, 4, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (82, N'Mens Mens V-Neck Stripped Sweatshirt', N'Size: S', CAST(189.00 AS Decimal(18, 2)), 3, 2, 4, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (83, N'mens Zipped Plain Navy Blue Sweatshirt', N'Size: M', CAST(199.00 AS Decimal(18, 2)), 1, 3, 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (84, N'mens Essential V-Neck Slip On Sweatshirt - Burgundy', N'Size: L
', CAST(199.00 AS Decimal(18, 2)), 7, 5, 4, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (85, N'Dare Men''s Sweatshirt Hooded', N'Size: L
', CAST(199.00 AS Decimal(18, 2)), 8, 6, 4, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (86, N'Round Neck Printed Sweatshir', N'Size: L
', CAST(299.00 AS Decimal(18, 2)), 2, 8, 4, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (87, N'mens ACTIV MEN CREW-NECK SWEATSHIRT', N'Size: M', CAST(319.00 AS Decimal(18, 2)), 4, 1, 4, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (88, N'Mens 6221277076930 Pants, NAVY', N'Size: M', CAST(319.00 AS Decimal(18, 2)), 6, 2, 4, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (89, N'Mens Hoodie With BaggyPants Training Suit', N'Size: M', CAST(325.00 AS Decimal(18, 2)), 9, 3, 4, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (90, N'Men sweetshirt hoodie long sleeves', N'Size: S', CAST(335.00 AS Decimal(18, 2)), 3, 4, 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (91, N'Men sweetshirt hoodie long sleeves', N'Size: S', CAST(335.00 AS Decimal(18, 2)), 1, 6, 4, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (92, N'Mens Striped Winter Zipped Hoodie With Inner Fleece', N'Size: S', CAST(339.00 AS Decimal(18, 2)), 7, 8, 4, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (93, N'sweetshirt hoodie long sleeves Men navy', N'Size: XXL
', CAST(349.00 AS Decimal(18, 2)), 8, 1, 4, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (94, N'Mix Color Oversize Hoody-Black', N'Size: M', CAST(359.00 AS Decimal(18, 2)), 2, 2, 4, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (95, N'mens 55431 Tri-tone Essential Hoodie', N'Size: M', CAST(393.00 AS Decimal(18, 2)), 4, 3, 4, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (96, N'mens 96225 Tri-tone " Nasa" Sweatshirt', N'Size: L
', CAST(439.00 AS Decimal(18, 2)), 6, 4, 4, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (100, N'Men pajama short half sleeves printed', N'Size: L
', CAST(169.00 AS Decimal(18, 2)), 5, 5, 7, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (101, N'Men pajama short half sleeves printed', N'Size: M', CAST(169.00 AS Decimal(18, 2)), 9, 8, 7, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (102, N'Men Contrast V Neck T Shirt with Side Pocket Shorts', N'Size: M', CAST(169.00 AS Decimal(18, 2)), 3, 1, 7, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (103, N'off cliff Solid T Shirt And Plaids Short Pajama ', N'Size: M', CAST(219.00 AS Decimal(18, 2)), 1, 2, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (104, N'Off Cliff Men Pyjama Plaided Short & Round Tshirt', N'Size: M', CAST(219.00 AS Decimal(18, 2)), 7, 3, 7, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (105, N'Off Cliff Men Pyjama Plaided Short & Round Tshirt', N'Size: M', CAST(219.00 AS Decimal(18, 2)), 8, 4, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (106, N'off cliff Plain T Shirt And Plaids Short Pajama ', N'Size: M', CAST(219.00 AS Decimal(18, 2)), 2, 5, 7, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (107, N'Men Pyjama Plaided Pants & V Neck Tshirt', N'Size: L
', CAST(229.00 AS Decimal(18, 2)), 4, 6, 7, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (108, N'mens Front Pocket Striped Pajamas Front Pocket ', N'Size: S', CAST(229.00 AS Decimal(18, 2)), 6, 1, 7, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (109, N'mens V Neck Striped Basic Pajamas', N'Size: L
', CAST(229.00 AS Decimal(18, 2)), 5, 2, 7, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (110, N'Men Classic Collar Buttoned Plaids Pajama Set', N'Size: M', CAST(239.00 AS Decimal(18, 2)), 9, 3, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (111, N'Off Cliff Men Pyjama Plaided Pants & V-Neck Tshirt, Navy', N'Size: S', CAST(249.00 AS Decimal(18, 2)), 3, 4, 7, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (112, N'mens Bi-Tone Heather Brown & Black Training Suit Pajama', N'Size: S', CAST(249.00 AS Decimal(18, 2)), 1, 5, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (113, N'off cliff pyjama set plain shorts with round buttoned T-shirt', N'Size: L
', CAST(259.00 AS Decimal(18, 2)), 7, 6, 7, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (114, N'off cliff pyjama set plain shorts with round buttoned T-shirt', N'Size: L
', CAST(259.00 AS Decimal(18, 2)), 8, 8, 7, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (115, N'Off Cliff Men Pyjama Plaided Pyjama Pants with buttons', N'Size: L
', CAST(269.00 AS Decimal(18, 2)), 2, 2, 7, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (116, N'Off Cliff mens Men Pyjama Plaided Pyjama Pants ', N'Size: M', CAST(269.00 AS Decimal(18, 2)), 4, 3, 7, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (117, N'Men Striped Polo Shirt & Pants Pajama Set', N'Size: M', CAST(270.00 AS Decimal(18, 2)), 6, 4, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (118, N'off cliff Striped T Shirt And Solid Shorts Pajama Set', N'Size: S', CAST(289.00 AS Decimal(18, 2)), 5, 5, 7, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (119, N'off cliff Patch Pocket T Shirt & Checkered Pants Pajama Set', N'Size: S', CAST(299.00 AS Decimal(18, 2)), 9, 6, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (120, N'off cliff Patch Pocket T Shirt & Checkered Pants Pajama Set', N'Size: S', CAST(299.00 AS Decimal(18, 2)), 3, 8, 7, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (121, N'Men''s Round Toe Lace Up Faux Leather', N'Size: M', CAST(119.00 AS Decimal(18, 2)), 1, 1, 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (122, N'H01-Hammer-Round Toe Textile Casual Sneakers', N'Size: L
', CAST(119.00 AS Decimal(18, 2)), 7, 3, 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (123, N'ACTIVNEW MEN''S SPORT SHOES', N'Size: XXL
', CAST(299.00 AS Decimal(18, 2)), 8, 4, 8, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (124, N'Men Casual Shoes', N'Size: XXL
', CAST(299.00 AS Decimal(18, 2)), 2, 5, 8, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (125, N'Womens MANS43 Sneaker, White', N'Size: S', CAST(309.00 AS Decimal(18, 2)), 4, 6, 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (126, N'Grinta', N'Size: M', CAST(319.00 AS Decimal(18, 2)), 6, 8, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (127, N'Men Causal Shoes', N'Size: M', CAST(359.00 AS Decimal(18, 2)), 5, 1, 8, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (128, N'Mens RB557', N'Size: L
', CAST(369.00 AS Decimal(18, 2)), 9, 2, 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (129, N'Mens RB555', N'Size: L
', CAST(369.00 AS Decimal(18, 2)), 3, 4, 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (130, N'Mens RNGHRA46 Oxford, Havan', N'Size: S', CAST(369.00 AS Decimal(18, 2)), 1, 5, 8, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (131, N'Z3-956-Fashionable genuine leather lace up', N'Size: S', CAST(404.00 AS Decimal(18, 2)), 7, 6, 8, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (132, N'Mens MANS36 Sneaker, Brown', N'Size: S', CAST(449.00 AS Decimal(18, 2)), 8, 8, 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (133, N'Mens VS104-NAvy Sneaker, NAvy', N'Size: S', CAST(489.00 AS Decimal(18, 2)), 2, 1, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (134, N'Mens VS115-Black Sneaker, Black', N'Size: M', CAST(489.00 AS Decimal(18, 2)), 6, 2, 8, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (135, N'Faux Leather Black Sneakers', N'Size: M', CAST(499.00 AS Decimal(18, 2)), 4, 3, 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (136, N'Mens SOCCER SHOES SC11152-1-M Sneaker', N'Size: M', CAST(899.00 AS Decimal(18, 2)), 5, 5, 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (137, N'Mens WALKING SHOES 20227202 Sneaker', N'Size: M', CAST(934.00 AS Decimal(18, 2)), 9, 6, 8, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (138, N'Mens MEN''S RUNNING SHOES Sneaker', N'Size: M', CAST(1024.00 AS Decimal(18, 2)), 3, 8, 8, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (139, N'Mens RUNNING SHOES Sneaker', N'Size: L
', CAST(1199.00 AS Decimal(18, 2)), 1, 1, 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (140, N'Vans', N'Size: L
', CAST(1639.00 AS Decimal(18, 2)), 7, 2, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [Brand_Id], [Category_Id], [Store_Id]) VALUES (141, N'Shoes, Mens', N'Size: L
', CAST(1649.00 AS Decimal(18, 2)), 8, 3, 8, 9)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (1, N'Art.Gallery.Misr', N'Tops (shirts, blouses, t-shirts, etc.)', N'ibn zinky zamalek', N'Cairo', N'Egypt', N'AG')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (2, N'souqmasr', N'Activeware (athletic clothing, workout clothes, etc.)', N'61, South, N 90th Street', N'Cairo', N'Egypt', N'AH')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (3, N'PrintOnline_egy', N'Underwear (bras, panties, etc.)', N'Al mokattam', N'Cairo', N'Egypt', N'AK')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (5, N'JOE.STORE', N'Sleepwear (pajamas, nightgowns, etc.)', N'Kanat Al Sweis
', N'Mansoura', N'Egypt', N'AK')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (6, N'indoor1975', N'Bottoms (pants, shorts, skirts, etc.)', N'Gehan Al Sadat', N'Mansoura', N'Egypt', N'AG')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (7, N'D WOLFSTORE', N'Outerwear (jackets, coats, etc.)', N'El-Zomor Canal
', N'Giza', N'Egypt', N'AM')
INSERT [dbo].[Stores] ([Id], [Name], [Description], [Street], [City], [Country], [Supplier_Id]) VALUES (9, N'White Rabbit-EG', N'Footwear (shoes, boots, sandals, etc.)', N'EL Mohandseen ', N'Giza', N'Egypt', N'AH')
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_Order_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_Order_Id] ON [dbo].[OrderItems]
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DeliveryMethod_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethod_Id] ON [dbo].[Orders]
(
	[DeliveryMethod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_User_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_User_Id] ON [dbo].[Orders]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_Brand_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_Brand_Id] ON [dbo].[Products]
(
	[Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_Category_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_Category_Id] ON [dbo].[Products]
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_Store_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_Store_Id] ON [dbo].[Products]
(
	[Store_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Promotions_Product_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Promotions_Product_Id] ON [dbo].[Promotions]
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_Pro_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_Pro_Id] ON [dbo].[Reviews]
(
	[Pro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stores_Supplier_Id]    Script Date: 3/30/2023 10:50:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Stores_Supplier_Id] ON [dbo].[Stores]
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products_Pro_Id] FOREIGN KEY([Pro_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products_Pro_Id]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_Order_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_Order_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethod_Id] FOREIGN KEY([DeliveryMethod_Id])
REFERENCES [dbo].[DeliveryMethods] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethod_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_Brand_Id] FOREIGN KEY([Brand_Id])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_Brand_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_Category_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Stores_Store_Id] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[Stores] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Stores_Store_Id]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_Products_Product_Id] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [FK_Promotions_Products_Product_Id]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products_Pro_Id] FOREIGN KEY([Pro_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products_Pro_Id]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_AspNetUsers_Supplier_Id] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_AspNetUsers_Supplier_Id]
GO
USE [master]
GO
ALTER DATABASE [WekalaDB] SET  READ_WRITE 
GO
