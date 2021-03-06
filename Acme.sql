USE [master]
GO
/****** Object:  Database [Acme]    Script Date: 11/3/2016 11:48:38 AM ******/
CREATE DATABASE [Acme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Acme', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Acme.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Acme_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Acme_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Acme] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Acme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Acme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Acme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Acme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Acme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Acme] SET ARITHABORT OFF 
GO
ALTER DATABASE [Acme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Acme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Acme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Acme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Acme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Acme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Acme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Acme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Acme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Acme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Acme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Acme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Acme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Acme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Acme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Acme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Acme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Acme] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Acme] SET  MULTI_USER 
GO
ALTER DATABASE [Acme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Acme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Acme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Acme] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Acme] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Acme]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Suburb] [varchar](100) NULL,
	[State] [varchar](3) NULL,
	[Postcode] [int] NULL,
	[Gender] [varchar](1) NULL,
	[BirthDate] [datetime] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ProductName] [varchar](100) NULL,
	[YearlyPremium] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](100) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Payable] [varchar](1) NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (1, N'Single')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (2, N'Partnership')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (3, N'Family')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (4, N'Retiree')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (1, 3, N'John', N'Jones', N'203 Cowley Drive', N'Sunnydale', N'NSW', 2011, N'M', CAST(N'1963-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (2, 4, N'Mary', N'Smith', N'16 Rodborough Rd', N'Lane Cove', N'NSW', 2013, N'F', CAST(N'1942-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (3, 1, N'Rick', N'Monahan', N'55 Mentmore Ave', N'Ryde', N'VIC', 3066, N'M', CAST(N'1981-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (4, 2, N'Tracy', N'Spanner', N'2 Chiefly Rd', N'Kogarah', N'NSW', 2045, N'F', CAST(N'1979-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (5, 2, N'Becky', N'Kindale', N'203 Coward ST', N'Strawberry Hills', N'QLD', 4019, N'F', CAST(N'1984-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (6, 1, N'Sandra', N'Jones', N'7/36 Chiefly Ave', N'Mascot', N'NSW', 2020, N'F', CAST(N'1991-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (7, 3, N'Trevor', N'Howard', N'23 Premier St', N'Kingston', N'TAS', 3099, N'M', CAST(N'1972-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (8, 4, N'Barbara', N'Becky', N'6/4 Burns Bay Rd', N'Rosebery', N'NSW', 2018, N'F', CAST(N'1939-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (9, 4, N'Shirley', N'Flowers', N'15 Victoria Road', N'Forestville', N'QLD', 4506, N'F', CAST(N'1947-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [CategoryID], [FirstName], [LastName], [Address], [Suburb], [State], [Postcode], [Gender], [BirthDate]) VALUES (10, 3, N'Henry', N'Bolles', N'1 Sunnydale St', N'Grantham', N'VIC', 3022, N'M', CAST(N'1969-06-13 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (1, 1, N'Basic Car insurance', 550.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (2, 1, N'Comprehensive Car Insurance', 750.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (3, 2, N'Basic House and Contents Insurance', 375.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (4, 2, N'Premium House and Contents Insurance', 525.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (5, 3, N'Comprehensive Life Insurance', 1025.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (6, 3, N'Life Cover Plus', 1500.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (7, 4, N'Sickness Income Protection ', 950.0000)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [YearlyPremium]) VALUES (8, 4, N'Sickness and Disability Income Protection', 1150.0000)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductType]) VALUES (1, N'Car Insurance')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductType]) VALUES (2, N'House and Contents Insurance')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductType]) VALUES (3, N'Life Insurance')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductType]) VALUES (4, N'Income Protection Insurance')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (1, 1, 1, N'M', CAST(N'2005-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (2, 1, 5, N'F', CAST(N'2001-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (3, 2, 6, N'Y', CAST(N'2006-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (4, 3, 2, N'Y', CAST(N'1995-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (5, 3, 3, N'F', CAST(N'1999-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (6, 4, 1, N'M', CAST(N'2010-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (7, 4, 7, N'Y', CAST(N'2007-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (8, 5, 4, N'F', CAST(N'1998-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (9, 6, 8, N'M', CAST(N'2004-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (10, 7, 2, N'Y', CAST(N'1996-06-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (11, 7, 3, N'Y', CAST(N'2003-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (12, 7, 7, N'F', CAST(N'2009-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (13, 8, 1, N'F', CAST(N'1999-08-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (14, 8, 5, N'M', CAST(N'2000-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (15, 9, 2, N'Y', CAST(N'1997-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (16, 9, 6, N'M', CAST(N'2013-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Sales] ([SaleID], [CustomerID], [ProductID], [Payable], [StartDate]) VALUES (17, 10, 4, N'F', CAST(N'2003-03-16 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sales] OFF
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customers1]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_AllowDeleteCategory]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categories_AllowDeleteCategory] 
	@CategoryID INT,
	@RecordCount INT OUTPUT
AS
BEGIN

  DECLARE @tmpRecordCount INT

  SELECT @RecordCount = 0  

  SELECT @tmpRecordCount = COUNT(*) FROM Customers WHERE CategoryID = @CategoryID
  IF @tmpRecordCount > 0 
     SELECT @RecordCount = 1
     
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_CreateCategory]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categories_CreateCategory] 
    @Category varchar(100),
    @NewCategoryID INT OUTPUT
AS
BEGIN    

   INSERT INTO Categories
           (Category)
   VALUES (@Category)
	
	SELECT @NewCategoryID = @@IDENTITY

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_DeleteCategory]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categories_DeleteCategory]
	@CategoryID INT
AS
BEGIN
	DELETE FROM Categories WHERE CategoryID = @CategoryID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_ExistsCategory]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
--Stored procedures for Categories
--
CREATE PROCEDURE [dbo].[sp_Categories_ExistsCategory] 
    @Category varchar(100),
	@RecordCount INT OUTPUT
AS
BEGIN    

	SELECT @RecordCount = COUNT(*) 
	FROM Categories
    WHERE Category = @Category
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_GetCategories]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categories_GetCategories] 
	@CategoryID INT
AS
BEGIN
   IF @CategoryID = 0
      BEGIN
         SELECT * 
	     FROM Categories 
	     ORDER BY Category
	  END
   ELSE	     
      BEGIN
         SELECT * 
	     FROM Categories 
	     WHERE CategoryID = @CategoryID
	  END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Categories_UpdateCategory]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categories_UpdateCategory] 
    @CategoryID int,
    @Category varchar(100)
AS
BEGIN    

   UPDATE Categories
      SET Category = @Category
   WHERE CategoryID = @CategoryID
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_AllowDeleteCustomer]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Customers_AllowDeleteCustomer] 
	@CustomerID INT,
	@RecordCount INT OUTPUT
AS
BEGIN

  DECLARE @tmpRecordCount INT

  SELECT @RecordCount = 0  

  SELECT @tmpRecordCount = COUNT(*) FROM Sales WHERE CustomerID = @CustomerID
  IF @tmpRecordCount > 0 
     SELECT @RecordCount = 1
     
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_CreateCustomer]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Customers_CreateCustomer] 
    @CategoryID int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address varchar(100),
    @Suburb varchar(100),
    @State varchar(3),
    @Postcode int,
    @Gender varchar(1),
    @BirthDate datetime,
    @NewCustomerID INT OUTPUT
AS
BEGIN    

   INSERT INTO Customers
           (CategoryID,
            FirstName,
            LastName,
            Address,
            Suburb,
            State,
            Postcode,
            Gender,
            BirthDate)
   VALUES (@CategoryID,
           @FirstName, 
           @LastName, 
           @Address,
           @Suburb, 
           @State, 
           @Postcode,
           @Gender, 
           @BirthDate)
	
	SELECT @NewCustomerID = @@IDENTITY

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_DeleteCustomer]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Customers_DeleteCustomer]
	@CustomerID INT
AS
BEGIN
	DELETE FROM Customers WHERE CustomerID = @CustomerID
END



GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_ExistsCustomer]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customers_ExistsCustomer] 
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address varchar(100),
    @Suburb varchar(100),
    @State varchar(3),
    @Postcode int,
	@RecordCount INT OUTPUT
AS
BEGIN    

	SELECT @RecordCount = COUNT(*) 
	FROM Customers
    WHERE FirstName = @FirstName
      AND LastName = @LastName
      AND Address = @Address
      AND Suburb = @Suburb
      AND State = @State
      AND Postcode = @Postcode
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_GetCustomers]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Customers_GetCustomers] 
	@CustomerID INT
AS
BEGIN
   IF @CustomerID = 0
      BEGIN
         SELECT * 
	     FROM Customers 
	     ORDER BY LastName, FirstName
	  END
   ELSE	     
      BEGIN
         SELECT * 
	     FROM Customers 
	     WHERE CustomerID = @CustomerID
	  END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Customers_UpdateCustomer]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Customers_UpdateCustomer] 
    @CustomerID int,
    @CategoryID int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address varchar(100),
    @Suburb varchar(100),
    @State varchar(3),
    @Postcode int,
    @Gender varchar(1),
    @BirthDate datetime
