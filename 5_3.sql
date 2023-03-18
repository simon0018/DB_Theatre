--�����, ���������� ����� � ���� �����, ���������� ��������� ����������, ���� ��������� ����������.


IF OBJECT_ID ('Play_view') IS NOT NULL
	DROP VIEW Play_view
GO

CREATE VIEW Play_view AS
(SELECT Play.Name AS '�����',
        COUNT (DISTINCT Role.Role_id) AS '���������� �����',
		COUNT (DISTINCT Performance.Performance_id) AS '���������� ����������',
		MAX (Performance.Start_date) AS '���� ��������� ����������'
 FROM Play LEFT OUTER JOIN Role ON Play.Play_id = Role.Play_id
           LEFT OUTER JOIN Performance ON Play.Play_id = Performance.Play_id
GROUP BY  Performance.Play_id, Role.Play_id,  Play.Name)
GO

SELECT * FROM Play_view

--������� 3 ����� � ������������ ����������� �����
SELECT TOP 3 WITH TIES [�����]
FROM Play_view
ORDER BY [���������� �����] DESC
GO

--������������ � INSERT
INSERT Role ([Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES ('�����', 7, 3, '�', 2)
DELETE FROM Role WHERE Name = '�����' AND Play_id = 2

INSERT Play_view ([Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES ('�����', 7, 3, '�', 2)
