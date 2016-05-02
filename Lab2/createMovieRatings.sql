# Remember to connect to the mysql database via
#  mysql -h zee -u m161234 -p m161234
# If you forget to specify the last m161234 (the database name) you need 
# to connect to it directly after you connect to the database via
#  use m161234;

/* Create the schema for our tables */
create table Movie(mID int PRIMARY KEY, title varchar(200), year int, director varchar(200));
create table Reviewer(rID int PRIMARY KEY, name varchar(200));
create table Rating(rID int, mID int, stars int, ratingDate date, CONSTRAINT PK_rating PRIMARY KEY(rID, mID, stars));

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2014-01-22');
insert into Rating values(201, 101, 4, '2014-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2014-01-20');
insert into Rating values(203, 108, 4, '2014-01-12');
insert into Rating values(203, 108, 2, '2014-01-28');
insert into Rating values(204, 101, 3, '2014-01-09');
insert into Rating values(205, 103, 3, '2014-01-27');
insert into Rating values(205, 104, 2, '2014-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2014-01-15');
insert into Rating values(206, 106, 5, '2014-01-19');
insert into Rating values(207, 107, 5, '2014-01-20');
insert into Rating values(208, 104, 3, '2014-01-02');
