-- 0 SELECT basics
-- 1.
SELECT population FROM world
  WHERE name = 'Germany';
-- 2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
-- 1 SELECT name
-- 1.
SELECT name FROM world
  WHERE name LIKE 'Y%';
-- 2.
SELECT name FROM world
  WHERE name LIKE '%Y';
-- 3.
SELECT name FROM world
  WHERE name LIKE '%X%';
-- 4.
SELECT name FROM world
  WHERE name LIKE '%land';
-- 5.
SELECT name FROM world
  WHERE name LIKE 'C%ia';
-- 6.
SELECT name FROM world
  WHERE name LIKE '%oo%';
-- 7.
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';
-- 8.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;
-- 9.
SELECT name FROM world
 WHERE name LIKE '%o__o%';
-- 10.
SELECT name FROM world
 WHERE name LIKE '____';
-- 11.
SELECT name
  FROM world
 WHERE name = capital;
-- 12.
SELECT name
  FROM world
 WHERE capital = concat(name, ' city');
-- 13, 14, and 15 have a bug, please skip them

-- 2 SELECT from World
-- 1.
SELECT name, continent, population FROM world;
-- 2.
SELECT name FROM world
WHERE population >= 200000000;
-- 3.
SELECT name, gdp/population
FROM world
WHERE population > 200000000;
-- 4.
SELECT name, population/1000000 
FROM world
WHERE continent = 'South America';
-- 5.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
-- 6.
SELECT name 
FROM world
WHERE name LIKE '%United%';
-- 7.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;
-- 8.
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000)
OR (area < 3000000 AND population > 250000000);
-- 9.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';
-- 10.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;
-- 11.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
-- 12.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital;
-- 13.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';


-- 3 SELECT from Nobel
-- 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
-- 2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
-- 3.
SELECT yr, subject 
FROM nobel
WHERE winner = 'Albert Einstein';
-- 4.
SELECT winner 
FROM nobel
WHERE yr >= 2000
AND subject = 'Peace';
-- 5.
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
AND yr >= 1980
AND yr <= 1989;
-- 6.
SELECT * FROM nobel
 WHERE winner = 'Theodore Roosevelt'
OR winner = 'Woodrow Wilson'
OR winner = 'Jimmy Carter'
OR winner = 'Barack Obama'
-- 7.
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'
-- 8.
SELECT * FROM nobel
WHERE subject = 'Physics'
AND yr = 1980
OR subject = 'Chemistry'
AND yr = 1984;
-- 9.
SELECT * FROM nobel
WHERE yr = 1980
AND subject <> 'Chemistry'
ANd subject <> 'Medicine';
-- 10.
SELECT * FROM nobel
WHERE subject = 'Medicine'
AND yr < 1910
OR subject = 'Literature'
and yr >= 2004;
-- 11.
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';
-- 12.
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';
-- 13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;
-- 14.
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject, winner;


-- 4 SELECT within SELECT
-- 1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
-- 2.
SELECT name
FROM world
WHERE gdp/population > 
(SELECT gdp/population FROM world WHERE name = 'United Kingdom')
AND continent = 'Europe';
-- 3.
SELECT name, continent 
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name ASC;
-- 4.
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');
-- 5.
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany')), '%')
FROM world
WHERE continent = 'Europe'
-- As noted in the tutorial, questions 6 - 10 in this unit are considered bonuses, just like units 6 - 8+
-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 5 SUM and COUNT
-- 1.
SELECT SUM(population)
FROM world
-- 2.
SELECT DISTINCT continent
FROM world
-- 3.
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';
-- 4.
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;
-- 5.
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
-- 6.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;
-- 7.
SELECT continent, COUNT(name)
FROM world 
WHERE population >= 10000000
GROUP BY continent;
-- 8.
SELECT continent 
FROM world 
GROUP BY continent
HAVING SUM(population) >= 100000000;

-- Note: the units below this are bonus for this weekend, and they will be required in a future assignment. If you do them now you will be ahead of the game!
-- 6 JOIN
-- 1.
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';
-- 2.
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;
-- 3.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM goal
JOIN game ON (game.id=goal.matchid)
WHERE teamid = 'GER'
-- 4.
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON (goal.matchid = game.id)
WHERE player LIKE 'Mario%';
-- 5.
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10;
-- 6.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos';
-- 7.
SELECT goal.player
FROM goal
JOIN game ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw';
-- 8.
SELECT DISTINCT goal.player
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE (game.team1='GER' OR game.team2='GER')
AND teamid != 'GER'
-- 9.
SELECT teamname, COUNT(player)
FROM eteam 
JOIN goal ON id=teamid
GROUP BY teamname
-- 10.
SELECT game.stadium, COUNT(player)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;
-- 11.
SELECT matchid, mdate, COUNT(player)
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;
-- 12.
SELECT goal.matchid, game.mdate, COUNT(player)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY matchid, mdate;
-- 13.
SELECT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;


-- 7 More JOIN operations
-- 1.
SELECT id, title
FROM movie
WHERE yr=1962
-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';
-- 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;
-- 4.
SELECT id
FROM actor
WHERE name = 'Glenn Close';
-- 5.
SELECT id
FROM movie
WHERE title = 'Casablanca';
-- 6.
SELECT actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movieid = 11768;
-- 7.
SELECT actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE title = 'Alien';
-- 8.
SELECT movie.title 
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford';
-- 9.
SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord != 1;
-- 10.
SELECT movie.title, actor.name
FROM movie 
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962 AND ord = 1;
-- 11.
SELECT yr, COUNT(title)
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.

-- 13.

-- 14.

-- 15.


-- 8 Using Null
-- 1.
SELECT name
FROM teacher
WHERE dept IS null;
-- 2.
SELECT teacher.name, dept.name
 FROM teacher 
INNER JOIN dept ON (teacher.dept=dept.id);
-- 3.
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON teacher.dept = dept.id;
-- 4.
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;
-- 5.
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher;
-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher 
LEFT JOIN dept ON teacher.dept = dept.id;
-- 7.
SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;
-- 9.
SELECT teacher.name,
CASE WHEN dept = 1 OR dept = 2 
THEN 'Sci'
ELSE 'Art' END
FROM teacher;
-- 10.
SELECT teacher.name,
CASE WHEN dept = 1 OR dept = 2
THEN 'Sci'
WHEN dept = 3
THEN 'Art'
ELSE 'None' END
FROM teacher;


-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

