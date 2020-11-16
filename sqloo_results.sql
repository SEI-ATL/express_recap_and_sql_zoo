-- 0 SELECT basics
-- 1. 
SELECT population FROM world
WHERE name = 'Germany'

-- 2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


-- 1 SELECT name

-- 1.
SELECT name FROM world
  WHERE name LIKE 'Y%'
-- 2.
SELECT name FROM world
  WHERE name LIKE '%y'
-- 3.
SELECT name FROM world
  WHERE name LIKE '%x%'
-- 4.
SELECT name FROM world
  WHERE name LIKE '%land'
-- 5.
SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE '%ia'
-- 6.
SELECT name FROM world
  WHERE name LIKE '%oo%'
-- 7.
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
-- 8.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
-- 9.
SELECT name FROM world
 WHERE name LIKE '%o__o%'
-- 10.
SELECT name FROM world
 WHERE length(name) = 4
-- 11.
SELECT name
  FROM world
 WHERE name=capital
-- 12.
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')
-- 13, 14, and 15 have a bug, please skip them


-- 2 SELECT from World
-- 1.
SELECT name, continent, population FROM world
-- 2.
SELECT name FROM world
WHERE population >= 200000000
-- 3.
SELECT name, gdp/population
FROM world WHERE population >= 200000000
-- 4.
SELECT name, population/1000000 FROM world WHERE continent = 'South America'

-- 5.
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy')
-- 6.
SELECT name FROM world WHERE name LIKE '%United%'
-- 7.
SELECT name, population, area FROM world WHERE population > 250000000 OR area > 3000000
-- 8.
SELECT name, population, area FROM world WHERE population > 250000000 XOR area > 3000000
-- 9.
SELECt name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world WHERE  continent = 'South America'
-- 10.
SELECT name, ROUND(gdp/population,-3) FROM world WHERE gdp >= 1000000000000
-- 11.
SELECT name,capital
  FROM world
 WHERE length(name)=length(capital) 
-- 12.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital
-- 13.
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%a%' AND name LIKE '%o%' AND name LIKE '%e%'AND name LIKE '%i%' AND name LIKE '%u%'
  AND name NOT LIKE '% %'


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
 WHERE winner= 'Albert Einstein'
-- 4.
SELECT winner
  FROM nobel
 WHERE subject='Peace' and yr >= 2000;
-- 5.
SELECT * FROM nobel WHERE subject='Literature' and yr >=1980 and yr <=1989;

-- 6.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')
-- 7.
SELECT winner FROM nobel WHERE winner LIKE 'John %';
-- 8.
SELECT yr, subject, winner FROM nobel WHERE (subject ='Physics' AND yr =1980) OR (subject='Chemistry' AND yr=1984)
-- 9.
SELECT yr, subject, winner FROM nobel WHERE yr=1980 AND (subject NOT IN ('Chemistry', 'Medicine'))
-- 10.
SELECT yr, subject, winner FROM nobel WHERE (subject = 'Medicine' and yr<1910) OR (subject = 'Literature' AND yr >= 2004);
-- 11.
SELECT * FROM nobel WHERE winner = 'Peter Grünberg'
-- 12.
SELECT * FROM nobel WHERE winner = 'Eugene O''Neill';
-- 13.
SELECT winner,yr,subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC
-- 14.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner



-- 4 SELECT within SELECT
-- 1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
-- 2.
SELECT name FROM world WHERE (gdp/population)>(SELECT gdp/population FROM world WHERE name ='United Kingdom') AND continent = 'Europe'

-- 3.
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name='Argentina' or name='Australia') ORDER BY name
-- 4.
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name='Canada') AND population < (SELECT population FROM world WHERE name='Poland')
-- 5.
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name='Germany')*100), '%') FROM world WHERE continent='Europe'

-- As noted in the tutorial, questions 6 - 10 in this unit are considered bonuses, just like units 6 - 8+
-- 6.
SELECT name FROM world WHERE gdp >= ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp>0) AND continent <> 'Europe'
-- 7.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)
-- 8.
SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)
-- 9.
SELECT name, continent, population FROM world WHERE continent = ALL(SELECT continent FROM world x WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent = y.continent))
-- 10.
SELECT name, continent FROM world x WHERE population > ALL(SELECT (population*3) FROM world y WHERE x.continent = y.continent AND x.name<>y.name)


-- 5 SUM and COUNT
-- 1.
SELECT SUM(population)
FROM world
-- 2.
SELECT DISTINCT continent FROM world
-- 3.
SELECT SUM(gdp) FROM world WHERE continent ='Africa'
-- 4.
SELECT COUNT(name) FROM world WHERE area >= 1000000
-- 5.
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
-- 6.
SELECT continent, COUNT(name) FROM world GROUP BY continentSELECT
-- 7.
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent
-- 8.
SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000

