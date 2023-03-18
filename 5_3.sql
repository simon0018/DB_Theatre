--Пьеса, количество ролей в этой пьесе, количество различных постановок, дата последней постановки.


IF OBJECT_ID ('Play_view') IS NOT NULL
	DROP VIEW Play_view
GO

CREATE VIEW Play_view AS
(SELECT Play.Name AS 'Пьеса',
        COUNT (DISTINCT Role.Role_id) AS 'Количество ролей',
		COUNT (DISTINCT Performance.Performance_id) AS 'Количество постановок',
		MAX (Performance.Start_date) AS 'Дата последней постановки'
 FROM Play LEFT OUTER JOIN Role ON Play.Play_id = Role.Play_id
           LEFT OUTER JOIN Performance ON Play.Play_id = Performance.Play_id
GROUP BY  Performance.Play_id, Role.Play_id,  Play.Name)
GO

SELECT * FROM Play_view

--Выбрать 3 пьесы с максимальным количеством ролей
SELECT TOP 3 WITH TIES [Пьеса]
FROM Play_view
ORDER BY [Количество ролей] DESC
GO

--Эксперименты с INSERT
INSERT Role ([Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES ('Слуга', 7, 3, 'М', 2)
DELETE FROM Role WHERE Name = 'Слуга' AND Play_id = 2

INSERT Play_view ([Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES ('Слуга', 7, 3, 'М', 2)
