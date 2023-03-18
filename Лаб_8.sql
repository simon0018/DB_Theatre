USE Театр
GO

EXECUTE AS USER ='Test'
REVERT
--Выбрать имена всех таблиц, созданных назначенным пользователем базы данных (владелец).

SELECT obj.name
FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
WHERE obj.type = 'U' 
      AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name())
	  AND obj.name <> 'sysdiagrams'

--
SELECT * FROM INFORMATION_SCHEMA.SEQUENCES





/*выбрать имя таблицы, имя столбца таблицы, признак того, допускает ли данный столбец null-значения,
 название типа данных столбца таблицы, размер этого типа данных для всех таблиц,
 созданных назначенным пользователем базы данных и всех их столбцов*/

SELECT  tab.name AS 'Таблица', col.name AS 'Столбец', col.is_nullable AS 'NULL', [type].name AS 'Тип данных',
        [type].max_length AS 'Размер'
FROM sys.objects tab INNER JOIN sys.columns col ON tab.object_id = col.object_id
                     INNER JOIN sys.types [type] ON col.system_type_id = [type].system_type_id
WHERE  tab.type = 'U'
       AND tab.object_id IN
	   (SELECT obj.object_id
        FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
        WHERE obj.type = 'U' 
              AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name())
	          AND obj.name <> 'sysdiagrams')
     





/* Выбрать название ограничения целостности (первичные и внешние ключи), имя таблицы, в
которой оно находится, признак того, что это за ограничение ('PK' для первичного ключа и 'F'
для внешнего) - для всех ограничений целостности, созданных назначенным пользователем
базы данных*/

SELECT [key].name AS 'Ограничение', tab.name AS 'Таблица', [key].type AS 'Признак'
FROM sys.objects tab INNER JOIN sys.objects [key] on [key].parent_object_id = tab.object_id
WHERE [key].type IN ('PK', 'F')
      AND tab.name <> 'sysdiagrams'
       AND [key].object_id IN
	   (SELECT obj.object_id
        FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
        WHERE obj.type IN ('PK', 'F')
              AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))






/*Выбрать название внешнего ключа, имя таблицы, содержащей внешний ключ, имя таблицы,
содержащей его родительский ключ - для всех внешних ключей, созданных назначенным
пользователем базы данных.*/

SELECT name_key.name AS 'Название ключа', name_parent.name AS 'Родительская таблица',
       name_table.name AS 'Дочерняя таблица'
FROM sys.objects name_key INNER JOIN sys.foreign_key_columns [key] 
									ON name_key.object_id = [key].constraint_object_id
						  INNER JOIN sys.objects name_table
						            ON name_table.object_id = [key].parent_object_id
						  INNER JOIN sys.objects name_parent
						            ON name_parent.object_id = [key].referenced_object_id
WHERE name_key.object_id IN
	   (SELECT obj.object_id
        FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
        WHERE obj.type = 'F'
              AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))






/*Выбрать название представления, SQL-запрос, создающий это представление - для всех
представлений, созданных назначенным пользователем базы данных.*/

SELECT [view].name AS 'Название', script.definition AS 'Запрос'
FROM sys.objects [view] INNER JOIN sys.sql_modules script ON [view].object_id = script.object_id
WHERE [view].type = 'V'
		AND [view].object_id IN
		(SELECT obj.object_id
		 FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
		 WHERE obj.type = 'V' 
			   AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))






/*Выбрать название триггера, имя таблицы, для которой определен триггер - для всех
триггеров, созданных назначенным пользователем базы данных*/

IF object_id('test', 'TR') IS NOT NULL
DROP TRIGGER test

GO
CREATE TRIGGER test
ON Actor
AFTER UPDATE
AS SELECT * FROM Actor

SELECT trig.name AS 'Триггер', tab.name AS 'Таблица'
FROM sys.triggers trig INNER JOIN sys.objects tab ON trig.parent_id = tab.object_id
WHERE trig.object_id IN
			(SELECT obj.object_id
			 FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
			 WHERE obj.type = 'TR' 
				  AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))

