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
  WHERE name LIKE '%A%A%A%'
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
 WHERE name=capital
-- 12.
SELECT name 
  FROM world
 WHERE capital = concat(name, ' city')
-- 13, 
SELECT capital, name
FROM world
WHERE capital LIKE concat('%',name,'%')
14, and 15 have a bug, please skip them


-- 2 SELECT from World
-- 1.
SELECT name, continent, population FROM world
-- 2.
SELECT name FROM world
WHERE population > 200000000
-- 3.
SELECT name, gdp/population
FROM world
WHERE population > 200000000
-- 4.
SELECT name, population/1000000
FROM world
WHERE continent ='South America'
-- 5.
SELECT name, population
FROM world
WHERE name IN ('France','Germany','Italy')
-- 6.
SELECT name 
FROM world
WHERE name LIKE 'United%'
-- 7.
SELECT name, population, area
FROM world
WHERE area >3000000 OR population > 250000000

-- 8.
SELECT name, population, area
FROM world
WHERE population > 250000000 OR area > 3000000
EXCEPT 
SELECT name, population, area 
FROM world
WHERE population > 250000000 AND area > 3000000
-- 9.
SELECT name, ROUND(population, -4)/1000000, ROUND(GDP, -7)/1000000000
FROM world
WHERE continent = 'South America'
-- 10.
SELECT name, ROUND(gdp/population, -3)
FROM world 
WHERE gdp > 1000000000000
-- 11.
SELECT name,       
       capital
 FROM world
 WHERE LENGTH(name)=LENGTH(capital)
-- 12.
SELECT name, capital
FROM world
WHERE  LEFT(name,1)= LEFT(capital,1)
AND capital != name
-- 13.
SELECT name
   FROM world

WHERE name LIKE '%A%' AND 
 name LIKE '%I%' AND 
 name LIKE '%U%' AND 
 name LIKE '%E%' AND 
name LIKE '%O%' AND 
 name NOT LIKE '% %'


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
WHERE winner = 'Albert Einstein'
-- 4.

SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr > 1999
-- 5.
SELECT yr, subject, winner 
FROM nobel
WHERE subject='literature' AND yr > 1979 AND yr <1990
-- 6.
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt',
            'Woodrow Wilson',
            'Jimmy Carter',
            'Barack Obama')
-- 7.
SELECT winner FROM nobel
WHERE winner LIKE 'John%'
-- 8.
SELECT yr, subject, winner 
FROM nobel
WHERE subject = 'Physics' AND yr = '1980' OR
subject = 'Chemistry' AND yr = '1984'
-- 9.
SELECT yr, subject, winner 
FROM nobel WHERE subject !='Chemistry' AND subject !='Medicine' AND yr='1980'
-- 10.
SELECT yr, subject, winner 
FROM nobel WHERE
yr <1910 AND 
subject = 'medicine' OR
yr > 2003 AND
subject = 'Literature'

-- 11.
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'
-- 12.
SELECT * FROM nobel
WHERE winner LIKE '%neill'
-- 13.
SELECT winner ,yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC 

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
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name ='United Kingdom')
       AND continent='Europe'
-- 3.
SELECT name, continent
FROM world
WHERE continent = (
  SELECT continent 
    FROM world 
      WHERE name ='Australia')
        OR continent= (
          SELECT continent 
            FROM world 
              WHERE name ='Argentina')
ORDER BY name ASC
-- 4.
SELECT name, population 
FROM world
WHERE population >
  (SELECT population
   FROM world
   WHERE name = 'Canada')
      AND population <
  (SELECT population
   FROM world
   WHERE name = 'Poland')
-- 5.
SELECT name, CONCAT
(ROUND(
100*population/(
SELECT population
FROM world
WHERE name ='Germany'
)
)
, '%')
FROM world
WHERE continent ='Europe'

-- As noted in the tutorial, questions 6 - 10 in this unit are considered bonuses, just like units 6 - 8+
-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 5 SUM and COUNT
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.


-- Note: the units below this are bonus for this weekend, and they will be required in a future assignment. If you do them now you will be ahead of the game!
-- 6 JOIN
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

