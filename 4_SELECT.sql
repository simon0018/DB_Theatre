/*Определить роли актера, чаще всего играющего в амплуа 'Злодей (злодейка)'.*/


SELECT DISTINCT Role.Name
FROM Actor INNER JOIN Cast ON Cast.Actor_id = Actor.Actor_id
          INNER JOIN Role ON Cast.Role_id = Role.Role_id
WHERE Cast.Actor_id IN
	(SELECT TOP 1 WITH TIES Cast.Actor_id
		FROM ROLE INNER JOIN Cast ON ROLE.Role_id = CAST.Role_id
				  INNER JOIN Theatrical_character ON Theatrical_character.Theatrical_character_id = Role.Theatrical_character_id
		WHERE Theatrical_character.Name = 'Злодей (злодейка)'
		GROUP BY Cast.Actor_id
		ORDER BY COUNT (Role.Role_id) DESC)






/*Подсчитать количество пьес для каждого режиссера.*/
SELECT Producer.last_name, Producer.first_name, COUNT( DISTINCT Performance.Play_id) AS 'Play number'
	FROM Producer INNER JOIN Performance ON Producer.Producer_id = Performance.Producer_id
	GROUP BY Producer.producer_id, Producer.last_name, Producer.first_name




/*Выбрать список пьес, в которых пол исполнителей ролей менялся. */
SELECT DISTINCT Play.Name 
FROM Play INNER JOIN Role ON Play.Play_id = Role.Play_id
WHERE Role.Role_id IN
	(SELECT Role.Role_id
		FROM Role INNER JOIN Cast ON Cast.Role_id = Role.Role_id
				  INNER JOIN Actor ON Cast.Actor_id = Actor.Actor_id
		WHERE Actor.Gender = 'М'
	INTERSECT
	SELECT Role.Role_id
		FROM Role INNER JOIN Cast ON Cast.Role_id = Role.Role_id
				  INNER JOIN Actor ON Cast.Actor_id = Actor.Actor_id
		WHERE Actor.Gender = 'Ж')




/*Выбрать список актеров, которые заняты в двух и более постановках одновременно */

SELECT Actor.Last_name, Actor.First_name
	FROM Performance INNER JOIN Cast ON Performance.Performance_id = Cast.Performance_id
				     INNER JOIN Actor ON Actor.Actor_id = Cast.Actor_id
	WHERE Performance.Finish_date IS NULL
 	GROUP BY Cast.Actor_id , Actor.Last_name, Actor.First_name
	HAVING COUNT(Cast.Performance_id) >= 2 


/*Вывести пьесы, для которых сейчас идут постановки, и кол-во постановок*/

SELECT Play.Name, COUNT (Performance.Performance_id)
	FROM Play INNER JOIN Performance ON Play.Play_id = Performance.Play_id
	WHERE Performance.Finish_date IS NULL
	GROUP BY Play.Play_id, Play.Name

/*Вывести список ролей, которые играли актеры без титулов */

SELECT DISTINCT Role.Name
	FROM Role INNER JOIN Cast ON Cast.Role_id = Role.Role_id
	          INNER JOIN Actor ON Cast.Actor_id = Actor.Actor_id
	WHERE Actor.Actor_id IN 
		(SELECT Actor_id 
			FROM Actor
		 EXCEPT 
		 SELECT DISTINCT Actor_id
			FROM Award_of_title)
