USE [MultimediaManagement]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 2019-03-28 9:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Keywords] [nvarchar](max) NULL,
	[UserID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityFile]    Script Date: 2019-03-28 9:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityFile](
	[ID] [uniqueidentifier] NOT NULL,
	[Extension] [nvarchar](30) NOT NULL,
	[PlaceholderID] [uniqueidentifier] NOT NULL,
	[Data] [ntext] NULL,
	[IsURL] [bit] NOT NULL,
 CONSTRAINT [PK_EntityFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Placeholder]    Script Date: 2019-03-28 9:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Placeholder](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Keywords] [nvarchar](max) NULL,
	[CollectionID] [uniqueidentifier] NOT NULL,
	[Data] [ntext] NULL,
	[Extension] [nvarchar](30) NULL,
 CONSTRAINT [PK_Placeholder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2019-03-28 9:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntityFile] ADD  DEFAULT ((0)) FOR [IsURL]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_User]
GO
ALTER TABLE [dbo].[EntityFile]  WITH CHECK ADD  CONSTRAINT [FK_EntityFile_Placeholder] FOREIGN KEY([PlaceholderID])
REFERENCES [dbo].[Placeholder] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntityFile] CHECK CONSTRAINT [FK_EntityFile_Placeholder]
GO
ALTER TABLE [dbo].[Placeholder]  WITH CHECK ADD  CONSTRAINT [FK_Placeholder_Collection] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[Collection] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Placeholder] CHECK CONSTRAINT [FK_Placeholder_Collection]
GO
