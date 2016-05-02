/*Author 2/C Michael Moore*/
/*Exercise 1*/
CREATE TABLE MODEL(
       ModelName varchar(30) NOT NULL,
       Length char(4),
       Beam char(3),
       Draft char(2),
       Displacement char(10),
       CruisingRange varchar(30),
       MaxSpeed char(2),
       MaxOccupancy varchar(30),
       
       CONSTRAINT PK_id PRIMARY KEY (ModelName)
       ) ENGINE=InnoDB;

CREATE TABLE BOAT(
       HullNumber varchar(30) NOT NULL,
       ModelName varchar(30) NULL,

       CONSTRAINT PK_hull PRIMARY KEY (HullNumber),
       CONSTRAINT FK_model FOREIGN KEY (ModelName)
                  REFERENCES MODEL(ModelName)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

CREATE TABLE CREW(
       CrewNumber varchar(30) PRIMARY KEY,
       CrewName varchar(30),
       CrewMotto text,
       HullNumber varchar(30) NULL,

       CONSTRAINT FK_boat FOREIGN KEY (HullNumber)
                  REFERENCES BOAT(HullNumber)
                  ON DELETE NO ACTION ON UPDATE CASCADE
        ) ENGINE=InnoDB;

CREATE TABLE MIDSHIPMAN(
       Alpha integer PRIMARY KEY,
       LName char(30),
       FName char(30),
       Email char(50),
       Phone varchar(30),
       ClassYear integer(4),
       isCommander boolean,
       CrewNumber varchar(30) NULL,

       CONSTRAINT FK_crew FOREIGN KEY (CrewNumber)
                  REFERENCES CREW(CrewNumber)
                  ON DELETE NO ACTION ON UPDATE CASCADE
        ) ENGINE=InnoDB;

CREATE TABLE COMMANDER(
       Alpha int PRIMARY KEY,
       PositionTitle char(30),

       CONSTRAINT FK_alpha FOREIGN KEY (Alpha)
                  REFERENCES MIDSHIPMAN(Alpha)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

CREATE TABLE CRUISE(
       StartTime DATETIME,
       StartDate DATE,
       CrewNumber varchar(30),
       ReturnDate DATE,
       ReturnTime DATETIME,
       Destination varchar(30),

       CONSTRAINT Pk_cruise PRIMARY KEY (StartTime, StartDate, CrewNumber),
       CONSTRAINT FK_crewnum FOREIGN KEY (CrewNumber)
                  REFERENCES CREW(CrewNumber)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

/*Exercise 2*/

CREATE TABLE SPEAKER(
       SpeakerLastName char(30),
       SpeakerFirstName char(30),
       Organization char(30),
       Phone int,
       Email char(50),
       StreetAddress varchar(30),
       City varchar(30),
       State char(2),
       Zip integer(5),
       Country varchar(30),
       speakingEvent boolean,

       CONSTRAINT Pk_speaker PRIMARY KEY (SpeakerLastName, SpeakerFirstName, Organization)
        ) ENGINE=InnoDB;

CREATE TABLE EVENT(
       EventName varchar(30),
       EventDate DATE,
       EventTime DATETIME,
       Audience int,
       Location varchar(30),
       hasSpeaker boolean,
       Speaker varchar(30) null,

       CONSTRAINT Pk_event PRIMARY KEY (EventName, EventDate),
       CONSTRAINT FK_speaker FOREIGN KEY (Speaker)
                  REFERENCES SPEAKER(SpeakerLastName)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

/*Exercise 3*/

CREATE TABLE EMPLOYEES(
       EmployeeID integer PRIMARY KEY,
       FirstName varchar(30),
       LastName varchar(30),
       Password varchar(50)
       ) ENGINE=InnoDB;

CREATE TABLE TEXTBOOK(
       ISBN int(13) PRIMARY KEY,
       Title varchar(50),
       Author varchar(30),
       Edition int,
       YearPublished int(4)
       ) ENGINE=InnoDB;

CREATE TABLE InStockTextbooks(
       StockNumber int(30) PRIMARY KEY,
       ISBN int(13) null,

       CONSTRAINT FK_isbn FOREIGN KEY (ISBN)
                  REFERENCES TEXTBOOK(ISBN)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

CREATE TABLE OldTextEditions(
       CurrentEditionISBN int(13) PRIMARY KEY,
       OlderEditionISBN int(13),

       CONSTRAINT FK_edition FOREIGN KEY (CurrentEditionISBN)
                  REFERENCES TEXTBOOK(ISBN)
                  ON DELETE NO ACTION ON UPDATE CASCADE
       ) ENGINE=InnoDB;

CREATE TABLE MAJORS(
       MajorCode varchar(10) PRIMARY KEY,
       MajorName varchar(10) NOT NULL,
       CourseCodes varchar(10)
       ) ENGINE=InnoDB;

CREATE TABLE COURSES(
       CourseCode varchar(10) PRIMARY KEY,
       CourseName varchar(30),
       ISBN int(13),
       Major varchar(10) null,

       CONSTRAINT FK_bookreq FOREIGN KEY (ISBN)
                  REFERENCES TEXTBOOK(ISBN)
                  ON DELETE NO ACTION ON UPDATE CASCADE
               /*CONSTRAINT FK_major FOREIGN KEY (Major)
                  REFERENCES MAJORS(MajorName)
                  ON DELETE NO ACTION ON UPDATE CASCADE*/


       ) ENGINE=InnoDB;

CREATE TABLE SalesInformation(
       Notes text
       ) ENGINE=InnoDB;


/*Exercise 4*/

SELECT City, 
