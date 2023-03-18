
--Амплуа, количество актеров этого амплуа, количество актеров этого амплуа, задействованных в текущих постановках, количество раз, когда актер этого амплуа исполнял роль другого амплуа.

IF OBJECT_ID ('Theatrical_character_view') IS NOT NULL
	DROP VIEW Theatrical_character_view;
GO

CREATE VIEW Theatrical_character_view AS
WITH [Table1] AS
(SELECT Theatrical_character.Theatrical_character_id, COUNT (Cast.Actor_id) AS Col_1
			   FROM Theatrical_character LEFT JOIN Specialization ON Theatrical_character.Theatrical_character_id = Specialization.Theatrical_character_id
			                             LEFT JOIN Cast ON Specialization.Actor_id = Cast.Actor_id
			                             LEFT JOIN Performance ON Cast.Performance_id = Performance.Performance_id
			   WHERE Performance.Finish_date IS NULL 
			   GROUP BY Theatrical_character.Theatrical_character_id),
[Table2] AS 
(SELECT Theatrical_character.Theatrical_character_id, COUNT (Specialization.Actor_id) AS Col_2
FROM Theatrical_character LEFT JOIN Specialization ON Theatrical_character.Theatrical_character_id = Specialization.Theatrical_character_id
                          LEFT JOIN Cast ON Specialization.Actor_id = Cast.Actor_id
						  LEFT JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Role.Theatrical_character_id <> Specialization.Theatrical_character_id
GROUP BY Theatrical_character.Theatrical_character_id
)

SELECT Theatrical_character.Name AS 'Амплуа',
        COUNT (DISTINCT Specialization.Actor_id) AS 'Количество актеров',
		Col_1 AS 'Задействовано в постановках',
		Col_2 AS 'Игра не в своем амплуа'
 FROM Theatrical_character LEFT JOIN Specialization ON Theatrical_character.Theatrical_character_id = Specialization.Theatrical_character_id
                          LEFT JOIN Cast ON Specialization.Actor_id = Cast.Actor_id
						  JOIN Table1 ON Table1.Theatrical_character_id = Theatrical_character.Theatrical_character_id
						  JOIN Table2 ON Table2.Theatrical_character_id = Theatrical_character.Theatrical_character_id
 GROUP BY Theatrical_character.Theatrical_character_id, Theatrical_character.Name, Table1.Col_1, Table2.Col_2
 

GO

SELECT * FROM Theatrical_character_view


