-- ���, �����, ����� ��������� ��������, ����� ������� �� �����

IF OBJECT_ID ('Date_view') IS NOT NULL
	DROP VIEW Date_view
GO


CREATE VIEW Date_view AS
(SELECT YEAR (Start_date) AS '���',
		MONTH (Start_date) AS '�����',
		COUNT (Performance_id) AS '����� �������'
FROM Performance
GROUP BY YEAR(Start_date), MONTH(Start_date))

GO

SELECT * FROM Date_view

--����� ������ �������
INSERT [Performance] ( [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES ( 1, 2, 1, '03-10-2014', '08-10-2015')   
DELETE FROM Performance WHERE Start_date = '03-10-2014'

--�� ����� ��������, �.�. COUNT
INSERT Date_view ([���], [�����], [����� �������]) VALUES ('2011', '2', 3)
