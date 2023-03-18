SET IDENTITY_INSERT [Theatre] ON
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (1, 'Малый театр', '115184, Москва, ул. Большая Ордынка, д. 69')
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (2, 'Театр Сатиры', '125009, Москва, Триумфальная площадь, дом 2, строение 1')
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (3, 'Московская Оперетта', '125009, город Москва, улица Большая Дмитровка, д. 6')
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (4, 'МХТ им. Чехова', '125009, Москва, Камергерский пер., д. 3')
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (5, 'Театр им. Вахтангова', '119002, г. Москва, ул. Арбат, д. 26')
	INSERT [Theatre] ([Theatre_id], [Name], [Adress]) VALUES (6, 'Театр им. Пушкина', '119002, г. Москва, Тверской бульвар, дом 23')
SET IDENTITY_INSERT [Theatre] OFF



SET IDENTITY_INSERT [Theatrical_character] ON
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (1, 'Герой (Героиня)')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (2, 'Шут')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (3, 'Иженю')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (4, 'Резонер')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (5, 'Субретка')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (6, 'Простак')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (7, 'Отец')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (8, 'Злодей (злодейка)')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (9, 'Влюбленный (влюбленная)')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (10, 'Незнакомец')
	INSERT [Theatrical_character] ([Theatrical_character_id], [Name]) VALUES (11, 'Друг')
SET IDENTITY_INSERT [Theatrical_character] OFF




SET IDENTITY_INSERT [Role_type] ON
	INSERT [Role_type] ([Role_type_id], [Name]) VALUES (1, 'Главная')
	INSERT [Role_type] ([Role_type_id], [Name]) VALUES (2, 'Второстепенная')
	INSERT [Role_type] ([Role_type_id], [Name]) VALUES (3, 'Эпизод')
	INSERT [Role_type] ([Role_type_id], [Name]) VALUES (4, 'Массовка')
SET IDENTITY_INSERT [Role_type] OFF



SET IDENTITY_INSERT [Title] ON
	INSERT [Title] ([Title_id], [Name]) VALUES (1, 'Народный артист России')
	INSERT [Title] ([Title_id], [Name]) VALUES (2, 'Заслуженный артист России')
	INSERT [Title] ([Title_id], [Name]) VALUES (3, 'Заслуженный артист CCCP')
SET IDENTITY_INSERT [Title] OFF



SET IDENTITY_INSERT [Writer] ON
	INSERT [Writer] ([Writer_id], [First_name], [Last_name] ) VALUES (1, 'Уильям', 'Шекспир')
	INSERT [Writer] ([Writer_id], [First_name], [Last_name] ) VALUES (2, 'Михаил', 'Лермонтов')
	INSERT [Writer] ([Writer_id], [First_name], [Last_name] ) VALUES (3, 'Антон', 'Чехов')
	INSERT [Writer] ([Writer_id], [First_name], [Last_name] ) VALUES (4, 'Пьер', 'де Бомарше')
	INSERT [Writer] ([Writer_id], [First_name], [Last_name] ) VALUES (5, 'Эдмон', 'Ростан')
SET IDENTITY_INSERT [Writer] OFF




SET IDENTITY_INSERT [Play] ON
	INSERT [Play] ([Play_id], [Name] ) VALUES (1, 'Маскарад')
	INSERT [Play] ([Play_id], [Name] ) VALUES (2, 'Король Лир')
	INSERT [Play] ([Play_id], [Name] ) VALUES (3, 'Укрощение строптивой')
	INSERT [Play] ([Play_id], [Name] ) VALUES (4, 'Вишневый сад')
	INSERT [Play] ([Play_id], [Name] ) VALUES (5, 'Безумный день или женитьба Фигаро')
	INSERT [Play] ([Play_id], [Name] ) VALUES (6, 'Сирано де Бержерак')
SET IDENTITY_INSERT [Play] OFF



