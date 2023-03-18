USE Театр
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

DECLARE @Tmp1 date
SET @Tmp1 = (SELECT Start_date
                    FROM Performance
					WHERE Performance_id = 4)
UPDATE Performance
SET Start_date = DATEADD (month, 2, @Tmp1)
WHERE Performance_id = 4

COMMIT

SELECT Start_date
FROM Performance
WHERE Performance_id = 4

UPDATE Performance
SET Start_date = '2015-01-04'
WHERE Performance_id = 4
