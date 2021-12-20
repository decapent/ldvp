USE [LDVP]
GO

/****** Object:  View [dbo].[VW_Rencontres]    Script Date: 2021-11-12 10:47:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [saison2].[VW_Rencontres]
AS
SELECT m.Date, 
	   r.Heure, 
	   m.Type, 
	   j.Nom AS PlayerName,
	   c.Nom As CommentatorName, 
	   rj.Equipe, 
	   rj.Home, 
	   rj.AllowedGoals AS GoalAgainst, 
	   rj.ScoredGoals AS Goals, 
	   (rj.AllowedGoals/NULLIF(CAST(rj.ScoredGoals AS decimal(6,3)),0)) AS 'GA/G',
	   rj.Shots, 
	   rj.ShotAgainst, 
	   rj.BodyChecks, 
	   (rj.BodyChecks/NULLIF(CAST(rj.Shots AS decimal(6,3)), 0)) AS IDT,
	   (rj.ScoredGoals/NULLIF(CAST(rj.Shots AS decimal(6,3)), 0)) AS ScoringPct,
	   (rj.OneTimerSucceeded/NULLIF(CAST(rj.TotalOneTimer AS decimal(6,3)),0)) AS OneTimerPct,
	   (rj.FaceoffsWon/CAST(rj.TotalFaceoffs AS decimal(6,3))) AS FaceOffPct,
	   (1 - (rj.AllowedGoals/CAST(rj.ShotAgainst AS decimal(6, 3)))) BlockRate
  FROM Match m
   INNER JOIN Rencontre r ON m.id = r.matchId
     INNER JOIN RencontreJoueur rj ON r.id = rj.rencontreId
	   INNER JOIN Joueur j ON rj.joueurId = j.id
	   	INNER JOIN Commentateur c ON r.commentateurId = c.id
GO