AS
BEGIN    

   UPDATE Customers
      SET CategoryID = @CategoryID,
          FirstName = @FirstName,
          LastName = @LastName,
          Address = @Address,
          Suburb = @Suburb,
          State = @State,
          Postcode = @Postcode,
          Gender = @Gender,
          BirthDate = @BirthDate
   WHERE CustomerID = @CustomerID
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_AllowDeleteProduct]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Products_AllowDeleteProduct] 
	@ProductID INT,
	@RecordCount INT OUTPUT
AS
BEGIN

  DECLARE @tmpRecordCount INT

  SELECT @RecordCount = 0  

  SELECT @tmpRecordCount = COUNT(*) FROM Sales WHERE ProductID = @ProductID
  IF @tmpRecordCount > 0 
     SELECT @RecordCount = 1
     
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_CreateProduct]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Products_CreateProduct] 
    @ProductTypeID int,
    @ProductName varchar(100),
    @YearlyPremium money,
    @NewProductID INT OUTPUT
AS
BEGIN    

   INSERT INTO Products
           (ProductTypeID,
            ProductName,
            YearlyPremium)
   VALUES (@ProductTypeID,
           @ProductName, 
           @YearlyPremium)
	
	SELECT @NewProductID = @@IDENTITY

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_DeleteProduct]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Products_DeleteProduct]
	@ProductID INT
