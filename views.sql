DROP VIEW IF EXISTS student;

CREATE VIEW student AS
  SELECT alpha, AcYr, Sem, Course, CourseGrade 
  FROM midn join grades using (alpha);

SELECT * FROM student;



DROP VIEW IF EXISTS faculty;

CREATE VIEW faculty AS
  SELECT alpha, AcYr, Sem, Course, CourseGrade, Title, Section, 6Week, 12Week, EndOfTerm, Exam, Repeated, PassFail
  FROM midn join grades using (alpha);

SELECT * FROM faculty;




DROP VIEW IF EXISTS NameGpa;

CREATE VIEW NameGpa AS
  SELECT CONCAT(first, " ", last) As Name, gpa
  FROM midn join gpa using (alpha);

SELECT * FROM NameGpa;



DROP VIEW IF EXISTS studentGrade;

CREATE VIEW studentGrade AS
  SELECT alpha, CONCAT(first, " ", last) As Name, gpa, course, Title, courseGrade
  FROM midn join grades using (alpha) join gpa using (alpha);

SELECT * FROM studentGrade;



DROP VIEW IF EXISTS sux2suk;

CREATE VIEW sux2suk AS
  SELECT distinct CONCAT(first, " ", last) As Name, gpa
  FROM midn join grades using (alpha) join gpa using (alpha)
Where gpa < 3.0;

SELECT * FROM sux2suk;
