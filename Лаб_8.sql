USE �����
GO

EXECUTE AS USER ='Test'
REVERT
--������� ����� ���� ������, ��������� ����������� ������������� ���� ������ (��������).

SELECT obj.name
FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
WHERE obj.type = 'U' 
      AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name())
	  AND obj.name <> 'sysdiagrams'

--
SELECT * FROM INFORMATION_SCHEMA.SEQUENCES





/*������� ��� �������, ��� ������� �������, ������� ����, ��������� �� ������ ������� null-��������,
 �������� ���� ������ ������� �������, ������ ����� ���� ������ ��� ���� ������,
 ��������� ����������� ������������� ���� ������ � ���� �� ��������*/

SELECT  tab.name AS '�������', col.name AS '�������', col.is_nullable AS 'NULL', [type].name AS '��� ������',
        [type].max_length AS '������'
FROM sys.objects tab INNER JOIN sys.columns col ON tab.object_id = col.object_id
                     INNER JOIN sys.types [type] ON col.system_type_id = [type].system_type_id
WHERE  tab.type = 'U'
       AND tab.object_id IN
	   (SELECT obj.object_id
        FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
        WHERE obj.type = 'U' 
              AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name())
	          AND obj.name <> 'sysdiagrams')
     





/* ������� �������� ����������� ����������� (��������� � ������� �����), ��� �������, �
������� ��� ���������, ������� ����, ��� ��� �� ����������� ('PK' ��� ���������� ����� � 'F'
��� ��������) - ��� ���� ����������� �����������, ��������� ����������� �������������
���� ������*/

SELECT [key].name AS '�����������', tab.name AS '�������', [key].type AS '�������'
FROM sys.objects tab INNER JOIN sys.objects [key] on [key].parent_object_id = tab.object_id
WHERE [key].type IN ('PK', 'F')
      AND tab.name <> 'sysdiagrams'
       AND [key].object_id IN
	   (SELECT obj.object_id
        FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
        WHERE obj.type IN ('PK', 'F')
              AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))






/*������� �������� �������� �����, ��� �������, ���������� ������� ����, ��� �������,
���������� ��� ������������ ���� - ��� ���� ������� ������, ��������� �����������
������������� ���� ������.*/

SELECT name_key.name AS '�������� �����', name_parent.name AS '������������ �������',
       name_table.name AS '�������� �������'
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






/*������� �������� �������������, SQL-������, ��������� ��� ������������� - ��� ����
�������������, ��������� ����������� ������������� ���� ������.*/

SELECT [view].name AS '��������', script.definition AS '������'
FROM sys.objects [view] INNER JOIN sys.sql_modules script ON [view].object_id = script.object_id
WHERE [view].type = 'V'
		AND [view].object_id IN
		(SELECT obj.object_id
		 FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
		 WHERE obj.type = 'V' 
			   AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))






/*������� �������� ��������, ��� �������, ��� ������� ��������� ������� - ��� ����
���������, ��������� ����������� ������������� ���� ������*/

IF object_id('test', 'TR') IS NOT NULL
DROP TRIGGER test

GO
CREATE TRIGGER test
ON Actor
AFTER UPDATE
AS SELECT * FROM Actor

SELECT trig.name AS '�������', tab.name AS '�������'
FROM sys.triggers trig INNER JOIN sys.objects tab ON trig.parent_id = tab.object_id
WHERE trig.object_id IN
			(SELECT obj.object_id
			 FROM sys.objects obj INNER JOIN sys.database_principals prin ON OBJECTPROPERTY(obj.object_id, 'OwnerId') = prin.principal_id
			 WHERE obj.type = 'TR' 
				  AND prin.principal_id = DATABASE_PRINCIPAL_ID (user_name()))

