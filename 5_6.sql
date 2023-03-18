-- роль, ее амплуа, кол-во мужчин и женщин, игравших эту роль
IF OBJECT_ID ('Role_Gender_view') IS NOT NULL
	DROP VIEW Role_Gender_view
GO


CREATE VIEW Role_Gender_view AS
WITH [Table_1] AS
(SELECT Role.Role_id,
		COUNT( Actor.Actor_id) AS Col_1
FROM Role LEFT JOIN Cast ON Role.Role_id = Cast.Role_id
          LEFT JOIN Actor ON Cast.Actor_id = Actor.Actor_id
WHERE Actor.Gender = 'М'
GROUP BY Role.Role_id),

[Table_2] AS
(SELECT Role.Role_id,
		COUNT( Actor.Actor_id) AS Col_2
FROM Role LEFT JOIN Cast ON Role.Role_id = Cast.Role_id
          LEFT JOIN Actor ON Cast.Actor_id = Actor.Actor_id
WHERE Actor.Gender = 'Ж'
GROUP BY Role.Role_id)

SELECT Role.Name AS 'Роль',
		Theatrical_character.Theatrical_character_id AS 'Амплуа',
		ISNULL (Table_1.Col_1, 0) AS 'Число мужчин' ,
		ISNULL (Table_2.Col_2, 0) AS 'Число женщин' 
FROM Role LEFT JOIN Theatrical_character ON Role.Theatrical_character_id = Theatrical_character.Theatrical_character_id
          LEFT JOIN Table_1 ON Table_1.Role_id = Role.Role_id
		  LEFT JOIN Table_2 ON Table_2.Role_id = Role.Role_id
GROUP BY Role.Role_id, Role.Name, Theatrical_character.Theatrical_character_id, Table_1.Col_1, Table_2.Col_2
GO



SELECT * FROM Role_Gender_view 

