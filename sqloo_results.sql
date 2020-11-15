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
-- 1 SELECT from WORLD
-- 1.
SELECT name, continent, population FROM world
-- 2.
SELECT name FROM world
WHERE population > 200000000
-- 3.
SELECT name, gdp / population FROM world
WHERE population > 200000000

-- 4.
SELECT name, population / 1000000 FROM world
WHERE continent IN ('South America')
-- 5.
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');
-- 6.
SELECT name FROM world
WHERE name LIKE 'United%'

-- 7.
SELECT name, population, area FROM world
WHERE population > 250000000 OR area > 3000000;

-- 8.
SELECT name, population, area FROM world
WHERE population > 250000000 XOR area > 3000000;

-- 9.
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2) FROM world
WHERE continent = 'South America';
-- 10.
SELECT name, ROUND(gdp / population, -3) FROM world
WHERE gdp > 1000000000000
-- 11.
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital);
-- 12.
SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) 
AND name <> capital;
-- 13
SELECT name FROM world
WHERE name NOT LIKE '% %' 
  and name LIKE '%u%' 
  and name LIKE '%a%' 
  and name LIKE '%o%' 
  and name LIKE '%i%'
  and name LIKE '%e%'
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

