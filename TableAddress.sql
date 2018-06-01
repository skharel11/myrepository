USE [SchoolMgmt]
GO

IF OBJECT_ID('dbo.Address') IS NOT NULL
	DROP TABLE dbo.Address;
GO

/****** Object:  Table [dbo].[Address]    Script Date: 5/31/2018 2:01:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Address](
	[AddressID] [INT] NOT NULL IDENTITY(1,1),
	[Line1] [NVARCHAR](100) NOT NULL,
	[Line2] [NVARCHAR](100) NULL,
	[ModifiedDate] [DATETIME] NOT NULL,
	[rowguid] [UNIQUEIDENTIFIER] NOT NULL,
	CONSTRAINT pk_Address_AddressID PRIMARY KEY CLUSTERED (
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE dbo.Address ADD CONSTRAINT df_Address_ModifiedDate DEFAULT (GETDATE()) FOR ModifiedDate;
GO

ALTER TABLE dbo.Address ADD CONSTRAINT df_Address_rowguid DEFAULT (NEWID()) FOR rowguid;
GO
 
/*Maximum number of rows that can be inserted is 1000 in this single select statement*/
INSERT INTO dbo.Address
VALUES ('Gushingal, Sanepa, Kathmandu',NULL,GETDATE(),NEWID()),
	('Balkumari, Lalitpur',NULL,GETDATE(),NEWID()),
	('Basundhara-3, Kathmandu',NULL,GETDATE(),NEWID()),
	('Nakkhu, Kathmandu',NULL,GETDATE(),NEWID()),
	('Bhotahiti, Kathmandu',NULL,GETDATE(),NEWID()),
	('Kathmandu',NULL,GETDATE(),NEWID()),
	('Tyangla Fant, Kirtipur-05, Kathmandu, Nepal',NULL,GETDATE(),NEWID());
GO
