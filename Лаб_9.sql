USE Театр
GO
--При добавлении в спектакль роли женского пола, которая исполняется актером мужского пола,
--к названию пьесы добавляется строка "(в традициях времен Шекспира)".
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



--Вставка пьесы из двух ролей
SET IDENTITY_INSERT [Play] ON
	INSERT [Play] ([Play_id], [Name]) VALUES (7, 'Диковинная болезнь')
SET IDENTITY_INSERT [Play] OFF
SET IDENTITY_INSERT [Performance] ON
INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (8, 3, 7, 1, '05-05-2017', '08-09-2017')   
SET IDENTITY_INSERT [Performance] OFF
SET IDENTITY_INSERT [Role] ON
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (35, 'Больная', NULL, 1, 'Ж', 7)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (36, 'Больной', NULL, 1, 'М', 7)
SET IDENTITY_INSERT [Role] OFF
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 35, 8) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) 



--Проверка
SELECT * FROM Play


INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 35, 8) --Мужчина играет женскую роль
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 36, 8) --Мужчина играет мужскую роль 
--Добавление нескольких строк, первые 2 - мужчины играют жеские роли, 3-я - мужчина мужскую роль
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (21, 35, 8), (24, 35, 8), (23, 36, 8)

DELETE FROM Cast
WHERE Performance_id = 8


--Мужчину на женскую роль
UPDATE Cast
SET Actor_id = 23
WHERE Actor_id = 34 AND Role_id = 17 AND Performance_id = 4

--Обратно
UPDATE Cast
SET Actor_id = 34 
WHERE Actor_id = 23 AND Role_id = 17 AND Performance_id = 4

--На несколько строк
UPDATE Cast
SET Actor_id = 13
WHERE Role_id = 13

--Обратно
DELETE FROM Cast WHERE Role_id = 13
INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (4, 13, 1), (7, 13, 5)




---------------------------------------------------------
SELECT Actor.Actor_id, Performance.Performance_id, Role.Role_id, Actor.Gender, Role.Gender
FROM Cast INNER JOIN Performance ON Performance.Performance_id = Cast.Performance_id
                   INNER JOIN Play ON Play.Play_id = Performance.Play_id
				   INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
				   INNER JOIN Role ON Role.Role_id = Cast.Role_id
WHERE Role.Role_id = 13



UPDATE Play 
SET Name = 'Маскарад' WHERE Play_id = 1
UPDATE Play 
SET Name = 'Король Лир' WHERE Play_id = 2
UPDATE Play 
SET Name = 'Укрощение строптивой' WHERE Play_id = 3
UPDATE Play 
SET Name = 'Вишневый сад' WHERE Play_id = 4
UPDATE Play 
SET Name = 'Безумный день или женитьба Фигаро' WHERE Play_id = 5
UPDATE Play 
SET Name = 'Сирано де Бержерак' WHERE Play_id = 6
UPDATE Play 
SET Name = 'Диковинная болезнь' WHERE Play_id = 7
Go

   