USE [GrosHub]
GO
/****** Object:  UserDefinedFunction [dbo].[USP_GetReview]    Script Date: 14-08-2022 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[USP_GetReview]
(
	@ProductId	INT =NULL
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @COUNT INT

	-- Add the T-SQL statements to compute the return value here
	SET @COUNT=(SELECT COUNT(*) FROM Review WHERE ProductId=@ProductId)

	-- Return the result of the function
	RETURN @COUNT

END
GO
/****** Object:  Table [dbo].[Order]    Script Date: 14-08-2022 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[ProductId] [int] NULL,
	[OrderQty] [int] NULL,
	[OrderAmt] [nvarchar](50) NULL,
	[StockId] [int] NULL,
	[ActualPrice] [decimal](18, 2) NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[DeliveryCharge] [decimal](18, 2) NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[ExpectedDeliveryDate] [datetime] NULL,
	[DeliveryStatus] [nvarchar](50) NULL,
	[CancelReason] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGallery]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGallery](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](50) NULL,
	[ProductId] [int] NULL,
	[IsPrimary] [bit] NULL,
 CONSTRAINT [PK_ProductGallery] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[RatingCounter] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NULL,
	[ProductId] [varchar](50) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[TownCity] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[IsCurrent] [bit] NULL,
 CONSTRAINT [PK_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CategoryId] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Discount] [int] NULL,
	[DeliveryChanrge] [decimal](18, 2) NULL,
	[DiscountedPrice] [decimal](18, 2) NULL,
	[ToTalPrice] [decimal](18, 2) NULL,
	[BrandName] [nvarchar](50) NULL,
	[StockDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Amount] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[BalanceQuantity] [int] NULL,
	[Weight] [nvarchar](50) NULL,
	[ShippingDay] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[AdminName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[TownCity] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Pin] [int] NULL,
	[ProfilePicture] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (1, N'Fruits')
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (2, N'Vegetables')
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (3, N'Cooking Essentials')
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (4, N'Dairy
 Products')
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (5, N'Test Category')
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductGallery] ON 
GO
INSERT [dbo].[ProductGallery] ([ProductImageId], [ImagePath], [ProductId], [IsPrimary]) VALUES (4, N'cvxc', NULL, NULL)
GO
INSERT [dbo].[ProductGallery] ([ProductImageId], [ImagePath], [ProductId], [IsPrimary]) VALUES (6, N'Product/141.jpg', 1, 1)
GO
INSERT [dbo].[ProductGallery] ([ProductImageId], [ImagePath], [ProductId], [IsPrimary]) VALUES (7, N'Product/261.jpg', 2, 1)
GO
INSERT [dbo].[ProductGallery] ([ProductImageId], [ImagePath], [ProductId], [IsPrimary]) VALUES (8, N'Product/371.jpg', 3, 1)
GO
INSERT [dbo].[ProductGallery] ([ProductImageId], [ImagePath], [ProductId], [IsPrimary]) VALUES (9, N'Product/181.png', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductGallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (1, N'Mango', 1, N'Fresh')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (2, N'Patato', 2, N'The potato is one of some 150 tuber-bearing species of the genus Solanum (a tuber is the swollen end of an underground stem). The compound leaves are spirally arranged; each leaf is 20–30 cm (about 8–12 inches) long and consists of a terminal leaflet and two to four pairs of leaflets.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (3, N'Onion', 2, N'Word forms: plural onions. variable noun. An onion is a round vegetable with a brown skin that grows underground. It has many white layers on its inside which have a strong, sharp smell and taste.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (4, N'Atta', 3, N'Atta/Ata or chakki atta is a wholemeal wheat flour, originating from the Indian subcontinent, used to make flatbreads such as chapati, roti, naan, paratha and puri. It is the most widespread flour in the Indian subcontinent')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (5, N'Maida', 3, N'Maida is a white flour from the Indian subcontinent, made from wheat. Finely milled without any bran, refined, and bleached, it closely resembles cake flour. Maida is used extensively for making fast foods, baked goods such as pastries, bread,')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (6, N'Edible Oils', 3, N'Cooking oil is plant, animal, or synthetic liquid fat used in frying, baking, and other types of cooking. It is also used in food preparation and flavoring not involving heat, such as salad dressings and bread dips, and may be called edible oil')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (7, N'Ghee', 3, N'Ghee is a class of clarified butter from India. It is commonly used in cuisine of the Indian subcontinent, Middle Eastern cuisine, traditional medicine, and religious rituals')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (8, N'Masalas', 3, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (9, N'Milk', 4, N'Milk is essentially an emulsion of fat and protein in water, along with dissolved sugar (carbohydrate), minerals, and vitamins. These constituents are present in the milk of all mammals, though their proportions differ from one species to another and within species.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (10, N'Cream', 4, N'ream, yellowish component of milk, rich in fat globules, that rises to the surface naturally if milk is allowed to stand; in the dairy industry, cream is separated mechanically (see cream separator). Homogenization of cream reduces the size of the fat globules, and the resulting product is less suitable for whipping.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (11, N'Butter', 4, N'Butter, a yellow-to-white solid emulsion of fat globules, water, and inorganic salts produced by churning the cream from cows'' milk. Butter has long been used as a spread and as a cooking fat. It is an important edible fat in northern Europe, North America, and other places where cattle are the primary dairy animals.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (12, N'Yogurt', 4, N'Yogurt is a dairy product made by fermenting milk with a yogurt culture. It provides protein and calcium, and it may enhance healthy gut bacteria. Health benefits range from protecting against osteoporosis to relieving irritable bowel disease and aiding digestion, but these depend on the type of yogurt consumed.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (13, N'Cheese', 4, N'Cheese is a dairy product produced in wide ranges of flavors, textures, and forms by coagulation of the milk protein casein. It comprises proteins and fat from milk, usually the milk of cows, buffalo, goats, or sheep.')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description]) VALUES (14, N'Icecream', 4, N'Ice cream in American English
a rich, sweet, creamy frozen food made from variously flavored cream and milk products churned or stirred to a smooth consistency during the freezing process and often containing gelatin, eggs, fruits, nuts, etc.')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAddress] ON 
GO
INSERT [dbo].[ShippingAddress] ([AddressId], [UserId], [Address], [TownCity], [Country], [State], [Pin], [IsCurrent]) VALUES (1, N'User', N'135 Jadavpur', N'Kolkata', N'India', N'WB', N'700032', 0)
GO
INSERT [dbo].[ShippingAddress] ([AddressId], [UserId], [Address], [TownCity], [Country], [State], [Pin], [IsCurrent]) VALUES (2, N'User', N'J234 SaltLake', N'Kolkata', N'India', N'WB', N'700032', 0)
GO
INSERT [dbo].[ShippingAddress] ([AddressId], [UserId], [Address], [TownCity], [Country], [State], [Pin], [IsCurrent]) VALUES (3, N'User', N'32 Beleghata', N'Kolkata', N'India', N'WB', N'700032', 1)
GO
SET IDENTITY_INSERT [dbo].[ShippingAddress] OFF
GO
INSERT [dbo].[tblAdmin] ([AdminId], [Password], [AdminName]) VALUES (N'Admin', N'12345', N'GrosHub')
GO
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Gender], [PhoneNo], [Email], [Address], [TownCity], [Country], [State], [Pin], [ProfilePicture]) VALUES (N'user', N'Dipsha Nandy', N'123412', N'Female', N'9867567', N'a@a.com', N'Kolkata', N'Kolkata', N'India', N'WB', 7000056, N'profilePicture/User.png')
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategoryDetails]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
-- =============================================      
-- Author:  <Author,,Name>      
-- Create date: <Create Date,,>      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[usp_GetCategoryDetails]       
 @ProductId INT =NULL,     
 @CategoryId INT =NULL,  
 @SearchText NVARCHAR(100) =NULL  
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
    SELECT PC.CategoryId,PC.CategoryName,P.ProductId,P.ProductName,P.[Description],      
 S.StockId,ISNULL(S.Price,0.0) Price,S.Discount,S.DeliveryChanrge,S.DiscountedPrice,S.ToTalPrice      
 ,S.BrandName,S.StockDate,S.ExpiryDate,S.Amount,S.Quantity      
 ,CASE WHEN S.StockDate>GETDATE() AND ISNULL(S.BalanceQuantity,0)<>0 THEN 'Availabilable'      
 ELSE 'Currently UnAvailabilable' END 'Availability',      
 PG.ImagePath,[DBO].[USP_GetReview](P.ProductId) Review,      
 CASE WHEN S.DeliveryChanrge=0 THEN 'Free Delivery' ELSE DeliveryChanrge END DeliveryChanrge,      
 ISNULL(ShippingDay,0) ShippingDay,S.Weight      
 FROM ProductCategory PC      
 INNER JOIN Products P ON PC.CategoryId=P.CategoryId      
 LEFT OUTER JOIN ProductGallery PG ON P.ProductId=PG.ProductId      
 LEFT OUTER JOIN Stock S ON P.ProductId=S.ProductId      
       
 LEFT OUTER JOIN Rating R ON P.ProductId=R.ProductId      
       
      
 WHERE P.ProductId=ISNULL(@ProductId,P.ProductId) AND P.CategoryId=ISNULL(@CategoryId,P.CategoryId) 
 AND P.ProductName LIKE '%'+ISNULL(@SearchText,P.ProductName)+'%'
   
   
 --AND PG.IsPrimary=CASE WHEN PG.IsPrimary IS NULL THEN NULL ELSE   1 END    
      
       
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductDetails]    Script Date: 14-08-2022 15:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetProductDetails] 
	@ProductId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT PC.CategoryId,PC.CategoryName,P.ProductId,P.ProductName,P.[Description],
	S.StockId,S.Price,S.Discount,S.DeliveryChanrge,S.DiscountedPrice,S.ToTalPrice
	,S.BrandName,S.StockDate,S.ExpiryDate,S.Amount,S.Quantity
	,CASE WHEN S.StockDate>GETDATE() AND ISNULL(S.BalanceQuantity,0)<>0 THEN 'Availabilable'
	ELSE 'Currently UnAvailabilable' END 'Availability'
	FROM ProductCategory PC
	INNER JOIN Products P ON PC.CategoryId=P.CategoryId
	LEFT OUTER JOIN Stock S ON P.ProductId=S.ProductId
	LEFT OUTER JOIN ProductGallery PG ON P.ProductId=PG.ProductId
	LEFT OUTER JOIN Rating R ON P.ProductId=R.ProductId
	WHERE P.ProductId=@ProductId
	
END
GO
