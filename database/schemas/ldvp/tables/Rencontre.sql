USE [LDVP]
GO

/****** Object:  Table [dbo].[Rencontre]    Script Date: 2021-11-14 9:14:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ldvp].[Rencontre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matchId] [int] NOT NULL,
	[commentateurId] [int] NOT NULL,
	[heure] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rencontres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [ldvp].[Rencontre]  WITH CHECK ADD  CONSTRAINT [FK_Rencontre_Commentateur] FOREIGN KEY([commentateurId])
REFERENCES [ldvp].[Commentateur] ([id])
GO

ALTER TABLE [ldvp].[Rencontre] CHECK CONSTRAINT [FK_Rencontre_Commentateur]
GO

ALTER TABLE [ldvp].[Rencontre]  WITH CHECK ADD  CONSTRAINT [FK_Rencontres_Match] FOREIGN KEY([matchId])
REFERENCES [ldvp].[Match] ([id])
GO

ALTER TABLE [ldvp].[Rencontre] CHECK CONSTRAINT [FK_Rencontres_Match]
GO

