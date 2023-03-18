-- Изменить у актрис, родившихся раньше 1992 года амплуа с "Иженю" на "Героиня"
UPDATE Specialization
	SET Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = 'Герой (Героиня)')
	WHERE Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = 'Иженю')
		AND
		Actor_id IN (
		SELECT Actor_id
			FROM Actor
			WHERE YEAR (Birthday) < 1992)

SELECT Last_name, First_name, Theatrical_character.Name,  YEAR (Birthday)
	FROM Actor INNER JOIN Specialization ON Actor.Actor_id = Specialization.Actor_id
			   INNER JOIN Theatrical_character ON Specialization.Theatrical_character_id = Theatrical_character.Theatrical_character_id
	WHERE Theatrical_character.Name = 'Иженю' OR Theatrical_character.Name = 'Герой (героиня)'

UPDATE Specialization
	SET Theatrical_character_id = (
		SELECT Theatrical_character_id
			FROM Theatrical_character
			WHERE Name = 'Иженю')
	WHERE Actor_id IN (
		  SELECT Actor_id
			  FROM Actor
			  WHERE Last_name = 'Бегунова')


--Изменить дату присуждения титула
SELECT Actor.Last_name, Actor.First_name, Title.Name, Award_of_title.Date
FROM Award_of_title INNER JOIN Actor ON Actor.Actor_id = Award_of_title.Actor_id
                    INNER JOIN Title ON Title.Title_id = Award_of_title.Title_id

UPDATE Award_of_title
	SET Date = '2005-06-24'
	WHERE Actor_id IN (
		SELECT actor_id
			FROM Actor
			WHERE Last_name = 'Подгородинский')
	AND Title_id IN (
		SELECT Title_id
			FROM Title
			WHERE Name = 'Заслуженный артист России')

UPDATE Award_of_title
	SET Date = '2005-01-08'
	WHERE Actor_id IN (
		SELECT actor_id
			FROM Actor
			WHERE Last_name = 'Подгородинский')
	AND Title_id IN (
		SELECT Title_id
			FROM Title
			WHERE Name = 'Заслуженный артист России')




--Изменить название театра
UPDATE Theatre
	SET Name = 'Государственное бюджетное учреждение культуры города Москвы «Московский академический театр сатиры»'
	WHERE Name = 'Театр Сатиры'
--varcar(50) мал
ALTER TABLE Theatre
ALTER COLUMN Name varchar(max)


ALTER TABLE Theatre
ALTER COLUMN Name varchar(50)

UPDATE Theatre
	SET Name = 'Театр Сатиры'
	WHERE Name = 'Государственное бюджетное учреждение культуры города Москвы «Московский академический театр сатиры»'



