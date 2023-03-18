USE Театр
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

DECLARE @Tmp date
SET @Tmp = (SELECT Start_date
                    FROM Performance
					WHERE Performance_id = 4)

WAITFOR DELAY '00:00:10'
UPDATE Performance
SET Start_date = DATEADD (month, 1, @Tmp)
WHERE Performance_id = 4

COMMIT

SELECT Start_date
FROM Performance
WHERE Performance_id = 4