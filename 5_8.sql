--�������� � ����� ������

IF OBJECT_ID ('Adress_view') IS NOT NULL
	DROP VIEW Adress_view
GO

CREATE VIEW Adress_view AS
(SELECT Name AS '��������',
        Adress AS '�����'
FROM Theatre
)
GO

SELECT * FROM Adress_view

-- ���������� ������ ����� �������������
INSERT Adress_view ([��������], [�����]) VALUES ('������������� �����', '�������-������� ���������')

SELECT * FROM Theatre

DELETE FROM Adress_view WHERE [�����] = '�������-������� ���������'

