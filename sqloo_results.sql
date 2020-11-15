-- 0 SELECT basics
-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';Modify it to show the population of Germany
    SELECT population FROM world
    WHERE name = 'Germany'

-- 2.Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
    SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000

-- 1 SELECT name

-- 1.You can use WHERE name LIKE 'B%' to find the countries that start with "B".The % is a wild-card it can match any characters
    SELECT name FROM world
    WHERE name LIKE 'Y%'

-- 2.Find the countries that end with y
    name FROM world
    WHERE name LIKE '%Y'

-- 3.Luxembourg has an x - so does one other country. List them both.Find the countries that contain the letter x
    SELECT name FROM world
    WHERE name LIKE '%X%'

-- 4.Iceland, Switzerland end with land - but are there others Find the countries that end with land
    SELECT name FROM world
    WHERE name LIKE '%land'

-- 5.Columbia starts with a C and ends with ia - there are two more like this.Find the countries that start with C and end with ia
    SELECT name FROM world
    WHERE name LIKE 'C%Ia'

-- 6.Greece has a double e - who has a double o? Find the country that has oo in the name
    SELECT name FROM world
    WHERE name LIKE '%oo%'

-- 7.Bahamas has three a - who else? Find the countries that have three or more a in the name
    SELECT name FROM world
    WHERE name LIKE '%a%a%a%'

-- 8.Find the countries that have "t" as the second character
    SELECT name FROM world
    WHERE name LIKE '_t%'
    ORDER BY name

-- 9.Find the countries that have exactly four characters.
   SELECT name FROM world
    WHERE name LIKE '%o__o%'


-- 10.Find the countries that have exactly four characters.
    SELECT name FROM world
    WHERE name LIKE '____'
    -- I input 4 dashes for 4 characters

-- 11.Find the country where the name is the capital city.


-- 12.

-- 13, 14, and 15 have a bug, please skip them


-- 2 SELECT from World
-- 1.Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world

-- 2.How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population > 200000000

-- 3.Give the name and the per capita GDP for those countries with a population of at least 200 million.HINT:How to calculate per capita GDP per capita GDP is the GDP divided by the population GDP/population

SELECT name, gdp/population
FROM world
WHERE POPULATION > 200000000

-- 4.Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- 5.Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy')

-- 6.Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%'

-- 7.Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
FROM world
WHERE population > 250000000 or area > 3000000

-- 8.Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE population > 250000000 xor area > 3000000

-- 9.Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000,2),ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America'

-- 10.Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000

-- 11.Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
 WHERE LENGTH(name) = LENGTH(capital)

-- 12.Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) and name <> capital

-- 13.Find the country that has all the vowels and no spaces in its name. (a e i o u)
SELECT name
  FROM world
 WHERE name LIKE '%a%'AND name LIKE '%e%'AND name LIKE '%i%'AND name LIKE '%o%'AND name LIKE '%u%'AND name NOT LIKE '% %';



-- 3 SELECT from Nobel
-- 1.Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2.Show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3.Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein' 

-- 4.Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE yr > 1999
and subject = 'Peace'

-- 5.Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner 
FROM nobel
WHERE yr >1979 and yr < 1990
and subject = 'Literature'

-- 6.Show all details of the presidential winners:Theodore Roosevelt,Woodrow Wilson,Jimmy Carter, Barack Obama
SELECT * FROM nobel
 WHERE subject = 'Peace'
  AND winner IN ('Barack Obama','Jimmy Carter','Woodrow Wilson','Theodore Roosevelt')


-- 7.Show the winners with first name John
SELECT winner 
FROM nobel
WHERE winner LIKE 'John%'
    
-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * FROM nobel 
WHERE subject = 'Physics' 
AND yr = 1980 
OR subject = 'Chemistry' 
AND yr = 1984;

-- 9.Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT * FROM nobel 
WHERE yr = 1980 
AND subject NOT IN ('Chemistry', 'Medicine');

-- 10.Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel 
WHERE subject = 'Medicine' 
AND yr < 1910 
OR subject = 'Literature' 
AND yr > 2003;


-- 11.Find all details of the prize won by PETER GRÜNBERG
SELECT yr, subject, winner
FROM nobel
WHERE winner = 'Peter Grünberg'

-- 12.Find all details of the prize won by EUGENE O'NEILL
-- Trick is to add and extra ' after the O
SELECT yr, subject, winner
FROM nobel
WHERE winner = 'Eugene O''Neill'

-- 13.List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
Select winner, yr, subject 
FROM nobel 
WHERE winner LIKE 'Sir%' 
ORDER BY yr DESC, winner

-- 14.Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner;



-- 4 SELECT within SELECT world(name, continent, area, population, gdp)
-- 1.List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (
 SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom')

-- 3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world 
WHERE continent IN 
(SELECT continent FROM world 
WHERE name IN ('Argentina', 'Australia')) 
ORDER BY name

-- 4.Which country has a population that is more than Canada but less than Poland? Show the name and the population.
Select name, population FROM world
WHERE population > 'Canada'
AND population < 'Poland'

-- 5.Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, CONCAT
(ROUND(population/(
SELECT population FROM world WHERE name = 'Germany')*100), '%') 
FROM world WHERE continent = 'Europe';

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

