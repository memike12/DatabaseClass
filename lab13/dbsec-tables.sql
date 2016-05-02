-- --------------------------------------------------------

DROP TABLE IF EXISTS songs12;

CREATE TABLE songs12 (
  SongID int NOT NULL auto_increment,
  Title varchar(30) NOT NULL,
  Artist varchar(30) NOT NULL,
  Votes int not null default 0,
  Constraint PK_songs PRIMARY KEY  (SongID)
);

insert into songs12(Title, Artist) values('Firework', 'Katy Perry');
insert into songs12(Title, Artist) values('Grenade', 'Bruno Mars');
insert into songs12(Title, Artist) values('What\'s My Name?', 'Rihanna');

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS users12;

CREATE TABLE users12 (
  UserID varchar(25) NOT NULL,
  Password varchar(40) NOT NULL,
  Type char(1) NOT NULL,
  Constraint PK_users PRIMARY KEY  (UserID)
);


INSERT INTO users12 (UserID, Password, Type) VALUES 
('crainiceanu', 'password', 'a'),
('doe', 'password', 'u');