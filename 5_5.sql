--Титул, количество присуждений, последнее присуждение (актер и дата)

IF OBJECT_ID ('Title_view') IS NOT NULL
	DROP VIEW Title_view
GO

CREATE VIEW Title_view AS
WITH [Table_1] AS
(SELECT Actor_id AS Col_1, Title_id
 FROM  Award_of_title
 WHERE Date IN (SELECT MAX (Date)
				FROM Award_of_title
				GROUP BY Title_id))



SELECT  Title.Name AS 'Титул',
		COUNT (Award_of_title.Actor_id) AS 'Число присуждений',
	 	MAX (Award_of_title.Date) AS 'Дата',
		(Actor.Last_name + ' ' + Actor.First_name) AS 'Актер'
 FROM Title LEFT JOIN Award_of_title ON Title.Title_id = Award_of_title.Title_id
           LEFT JOIN Actor ON Award_of_title.Actor_id = Actor.Actor_id
		   LEFT JOIN Table_1 ON Table_1.Title_id = Title.Title_id
WHERE Actor.Actor_id = Table_1.Col_1
GROUP BY Title.Title_id, Title.Name, Award_of_title.Actor_id, Actor.Last_name, Actor.First_name
GO



SELECT * FROM Title_view


