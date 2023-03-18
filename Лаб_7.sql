USE �����
GO

DROP LOGIN Test
DROP USER Test

CREATE LOGIN Test WITH PASSWORD = 'test'
CREATE USER Test FOR LOGIN Test
--CREATE USER Test2 FOR LOGIN Test

--������� ��� ���������
EXECUTE AS USER = 'Test'

SELECT * FROM Actor

UPDATE Performance
SET Start_date = DATEADD (month, 2, Start_date)
WHERE Performance_id = 4

INSERT [Play] ([Name] ) VALUES ('���� �� ���')
DELETE FROM Play WHERE Name = '������ �� ��������'

REVERT

--��������� SELECT, UPDATE, INSERT ��� ������� Actor
GRANT SELECT, INSERT, UPDATE, DELETE ON Actor TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Actor
ORDER BY Last_name

UPDATE Actor
SET Last_name = '�������'
WHERE Last_name = '��������'

INSERT [Actor] ([Last_name], [First_name], [Gender], [Birthday] ) VALUES ('��������', '�������', '�', '1982-07-21')
DELETE FROM Actor WHERE Last_name = '��������'

UPDATE Actor
SET Last_name = '��������'
WHERE Last_name = '�������'

REVERT

--��������� ������ ������ ���� ������� � ������� Performance
GRANT SELECT, UPDATE ON Performance (Performance_id, Finish_date) TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Performance -- �� �����
SELECT Performance_id,Finish_date FROM Performance -- �����

UPDATE Performance
SET Finish_date = '2017-11-11'
WHERE Performance_id = 2 

UPDATE Performance
SET Finish_date = NULL
WHERE Performance_id = 2

REVERT

--��������� ������ ������
GRANT SELECT ON Play TO Test

EXECUTE AS USER = 'Test'

SELECT * FROM Play -- �����
SELECT * FROM Author -- ������
INSERT INTO Play (Name) VALUES ('���� �� ���') -- ������
REVERT

-- ��������� SELECT � ��������������
GRANT SELECT ON Play_view to Test

EXECUTE AS USER = 'Test'
SELECT * FROM Play_view -- �����
REVERT

--�������� ����
EXEC sp_addrole Test_role
GRANT UPDATE ON Adress_view (�����) TO Test_role 
GRANT SELECT ON Adress_view TO Test_role
DENY SELECT ON Actor TO Test_role
GRANT SELECT ON Actor TO Test_role

EXEC sp_addrolemember Test_role, Test

EXECUTE AS USER = 'Test'
UPDATE Adress_view
SET ����� = '125008, ����� ������, ����� ������� ���������, �. 6'
WHERE �������� = '���������� ��������'

UPDATE Adress_view
SET ����� = '125009, ����� ������, ����� ������� ���������, �. 6'
WHERE �������� = '���������� ��������'

SELECT * FROM Adress_view

REVERT

--������ ���
EXEC sp_droprolemember Test_role, Test
EXEC sp_droprole Test_role

--GRANT SELECT ON Actor TO Test WITH GRANT OPTION


--����� ����� �������� ������������
--��� ����������� � ������ ������, ����� ���������, ���������