USE master
GO

IF object_id ('Creation_tables', 'U') IS NOT NULL
	DROP TABLE Creation_tables 
GO

CREATE TABLE Creation_tables 
([Login] varchar(max),
[User] varchar(max),
Table_name varchar(max),
[Database] varchar(max),
[Time] Datetime);
GO

IF EXISTS (SELECT * FROM sys.triggers
   WHERE name = 'Creation_trig')
DROP TRIGGER Creation_trig
ON ALL SERVER;
GO

CREATE TRIGGER Creation_trig
ON ALL SERVER
AFTER CREATE_TABLE 
AS
DECLARE @data XML  
SET @data = EVENTDATA()
 INSERT INTO Creation_tables ([Login], [User], [Table_name], [Database], [Time])
        VALUES (ORIGINAL_LOGIN(), CURRENT_USER, (EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')))
GO

SELECT * FROM Creation_tables

USE Театр
GO


CREATE TABLE test1
(x int);

IF object_id ('test1', 'U') IS NOT NULL
	DROP TABLE test1 
GO

