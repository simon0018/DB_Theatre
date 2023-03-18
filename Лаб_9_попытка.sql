USE �����
GO

IF object_id ('Shakespeare_play', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_play2
GO

--���� � ��������� ���� ���� �������� ����, ������� ����������� �������� �������� ����,
--�� � �������� ����� ����������� ������ "(� ��������� ������ ��������)".
CREATE TRIGGER Shakespeare_play2 ON Cast
AFTER INSERT, UPDATE
AS 
BEGIN
UPDATE Play
SET Name = Name + ' � ��������� ������ ��������'
WHERE Play_id IN
	(SELECT DISTINCT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
	INNER JOIN inserted ON Performance.Performance_id = inserted.performance_id
	WHERE Performance.Performance_id NOT IN
	(SELECT DISTINCT Performance.Performance_id
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
	          INNER JOIN Cast ON Performance.Performance_id = Cast.Performance_id
			  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
			  INNER JOIN Role ON Role.Role_id = Cast.Role_id
	WHERE Actor.Gender = '�' AND Role.Gender = '�')
	AND Play.Name NOT LIKE '%� ��������� ������ ��������%')
END
GO

SET IDENTITY_INSERT [Play] ON
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
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) 

SELECT * FROM Play
WHERE Play.Name NOT LIKE '%� ��������� ������ ��������%'

DELETE FROM Cast
WHERE Performance_id = 8



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

