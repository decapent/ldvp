USE [LDVP]
GO

/****** Object:  View [dbo].[VW_Rencontres]    Script Date: 2021-11-12 10:47:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VW_Rencontres]
AS
SELECT m.Date, r.Heure, m.Type, j.Nom, 
	   rj.Equipe, rj.Home, rj.AllowedGoals, 
	   rj.ScoredGoals, rj.Shots, rj.ShotAgainst, rj.BodyChecks, 
	   (rj.BodyChecks/CAST(rj.Shots AS decimal(6,3))) AS IDT,
	   (rj.ScoredGoals/CAST(rj.Shots AS decimal(6,3))) * 100 AS ScoringPct,
	   (rj.OneTimerSucceeded/NULLIF(CAST(rj.TotalOneTimer AS decimal(6,3)), 0)) * 100 AS OneTimerPct,
	   (rj.FaceoffsWon/CAST(rj.TotalFaceoffs AS decimal(6,3))) * 100 AS FaceOffPct
  FROM Match m
   INNER JOIN Rencontre r ON m.id = r.matchId
     INNER JOIN RencontreJoueur rj ON r.id = rj.rencontreId
	   INNER JOIN Joueur j ON rj.joueurId = j.id
GO

