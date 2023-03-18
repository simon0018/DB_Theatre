USE �����
GO
--��� ���������� � ��������� ���� �������� ����, ������� ����������� ������� �������� ����,
--� �������� ����� ����������� ������ "� ��������� ������ ��������".
IF object_id ('Shakespeare_play', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_play
GO

CREATE TRIGGER Shakespeare_play ON Cast
AFTER INSERT, UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' � ��������� ������ ��������'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
	          INNER JOIN inserted ON Performance.Performance_id = inserted.performance_id
			  INNER JOIN Actor ON Actor.Actor_id = inserted.Actor_id
			  INNER JOIN Role ON Role.Role_id = inserted.Role_id
	WHERE Actor.Gender = '�' AND Role.Gender = '�'
	AND Play.Name NOT LIKE '%� ��������� ������ ��������%')
END
GO


--������ ���� ������
IF object_id ('Change_actor', 'TR') IS NOT NULL
	DROP TRIGGER Change_actor
GO

CREATE TRIGGER Change_actor ON Actor
AFTER UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' � ��������� ������ ��������'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
			  INNER JOIN Cast ON Cast.Performance_id = Performance.Performance_id
			  INNER JOIN Role ON Role.Role_id = Cast.Role_id
			  INNER JOIN inserted ON Cast.Actor_id = inserted.Actor_id
	WHERE Inserted.Gender = '�' AND Role.Gender = '�'
	AND Play.Name NOT LIKE '%� ��������� ������ ��������%')
END
GO

-- ������ ���� ����
IF object_id ('Change_role', 'TR') IS NOT NULL
	DROP TRIGGER Change_role
GO

CREATE TRIGGER Change_role ON Role
AFTER UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' � ��������� ������ ��������'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
			  INNER JOIN Cast ON Cast.Performance_id = Performance.Performance_id
			  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
			  INNER JOIN inserted ON Cast.Role_id = inserted.Role_id
	WHERE Actor.Gender = '�' AND inserted.Gender = '�'
	AND Play.Name NOT LIKE '%� ��������� ������ ��������%')
END
GO

--���� �� �������� ������, �������� ������� ����, ������ ���������
IF object_id ('Shakespeare_delete_cast', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_cast
GO

CREATE TRIGGER Shakespeare_delete_cast ON Cast 
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' � ��������� ������ ��������', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = '�' AND Role.Gender = '�'
GROUP BY Play.Play_id)
END
GO



IF object_id ('Shakespeare_delete_actor', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_actor
GO

CREATE TRIGGER Shakespeare_delete_actor ON Actor
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' � ��������� ������ ��������', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = '�' AND Role.Gender = '�'
GROUP BY Play.Play_id)
END
GO

IF object_id ('Shakespeare_delete_role', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_role
GO

CREATE TRIGGER Shakespeare_delete_role ON Role
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' � ��������� ������ ��������', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = '�' AND Role.Gender = '�'
GROUP BY Play.Play_id)
END
GO



--���, �����, ������ �������, � ����� ��