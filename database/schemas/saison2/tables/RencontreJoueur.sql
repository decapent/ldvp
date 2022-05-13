USE [LDVP]
GO

/****** Object:  Table [saison2].[RencontreJoueur]    Script Date: 2021-11-13 12:08:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [saison2].[RencontreJoueur](
	[rencontreId] [int] NOT NULL,
	[joueurId] [int] NOT NULL,
	[Equipe] [nvarchar](max) NOT NULL,
	[Home] [bit] NOT NULL,
	[ScoredGoals] [int] NULL,
	[AllowedGoals] [int] NULL,
	[Shots] [int] NULL,
	[ShotAgainst] [int] NULL,
	[TotalBreakaways] [int] NULL,
	[BreakawaysSucceeded] [int] NULL,
	[TotalOneTimer] [int] NULL,
	[OneTimerSucceeded] [int] NULL,
	[TotalFaceoffs] [int] NULL,
	[FaceoffsWon] [int] NULL,
	[BodyChecks] [int] NULL,
 CONSTRAINT [PK_RencontreJoueur] PRIMARY KEY CLUSTERED 
(
	[rencontreId] ASC,
	[joueurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [saison2].[RencontreJoueur]  WITH CHECK ADD  CONSTRAINT [FK_RencontreJoueur_Joueur] FOREIGN KEY([joueurId])
REFERENCES [ldvp].[Joueur] ([id])
GO

ALTER TABLE [saison2].[RencontreJoueur] CHECK CONSTRAINT [FK_RencontreJoueur_Joueur]
GO

ALTER TABLE [saison2].[RencontreJoueur]  WITH CHECK ADD  CONSTRAINT [FK_RencontreJoueur_Rencontre] FOREIGN KEY([rencontreId])
REFERENCES [ldvp].[Rencontre] ([id])
GO

ALTER TABLE [saison2].[RencontreJoueur] CHECK CONSTRAINT [FK_RencontreJoueur_Rencontre]
GO

