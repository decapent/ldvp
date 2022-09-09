USE [LDVP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [saison3].[RencontreJoueur](
	[rencontreId] [int] NOT NULL,
	[equipeId] [int] NOT NULL,
	[Ville] [nvarchar](max) NOT NULL,
	[Home] [bit] NOT NULL,
	[ScoredGoals] [int] NULL,
	[AllowedGoals] [int] NULL,
	[Shots] [int] NULL,
	[ShotAgainst] [int] NULL,
	[PassesPct] [float] NULL,
	[TimeOnAttackInSecs] [int] NULL,
	[Hits] [int] NULL,
	[HitsPct] [float] NULL,
	[Takeaway] [int] NULL,
	[Giveaway] [int] NULL,
	[Interceptions] [int] NULL,
	[BlockedShots] [int] NULL,
 CONSTRAINT [PK_RencontreEquipe] PRIMARY KEY CLUSTERED 
(
	[rencontreId] ASC,
	[equipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [saison3].[RencontreJoueur]  WITH CHECK ADD  CONSTRAINT [FK_RencontreJoueur_Equipe] FOREIGN KEY([equipeId])
REFERENCES [saison3].[Equipe] ([id])
GO

ALTER TABLE [saison3].[RencontreJoueur] CHECK CONSTRAINT [FK_RencontreJoueur_Joueur]
GO

ALTER TABLE [saison3].[RencontreJoueur]  WITH CHECK ADD  CONSTRAINT [FK_RencontreJoueur_Rencontre] FOREIGN KEY([rencontreId])
REFERENCES [ldvp].[Rencontre] ([id])
GO

ALTER TABLE [saison3].[RencontreJoueur] CHECK CONSTRAINT [FK_RencontreJoueur_Rencontre]
GO