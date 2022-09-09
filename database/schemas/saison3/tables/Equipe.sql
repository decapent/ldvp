USE [LDVP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [saison3].[Equipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[joueur1Id] [int] NOT NULL,
	[joueur2Id] [int] NOT NULL,
	[Nom] [nvarchar](max) NULL,
 CONSTRAINT [PK_Equipe_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [saison3].[Equipe]  WITH CHECK ADD  CONSTRAINT [FK_Equipe_Joueur1] FOREIGN KEY([joueur1Id])
REFERENCES [ldvp].[Joueur] ([id])
GO

ALTER TABLE [saison3].[Equipe] CHECK CONSTRAINT [FK_Equipe_Joueur1]
GO

ALTER TABLE [saison3].[Equipe]  WITH CHECK ADD  CONSTRAINT [FK_Equipe_Joueur2] FOREIGN KEY([joueur2Id])
REFERENCES [ldvp].[Joueur] ([id])
GO

ALTER TABLE [saison3].[Equipe] CHECK CONSTRAINT [FK_Equipe_Joueur2]
GO