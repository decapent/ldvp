USE [LDVP]
GO

/****** Object:  Table [dbo].[Joueur]    Script Date: 2021-11-13 12:04:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Joueur](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](max) NULL,
 CONSTRAINT [PK_Joueur] PRIMARY KEY CLUSTERED 
 (
     [id] ASC 
 ) WITH (
     PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)  ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
