USE [LDVP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [saison2].[VW_PlayerCard]
AS
SELECT monkaTOS.*, 
       -- Constant of 0.6745 is an approximation of ZScore 50%
	   AvgIDT + (0.6745 * StdDevIDT) AS '50PctIDTUpperLimit', 
	   AvgIDT - (0.6745 * StdDevIDT) AS '50PctIDTLowerLimit', 
	   AvgScoringPct + (0.6745 * StdDevScoringPct) AS '50PctScoringUpperLimit',
	   AvgScoringPct - (0.6745 * StdDevScoringPct) AS '50PctScoringLowerLimit'
  FROM (
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
		   MIN(rj.ScoredGoals / CAST(rj.Shots AS decimal(6, 3))) AS MinScoringPct,
		   MAX(rj.ScoredGoals / CAST(rj.Shots AS decimal(6, 3))) AS MaxScoringPct,
		   STDEV (rj.OneTimerSucceeded / NULLIF (CAST(rj.TotalOneTimer AS decimal(6, 3)), 0)) AS StdDevScoringPct,
		   AVG(rj.OneTimerSucceeded / NULLIF (CAST(rj.TotalOneTimer AS decimal(6, 3)), 0)) AS AvgOneTimerPct, 
		   AVG(rj.FaceoffsWon / CAST(rj.TotalFaceoffs AS decimal(6, 3))) AS AvgFaceOffPct,
		   AVG(1 - (rj.AllowedGoals/CAST(rj.ShotAgainst AS decimal(6, 3)))) AS BlockRate,
		   AVG(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS AvgIDT,
		   MIN(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS MinIDT,
		   MAX(rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS MaxIDT,
		   STDEV (rj.BodyChecks / NULLIF(CAST(rj.Shots AS decimal(6, 3)), 0)) AS StdDevIDT	   
	  FROM saison2.RencontreJoueur rj 
	 INNER JOIN saison2.Joueur j ON rj.joueurId = j.id
	 GROUP BY j.Nom
) AS monkaTOS
GO


