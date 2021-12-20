IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'saison2')) 
BEGIN
    EXEC ('CREATE SCHEMA [saison2] AUTHORIZATION [dbo]')
END