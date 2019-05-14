CREATE DATABASE [Joole_Team]
go
use Joole_Team
go

CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[ManufacturerID] [int] NOT NULL,
	[ManufacturerName] [nvarchar](100) NOT NULL,
	[Website] [nvarchar](250) NOT NULL,
	[PhoneNumber] [numeric](10, 0) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblManufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Series] [nvarchar](200) NULL,
	Model varchar(500),
	[ModelYear] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	 ManufacturerID int,
	[ProductImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](25) NOT NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblType]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](25) NOT NULL,
	[IsTOption] [bit] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeOptValue]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeOptValue](
	[TypeOptID] [int] NOT NULL,
	[Opt] [nvarchar](max) NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_tblTypeOptValue] PRIMARY KEY CLUSTERED 
(
	[TypeOptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeSpecValue]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeSpecValue](
	[TypeSpecID] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Range] [int] NOT NULL,
 CONSTRAINT [PK_tblTypeSpecValue] PRIMARY KEY CLUSTERED 
(
	[TypeSpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/13/2019 4:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](500) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




--Alter table tblProducts
--add Model varchar(500);

--Alter table tblProducts
--add ManufacturerID int;

--Alter table tblProducts
--drop column DepartmentID;

--Alter table tblProducts
--drop column SalesPersonID;

/*Set Constraint*/
Alter table tblProducts
ADD FOREIGN KEY (ManufacturerID) REFERENCES tblManufacturer(ManufacturerID);

ALTER TABLE tblProducts 
ADD FOREIGN KEY (SubCategoryID) REFERENCES tblSubCategory(SubCategoryID);

ALTER TABLE tblSubCategory 
ADD FOREIGN KEY (CategoryID) REFERENCES tblCategory(CategoryID);

ALTER TABLE tblType 
ADD FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID);

ALTER TABLE tblTypeOptValue 
ADD FOREIGN KEY (TypeID) REFERENCES tblType(TypeID);

ALTER TABLE tblTypeSpecValue 
ADD FOREIGN KEY (TypeID) REFERENCES tblType(TypeID);

--DELETE from tblProducts WHERE ProductID BETWEEN 1 AND 10;


/*Insert data*/

Alter table tblUser
drop column RoleId,isActive,LastLoginDate,CreateDate,LastModified,DepartmentID;

insert into tblUser(UserId, Username, Password, Email, ImagePath)
values (1,'admin','admin','admin@gmail.com','');

insert into tblTypeSpecValue(TypeSpecID, Value, TypeID, Range)
values (1,'5,467',3,0)
,(2,'1.95',4,1)
,(3,'21.14',4,2)
,(4,'100',5,1)
,(5,'240',5,2)
,(6,'35',6,1)
,(7,'200',6,2)
,(8,'7',11,0)
,(9,'35',12,0)
,(10,'60',13,0)
,(11,'12.3',7,1)
,(12,'57',7,2)
,(13,'13',8,0)
;

insert into tblTypeOptValue(TypeOptID,Opt,TypeID)
values (1,'Roof',1)
,(2,'With Light',2)
,(3,'Indoor',9)
,(4,'Commercial',10)
,(5,'Wall',1)
,(6,'Without Light',2)
,(7,'Outdoor',9)
,(8,'Residential',10)
;

Insert into tblType(TypeID,TypeName,IsTOption,ProductID)
values (1,'Mounting Location',1,8)
,(2,'Accessories',1,8)
,(3,'AirFlow',0,8)
,(4,'Power (W)',0,8)
,(5,'Operating Voltage (VAC)',0,8)
,(6,'Fan speed (RPM)',0,8)
,(7,'Height (in)',0,8)
,(8,'Weight (lbs)',0,8)
,(9,'Application',1,8)
,(10,'Use Type',1,8)
,(11,'Number of fan speeds',0,8)
,(12,'Sound at max speed(dBA)',0,8)
,(13,'Fan sweep diameter (in)',0,8)
;

Insert into tblProducts(ProductID,ProductName,Series,Model,ModelYear,SubCategoryID,ManufacturerID,ProductImagePath)
values (1, 'Ore International Inc. 3-Crystal Inspirational Lighting','Black Series','S3-151','2017',1,4,'\Content\Images\ProductPictures\01.jpeg')
,(2, 'OK Lighting Crystal Drop Lighting','Crystal Series','S3-152','2015',1,5,'\Content\Images\ProductPictures\02.jpeg')
,(3, 'Safavieh Bessie Candlestick Lighting','Candlestickd','S3-153','2017',1,6,'\Content\Images\ProductPictures\03.jpeg')
,(4, 'Delta Electronics Power','TDPS','S3-154','2016',2,7,'\Content\Images\ProductPictures\04.jpeg')
,(5, 'RSR ELECTRONICS Power','PHSY','S3-155','2015',2,8,'\Content\Images\ProductPictures\05.jpeg')
,(6, 'Sceptre 24 TV','Class','S3-156','2017',3,9,'\Content\Images\ProductPictures\06.jpeg')
,(7, 'Sanyo 32 TV','Class','S3-157','2015',3,10,'\Content\Images\ProductPictures\07.jpeg')
,(8, '52Casa Vieja Impel Celling Fan','Impel','S3-158','2016',4,1,'\Content\Images\ProductPictures\08.jpeg')
,(9, 'Westinghouse Fan','White Series','S3-159','2015',4,2,'\Content\Images\ProductPictures\09.jpeg')
,(10, 'BISSELL 3-in-1 Lightweight Fan','Practical','S3-160','2016',4,3,'\Content\Images\ProductPictures\10.jpeg')
;


Insert into tblManufacturer(ManufacturerID,ManufacturerName,Website,PhoneNumber,Email)
values (1, 'Big Ass','www.bigass.com','123456789','abc@bigass.com')
,(2, 'Emerson','www.bigass.com','123456789','abc@bigass.com')
,(3, 'Minka','www.bigass.com','123456789','abc@bigass.com')
,(4, 'C3 Lighting','www.bigass.com','123456789','abc@bigass.com')
,(5, 'PMC Lighting Inc','www.bigass.com','123456789','abc@bigass.com')
,(6, 'Visa Lighting','www.bigass.com','123456789','abc@bigass.com')
,(7, 'Enervex','www.bigass.com','123456789','abc@bigass.com')
,(8, 'Grundfos','www.bigass.com','123456789','abc@bigass.com')
,(9, 'Ajax plumbing and heating Corporation','www.bigass.com','123456789','abc@bigass.com')
,(10, 'Bell & Gossett','www.bigass.com','123456789','abc@bigass.com')
;

Insert into tblSubCategory(SubCategoryID
      ,SubCategoryName
	  ,CategoryID
)
values (1
      ,'Lighting'
	  ,1
),
(2
      ,'Power Electronics'
	  ,1
),
(3
      ,'Tevevision Technology'
	  ,1
),
(4
      ,'Fans'
	  ,2
),
(5
      ,'Vaccums'
	  ,2
),
(6
      ,'Toasters'
	  ,2
),
(7
      ,'Knife'
	  ,3
),
(8
      ,'Paints'
	  ,3
),
(9
      ,'Kitchen Cabinet'
	  ,4
),
(10
      ,'Lighting'
	  ,4
),
(11
      ,'Lighting'
	  ,4
);

Insert into tblCategory(CategoryID
      ,CategoryName
)
values (1
      ,'Electricals'
),
(2
      ,'Mechanical'
),
(3
      ,'Stationary'
),
(4
      ,'Furniture'
);