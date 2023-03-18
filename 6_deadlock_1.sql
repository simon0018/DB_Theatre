USE Театр
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

UPDATE Performance
SET Start_date = '2015-03-25'
WHERE Performance_id = 4

WAITFOR DELAY '00:00:05'

UPDATE Performance
SET Start_date = '2015-03-25'
WHERE Performance_id = 3

COMMIT


SELECT *
FROM Performance
WHERE Performance_id IN (3,4)

UPDATE Performance
SET Start_date = '02-11-2013'
WHERE Performance_id = 3

UPDATE Performance
SET Start_date = '04-01-2015'
WHERE Performance_id = 4