AS
BEGIN
	DELETE FROM Products WHERE ProductID = @ProductID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_ExistsProduct]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--Stored procedures for Products
--
CREATE PROCEDURE [dbo].[sp_Products_ExistsProduct] 
    @ProductTypeID int,
    @ProductName varchar(100),
	@RecordCount INT OUTPUT
AS
BEGIN    

	SELECT @RecordCount = COUNT(*) 
	FROM Products
    WHERE ProductTypeID = @ProductTypeID
      AND ProductName = @ProductName
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_GetProducts]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Products_GetProducts] 
	@ProductID INT
AS
BEGIN
   IF @ProductID = 0
      BEGIN
         SELECT * 
	     FROM Products 
	     ORDER BY ProductName
	  END
   ELSE	     
      BEGIN
         SELECT * 
	     FROM Products 
	     WHERE ProductID = @ProductID
	  END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Products_UpdateProduct]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Products_UpdateProduct] 
    @ProductID int,
    @ProductTypeID int,
    @ProductName varchar(100),
    @YearlyPremium money
AS
BEGIN    

   UPDATE Products
      SET ProductTypeID = @ProductTypeID,
          ProductName = @ProductName,
		  YearlyPremium = @YearlyPremium
   WHERE ProductID = @ProductID
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_AllowDeleteProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProductTypes_AllowDeleteProductType] 
	@ProductTypeID INT,
	@RecordCount INT OUTPUT
