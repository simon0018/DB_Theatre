USE �����
GO

DELETE FROM Specialization
WHERE Actor_id = 1 AND Theatrical_character_id = 2

--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION 

SELECT  * FROM Specialization
WHERE Actor_id = 3

WAITFOR DELAY '00:00:07'

SELECT  * FROM Specialization


COMMIT

--SELECT @@TRANCOUNT



