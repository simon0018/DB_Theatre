USE Театр
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

UPDATE Performance
SET Start_date = DATEADD (month, 1, Start_date)
WHERE Performance_id = 4

WAITFOR DELAY '00:00:10'


COMMIT


SELECT Start_date
FROM Performance
WHERE Performance_id = 4

UPDATE Performance
SET Start_date = '2015-01-04'
WHERE Performance_id = 4