AS
BEGIN

  DECLARE @tmpRecordCount INT

  SELECT @RecordCount = 0  

  SELECT @tmpRecordCount = COUNT(*) FROM Products WHERE ProductTypeID = @ProductTypeID
  IF @tmpRecordCount > 0 
     SELECT @RecordCount = 1
     
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_CreateProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProductTypes_CreateProductType] 
    @ProductType varchar(100),
    @NewProductTypeID INT OUTPUT
AS
BEGIN    

   INSERT INTO ProductTypes
           (ProductType)
   VALUES (@ProductType)
	
	SELECT @NewProductTypeID = @@IDENTITY

END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_DeleteProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProductTypes_DeleteProductType]
	@ProductTypeID INT
AS
BEGIN
	DELETE FROM ProductTypes WHERE ProductTypeID = @ProductTypeID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_ExistsProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--
--Stored procedures for Brands
--
CREATE PROCEDURE [dbo].[sp_ProductTypes_ExistsProductType] 
    @ProductType varchar(100),
	@RecordCount INT OUTPUT
AS
BEGIN    

	SELECT @RecordCount = COUNT(*) 
	FROM ProductTypes
    WHERE ProductType = @ProductType
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_GetProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProductTypes_GetProductType] 
	@ProductTypeID INT
AS
BEGIN
   IF @ProductTypeID = 0
      BEGIN
         SELECT * 
	     FROM ProductTypes 
	     ORDER BY ProductType
	  END
   ELSE	     
      BEGIN
         SELECT * 
	     FROM ProductTypes 
	     WHERE ProductTypeID = @ProductTypeID
	  END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTypes_UpdateProductType]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProductTypes_UpdateProductType] 
    @ProductTypeID int,
    @ProductType varchar(100)
AS
BEGIN    

   UPDATE ProductTypes
      SET ProductType = @ProductType
   WHERE ProductTypeID = @ProductTypeID
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Sales_CreateSale]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sales_CreateSale] 
    @CustomerID INT,
	@ProductID INT,
    @Payable VARCHAR(1),
	@StartDate DATETIME,
    @NewSaleID INT OUTPUT
AS
BEGIN    

   INSERT INTO Sales
           (CustomerID, ProductID, Payable, StartDate)
   VALUES (@CustomerID, @ProductID, @Payable, @StartDate)
	
   SELECT @NewSaleID = @@IDENTITY

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Sales_DeleteSale]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sales_DeleteSale]
    @SaleID INT
AS
BEGIN
	DELETE FROM Sales 
    WHERE SaleID = @SaleID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Sales_ExistsSale]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--Stored procedures for Sizes
--
CREATE PROCEDURE [dbo].[sp_Sales_ExistsSale] 
    @CustomerID INT,
	@ProductID INT,
	@RecordCount INT OUTPUT
AS
BEGIN    

	SELECT @RecordCount = COUNT(*) 
	FROM Sales
    WHERE CustomerID = @CustomerID
      AND ProductID = @ProductID
   
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Sales_GetSales]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sales_GetSales] 
    @SaleID INT
AS
BEGIN
   IF (@SaleID = 0) 
      BEGIN
         SELECT * 
	     FROM Sales 
	     ORDER BY CustomerID, ProductID
	  END
   ELSE	     
      BEGIN
         SELECT * 
	     FROM Sales 
	     WHERE SaleID = @SaleID
	  END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Sales_UpdateSale]    Script Date: 11/3/2016 11:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sales_UpdateSale] 
    @SaleID INT,
	@CustomerID INT,
	@ProductID INT,
    @Payable VARCHAR(1),
	@StartDate DATETIME
AS
BEGIN    

   UPDATE Sales
      SET Payable = @Payable,
	      StartDate = @StartDate
   WHERE SaleID = @SaleID
   
END


GO
USE [master]
GO
ALTER DATABASE [Acme] SET  READ_WRITE 
GO
