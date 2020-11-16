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
Find the country that start with Y

SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2.
Find the countries that end with y

SELECT name FROM world
  WHERE name LIKE '%y';

-- 3.
Find the countries that contain the letter x

SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4.
Find the countries that end with land

SELECT name FROM world
  WHERE name LIKE '%land';

-- 5.
Find the countries that start with C and end with ia

SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6.
Find the country that has oo in the name

SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7.
Find the countries that have three or more a in the name

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8.
Find the countries that have "t" as the second character.

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

-- 9.
Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- 10.
Find the countries that have exactly four characters

SELECT name FROM world
 WHERE name LIKE '____';

-- 11.
Find the country where the name is the capital city

SELECT name
FROM world
WHERE name = capital;

-- 12.
Find the country where the capital is the country plus "City"

SELECT name FROM world
WHERE capital = concat(name, ' City');

-- 13, 14, and 15 have a bug, please skip them


-- 2 SELECT from World
-- 1.
SELECT name, continent, population FROM world

-- 2.
Show the name for the countries that have a population of at least 200 million

SELECT name FROM world
WHERE population > 200000000;

-- 3.
Give the name and the per capita GDP for those countries with a population of at least 200 million

SELECT name, gdp/population FROM world
WHERE population > 200000000;

-- 4.
Show the name and population in millions for the countries of the continent 'South America'

SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

-- 5.
Show the name and population for France, Germany, Italy

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6.
Show the countries which have a name that includes the word 'United'

SELECT name FROM world
WHERE name LIKE '%United%';

-- 7.
Show the countries that are big by area or big by population. Show name, population and area

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8.
Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'

SELECT name, ROUND(population / 1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America';

-- 10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

-- 11.
Show the name and capital where the name and the capital have the same number of characters

SELECT name, capital
FROM world 
WHERE LENGTH(name) = LENGTH(capital);

-- 12.
Show the name and the capital where the first letters of each match. Dont include countries where the name and the capital are the same word

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital, 1) AND name <> capital;

-- 13.
Find the country that has all the vowels and no spaces in its name

SELECT name FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'


-- 3 SELECT from Nobel
-- 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

-- 2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3.
Show the year and subject that won 'Albert Einstein' his prize

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4.
Give the name of the 'Peace' winners since the year 2000, including 2000

SELECT winner FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- 5.
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive

SELECT yr, subject, winner FROM nobel
WHERE subject = 'Literature' 
AND yr BETWEEN 1980 AND 1989;

-- 6.
Show all details of the presidential winners

SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7.
Show the winners with first name John

SELECT winner FROM nobel
WHERE winner LIKE 'John%';

-- 8.
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9.
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine';

-- 10.
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11.
Find all details of the prize won by PETER GR_NBERG

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12.
SELECT * FROM nobel
WHERE winner = 'EUGENE O\'NEILL';

'-- 13.
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order

SELECT winner, yr , subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- 14.
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last

SELECT winner, subject FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;


-- 4 SELECT within SELECT
-- 1.
List each country name where the population is larger than that of 'Russia'

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'

SELECT name FROM world
WHERE (gdp / population) > (SELECT gdp / population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';

-- 3.
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4.
Which country has a population that is more than Canada but less than Poland?

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%')
FROM world
WHERE continent = 'Europe';

-- As noted in the tutorial, questions 6 - 10 in this unit are considered bonuses, just like units 6 - 8+
-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 5 SUM and COUNT
-- 1.
Show the total population of the world

SELECT SUM(population)
FROM world;

-- 2.
List all the continents - just once each

SELECT DISTINCT continent FROM world;

-- 3.
Give the total GDP of Africa

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

-- 4.
How many countries have an area of at least 1000000

SELECT COUNT(name) FROM world
WHERE area > 1000000;

-- 5.
What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6.
For each continent show the continent and number of countries

SELECT continent, COUNT(name) FROM world
GROUP BY continent;

-- 7.
For each continent show the continent and number of countries with populations of at least 10 million

SELECT continent, COUNT(name)
FROM (SELECT * FROM world a WHERE population > 10000000) b GROUP BY continent;

-- 8.


-- Note: the units below this are bonus for this weekend, and they will be required in a future assignment. If you do them now you will be ahead of the game!
-- 6 JOIN
-- 1.
show the matchid and player name for all goals scored by Germany

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

-- 2.
Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

-- 3.
show the player, teamid, stadium and mdate for every German goal

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4.
Show the team1, team2 and player for every goal scored by a player called Mario

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

-- 5.
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid=id
 WHERE gtime<=10;

-- 6.
List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.



-- 7 More JOIN operations
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.

-- 14.

-- 15.


-- 8 Using Null
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

