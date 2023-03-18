--������� �������, � ������� ������ 2 ������
SELECT Actor_id, COUNT (Theatrical_character_id) AS Number_of_specializations
	FROM Specialization
	GROUP BY Actor_id

DELETE 
	FROM Actor 
	WHERE Actor_id = (
		SELECT Actor_id
		FROM Specialization
	    GROUP BY Actor_id
		HAVING COUNT (Theatrical_character_id)<2)
	


--������� ����������, ������������� �� 2014 ����

SELECT Performance_id, Finish_date
	FROM Performance

DELETE
	FROM Performance
	WHERE YEAR (Finish_date) < 2014

SET IDENTITY_INSERT [Performance] ON
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (7, 6, 5, 6, '22-05-2010', '16-09-2012')  
SET IDENTITY_INSERT [Performance] OFF

	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (32, 28, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (33, 29, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (34, 30, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (35, 31, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (36, 32, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (37, 33, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (22, 34, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (29, 34, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (30, 34, 7) 

	

--������� ��������
DELETE FROM Writer
	WHERE Last_name = '�������'
--������, �.�. DELETE NO ACTION