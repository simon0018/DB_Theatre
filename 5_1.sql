--�����, ���� ����������, ��������, ������, �������� ������� ����

IF OBJECT_ID ('Main_Roles_view') IS NOT NULL
	DROP VIEW Main_Roles_view
GO

CREATE VIEW Main_Roles_view AS
(SELECT Play.Name AS '�����',
        Performance.Start_date AS '���� ������',
		Performance.Finish_date AS '���� ����������',
		Producer.Last_name + ' ' + Producer.First_name AS '��������',
		Actor.Last_name + ' ' + Actor.First_name AS '����������� ������� �����'
FROM Play LEFT JOIN Performance ON Play.Play_id = Performance.Play_id
          LEFT JOIN Producer ON Performance.Producer_id = Producer.Producer_id
		  LEFT JOIN Cast ON Cast.Performance_id = Performance.Performance_id
		  LEFT JOIN Role ON Cast.Role_id = Role.Role_id
		  LEFT JOIN Role_type ON Role.Role_type_id = Role_type.Role_type_id
		  LEFT JOIN Actor ON Actor.Actor_id = Cast.Actor_id
WHERE Role_type.Name = '�������')
GO

SELECT * FROM Main_Roles_view

--������� �������, ������� ������ ������� ���� ������� ������
SELECT [����������� ������� �����]
FROM Main_Roles_view
GROUP BY [����������� ������� �����]
HAVING COUNT ([�����]) > 1

--����������� ������ ���������� ������ - �������� ������
INSERT Main_Roles_view ([�����], [���� ������],[���� ����������],[��������], [����������� ������� �����]) VALUES ('������ �� ��������', '2013-05-22', '2013-08-23', '������ �������', '������� �����')
--���-�� �������