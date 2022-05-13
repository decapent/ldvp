IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ldvp')) 
BEGIN
    CREATE SCHEMA [ldvp] AUTHORIZATION [dbo]
END

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'saison2')) 
BEGIN
    CREATE SCHEMA [saison2] AUTHORIZATION [dbo]
END

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'saison3')) 
BEGIN
    CREATE SCHEMA [saison3] AUTHORIZATION [dbo]
END