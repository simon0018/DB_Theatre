--Пьеса, даты постановки, режиссер, актеры, играющие главные роли

IF OBJECT_ID ('Main_Roles_view') IS NOT NULL
	DROP VIEW Main_Roles_view
GO

CREATE VIEW Main_Roles_view AS
(SELECT Play.Name AS 'Пьеса',
        Performance.Start_date AS 'Дата начала',
		Performance.Finish_date AS 'Дата завершения',
		Producer.Last_name + ' ' + Producer.First_name AS 'Режиссер',
		Actor.Last_name + ' ' + Actor.First_name AS 'Исполнители главных ролей'
FROM Play LEFT JOIN Performance ON Play.Play_id = Performance.Play_id
          LEFT JOIN Producer ON Performance.Producer_id = Producer.Producer_id
		  LEFT JOIN Cast ON Cast.Performance_id = Performance.Performance_id
		  LEFT JOIN Role ON Cast.Role_id = Role.Role_id
		  LEFT JOIN Role_type ON Role.Role_type_id = Role_type.Role_type_id
		  LEFT JOIN Actor ON Actor.Actor_id = Cast.Actor_id
WHERE Role_type.Name = 'Главная')
GO

SELECT * FROM Main_Roles_view

--Вывести актеров, которые играли главную роль минимум дважды
SELECT [Исполнители главных ролей]
FROM Main_Roles_view
GROUP BY [Исполнители главных ролей]
HAVING COUNT ([Пьеса]) > 1

--Затрагивает данные нескольких таблиц - обновить нельзя
INSERT Main_Roles_view ([Пьеса], [Дата начала],[Дата завершения],[Режиссер], [Исполнители главных ролей]) VALUES ('Сирано де Бержерак', '2013-05-22', '2013-08-23', 'Иванов Виталий', 'Лагутин Игорь')
--кол-во актеров