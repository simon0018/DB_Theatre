
CREATE TABLE [Actor] (
	Actor_id int IDENTITY (1,1) PRIMARY KEY,
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
	Birthday date NOT NULL,
	Gender char(1) CHECK (Gender = 'Ì' OR Gender = 'Æ') NOT NULL,
);

CREATE TABLE [Theatrical_character] (
	Theatrical_character_id int NOT NULL IDENTITY (1,1),
	Name varchar(50) NOT NULL,
  CONSTRAINT [PK_THEATRICAL_CHARACTER] PRIMARY KEY
  (
  [Theatrical_character_id] ASC
  ) 
);

CREATE TABLE [Play] (
	Play_id int NOT NULL IDENTITY (1,1) ,
	Name varchar(max) NOT NULL,
  CONSTRAINT [PK_PLAY] PRIMARY KEY
  (
  [Play_id] ASC
  )
);

CREATE TABLE [Performance] (
	Performance_id int NOT NULL IDENTITY (1,1),
	Producer_id int NULL,
	Start_date date NOT NULL,
	Finish_date date NULL,
	Theatre_id int NULL,
	Play_id int NULL,
  CONSTRAINT [PK_PERFORMANCE] PRIMARY KEY
  (
  [Performance_id] ASC
  ) 
);

CREATE TABLE [Role] (
	Role_id int NOT NULL IDENTITY (1,1),
	Name varchar(50) NOT NULL,
	Theatrical_character_id int NULL,
	Role_type_id int NULL,
	Gender char(1) CHECK (Gender = 'Ì' OR Gender = 'Æ') NOT NULL,
	Play_id int NULL,
  CONSTRAINT [PK_ROLE] PRIMARY KEY
  (
  [Role_id] ASC
  ) 
);

CREATE TABLE [Cast] (
	Actor_id int NOT NULL,
	Role_id int NOT NULL,
	Performance_id int NOT NULL,
  CONSTRAINT [PK_CONNECTION] PRIMARY KEY
  (
  [Actor_id] ASC,
  [Role_id] ASC,
  [Performance_id] ASC
  )
);

CREATE TABLE [Producer] (
	Producer_id int NOT NULL IDENTITY (1,1),
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
  CONSTRAINT [PK_PRODUCER] PRIMARY KEY
  (
  [Producer_id] ASC
  )
);

CREATE TABLE [Title] (
	Title_id int NOT NULL IDENTITY (1,1),
	Name varchar(50) NOT NULL,
  CONSTRAINT [PK_TITLE] PRIMARY KEY
  (
  [Title_id] ASC
  )
);

CREATE TABLE [Role_type] (
	Role_type_id int NOT NULL IDENTITY (1,1),
	Name varchar(50) NOT NULL,
  CONSTRAINT [PK_ROLE_TYPE] PRIMARY KEY
  (
  [Role_type_id] ASC
  ) 
);

CREATE TABLE [Writer] (
	Writer_id int NOT NULL IDENTITY (1,1),
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
  CONSTRAINT [PK_WRITER] PRIMARY KEY
  (
  [Writer_id] ASC
  )
);

CREATE TABLE [Theatre] (
	Theatre_id int NOT NULL IDENTITY (1,1),
	Name varchar(50) NOT NULL,
	Adress varchar(max) NOT NULL,
  CONSTRAINT [PK_THEATRE] PRIMARY KEY
  (
  [Theatre_id] ASC
  )
);

CREATE TABLE [Award_of_title] (
	Actor_id int NOT NULL,
	Title_id int NOT NULL,
	Date date NOT NULL,
  CONSTRAINT [PK_AWARD_OF_TITLE] PRIMARY KEY
  (
  [Actor_id] ASC,
  [Title_id] ASC
  )
);

CREATE TABLE [Author] (
	Writer_id int NOT NULL DEFAULT (0),
	Play_id int NOT NULL,
  CONSTRAINT [PK_AUTHOR] PRIMARY KEY
  (
  [Writer_id] ASC,
  [Play_id] ASC
  ) 
);

CREATE TABLE [Specialization] (
	Actor_id int NOT NULL,
	Theatrical_character_id int NOT NULL,
  CONSTRAINT [PK_SPECIALIZATION] PRIMARY KEY
  (
  [Actor_id] ASC,
  [Theatrical_character_id] ASC
  ) 
);





ALTER TABLE [Performance] 
	ADD CONSTRAINT [Performance_fk0] FOREIGN KEY ([Producer_id]) 
		REFERENCES [Producer]([Producer_id]) ON UPDATE CASCADE ;

ALTER TABLE [Performance] 
	ADD CONSTRAINT [Performance_fk1] FOREIGN KEY ([Theatre_id]) 
		REFERENCES [Theatre]([Theatre_id]) ON UPDATE CASCADE;

ALTER TABLE [Performance] 
	ADD CONSTRAINT [Performance_fk2] FOREIGN KEY ([Play_id]) 
		REFERENCES [Play]([Play_id]) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE [Role] 
	ADD CONSTRAINT [Role_fk0] FOREIGN KEY ([Theatrical_character_id]) 
		REFERENCES [Theatrical_character]([Theatrical_character_id]) ON DELETE SET DEFAULT ON UPDATE CASCADE;

ALTER TABLE [Role] 
	ADD CONSTRAINT [Role_fk1] FOREIGN KEY ([Role_type_id]) 
		REFERENCES [Role_type]([Role_type_id])ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE [Role] 
	ADD CONSTRAINT [Role_fk2] FOREIGN KEY ([Play_id]) 
		REFERENCES [Play]([Play_id]) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE [Cast] 
	ADD CONSTRAINT [Cast_fk0] FOREIGN KEY ([Actor_id]) 
		REFERENCES [Actor]([Actor_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE [Cast] 
	ADD CONSTRAINT [Cast_fk1] FOREIGN KEY ([Role_id]) 
		REFERENCES [Role]([Role_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE [Cast] 
	ADD CONSTRAINT [Cast_fk2] FOREIGN KEY ([Performance_id]) 
		REFERENCES [Performance]([Performance_id]);

ALTER TABLE [Award_of_title] 
	ADD CONSTRAINT [Award_of_title_fk0] FOREIGN KEY ([Actor_id]) 
		REFERENCES [Actor]([Actor_id]);

ALTER TABLE [Award_of_title] 
	ADD CONSTRAINT [Award_of_title_fk1] FOREIGN KEY ([Title_id]) 
		REFERENCES [Title]([Title_id]);

ALTER TABLE [Author] 
	ADD CONSTRAINT [Author_fk0] FOREIGN KEY ([Writer_id]) 
		REFERENCES [Writer]([Writer_id]) ON UPDATE CASCADE;

ALTER TABLE [Author] 
	ADD CONSTRAINT [Author_fk1] FOREIGN KEY ([Play_id]) 
		REFERENCES [Play]([Play_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE [Specialization] 
	ADD CONSTRAINT [Specialization_fk0] FOREIGN KEY ([Actor_id]) 
		REFERENCES [Actor]([Actor_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE [Specialization] 
	ADD CONSTRAINT [Specialization_fk1] FOREIGN KEY ([Theatrical_character_id]) 
		REFERENCES [Theatrical_character]([Theatrical_character_id]) ON DELETE CASCADE ON UPDATE CASCADE;

