/* Examples for Triggers and Stored Procedures */

--
-- /* A simple function */
--

DROP FUNCTION IF EXISTS hello;

CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50)
RETURN CONCAT('Hello, ',s,'!');

SELECT hello('world');

--
-- /* A simple function, but with the DELIMETER set, not necessary in this case, why? */
-- 

DROP FUNCTION IF EXISTS happy;

DELIMITER $$
CREATE FUNCTION happy (myname CHAR(20))
RETURNS CHAR(50)
RETURN CONCAT('Happy Joy Joy ', myname);
$$
DELIMITER ;

SELECT happy('world')

--
-- /* Moving on a bit */
--

--
-- /* Why do we need to set the delimiter in this case? */
--

DROP FUNCTION IF EXISTS happytwo;

DELIMITER $$
CREATE FUNCTION happytwo()
RETURNS TEXT
BEGIN
  DECLARE happyness CHAR(50);
  SET happyness = 'Happy Happy Joy Joy';
  RETURN happyness;
END;
$$
DELIMITER ;

SELECT happytwo();

--
-- /* Lets access our tables */
-- 

--
-- /* Remember: Functions only return a single value */
--

DROP FUNCTION IF EXISTS getmidname;

DELIMITER $$
CREATE FUNCTION getmidname(midnalpha INT)
RETURNS TEXT READS SQL DATA
BEGIN
  DECLARE answer TEXT;
  SET answer = (SELECT CONCAT(first, ' ', last) FROM midn WHERE alpha = midnalpha);
  RETURN answer;
END;
$$
DELIMITER ;

select (getmidname(181234));

--
-- /* Lets access our tables, version 2 */
-- /* Remember: Functions only return a single value */
--

DROP FUNCTION IF EXISTS getmidname;

DELIMITER $$
CREATE FUNCTION getmidname(midnalpha INT)
RETURNS TEXT READS SQL DATA
BEGIN
  DECLARE answer TEXT;
  IF midnalpha IS NULL
    THEN # get the information from our default mid
      SET answer = (SELECT CONCAT(first, ' ', last) FROM midn WHERE alpha = 181234);
    ELSE # get the information from the requested mid
      SET answer = (SELECT CONCAT(first, ' ', last) FROM midn WHERE alpha = midnalpha);
  END IF;
  RETURN answer;
END;
$$
DELIMITER ;

select (getmidname(181234));
select (getmidname(NULL));