-- Note: the units below this are bonus for this weekend, and they will be required in a future assignment. If you do them now you will be ahead of the game!
-- 6 JOIN
-- 1.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012
-- 3.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4.
SELECT team1, team2, player FROM game 
JOIN goal ON matchid=id 
WHERE player LIKE 'Mario %'
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10
-- 6.
SELECT mdate, teamname
FROM game JOIN eteam on eteam.id = team1
WHERE coach = 'Fernando Santos'
-- 7.
SELECT player FROM goal JOIN game ON (id=matchid)
WHERE stadium='National Stadium, Warsaw'
-- 8.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid <> 'GER' AND (team1 ='GER' OR team2 = 'GER')
-- 9.
SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
-- 10.
SELECT stadium, COUNT(stadium)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
-- 11.
SELECT matchid, mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY mdate, matchid
ORDER BY matchid
-- 12.
SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON (matchid=id)
WHERE (teamid='GER')
GROUP BY matchid, mdate
-- 13.
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2



-- 7 More JOIN operations
-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962
-- 2.
SELECT yr FROM movie WHERE title='Citizen Kane'
-- 3.
SELECT id, title, yr FROM movie 
WHERE title LIKE '%Star Trek%'
ORDER BY yr
-- 4.
SELECT id FROM actor WHERE name='Glenn Close'
-- 5.
SELECT id FROM movie WHERE title='Casablanca'
-- 6.
SELECT name FROM actor JOIN casting ON actor.id=actorid WHERE movieid=11768
-- 7.
SELECT name FROM actor JOIN casting ON actor.id=actorid WHERE movieid=(SELECT id FROM movie WHERE title='Alien')
-- 8.
 SELECT DISTINCT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid= (SELECT actor.id FROM actor WHERE name='Harrison Ford')
-- 9.
 SELECT DISTINCT title FROM movie WHERE movie.id IN(SELECT movieid FROM casting JOIN actor ON actor.id=actorid WHERE actor.name='Harrison Ford' AND casting.ord <>1)
-- 10.
SELECT title, name FROM movie 
JOIN casting ON (movie.id=movieid) 
JOIN actor ON (actor.id=actorid) 
WHERE (yr=1962 AND casting.ord=1)
-- 11.
SELECT yr,COUNT(title) FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.
SELECT DISTINCT title, name FROM casting 
JOIN movie ON (movieid=movie.id)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
  SELECT movieid FROM actor JOIN casting on (actor.id=actorid)
  WHERE name='Julie Andrews') AND ord=1
-- 13.
SELECT name FROM actor JOIN casting ON (actor.id=actorid)
 WHERE ord=1 GROUP BY name
HAVING COUNT(movieid)>=15
-- 14.
SELECT title, COUNT(actorid) FROM movie 
JOIN casting ON (movie.id=movieid) 
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title
-- 15.
SELECT name FROM actor 
JOIN casting ON actor.id=actorid
JOIN movie ON movie.id=movieid
WHERE movie.id IN (
SELECT movieid FROM casting JOIN actor ON actorid=actor.id WHERE name='Art Garfunkel')
 AND name <> 'Art Garfunkel'

-- 8 Using Null
-- 1.
SELECT name FROM teacher WHERE dept IS NULL
-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)
-- 3.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 4.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher 
-- 6.
SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
 LEFT JOIN dept ON dept=dept.id
-- 7.
SELECT COUNT(name), COUNT(mobile) FROM teacher 
-- 8.
SELECT dept.name, COUNT(teacher.name) FROM teacher 
RIGHT JOIN dept ON (dept.id=dept) 
GROUP BY dept.name
-- 9.
SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END 
FROM teacher

-- 10.
SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci' 
WHEN dept=3 THEN 'Art' ELSE 'None' END 
FROM teacher



-- 8+ Numeric Examples 
-- 1.
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 2.
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score>=100
-- 3.
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score < 50
   AND subject='(8) Computer Science'
-- 4.
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 5.
SELECT subject,SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 6.
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 7.
SELECT institution, ROUND(SUM(response*score)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
-- 8.
SELECT institution,SUM(sample),SUM(CASE WHEN subject='(8) Computer Science' THEN nss.sample ELSE 0 END)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY institution


--I did this before realizing it was not section 8+ ...whoops
-- SELF JOIN
-- 1.
SELECT COUNT(*) FROM stops
-- 2.
SELECT id FROM stops WHERE name = 'Craiglockhart'
-- 3.
SELECT stops.id, name FROM stops JOIN route 
ON (stop=stops.id) WHERE num=4 and company='LRT'

-- 4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)=2
-- 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149
-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'
-- 7.
SELECT DISTINCT a.company, a.num FROM route a 
JOIN route b on (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137
-- 8.
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopA ON (a.stop=stopA.id)
  JOIN stops stopB ON (b.stop=stopB.id)
WHERE stopA.name='Craiglockhart' AND stopB.name='Tollcross'
-- 9.
SELECT  stopb.name,a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
-- 10.
--This should work but it's too big for the site to run
SELECT DISTINCT a.company, a.num, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN (route c JOIN route d ON (c.stop=d.stop AND c.company=d.company))
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  JOIN stops stopc ON (c.stop=stopc.id)
  JOIN stops stopd ON (d.stop=stopd.id)
WHERE stopa.name='Craiglockhart' AND stopd.name='Lochend' AND stopb.name=stopc.name