CREATE TABLE Students(
       Alpha int(6) Primary Key,
       Name varchar(20),
       Email varchar(50),
       ClassYear int(4),
       GPA float(3)
);

DROP TRIGGER IF EXISTS UpdateEmail;

DELIMITER $$
CREATE TRIGGER UpdateEmail BEFORE INSERT ON Students	
FOR EACH ROW
BEGIN
        IF (new.Email is null) THEN
           SET new.Email = CONCAT('m' , new.Alpha , '@usna.edu');
        END IF;
END; $$
