USE [LDVP]
GO

-- By Match
SELECT m.Date,
	   SUM(ms.quantity) AS Total
  FROM MatchSnack ms, Match m
 WHERE m.id = ms.matchId
 GROUP BY m.Date
 ORDER BY m.Date ASC
 

 -- By Snacks
 SELECT s.Nom,
	    SUM(ms.quantity) AS Total
  FROM MatchSnack ms
	INNER JOIN Snack s ON ms.snackId = s.id
 WHERE s.id = ms.snackId
 GROUP BY s.Nom
 ORDER BY Total DESC;