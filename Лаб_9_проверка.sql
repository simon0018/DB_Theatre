USE �����
GO

--������� ����� �� ���� �����
/*SET IDENTITY_INSERT [Play] ON
	INSERT [Play] ([Play_id], [Name]) VALUES (7, '���������� �������')
SET IDENTITY_INSERT [Play] OFF
SET IDENTITY_INSERT [Performance] ON
INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (8, 3, 7, 1, '05-05-2017', '08-09-2017')   
SET IDENTITY_INSERT [Performance] OFF
SET IDENTITY_INSERT [Role] ON
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (35, '�������', NULL, 1, '�', 7)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (36, '�������', NULL, 1, '�', 7)
SET IDENTITY_INSERT [Role] OFF
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 35, 8) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) */



--��������
SELECT * FROM Play


INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 35, 8) --������� ������ ������� ����
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) --������� ������ ������� ���� 
--���������� ���������� �����, ������ 2 - ������� ������ ������ ����, 3-� - ������� ������� ����
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (21, 35, 8), (24, 35, 8), (23, 36, 8)

SELECT * FROM Play

DELETE FROM Cast
WHERE Performance_id = 8
GO
--������� �� ������� ����
UPDATE Cast
SET Actor_id = 23
WHERE Actor_id = 34 AND Role_id = 17 AND Performance_id = 4

SELECT * FROM Play

--�������
UPDATE Cast
SET Actor_id = 34 
WHERE Actor_id = 23 AND Role_id = 17 AND Performance_id = 4

GO

--�� ��������� �����
UPDATE Cast
SET Actor_id = 13
WHERE Role_id = 13

SELECT * FROM Play
--�������
DELETE FROM Cast WHERE Role_id = 13
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (4, 13, 1), (7, 13, 5)

GO

--������ ��� ������
SELECT * FROM Play
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (34, 35, 8) --������� ������ ������� ���� 

UPDATE Actor
SET Gender = '�' WHERE Actor_id = 34

SELECT * FROM Play

DELETE FROM Cast
WHERE Performance_id = 8

UPDATE Actor
SET Gender = '�' WHERE Actor_id = 34
GO

--������ ��� ����
SELECT * FROM Play
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) --������� ������ ������� ���� 
UPDATE Role
SET Gender = '�' WHERE Role_id = 36

SELECT * FROM Play

DELETE FROM Cast
WHERE Performance_id = 8

UPDATE Role
SET Gender = '�' WHERE Role_id = 34
GO


/*SELECT Actor.Actor_id, Performance.Performance_id, Role.Role_id, Actor.Gender, Role.Gender
FROM Cast INNER JOIN Performance ON Performance.Performance_id = Cast.Performance_id
                   INNER JOIN Play ON Play.Play_id = Performance.Play_id
				   INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
				   INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Role.Role_id = 13*/

--���� ������, �������� ������� ����, �� ��������
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 35, 8) --������� ������ ������� ����
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) --������� ������ ������� ���� 

SELECT * FROM Play

DELETE FROM Cast
WHERE Performance_id = 8

SELECT * FROM Play

GO


UPDATE Play 
SET Name = '��������' WHERE Play_id = 1
UPDATE Play 
SET Name = '������ ���' WHERE Play_id = 2
UPDATE Play 
SET Name = '��������� ����������' WHERE Play_id = 3
UPDATE Play 
SET Name = '�������� ���' WHERE Play_id = 4
UPDATE Play 
SET Name = '�������� ���� ��� �������� ������' WHERE Play_id = 5
UPDATE Play 
SET Name = '������ �� ��������' WHERE Play_id = 6
UPDATE Play 
SET Name = '���������� �������' WHERE Play_id = 7
Go

   