SET IDENTITY_INSERT [Actor] ON
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (1, 'Борис', 'Клюев', '13-07-1944', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (2, 'Полина', 'Долинская', '31-12-1988', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (3, 'Александр', 'Дривень', '31-05-1984', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (4, 'Наталья', 'Хрусталева', '11-12-1995', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (5, 'Мария', 'Серегина', '05-10-1992', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (6, 'Валерия', 'Князева', '11-02-1989', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (7, 'Ольга', 'Плешкова', '18-12-1993', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (8, 'Борис', 'Невзоров', '18-01-1950', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (9, 'Юлия', 'Хрусталева', '11-12-1995', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (10, 'Глеб', 'Подгородинский', '03-05-1975', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (11, 'Дмитрий', 'Марин', '22-01-1984', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (12, 'Михаил', 'Мартьянов', '22-06-1980', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (13, 'Василий', 'Зотов', '16-12-1974', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (14, 'Александр', 'Воеводин', '21-09-1950', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (15, 'Евгений', 'Хазов', '13-05-1988', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (16, 'Игорь', 'Лагутин', '16-12-1975', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (17, 'Юлия', 'Пивень', '22-12-1990', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (18, 'Лиана', 'Ермакова', '13-08-1988', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (19, 'Юрий', 'Воробьев', '14-12-1962', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (20, 'Валерий', 'Гурьев', '16-07-1982', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (21, 'Максим', 'Демченко', '09-11-1990', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (22, 'Михаил', 'Державин', '21-01-1974', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (23, 'Константин', 'Карасик', '23-12-1997', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (24, 'Андрей', 'Кассин', '17-04-1998', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (25, 'Светлана', 'Аманова', '29-04-1961', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (26, 'Варвара', 'Андреева', '27-05-1976', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (27, 'Апполинария', 'Муравьева', '17-02-1979', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (28, 'Ирина', 'Жерякова', '03-10-1983', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (29, 'Алексей', 'Фадеев', '13-10-1977', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (30, 'Андрей', 'Коршунов', '22-05-1978', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (31, 'Александр', 'Асрентьев', '30-11-1951', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (32, 'Виктория', 'Исакова', '24-03-1966', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (33, 'Сергей', 'Лазарев', '01-04-1980', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (34, 'Таисия', 'Вилкова', '07-10-1987', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (35, 'Ирина', 'Бякова', '09-12-1979', 'Ж')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (36, 'Алексей', 'Рахманов', '22-05-1980', 'М')
	INSERT [Actor] ([Actor_id], [First_name], [Last_name], [Birthday], [Gender]) VALUES (37, 'Анна', 'Бегунова', '24-07-1990', 'Ж')
SET IDENTITY_INSERT [Actor] OFF


SET IDENTITY_INSERT [Producer] ON
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (1, 'Андрей', 'Житинкин')   
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (2, 'Антон', 'Яковлев')     
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (3, 'Валентин', 'Плучек')  
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (4, 'Сергей', 'Лепетюха')  
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (5, 'Виталий', 'Иванов')  
	INSERT [Producer] ([Producer_id], [First_name], [Last_name]) VALUES (6, 'Евгений', 'Писарев')  
SET IDENTITY_INSERT [Producer] OFF



/* [Author] */
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (1, 2)
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (2, 1)
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (3, 1)
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (4, 3)
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (5, 4)
	INSERT [Author] ([Play_id], [Writer_id] ) VALUES (6, 5)





SET IDENTITY_INSERT [Role] ON
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (1, 'Король Лир', 7, 1, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (2, 'Гонерилья', 8, 1, 'Ж', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (3, 'Регана', 8, 1, 'Ж', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (4, 'Корделия', 1, 1, 'Ж', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (5, 'Граф Кент', 11, 2, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (6, 'Граф Глостер', 11, 2, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (7, 'Шут', 2, 3, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (8, 'Герцог Олбанский', NULL, 3, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (9, 'Герцог Корнуэльский', NULL, 3, 'М', 2)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (10, 'Евгений Арбенин', 8, 1, 'М', 1)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (11, 'Нина', 1, 1, 'Ж', 1)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (12, 'Князь Звездич', NULL, 2, 'М', 1)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (13, 'Горничная',5 , 3, 'Ж', 1)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (14, 'Дама на балу', NULL, 4, 'Ж', 1)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (15, 'Баптиста', 7, 2, 'М', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (16, 'Петруччо', 1, 1, 'М', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (17, 'Катарина', 1, 1, 'Ж', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (18, 'Бьянка', 9, 2, 'Ж', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (19, 'Люченцио', 9, 2, 'М', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (20, 'Гремио', 9, 3, 'М', 3)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (21, 'Любовь Раневская', NULL, 1, 'Ж', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (22, 'Аня', NULL, 2, 'Ж', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (23, 'Варя', NULL, 2, 'Ж', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (24, 'Леонид Гаев', NULL, 1, 'М', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (25, 'Ермолай Лопахин', NULL, 2, 'М', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (26, 'Петр Трофимов', NULL, 2, 'М', 4)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (27, 'Граф Альмавива', 8, 1, 'М', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (28, 'Графиня', 11, 2, 'Ж', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (29, 'Фигаро', 9, 1, 'М', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (30, 'Сюзанна', 9, 1, 'Ж', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (31, 'Марселина', 5, 2, 'Ж', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (32, 'Антонио', 2, 3, 'М', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (33, 'Фаншетта', 3, 3, 'Ж', 5)
	INSERT [Role] ([Role_id], [Name], [Theatrical_character_id], [Role_type_id], [Gender], [Play_id] ) VALUES (34, 'Слуга', NULL, 4, 'М', 5)
SET IDENTITY_INSERT [Role] OFF






/* [Specialization] */
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (1, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (1, 4) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (1, 7) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (1, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (1, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (2, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (2, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (3, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (3, 10)
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (3, 8)  
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (4, 3) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (4, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (5, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (6, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (6, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (6, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (7, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (8, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (8, 10) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (8, 4) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (9, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (9, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (10, 4) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (10, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (10, 2) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (11, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (12, 6) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (13, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (14, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (14, 4) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (14, 7) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (14, 10) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (15, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (16, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (16, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (17, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (18, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (19, 7) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (20, 2) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (20, 6) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (21, 10) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (22, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (23, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (24, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (25, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (25, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (26, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (27, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (27, 10) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (27, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (28, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (29, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (29, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (29, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (30, 8) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (31, 7) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (31, 11) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (32, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (33, 1) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (33, 9) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (33, 2) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (34, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (35, 5) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (36, 4) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (36, 7) 
	INSERT [Specialization] ([Actor_id], [Theatrical_character_id]) VALUES (37, 3) 



/* [Award_of_title] */
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (1, 3, '14-08-1989') 
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (1, 1, '28-10-2002')  
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (8, 2, '05-07-1997') 
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (8, 1, '11-11-2011') 
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (10, 2, '01-08-2005')
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (13, 2, '19-04-2014')
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (14, 2, '15-10-2003')
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (25, 2, '18-11-1996')
	INSERT [Award_of_title] ([Actor_id], [Title_id], [Date]) VALUES (25, 1, '28-01-2006')





SET IDENTITY_INSERT [Performance] ON
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (1, 1, 1, 1, '05-10-2014', '08-09-2015')   
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (2, 2, 2, 1, '07-09-2017', NULL)    
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (3, 3, 3, 2, '02-11-2013', '06-01-2014')   
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (4, 4, 3, 5, '04-01-2015', '23-09-2015')  
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (5, 2, 1, 1, '05-10-2014', '08-09-2015')  
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (6, 5, 4, 4, '12-08-2017', NULL)  
	INSERT [Performance] ([Performance_id], [Producer_id], [Play_id], [Theatre_id], [Start_date], [Finish_date]) VALUES (7, 6, 5, 6, '22-05-2010', '16-09-2012')  
SET IDENTITY_INSERT [Performance] OFF




/* [Cast] */
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (1, 10, 1)    
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (2, 11, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (3, 12, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (4, 13, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (5, 14, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (6, 14, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (7, 14, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (4, 14, 1) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (8, 1, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (6, 2, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (5, 3, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (7, 4, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (11, 5, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (3, 6, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (10, 7, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 8, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (13, 9, 2) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (14, 15, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (15, 19, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (16, 16, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (17, 17, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (18, 17, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (19, 20, 3) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (23, 17, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (24, 18, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (20, 15, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (22, 16, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (21, 19, 4)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (21, 16, 4)  
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (22, 19, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (19, 20, 4) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (1, 10, 5)    
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (4, 11, 5) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (3, 12, 5) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (7, 13, 5) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (5, 14, 5) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (7, 14, 5)  
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (6, 14, 5) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (25, 21, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (26, 22, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (27, 22, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (28, 23, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (12, 25, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (30, 26, 6)
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (29, 26, 6) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (11, 24, 6) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (31, 27, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (32, 28, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (33, 29, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (34, 30, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (35, 31, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (36, 32, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (37, 33, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (22, 34, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (29, 34, 7) 
	INSERT [Cast] ([Actor_id], [Role_id], [Performance_id]) VALUES (30, 34, 7) 





	/*INSERT [Theatrical_character] ( [Name]) VALUES ( 'Гекепкеоиня)')
	select * from  theatrical_character
	Delete [Theatrical_character] where Name='Гекепкеоиня)'*/

