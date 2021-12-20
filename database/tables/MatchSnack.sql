USE [LDVP]
GO

/****** Object:  Table [dbo].[MatchSnack]    Script Date: 2021-11-13 12:07:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [saison2].[MatchSnack](
	[matchId] [int] NOT NULL,
	[snackId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_MatchSnack] PRIMARY KEY CLUSTERED 
(
	[matchId] ASC,
	[snackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [saison2].[MatchSnack]  WITH CHECK ADD  CONSTRAINT [FK_MatchSnack_Match] FOREIGN KEY([matchId])
REFERENCES [saison2].[Match] ([id])
GO

ALTER TABLE [saison2].[MatchSnack] CHECK CONSTRAINT [FK_MatchSnack_Match]
GO

ALTER TABLE [saison2].[MatchSnack]  WITH CHECK ADD  CONSTRAINT [FK_MatchSnack_Snack] FOREIGN KEY([snackId])
REFERENCES [saison2].[Snack] ([id])
GO

ALTER TABLE [saison2].[MatchSnack] CHECK CONSTRAINT [FK_MatchSnack_Snack]
GO

