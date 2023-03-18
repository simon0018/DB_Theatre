USE Театр
GO
--При добавлении в спектакль роли женского пола, которая исполняется актером мужского пола,
--к названию пьесы добавляется строка "в традициях времен Шекспира".
IF object_id ('Shakespeare_play', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_play
GO

CREATE TRIGGER Shakespeare_play ON Cast
AFTER INSERT, UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' в традициях времен Шекспира'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
	          INNER JOIN inserted ON Performance.Performance_id = inserted.performance_id
			  INNER JOIN Actor ON Actor.Actor_id = inserted.Actor_id
			  INNER JOIN Role ON Role.Role_id = inserted.Role_id
	WHERE Actor.Gender = 'М' AND Role.Gender = 'Ж'
	AND Play.Name NOT LIKE '%в традициях времен Шекспира%')
END
GO


--Замена пола актера
IF object_id ('Change_actor', 'TR') IS NOT NULL
	DROP TRIGGER Change_actor
GO

CREATE TRIGGER Change_actor ON Actor
AFTER UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' в традициях времен Шекспира'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
			  INNER JOIN Cast ON Cast.Performance_id = Performance.Performance_id
			  INNER JOIN Role ON Role.Role_id = Cast.Role_id
			  INNER JOIN inserted ON Cast.Actor_id = inserted.Actor_id
	WHERE Inserted.Gender = 'М' AND Role.Gender = 'Ж'
	AND Play.Name NOT LIKE '%в традициях времен Шекспира%')
END
GO

-- Замена пола роли
IF object_id ('Change_role', 'TR') IS NOT NULL
	DROP TRIGGER Change_role
GO

CREATE TRIGGER Change_role ON Role
AFTER UPDATE AS 
BEGIN
UPDATE Play
SET Name = Name + ' в традициях времен Шекспира'
WHERE Play_id IN
	(SELECT Play.Play_id 
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
			  INNER JOIN Cast ON Cast.Performance_id = Performance.Performance_id
			  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
			  INNER JOIN inserted ON Cast.Role_id = inserted.Role_id
	WHERE Actor.Gender = 'М' AND inserted.Gender = 'Ж'
	AND Play.Name NOT LIKE '%в традициях времен Шекспира%')
END
GO

--Если не осталось мужчин, играющих женские роли, убрать приставку
IF object_id ('Shakespeare_delete_cast', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_cast
GO

CREATE TRIGGER Shakespeare_delete_cast ON Cast 
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' в традициях времен Шекспира', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = 'М' AND Role.Gender = 'Ж'
GROUP BY Play.Play_id)
END
GO



IF object_id ('Shakespeare_delete_actor', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_actor
GO

CREATE TRIGGER Shakespeare_delete_actor ON Actor
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' в традициях времен Шекспира', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = 'М' AND Role.Gender = 'Ж'
GROUP BY Play.Play_id)
END
GO

IF object_id ('Shakespeare_delete_role', 'TR') IS NOT NULL
	DROP TRIGGER Shakespeare_delete_role
GO

CREATE TRIGGER Shakespeare_delete_role ON Role
AFTER INSERT, UPDATE, DELETE AS 
BEGIN
UPDATE Play
SET Name = REPLACE(Name,' в традициях времен Шекспира', '') 
WHERE Play_id IN
(SELECT DISTINCT Play_id 
FROM Play
EXCEPT
SELECT Play.Play_id
FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
          INNER JOIN Cast ON Performance.Performance_id = Cast.performance_id
		  INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
		  INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Actor.Gender = 'М' AND Role.Gender = 'Ж'
GROUP BY Play.Play_id)
END
GO



--кто, когда, создал таблицу, в какой бд