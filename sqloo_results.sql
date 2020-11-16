-------------- 0 SELECT BASIC
-- 1.
SELECT population FROM world
WHERE name = 'Germany'

-- 2.
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

-------------- 1 SELECT NAME

-- 1.
SELECT name FROM world
WHERE name LIKE 'y%'

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
WHERE name LIKE 'c%ia'

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
WHERE name LIKE '____'

-- 11.
SELECT name
FROM world
WHERE name LIKE capital

-- 12.
SELECT name FROM world
WHERE capital = concat(name, ' City')


-- 13, 14, and 15 have a bug, please skip them

-------------- 2 SELECT FROM WORLD

-- 1.
SELECT name, continent, population FROM world

-- 2.
SELECT name FROM world
WHERE population >= 200000000

-- 3.
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- 4.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- 5.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6.
SELECT name
FROM world
WHERE name LIKE '%united%'

-- 7.
SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population >= 250000000

-- 8.
SELECT name, population, area
FROM world
WHERE area >= 3000000 XOR population >= 250000000

-- 9.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'


-- 10.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= '1000000000000' 

-- 11.
SELECT name, capital
FROM world
WHERE LENGTH(name) LIKE LENGTH(capital)

-- 12.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- 13.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%' AND name LIKE '%i%'
AND name LIKE '%o%' AND name LIKE '%u%'
AND name NOT LIKE '% %'


-------------- 3 SELECT FROM NOBEL

-- 1.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 2.
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature'

-- 3.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4.
SELECT winner
FROM nobel
WHERE subject LIKE 'Peace' AND yr >= 2000

-- 5.
SELECT yr, subject, winner
FROM nobel
WHERE subject LIKE 'Literature' AND yr BETWEEN 1980 AND 1989

-- 6.
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')

-- 7.
SELECT winner
FROM nobel
WHERE winner LIKE 'John %'

-- 8.
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Chemistry' AND yr = '1984') OR
(subject = 'Physics' AND yr = '1980')

-- 9.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

-- 10.
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR
(subject = 'Literature' AND yr >= 2004) 

-- 11.
SELECT *
FROM nobel
WHERE winner LIKE 'Peter Gr_nberg'

-- 12.
SELECT *
FROM nobel
WHERE winner LIKE 'Eugene o''neill'

-- 13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner

-- 14.SELECT winner, subject
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject,winner

-------------- 4 SELECT WITHIN SELECT

-- 1.
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

-- 2.
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population >
(SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- 3.
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

-- 4.
SELECT name, population
FROM world
WHERE population BETWEEN
(SELECT population FROM world WHERE name = 'Poland') AND
(SELECT population FROM world WHERE name = 'Canada')

-- 5.
SELECT name, CONCAT(CAST(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'),0) as int), '%')
FROM world
WHERE continent = 'Europe'


--------------- As noted in the tutorial, questions 6 - 10 in this unit
--------------- are considered bonuses, just like units 6 - 8+

--------------- (I NEED TO STUDY THESE MORE BELOW)

-- 6.
SELECT name FROM world 
WHERE gdp > ALL
(SELECT gdp FROM world
WHERE continent = 'Europe' 
AND gdp IS NOT NULL)

-- 7.
SELECT continent, name, area 
FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
and area > 0 )


-- 8.
SELECT continent,name FROM world x
WHERE x.name <= ALL (
SELECT name FROM world y
WHERE x.continent=y.continent)


-- 9.
SELECT name,continent,population FROM world x
WHERE 25000000 >= ALL (
SELECT population FROM world y
WHERE x.continent=y.continent
AND y.population>0)


-- 10.
SELECT name, continent FROM world x WHERE
population > ALL
(SELECT population*3 FROM world y
WHERE y.continent = x.continent
AND y.name != x.name)


-------------- 5 SUM AND COUNT

-- 1.
SELECT SUM(population)
FROM world

-- 2.
SELECT DISTINCT(continent)
FROM world

-- 3.
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

-- 4.
SELECT COUNT(name)
FROM world
WHERE area >= 1000000

-- 5.
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia','Latvia','Lithuania')

-- 6.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- 7.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

-- 8.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >=100000000

------------------------------ Note: the units below this are bonus for this weekend,
------------------------------ and they will be required in a future assignment.
------------------------------ If you do them now you will be ahead of the game!
------------------------------ I did some not, all i kept getting stuck

-------------- 6 JOIN

-- 1.
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER'

-- 2.
SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'

-- 3.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4.
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

-- 7.
SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw'

-- 8.
SELECT DISTINCT player
FROM game JOIN goal ON (matchid=id) 
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

-- 9.
SELECT teamname,COUNT(teamid)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10.
SELECT stadium, COUNT(teamid)
FROM game JOIN goal ON (matchid=id)
GROUP BY stadium 

-- 11.
SELECT matchid,mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid,mdate

-- 12.
SELECT matchid,mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid, mdate

-- 13. (I DIDNT GET THIS ONE TWO MUCH, I FOUND THIS ANSWER ONLINE)
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate,matchid,team1,team2



-------------- 7 MORE JOIN OPERATIONS

-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star%Trek%'
ORDER BY yr

-- 4.
SELECT id
FROM actor 
WHERE name = 'Glenn Close'

-- 5.
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- 6.
SELECT name
FROM casting JOIN actor
WHERE movieid=11768 AND actorid=actor.id

-- 7.
SELECT name
FROM movie, casting, actor
WHERE title='Alien'
AND movieid=movie.id
AND actorid=actor.id

-- 8.
SELECT title
FROM movie, casting, actor
WHERE name='Harrison Ford'
AND movieid=movie.id
AND actorid=actor.id

-- 9.
SELECT title
FROM movie, casting, actor
WHERE name='Harrison Ford' AND ord!='1'
AND movieid=movie.id
AND actorid=actor.id

-- 10.
SELECT title, name 
FROM movie, casting, actor
WHERE yr='1962'
AND movieid=movie.id
AND actorid=actor.id
AND ord=1

-- 11.

-- 12.

-- 13.

-- 14.

-- 15.

-------------- 8 USING NULL

-- 1.
SELECT name
FROM teacher
WHERE dept IS NULL


-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)


-- 3.
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON (teacher.dept=dept.id)


-- 4.
SELECT teacher.name, dept.name
FROM teacher 
RIGHT JOIN dept ON (teacher.dept=dept.id)


-- 5.
SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher


-- 6.
SELECT teacher.name, COALESCE(dept.name,'None')
FROM teacher LEFT JOIN dept
ON teacher.dept=dept.id


-- 7.

-- 8.

-- 9.

-- 10.

-------------- 8+ NUMERIC EXAMPLES

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
SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject = '(8) Computer Science'


-- 4.
SELECT subject,SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject


-- 5.

-- 6.

-- 7.

-- 8.