USE [LDVP]
GO

/****** Object:  View [dbo].[VW_SnackRedeems]    Script Date: 2021-11-12 10:48:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VW_SnackRedeems]
AS
	SELECT m.Date, s.Nom, ms.quantity, ms.quantity * 50 As ChannelPoints
	  FROM MatchSnack ms
	 INNER JOIN Snack s ON ms.snackId = s.id
     	INNER JOIN Match m ON ms.matchId = m.id
GO

