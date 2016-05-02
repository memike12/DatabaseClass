#1
CREATE TABLE `PerformanceTypes` (
       `PerformanceTypeName` VARCHAR(45) NOT NULL,
       PRIMARY KEY (`PerformanceTypeName`)) ENGINE=InnoDB;

CREATE TABLE `Performers` (
       `PerformerID` INT NOT NULL,
       `FirstName` VARCHAR(45) NULL,
       `LastName` VARCHAR(45) NULL,
       `Address` VARCHAR(60) NULL,
       `PerformanceTypeName` VARCHAR(45) NOT NULL,
       PRIMARY KEY (`PerformerID`),
       CONSTRAINT `PNAME_id` FOREIGN KEY(`PerformanceTypeName`)
                  REFERENCES PerformanceTypes(PerformanceTypeName)
                  ) ENGINE=InnoDB;

CREATE TABLE `Arenas` (
       `ArenaID` INT NOT NULL,
       `ArenaName` VARCHAR(45) NULL,
       `City` VARCHAR(45) NULL,
       `Capacity` INT NULL,
       PRIMARY KEY (`ArenaID`)) ENGINE=InnoDB;

CREATE TABLE `Concerts` (
       `PerformerID` INT NOT NULL,
       `ArenaID` INT NOT NULL,
       `ConcertDate` DATE NOT NULL,
       CONSTRAINT `PK_id` PRIMARY KEY(`PerformerID`, `ArenaID`, `ConcertDate`),
       CONSTRAINT `FK_id` FOREIGN KEY(`PerformerID`)
                  REFERENCES Performers(PerformerID),
       CONSTRAINT `FK2_id` FOREIGN KEY(`ArenaID`)
                  REFERENCES Arenas(ArenaID)
       ) ENGINE=InnoDB;

#2
INSERT INTO PerformanceTypes (PerformanceTypeName)
VALUES('singer');
INSERT INTO PerformanceTypes (PerformanceTypeName)
VALUES('dancer');
INSERT INTO PerformanceTypes (PerformanceTypeName)
VALUES('comedian');

#3
ALTER TABLE `Performers`
ADD DateOfBirth DATE NULL;

#4
#a)
INSERT INTO Performers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
Values(1, 'John', 'Dow', 'Annapolis, MD', 'singer', NULL);
#b)
INSERT INTO Performers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
Values(2, 'John', 'Doe', 'Annapolis, MD', 'painter', NULL);
/*My table doesn't accept the row*/
#c)
INSERT INTO Performers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
Values(3, 'Matt', 'Smith', 'Baltimore, MD', 'dancer', NULL);
INSERT INTO Performers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
Values(4, 'Jane', 'Brown', 'New York, NY', 'dancer', NULL);
INSERT INTO Performers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
Values(5, 'Jennifer', 'Shade', 'Seattle, WA', 'dancer', NULL);

#5
UPDATE Performers SET DateOfBirth = '1990-03-02' WHERE PerformerID=1;

#6
#a)
DELETE FROM Performers WHERE FirstName = 'Matt' AND LastName = 'Smith';
#b)
#My delete statement would remove all the rows with these constraints

#7
#a)
DELETE FROM PerformanceTypes WHERE PerformanceTypeName = 'singer';
#b)
/*It was not removed because there is a forign key dependency from Performers depending on singer to be there */
#d)
DELETE FROM PerformanceTypes WHERE PerformanceTypeName = 'comedian';
/*There are no performers that have the PerformanceTypeName of comedian so mySQL doesn't put up any fight against deleting it.*/

#8
Update PerformanceTypes Set PerformanceTypeName='dance performer' where PerformanceTypeName='dancer';
/* this fails because I am updating the parent of the foreign key, not the child which relies on dancer to be there*/

#9
#a)
INSERT INTO Arenas (ArenaID, ArenaName, City, Capacity)
Values(1, 'Gaming Sector', 'Tron City', 1000000);
INSERT INTO Arenas (ArenaID, ArenaName, City, Capacity)
Values(2, 'Trillenium Stadium', 'Dartmoor', 100000);
INSERT INTO Arenas (ArenaID, ArenaName, City, Capacity)
Values(3, 'Petranaki Arena', 'Geonosis', 1000000);
INSERT INTO Arenas (ArenaID, ArenaName, City, Capacity)
Values(4, 'Colosseum', 'Rome', 45000);
#b)
INSERT INTO Concerts (PerformerID, ArenaID, ConcertDate)
Values(1, 2, '2001-10-01');
INSERT INTO Concerts (PerformerID, ArenaID, ConcertDate)
Values(5, 4, '0001-10-31');
INSERT INTO Concerts (PerformerID, ArenaID, ConcertDate)
Values(4, 2, '2001-10-11');
INSERT INTO Concerts (PerformerID, ArenaID, ConcertDate)
Values(1, 3, '9457-10-01');
#c
UPDATE Arenas Set Capacity=50000 WHERE ArenaID IN (Select ArenaID From Concerts HAVING Count(ArenaID) > 1); 

#10
#a)
CREATE TABLE `Dancers` (
       `PerformerID` INT NOT NULL,
       `FirstName` VARCHAR(45) NULL,
       `LastName` VARCHAR(45) NULL,
       `Address` VARCHAR(60) NULL,
       `PerformanceTypeName` VARCHAR(45) NOT NULL,
       `DateOfBirth`  DATE NULL,
       PRIMARY KEY (`PerformerID`),
       CONSTRAINT `DNAME_id` FOREIGN KEY(`PerformanceTypeName`)
                  REFERENCES PerformanceTypes(PerformanceTypeName)
                  ) ENGINE=InnoDB;
#b)
INSERT INTO Dancers Select * From Performers WHERE PerformanceTypeName='dancer';

#11
#a
ALTER TABLE Concerts DROP FOREIGN KEY FK_id;
#b
DELETE FROM Performers WHERE PerformanceTypeName='dancer';
#C
SELECT PerformerID FROM Concerts  WHERE PerformerID <>(Select PerformerID FROM Performers);
#d
DELETE FROM Concerts WHERE PerformerID <>(Select PerformerID FROM Performers);

#12
#a
Drop Table PerformanceTypes;
#b
/*I cannot drop PerformanceTypes because there are foreign keys that are dependent on it*/

#c
ALTER TABLE Performers DROP FOREIGN KEY PNAME_id;
ALTER TABLE Dancers DROP FOREIGN KEY DNAME_id;

#d
/*It worked now that there wasn't a foreign key depending on it*/

#13
SELECT DISTINCT Arenas.ArenaID, Arenas.ArenaName, Arenas.City, Arenas.Capacity, Concerts.PerformerID, Concerts.ConcertDate FROM Concerts RIGHT JOIN Arenas ON Concerts.ArenaID=Arenas.ArenaID;


#14
SELECT ArenaName FROM Arenas WHERE Capacity>(SELECT AVG(Capacity) FROM Arenas);
