-- 
SELECT m.Type, m.Date, r.Heure, j.Nom, 
	   rj.Equipe, rj.Home, rj.AllowedGoals, 
	   rj.ScoredGoals, rj.Shots, rj.BodyChecks, rj.AttackZone,
	   (rj.BodyChecks/CAST(rj.Shots AS decimal(6,3))) AS IDT,
	   (rj.ScoredGoals/CAST(rj.Shots AS decimal(6,3))) * 100 AS ScoringPct,
	   (rj.OneTimerSucceeded/NULLIF(CAST(rj.TotalOneTimer AS decimal(6,3)), 0)) * 100 AS OneTimerPct,
	   (rj.FaceoffsWon/CAST(rj.TotalFaceoffs AS decimal(6,3))) * 100 AS FaceOffPct
  FROM Match m,
	   Joueur j,
	   Rencontre r,
	   RencontreJoueur rj
 WHERE m.id = r.matchId
   AND r.Id = rj.rencontreId
   AND rj.joueurId = j.id


SELECT j.Nom, 
	   COUNT(j.Nom) AS NbMatch, 
	   SUM(CASE rj.Home WHEN 1 THEN 1 ELSE 0 END) AS HomeCnt, 
	   SUM(CASE rj.Home WHEN 0 THEN 1 ELSE 0 END) AS AwayCnt, 
	   SUM(rj.ScoredGoals) AS TotalGoals,
	   SUM(rj.Shots) AS TotalShots,
	   SUM(rj.BodyChecks) AS TotalBodyChecks,
	   AVG(rj.ScoredGoals / CAST(rj.Shots AS decimal(6, 3)) * 100) AS AvgScoringPct, 
	   AVG(rj.OneTimerSucceeded / NULLIF (CAST(rj.TotalOneTimer AS decimal(6, 3)), 0) * 100) AS AvgOneTimerPct, 
       AVG(rj.BodyChecks / CAST(rj.Shots AS decimal(6, 3))) AS AvgIDT, 
	   SUM(DATEDIFF(SECOND, '0:00:00', rj.AttackZone) / CAST(60 AS decimal(6, 3))) AS TotalAttackZoneInMinutes
FROM dbo.RencontreJoueur rj 
	INNER JOIN dbo.Joueur j ON rj.joueurId = j.id
GROUP BY j.Nom
ORDER BY AvgIDT DESC