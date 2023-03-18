--Название и адрес театра

IF OBJECT_ID ('Adress_view') IS NOT NULL
	DROP VIEW Adress_view
GO

CREATE VIEW Adress_view AS
(SELECT Name AS 'Название',
        Adress AS 'Адрес'
FROM Theatre
)
GO

SELECT * FROM Adress_view

-- Добавление данных через представление
INSERT Adress_view ([Название], [Адрес]) VALUES ('Императорский театр', 'Далекая-далекая галактика')

SELECT * FROM Theatre

DELETE FROM Adress_view WHERE [Адрес] = 'Далекая-далекая галактика'

