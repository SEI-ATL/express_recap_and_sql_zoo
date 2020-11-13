-- 0 SELECT basics
-- 1. 
SELECT population FROM world
  WHERE name = 'Germany'

-- 2.
SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway','Denmark');

-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- 1 SELECT name

-- 1.
SELECT name FROM world
  WHERE name LIKE 'Y%'
-- 2.
SELECT name FROM world
  WHERE name LIKE '%Y'
-- 3.
SELECT name FROM world
  WHERE name LIKE '%x%'
-- 4.
SELECT name FROM world
  WHERE name LIKE '%land'
-- 5.
SELECT name FROM world
  WHERE name LIKE 'C%ia'
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
 WHERE name = capital
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
WHERE population > 200000000
-- 3.
SELECT name, gdp/population
FROM world
WHERE population > 200000000
-- 4.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'
-- 5.
SELECT name, population
FROM world
WHERE name IN ('France','Germany','Italy')
-- 6.
SELECT name
FROM world
WHERE name LIKE 'United%'
-- 7.
SELECT name,population,area
FROM world
WHERE area>3000000
OR population>250000000
-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.



-- 3 SELECT from Nobel
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



-- 4 SELECT within SELECT
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

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

