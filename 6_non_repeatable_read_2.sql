USE �����
GO


--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION

UPDATE Actor
SET Last_name = '����������'
WHERE Actor_id = 9

COMMIT

