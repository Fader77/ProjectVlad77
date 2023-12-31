USE [master]
GO
/****** Object:  Database [Marchenko_ISP401]    Script Date: 02.12.2023 14:06:48 ******/
CREATE DATABASE [Marchenko_ISP401]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Marchenko_ISP401', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Marchenko_ISP401.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Marchenko_ISP401_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Marchenko_ISP401_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Marchenko_ISP401] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Marchenko_ISP401].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Marchenko_ISP401] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET ARITHABORT OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Marchenko_ISP401] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Marchenko_ISP401] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Marchenko_ISP401] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Marchenko_ISP401] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET RECOVERY FULL 
GO
ALTER DATABASE [Marchenko_ISP401] SET  MULTI_USER 
GO
ALTER DATABASE [Marchenko_ISP401] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Marchenko_ISP401] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Marchenko_ISP401] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Marchenko_ISP401] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Marchenko_ISP401] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Marchenko_ISP401', N'ON'
GO
ALTER DATABASE [Marchenko_ISP401] SET QUERY_STORE = OFF
GO
USE [Marchenko_ISP401]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Marchenko_ISP401]
GO
/****** Object:  Table [dbo].[Product_catalog]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_catalog](
	[ProductArticle] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductUnitOfMeasurment] [nvarchar](255) NULL,
	[ProductCost] [float] NULL,
	[ProductMaxDiscount] [float] NULL,
	[ProductManufacturer] [nvarchar](255) NULL,
	[ProductProvider] [nvarchar](255) NULL,
	[ProductCategory] [nvarchar](255) NULL,
	[ProductDiscountAmount] [float] NULL,
	[ProductQuantityInStock] [float] NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[ProductPhoto] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_111]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_111]
AS
SELECT        ProductArticle AS Артикле, ProductName AS Название, ProductUnitOfMeasurment AS [Единица измерения], ProductCost AS Стоимость, ProductMaxDiscount AS [Максимальная скидка], 
                         ProductManufacturer AS Производитель, ProductProvider AS Поставщик, ProductCategory AS Категория, ProductDiscountAmount AS Скидка, ProductQuantityInStock AS Количество, ProductDescription AS Описание, 
                         ProductPhoto AS Фото
FROM            dbo.Product_catalog
GO
/****** Object:  Table [dbo].[Order_amount]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_amount](
	[ID] [float] NULL,
	[Article_Number] [nvarchar](255) NULL,
	[Order_amount] [float] NULL,
	[Order_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [float] NULL,
	[Order_date] [datetime] NULL,
	[Delivery_date] [datetime] NULL,
	[Order_point_of_pick] [float] NULL,
	[Order_client_id] [float] NULL,
	[Order_code] [float] NULL,
	[Order_status] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point_of_pick]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_of_pick](
	[Id_pick_up_point] [float] NULL,
	[Index] [float] NULL,
	[City] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[House] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_id] [int] NOT NULL,
	[Role_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.12.2023 14:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_client] [int] NOT NULL,
	[UserSurname] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[UserPatronymic] [nvarchar](255) NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[ID_Role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (1, N'K478R4', 10, 1)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (2, N'S563T4', 2, 2)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (3, N'K083T5', 11, 3)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (4, N'B037T5', 1, 4)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (5, N'R922T5', 7, 5)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (6, N'V783T5', 1, 6)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (7, N'H937R3', 1, 7)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (8, N'F903T5', 4, 8)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (9, N'R836R5', 1, 9)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (10, N'D832R2', 5, 10)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (11, N'F933T5', 5, 1)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (12, N' D034T5', 6, 2)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (13, N' D826T5', 11, 3)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (14, N' D832R2', 5, 4)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (15, N' D044T5', 5, 5)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (16, N' F933T5', 5, 6)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (17, N' S039T5', 3, 7)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (18, N' F937R4', 3, 8)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (19, N' D826T5', 2, 9)
INSERT [dbo].[Order_amount] ([ID], [Article_Number], [Order_amount], [Order_id]) VALUES (20, N' D044T5', 2, 10)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 2, 51, 111, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (2, CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-08T00:00:00.000' AS DateTime), 8, 0, 112, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (3, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 10, 0, 113, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (4, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 12, 0, 114, 1)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (5, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 15, 0, 115, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (6, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 18, 52, 116, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (7, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 20, 0, 117, 1)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (8, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 25, 0, 118, 0)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (9, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 30, 0, 119, 1)
INSERT [dbo].[Orders] ([Order_id], [Order_date], [Delivery_date], [Order_point_of_pick], [Order_client_id], [Order_code], [Order_status]) VALUES (10, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 36, 53, 120, 0)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (1, 344288, N' г. Ковров', N' ул. Чехова', 1)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (2, 614164, N' г. Ковров', N' ул. Степная', 30)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (3, 394242, N' г. Ковров', N' ул. Коммунистическая', 43)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (4, 660540, N' г. Ковров', N' ул. Солнечная', 25)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (5, 125837, N' г. Ковров', N' ул. Шоссейная', 40)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (6, 125703, N' г. Ковров', N' ул. Партизанская', 49)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (7, 625283, N' г. Ковров', N' ул. Победы', 46)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (8, 614611, N' г. Ковров', N' ул. Молодежная', 50)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (9, 454311, N' г. Ковров', N' ул. Новая', 19)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (10, 660007, N' г. Ковров', N' ул. Октябрьская', 19)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (11, 603036, N' г. Ковров', N' ул. Садовая', 4)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (12, 450983, N' г. Ковров', N' ул. Комсомольская', 26)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (13, 394782, N' г. Ковров', N' ул. Чехова', 3)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (14, 603002, N' г. Ковров', N' ул. Дзержинского', 28)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (15, 450558, N' г. Ковров', N' ул. Набережная', 30)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (16, 394060, N' г. Ковров', N' ул. Фрунзе', 43)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (17, 410661, N' г. Ковров', N' ул. Школьная', 50)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (18, 625590, N' г. Ковров', N' ул. Коммунистическая', 20)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (19, 625683, N' г. Ковров', N' ул. 8 Марта', 77)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (20, 400562, N' г. Ковров', N' ул. Зеленая', 32)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (21, 614510, N' г. Ковров', N' ул. Маяковского', 47)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (22, 410542, N' г. Ковров', N' ул. Светлая', 46)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (23, 620839, N' г. Ковров', N' ул. Цветочная', 8)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (24, 443890, N' г. Ковров', N' ул. Коммунистическая', 1)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (25, 603379, N' г. Ковров', N' ул. Спортивная', 46)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (26, 603721, N' г. Ковров', N' ул. Гоголя', 41)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (27, 410172, N' г. Ковров', N' ул. Северная', 13)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (28, 420151, N' г. Ковров', N' ул. Вишневая', 32)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (29, 125061, N' г. Ковров', N' ул. Подгорная', 8)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (30, 630370, N' г. Ковров', N' ул. Шоссейная', 24)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (31, 614753, N' г. Ковров', N' ул. Полевая', 35)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (32, 426030, N' г. Ковров', N' ул. Маяковского', 44)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (33, 450375, N' г. Ковров', N' ул. Клубная', 44)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (34, 625560, N' г. Ковров', N' ул. Некрасова', 12)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (35, 630201, N' г. Ковров', N' ул. Комсомольская', 17)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (36, 190949, N' г. Ковров', N' ул. Мичурина', 26)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Point_of_pick] ([Id_pick_up_point], [Index], [City], [Street], [House]) VALUES (NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K478R4', N'Аромат', N'шт.', 3500, 30, N'Esteban', N'Стокманн', N'Ароматы для дома', 4, 4, N'Аромат для декобукета Esteban', N'K478R4.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V783T5', N'Ваза', N'шт.', 1300, 25, N'Home Philosophy', N'Стокманн', N'Вазы', 2, 13, N'Ваза из керамики Betty', N'V783T5.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V483R7', N'Ваза', N'шт.', 100, 15, N'Весна', N'Hoff', N'Вазы', 3, 7, N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'V483R7.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S563T4', N'Свеча', N'шт.', 1000, 20, N'True Scents', N'Hoff', N'Свечи', 3, 12, N'Свеча в стакане True Scents', N'S563T4.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P927R2', N'Подставка', N'шт.', 4000, 15, N'Valley', N'Стокманн', N'Горшки и подставки', 2, 4, N'Подставка для цветочных горшков Valley', N'P927R2.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F933T5', N'Кашпо', N'шт.', 1400, 20, N'Cube Color', N'Hoff', N'Горшки и подставки', 4, 23, N'Настольное кашпо с автополивом Cube Color', N'F933T5.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H023R8', N'Часы', N'шт.', 5600, 15, N'Umbra', N'Стокманн', N'Часы', 2, 6, N'Часы настенные Ribbon 30,5 см', N'H023R8.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H937R3', N'Часы', N'шт.', 999, 10, N'Umbra', N'Hoff', N'Часы', 3, 4, N'Часы настенные 6500 30,2 см', N'H937R3.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D034T5', N'Диффузор', N'шт.', 800, 20, N'Miksdo', N'Hoff', N'Ароматы для дома', 2, 15, N'Диффузор Mikado intense Апельсин с корицей', N'D034T5.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P936E4', N'Подставка', N'шт.', 3590, 15, N'Umbra', N'Стокманн', N'Горшки и подставки', 4, 9, N'Подставка для газет и журналов Zina', N'P936E4.jpg')
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K937T4', N'Аромат', N'шт.', 7900, 25, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, 17, N'Деко-букет Кедр 250 мл', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P846R4', N'Подставка', N'шт.', 1400, 15, N'Valley', N'Стокманн', N'Горшки и подставки', 3, 12, N'Подставка для цветочных горшков 55x25x35 см Valley', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S039T5', N'Свеча', N'шт.', 250, 10, N'True Scents', N'Hoff', N'Свечи', 2, 18, N'Свеча True Moods Feel happy', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D947R5', N'Диффузор', N'шт.', 500, 5, N'Aroma', N'Hoff', N'Ароматы для дома', 4, 6, N'Диффузор Aroma Harmony Lavender', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F903T5', N'Фоторамка', N'шт.', 600, 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, 3, N'Фоторамка Gallery 20х30 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S937T5', N'Подсвечник', N'шт.', 2600, 10, N'Kersten', N'Стокманн', N'Ароматы для дома', 3, 23, N'Подсвечник 37 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R836R5', N'Шкатулка', N'шт.', 8000, 30, N'Umbra', N'Стокманн', N'Шкатулки и подставки', 5, 3, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F837T5', N'Фоторамка', N'шт.', 999, 5, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, 15, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V432R6', N'Ваза', N'шт.', 1990, 10, N'Kersten', N'Стокманн', N'Вазы', 3, 30, N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F928T5', N'Фоторамка', N'шт.', 1590, 25, N'Umbra', N'Стокманн', N'Картины и фоторамки', 2, 13, N'Фоторамка Prisma 10х10 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F937R4', N'Фоторамка', N'шт.', 359, 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 4, 17, N'Фоторамка 10х15 см Gallery серый с патиной/золотой', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K083T5', N'Аромат', N'шт.', 2790, 20, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, 6, N'Сменный аромат Figue noire 250 мл', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V937E4', N'Ваза', N'шт.', 1999, 15, N'Kersten', N'Hoff', N'Вазы', 3, 21, N'Ваза 18H2535S 30,5 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R922T5', N'Шкатулка', N'шт.', 690, 10, N'Home Philosophy', N'Стокманн', N'Шкатулки и подставки', 2, 4, N'Шкатулка из керамики Lana 6х7 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B025Y5', N'Блюдо', N'шт.', 1890, 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 8, N'Блюдо декоративное flower 35 см Home Philosophy', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D826T5', N'Диффузор', N'шт.', 600, 5, N'True Scents', N'Hoff', N'Ароматы для дома', 2, 13, N'Диффузор True Scents 45 мл манго', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S936Y5', N'Свеча', N'шт.', 299, 15, N'True Scents', N'Hoff', N'Ароматы для дома', 3, 4, N'Свеча в стакане True Scents', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B037T5', N'Блюдо', N'шт.', 690, 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 2, 14, N'Блюдо декоративное Flower 35 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D832R2', N'Растение', N'шт.', 1000, 10, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 15, N'Декоративное растение 102 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D044T5', N'Декор настенный', N'шт.', 1790, 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 7, N'Декор настенный Фантазия 45х45х1 см', NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product_catalog] ([ProductArticle], [ProductName], [ProductUnitOfMeasurment], [ProductCost], [ProductMaxDiscount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[Roles] ([Role_id], [Role_name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Roles] ([Role_id], [Role_name]) VALUES (2, N'Админ')
INSERT [dbo].[Roles] ([Role_id], [Role_name]) VALUES (3, N'Клиент')
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (1, N'Алексеев ', N'Владислав', N'Аркадьевич', N'loginDEbct2018', N'Qg3gff', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (2, N'Савельева ', N'Евфросиния', N'Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (3, N'Никонов ', N'Мэлс', N'Лукьевич', N'loginDEuro2018', N'a1MIcO', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (4, N'Горшкова ', N'Агафья', N'Онисимовна', N'loginDEpst2018', N'0CyGnX', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (5, N'Горбачёв ', N'Пантелеймон', N'Германович', N'loginDEpsu2018', N'Vx9cQ{', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (6, N'Ершова ', N'Иванна', N'Максимовна', N'loginDEzqs2018', N'qM9p7i', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (7, N'Туров ', N'Денис', N'Геласьевич', N'loginDEioe2018', N'yMPu&2', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (8, N'Носова ', N'Наина', N'Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (9, N'Куликов ', N'Андрей', N'Святославович', N'loginDEfsp2018', N'&dtlI+', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (10, N'Нестеров ', N'Агафон', N'Георгьевич', N'loginDExcd2018', N'SZXZNL', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (11, N'Козлов ', N'Геласий', N'Христофорович', N'loginDEvlf2018', N'O5mXc2', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (12, N'Борисова ', N'Анжелика', N'Анатольевна', N'loginDEanv2018', N'Xiq}M3', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (13, N'Суханов ', N'Станислав', N'Фролович', N'loginDEzde2018', N'tlO3x&', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (14, N'Тетерина ', N'Феврония', N'Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (15, N'Муравьёва ', N'Александра', N'Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (16, N'Новикова ', N'Лукия', N'Ярославовна', N'loginDEwjv2018', N'ZfseKA', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (17, N'Агафонова ', N'Лариса', N'Михаиловна', N'loginDEiry2018', N'5zu7+}', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (18, N'Сергеева ', N'Агата', N'Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (19, N'Колобова ', N'Елена', N'Евгеньевна', N'loginDExxv2018', N'+daE|T', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (20, N'Ситников ', N'Николай', N'Филатович', N'loginDEbto2018', N'b1iYMI', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (21, N'Белов ', N'Роман', N'Иринеевич', N'loginDEfbs2018', N'v90Rep', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (22, N'Волкова ', N'Алла', N'Лукьевна', N'loginDEple2018', N'WlW+l8', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (23, N'Кудрявцева ', N'Таисия', N'Игоревна', N'loginDEhhx2018', N'hmCHeQ', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (24, N'Семёнова ', N'Октябрина', N'Христофоровна', N'loginDEayn2018', N'Ka2Fok', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (25, N'Смирнов ', N'Сергей', N'Яковович', N'loginDEwld2018', N'y9HStF', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (26, N'Брагина ', N'Алина', N'Валерьевна', N'loginDEhuu2018', N'X31OEf', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (27, N'Евсеев ', N'Игорь', N'Донатович', N'loginDEmjb2018', N'5mm{ch', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (28, N'Суворов ', N'Илья', N'Евсеевич', N'loginDEdgp2018', N'1WfJjo', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (29, N'Котов ', N'Денис', N'Мартынович', N'loginDEgyi2018', N'|7nYPc', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (30, N'Бобылёва ', N'Юлия', N'Егоровна', N'loginDEmvn2018', N'Mrr9e0', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (31, N'Брагин ', N'Бронислав', N'Георгьевич', N'loginDEfoj2018', N'nhGc+D', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (32, N'Александров ', N'Владимир', N'Дамирович', N'loginDEuuo2018', N'42XmH1', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (33, N'Фокин ', N'Ириней', N'Ростиславович', N'loginDEhsj2018', N's+jrMW', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (34, N'Воронов ', N'Митрофан', N'Антонович', N'loginDEvht2018', N'zMyS8Z', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (35, N'Маслов ', N'Мстислав', N'Антонинович', N'loginDEeqo2018', N'l5CBqA', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (36, N'Щербаков ', N'Георгий', N'Богданович', N'loginDExrf2018', N'mhpRIT', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (37, N'Кириллова ', N'Эмилия', N'Федосеевна', N'loginDEfku2018', N'a1m+8c', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (38, N'Васильев ', N'Серапион', N'Макарович', N'loginDExix2018', N'hzxtnn', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (39, N'Галкина ', N'Олимпиада', N'Владленовна', N'loginDEqrf2018', N'mI8n58', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (40, N'Яковлева ', N'Ксения', N'Онисимовна', N'loginDEhlk2018', N'g0jSed', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (41, N'Калашникова ', N'Александра', N'Владимировна', N'loginDEwoe2018', N'yOtw2F', 2)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (42, N'Медведьева ', N'Таисия', N'Тихоновна', N'loginDExyu2018', N'7Fg}9p', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (43, N'Карпова ', N'Ольга', N'Лукьевна', N'loginDEcor2018', N'2cIrC8', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (44, N'Герасимов ', N'Мстислав', N'Дамирович', N'loginDEqon2018', N'YeFbh6', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (45, N'Тимофеева ', N'Ксения', N'Валерьевна', N'loginDEyfd2018', N'8aKdb0', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (46, N'Горбунов ', N'Вячеслав', N'Станиславович', N'loginDEtto2018', N'qXYDuu', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (47, N'Кошелева ', N'Кира', N'Владиславовна', N'loginDEdal2018', N'cJWXL0', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (48, N'Панфилова ', N'Марина', N'Борисовна', N'loginDEbjs2018', N'Xap2ct', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (49, N'Кудрявцев ', N'Матвей', N'Игоревич', N'loginDEdof2018', N'kD|LRU', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (50, N'Зуев ', N'Эдуард', N'Пантелеймонович', N'loginDEsnh2018', N'kjwehfkd', 1)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (51, N'Архипова', N'Оливия', N'Дмитриевна', N'loginDetrkn2020', N'dsfjlknfkle', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (52, N'Никонова', N'Татьяна', N'Захаровна', N'logindefjdkg2021', N'dfsgjkdrhg', 3)
INSERT [dbo].[Users] ([ID_client], [UserSurname], [UserName], [UserPatronymic], [Login], [Password], [ID_Role]) VALUES (53, N'Рябова', N'Диана', N'Павловна', N'loginufghh2022', N'grsughrj', 3)
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([Role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[Data_checking]    Script Date: 02.12.2023 14:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Data_checking] 
@login varchar(50),
@password varchar(50)

AS
BEGIN
	
SELECT *
	FROM [Users]
	WHERE [Login]=@login and [Password]=@password
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product_catalog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 8
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
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_111'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_111'
GO
USE [master]
GO
ALTER DATABASE [Marchenko_ISP401] SET  READ_WRITE 
GO
