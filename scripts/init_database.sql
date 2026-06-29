/*
=============================================
Create Database and Schemas
=============================================
Script Purpose: 
- This script creates the 'Datawarehouse' database after checking if it exists. If the dataset exiss, it's dropped and recreated.  
- The script sets up three schemas withing the database: 'bronze', 'silver', and 'gold'.

⚠️ WARNING:
    This script will drop the 'Datawarehouse' database if it already exists, which will result in the loss of all data within that database. Please ensure that you have backups before running this script.
*/

-- Switch to the 'master' database
Use master;
GO

-- Drop and recreate the 'Datawarehouse' database 
IF EXISTS (SELECT 1
FROM sys.databases
WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END
GO

-- Create the 'Datawarehouse' database
CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO

-- Create the 'bronze', 'silver' and 'gold' schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO