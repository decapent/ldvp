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
	   SUM(rj.Shots) / CAST(SUM(rj.Shots) + SUM(rj.ShotAgainst) AS decimal(6,3)) AS 'CF%',
	   AVG(rj.ScoredGoals / CAST(rj.Shots AS decimal(6, 3))) AS AvgScoringPct, 
	   AVG(rj.OneTimerSucceeded / NULLIF (CAST(rj.TotalOneTimer AS decimal(6, 3)), 0)) AS AvgOneTimerPct, 
	   AVG(rj.FaceoffsWon / CAST(rj.TotalFaceoffs AS decimal(6, 3))) AS AvgFaceOffPct,
	   AVG(1 - (rj.AllowedGoals/CAST(rj.ShotAgainst AS decimal(6, 3)))) AS BlockRate,
       AVG(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS AvgIDT,
	   MIN(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS MinIDT,
	   MAX(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS MaxIDT,
       STDEV (rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS StdDevIDT
FROM dbo.RencontreJoueur rj 
	INNER JOIN dbo.Joueur j ON rj.joueurId = j.id
GROUP BY j.Nom
GO


