USE Театр
GO

DROP LOGIN Test
DROP USER Test

CREATE LOGIN Test WITH PASSWORD = 'test'
CREATE USER Test FOR LOGIN Test
--CREATE USER Test2 FOR LOGIN Test

--Сначала все запрещено
EXECUTE AS USER = 'Test'

SELECT * FROM Actor

UPDATE Performance
SET Start_date = DATEADD (month, 2, Start_date)
WHERE Performance_id = 4

INSERT [Play] ([Name] ) VALUES ('Горе от ума')
DELETE FROM Play WHERE Name = 'Сирано де Бержерак'

REVERT

--Разрешаем SELECT, UPDATE, INSERT для таблицы Actor
GRANT SELECT, INSERT, UPDATE, DELETE ON Actor TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Actor
ORDER BY Last_name

UPDATE Actor
SET Last_name = 'Анохина'
WHERE Last_name = 'Бегунова'

INSERT [Actor] ([Last_name], [First_name], [Gender], [Birthday] ) VALUES ('Чернышев', 'Евгений', 'М', '1982-07-21')
DELETE FROM Actor WHERE Last_name = 'Чернышев'

UPDATE Actor
SET Last_name = 'Бегунова'
WHERE Last_name = 'Анохина'

REVERT

--Разрешаем менять только один столбец в таблице Performance
GRANT SELECT, UPDATE ON Performance (Performance_id, Finish_date) TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Performance -- не может
SELECT Performance_id,Finish_date FROM Performance -- может

UPDATE Performance
SET Finish_date = '2017-11-11'
WHERE Performance_id = 2 

UPDATE Performance
SET Finish_date = NULL
WHERE Performance_id = 2

REVERT

--Разрешаем только читать
GRANT SELECT ON Play TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Play -- можно
SELECT * FROM Author -- нельзя
INSERT INTO Play (Name) VALUES ('Горе от ума') -- нельзя
REVERT

-- Разрешить SELECT в представлениях
GRANT SELECT ON Play_view to Test

EXECUTE AS USER = 'Test'
SELECT * FROM Play_view -- можно
REVERT

--Создание роли
EXEC sp_addrole Test_role
GRANT UPDATE ON Adress_view (Адрес) TO Test_role 
GRANT SELECT ON Adress_view TO Test_role
DENY SELECT ON Actor TO Test_role
GRANT SELECT ON Actor TO Test_role

EXEC sp_addrolemember Test_role, Test

EXECUTE AS USER = 'Test'
UPDATE Adress_view
SET Адрес = '125008, город Москва, улица Большая Дмитровка, д. 6'
WHERE Название = 'Московская оперетта'

UPDATE Adress_view
SET Адрес = '125009, город Москва, улица Большая Дмитровка, д. 6'
WHERE Название = 'Московская оперетта'

SELECT * FROM Adress_view

REVERT

--Удалим все
EXEC sp_droprolemember Test_role, Test
EXEC sp_droprole Test_role

--GRANT SELECT ON Actor TO Test WITH GRANT OPTION


--Явные права текущего пользователя
--Кто подключился в данный момент, какая программа, компьютер