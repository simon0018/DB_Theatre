-- �������� � ������, ���������� ������ 1992 ���� ������ � "�����" �� "�������"
UPDATE Specialization
	SET Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = '����� (�������)')
	WHERE Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = '�����')
		AND
		Actor_id IN (
		SELECT Actor_id
			FROM Actor
			WHERE YEAR (Birthday) < 1992)

SELECT Last_name, First_name, Theatrical_character.Name,  YEAR (Birthday)
	FROM Actor INNER JOIN Specialization ON Actor.Actor_id = Specialization.Actor_id
			   INNER JOIN Theatrical_character ON Specialization.Theatrical_character_id = Theatrical_character.Theatrical_character_id
	WHERE Theatrical_character.Name = '�����' OR Theatrical_character.Name = '����� (�������)'

UPDATE Specialization
	SET Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = '�����')
	WHERE Actor_id IN (
		  SELECT Actor_id
			  FROM Actor
			  WHERE Last_name = '��������')


--�������� ���� ����������� ������
SELECT Actor.Last_name, Actor.First_name, Title.Name, Award_of_title.Date
FROM Award_of_title INNER JOIN Actor ON Actor.Actor_id = Award_of_title.Actor_id
                    INNER JOIN Title ON Title.Title_id = Award_of_title.Title_id

UPDATE Award_of_title
	SET Date = '2005-06-24'
	WHERE Actor_id IN (
		SELECT actor_id
			FROM Actor
			WHERE Last_name = '��������������')
	AND Title_id IN (
		SELECT Title_id
			FROM Title
			WHERE Name = '����������� ������ ������')

UPDATE Award_of_title
	SET Date = '2005-01-08'
	WHERE Actor_id IN (
		SELECT actor_id
			FROM Actor
			WHERE Last_name = '��������������')
	AND Title_id IN (
		SELECT Title_id
			FROM Title
			WHERE Name = '����������� ������ ������')




--�������� �������� ������
UPDATE Theatre
	SET Name = '��������������� ��������� ���������� �������� ������ ������ ����������� ������������� ����� �������'
	WHERE Name = '����� ������'
--varcar(50) ���
ALTER TABLE Theatre
ALTER COLUMN Name varchar(max)


ALTER TABLE Theatre
ALTER COLUMN Name varchar(50)

UPDATE Theatre
	SET Name = '����� ������'
	WHERE Name = '��������������� ��������� ���������� �������� ������ ������ ����������� ������������� ����� �������'



