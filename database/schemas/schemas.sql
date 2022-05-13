IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ldvp')) 
BEGIN
    EXEC ('CREATE SCHEMA [ldvp] AUTHORIZATION [dbo]')
END

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'saison2')) 
BEGIN
    EXEC ('CREATE SCHEMA [saison2] AUTHORIZATION [dbo]')
END

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'saison3')) 
BEGIN
    EXEC ('CREATE SCHEMA [saison3] AUTHORIZATION [dbo]')
END