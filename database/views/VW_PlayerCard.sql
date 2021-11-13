USE [LDVP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_PlayerCard]
AS
SELECT j.Nom, 
	   COUNT(j.Nom) AS NbMatch, 
	   SUM(CASE rj.Home WHEN 1 THEN 1 ELSE 0 END) AS HomeMatchCnt, 
	   SUM(CASE rj.Home WHEN 0 THEN 1 ELSE 0 END) AS AwayMatchCnt, 
	   SUM(rj.ScoredGoals) AS TotalScoredGoals,
	   SUM(rj.AllowedGoals) AS TotalAllowedGoals,
	   SUM(rj.Shots) As TotalShots,
	   SUM(rj.ShotAgainst) As TotalShotAgaints,
	   AVG(rj.ScoredGoals / CAST(rj.Shots AS decimal(6, 3)) * 100) AS AvgScoringPct, 
	   AVG(rj.OneTimerSucceeded / NULLIF (CAST(rj.TotalOneTimer AS decimal(6, 3)), 0) * 100) AS AvgOneTimerPct, 
	   AVG(rj.FaceoffsWon / CAST(rj.TotalFaceoffs AS decimal(6, 3)) * 100) AS AvgFaceOffPct,
       AVG(rj.BodyChecks / CAST(rj.Shots AS decimal(6, 3))) AS AvgIDT,
	   MAX(rj.BodyChecks / CAST(rj.Shots AS decimal(6, 3))) AS MaxIDT
FROM dbo.RencontreJoueur rj 
	INNER JOIN dbo.Joueur j ON rj.joueurId = j.id
GROUP BY j.Nom
GO


