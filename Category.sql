IF OBJECT_ID('dbo.Category0 is not null
  DROP TABELE dbo.Category
GO

CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsModified] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [nvarchar](50) NOT NULL,
	[UpdateOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[DeletedOn] [datetime] NULL,
	[DeleteBy] [nvarchar](50) NULL,
	[PortalID] [int] NOT NULL,
	[UserModuleID] [int] NOT NULL,
	[CultureCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_Category] ADD  CONSTRAINT [DF_tbl_Category_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tbl_Category] ADD  CONSTRAINT [DF_tbl_Category_IsModified]  DEFAULT ((0)) FOR [IsModified]
GO

ALTER TABLE [dbo].[tbl_Category] ADD  CONSTRAINT [DF_tbl_Category_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
  
CREATE PROCEDURE [dbo].[usp_Category_GetAll]
@PortalID	INT,
@UserModuleID	INT,
@CultureCode	NVARCHAR(50)
AS
BEGIN

	SELECT 
		CategoryID,
		Title,
		Detail,
		IsActive,
		AddedOn,
		AddedBy
	FROM dbo.tbl_Category
	WHERE
		IsDeleted = 0
		AND
        PortalID = @PortalID
		AND
        UserModuleID = @UserModuleID
		AND
        CultureCode = @CultureCode
END
GO

