USE [GrosHub]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/28/2022 4:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CategoryName] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/28/2022 4:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 5/28/2022 4:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[UserId] [varchar](50) NOT NULL,
	[ProductId] [uniqueidentifier] NULL,
	[RatingCounter] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/28/2022 4:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NOT NULL,
	[ProductId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 5/28/2022 4:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[TownCity] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pin] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/28/2022 4:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[TownCity] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Pin] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
