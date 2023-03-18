--пьесу определ€ем по постановке
IF OBJECT_ID ('Role_view') IS NOT NULL
	DROP VIEW Role_view
GO

--–оль, количество постановок за последние п€ть лет, в которой использовалась эта роль, актер, чаще всего исполн€вший эту роль.
CREATE VIEW Role_view AS
WITH [Table_1] AS
(SELECT Cast.Role_id, Cast.Actor_id, COUNT (Cast.Performance_id) AS Num
FROM Cast
GROUP BY Role_id, Actor_id),

[Table_2] AS
(SELECT Table_1.Role_id, Table_1.Actor_id, MAX (Table_1.Num) AS 'Max'
FROM Table_1
GROUP BY Role_id, Actor_id)


SELECT 
	Role.Name AS '–оль',
	COUNT (DISTINCT Performance.Performance_id) AS '„исло постановок',
    Actor.Last_name + ' ' + Actor.First_name  AS 'јктер'
FROM Role LEFT JOIN Cast ON Role.Role_id = Cast.Role_id
		  LEFT JOIN Actor ON Cast.Actor_id = Actor.Actor_id
		  LEFT JOIN Performance ON Performance.Performance_id = Cast.Performance_id
		  LEFT JOIN Table_2 ON Table_2.Role_id = Role.Role_id
WHERE YEAR(SYSDATETIME()) - YEAR(Performance.Start_date) <= 5 AND
      Actor.Actor_id = Table_2.Actor_id AND
	  Role.Role_id = Table_2.Role_id
GROUP BY Role.Role_id, Role.Name, Actor.Last_name, Actor.First_name

GO


SELECT * FROM Role_view

