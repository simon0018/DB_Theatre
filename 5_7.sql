-- год, месяц, когда произошли премьеры, число премьер за месяц

IF OBJECT_ID ('Date_view') IS NOT NULL
	DROP VIEW Date_view
GO


CREATE VIEW Date_view AS
(SELECT YEAR (Start_date) AS 'Год',
		MONTH (Start_date) AS 'Месяц',
		COUNT (Performance_id) AS 'Число премьер'
FROM Performance
GROUP BY YEAR(Start_date), MONTH(Start_date))

GO

SELECT * FROM Date_view

--Можно менять таблицу
INSERT [Performance] ( [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES ( 1, 2, 1, '03-10-2014', '08-10-2015')   
DELETE FROM Performance WHERE Start_date = '03-10-2014'

--Не можем изменить, т.к. COUNT
INSERT Date_view ([Год], [Месяц], [Число премьер]) VALUES ('2011', '2', 3)
