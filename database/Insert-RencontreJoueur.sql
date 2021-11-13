USE [LDVP]
GO

SELECT * FROM Rencontre WHERE matchId = 2

SELECT * FROM Joueur

INSERT INTO [dbo].[RencontreJoueur]
           ([rencontreId]
           ,[joueurId]
           ,[Equipe]
           ,[Home]
           ,[ScoredGoals]
           ,[AllowedGoals]
           ,[Shots]
           ,[TotalBreakaways]
           ,[BreakawaysSucceeded]
           ,[TotalOneTimer]
           ,[OneTimerSucceeded]
           ,[TotalFaceoffs]
           ,[FaceoffsWon]
           ,[BodyChecks]
           ,[AttackZone])
     VALUES
           (11,6,'CHICAGO',1,0,8,15,1,0,3,0,19,7,51, '00:12:56'),
		   (11,14,'TORONTO',0,8,0,29,2,1,20,7,19,12,40, '00:10:06')
GO

Select * from RencontreJoueur


