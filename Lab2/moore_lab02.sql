-- #1
SELECT DISTINCT m.year FROM Movie m, Rating r WHERE m.mID = r.mID AND r.stars >= 4 ORDER By m.year ASC;

--#2
SELECT rev.name, m.title, r.stars, r.ratingDate FROM Movie m, Rating r, Reviewer rev WHERE rev.rID = r.rID AND r.mID = m.mID ORDER BY rev.name ASC, m.title ASC, r.stars ASC;

--#3
SELECT title FROM Movie LEFT JOIN Rating ON Movie.mID = Rating.mID WHERE stars IS NULL;

--#4
SELECT mID, stars FROM Rating WHERE stars = (SELECT MIN(stars) FROM Rating);

--#5
SELECT rev.name, m.title, r.stars FROM Rating r, Reviewer rev, Movie m WHERE r.stars = (SELECT MIN(stars) FROM Rating) AND m.mID = r.mID AND r.rID = rev.rID;

--#6
SELECT m.title, MAX(r.stars) AS stars FROM Movie m, Rating r WHERE m.mID = r.mID GROUP BY title;

--#7
SELECT m.title, AVG(r.stars) AS stars FROM Movie m, Rating r WHERE m.mID = r.mID GROUP BY title ORDER BY stars DESC;

--#8
SELECT AVG(r.stars) AS stars FROM Movie m, Rating r WHERE m.mID = r.mID GROUP BY title ORDER BY stars DESC LIMIT 1;

--#9
SELECT m.title, MAX(r.stars) - MIN(r.stars) AS spread FROM Movie m, Rating r WHERE m.mID = r.mID GROUP BY title ORDER BY spread DESC, title ASC;

--#10
SELECT rev.name FROM Rating r, Reviewer rev WHERE rev.rID = r.rID GROUP BY r.rID HAVING count(r.rID) >= 3;

--#11
SELECT director, title FROM Movie WHERE director IN (SELECT director FROM Movie GROUP BY director HAVING count(director) > 1) ORDER BY director ASC, title ASC;

--#12
SELECT title FROM Movie WHERE mID NOT IN (SELECT m.mID FROM Movie m, Reviewer rev, Rating r WHERE r.rID = 205 AND m.mID = r.mID GROUP BY title);

--#13

--#14
SELECT m.title, AVG(r.stars) AS stars FROM Movie m, Rating r WHERE m.mID = r.mID GROUP BY title ORDER BY stars DESC LIMIT 1;

--#15

