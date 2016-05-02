/* Create a GPA Table */

DROP TABLE IF EXISTS gpa;
CREATE TABLE gpa (
  alpha int(11) NOT NULL,
  gpa double NOT NULL,
  PRIMARY KEY (alpha)
);

DROP TABLE IF EXISTS gletter;
CREATE TABLE gletter (
  Letter char(1) NOT NULL,
  LetterVal int NOT NULL,
  PRIMARY KEY (Letter)
);

INSERT INTO gletter VALUES ("A", 4), ("B", 3), ("C",2), ("D",1), ("F",0), ("I",0);

INSERT INTO gpa (alpha, gpa)
  SELECT alpha, AVG(LetterVal) AS gpa 
  FROM grades g, gletter v 
  WHERE g.CourseGrade = v.Letter GROUP BY alpha;

-- --
-- Now lets work on triggers
-- --

/* create trigger: provide trigger name and specify when trigger should be invoked */ 

DELIMITER $$
CREATE TRIGGER UpdateGPA AFTER UPDATE ON grades	
FOR EACH ROW
BEGIN
  DECLARE varGPA double;
  IF (new.CourseGrade is not null) THEN
  /* create a variable @newGPA to compute and store the new gpa value */
  SET varGPA = (SELECT avg(LetterVal) 
    FROM grades g, gletter v
    WHERE g.CourseGrade = v.Letter AND alpha = new.alpha);
  /* update the Students table with the new GPA value */
  update gpa set gpa = varGPA where alpha = new.alpha;
  END IF;
END; $$

/* restore the default delimiter */
DELIMITER ;  

/* NOW LETS TEST THIS */

select * from gpa where alpha = 181234;

update grades set CourseGrade = "F" where alpha = 181234;

select * from gpa where alpha = 181234;

