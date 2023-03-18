USE Театр
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

UPDATE Performance
SET Start_date = DATEADD (month, 2, Start_date)
WHERE Performance_id = 4

COMMIT


