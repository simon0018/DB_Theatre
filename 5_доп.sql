--�����, ���� ����������, ��������, ������, �������� ������� ����

IF OBJECT_ID ('Main_Roles_count_view') IS NOT NULL
	DROP VIEW Main_Roles_count_view
GO

CREATE VIEW Main_Roles_count_view AS
WITH [Table_1] AS
(SELECT Play.Name AS '�����',
		Actor.Last_name + ' ' + Actor.First_name AS '����������� ������� �����'
FROM Play LEFT JOIN Performance ON Play.Play_id = Performance.Play_id
		  LEFT JOIN Cast ON Cast.Performance_id = Performance.Performance_id
		  LEFT JOIN Role ON Cast.Role_id = Role.Role_id
		  LEFT JOIN Role_type ON Role.Role_type_id = Role_type.Role_type_id
		  LEFT JOIN Actor ON Actor.Actor_id = Cast.Actor_id
WHERE Role_type.Name = '�������'
UNION ALL
SELECT Play.Name AS '�����',
	   CAST(COUNT (Cast.Actor_id) AS VARCHAR) AS '����������� ������� �����'
FROM Play LEFT JOIN Performance ON Play.Play_id = Performance.Play_id
		  LEFT JOIN Cast ON Cast.Performance_id = Performance.Performance_id
		  LEFT JOIN Role ON Cast.Role_id = Role.Role_id
		  LEFT JOIN Role_type ON Role.Role_type_id = Role_type.Role_type_id
		  LEFT JOIN Actor ON Actor.Actor_id = Cast.Actor_id
WHERE Role_type.Name = '�������'
GROUP BY Play.Play_id, Play.Name)


SELECT TOP (select 100) PERCENT * FROM [Table_1]
ORDER BY [�����],[����������� ������� �����] DESC
/*UNION ALL
SELECT TOP 2 PERCENT * FROM [Table_1]
ORDER BY [�����] ,[����������� ������� �����] DESC*/
GO

SELECT * FROM Main_Roles_count_view


